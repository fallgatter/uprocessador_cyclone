import socket
import threading
import re
import tkinter as tk
from tkinter import ttk, messagebox
from typing import Dict, Optional
import assembler


class AssemblyIDE:
	def __init__(self, root: tk.Tk) -> None:
		self.root = root
		self.root.title("IDE Assembly (Cliente)")

		self.client_socket: Optional[socket.socket] = None
		self.running_net = False

		self.reg_vars: Dict[str, tk.StringVar] = {}

		self.last_pc: Optional[int] = None
		self.auto_scroll: bool = False

		self.bp_index: Optional[int] = None  # breakpoint atual (None = nenhum)

		self._build_ui()
		self._update_register_view_initial()

	# ================= UI =================

	def _build_ui(self):
		main = ttk.Frame(self.root)
		main.pack(fill="both", expand=True)

		# ================= CONEXÃO =================
		conn = ttk.Frame(main)
		conn.pack(fill="x", padx=6, pady=4)

		ttk.Label(conn, text="IP:").pack(side="left")
		self.ip_var = tk.StringVar(value="192.168.1.101")
		ttk.Entry(conn, textvariable=self.ip_var, width=15).pack(side="left", padx=4)

		ttk.Label(conn, text="Porta:").pack(side="left")
		self.port_var = tk.StringVar(value="8080")
		ttk.Entry(conn, textvariable=self.port_var, width=6).pack(side="left", padx=4)

		self.btn_connect = ttk.Button(conn, text="Conectar", command=self.connect)
		self.btn_connect.pack(side="left", padx=6)

		# ================= BOTÕES =================
		btns = ttk.Frame(main)
		btns.pack(fill="x")

		self.btn_send = ttk.Button(btns, text="Enviar Programa", command=self.send_program, state="disabled")
		self.btn_step = ttk.Button(btns, text="STEP", command=self.send_step, state="disabled")
		self.btn_run = ttk.Button(btns, text="RUN", command=self.send_run, state="disabled")
		self.btn_reset = ttk.Button(btns, text="RESET", command=self.send_reset, state="disabled")
		self.btn_bp = ttk.Button(btns, text="BP", command=self.send_breakpoint, state="disabled")
		self.btn_save = ttk.Button(btns, text="Salvar código", command=self.save_code)

		for b in (self.btn_send, self.btn_step, self.btn_run, self.btn_reset, self.btn_bp, self.btn_save):
			b.pack(side="left", padx=4, pady=4)

		# ================= CONTEÚDO =================
		content = ttk.Frame(main)
		content.pack(fill="both", expand=True)

		# -------- Editor --------
		editor_frame = ttk.Frame(content)
		editor_frame.pack(side="left", fill="both", expand=True)

		self.text = tk.Text(editor_frame, wrap="none", undo=True)
		self.text.pack(side="left", fill="both", expand=True)

		scroll = ttk.Scrollbar(editor_frame, orient="vertical", command=self.text.yview)
		self.text.configure(yscrollcommand=scroll.set)
		scroll.pack(side="right", fill="y")

		# TAGS
		self.text.tag_configure("pc_line", background="#fff3a0")
		self.text.tag_configure("bp_line", background="#ffb3b3")

		# -------- Registradores --------
		right = ttk.Frame(content)
		right.pack(side="right", fill="y", padx=10)

		ttk.Label(right, text="Registradores", font=("TkDefaultFont", 10, "bold"))\
			.pack(anchor="w", pady=(4, 8))

		for name in [f"R{i}" for i in range(7)] + ["A", "PC"]:
			row = ttk.Frame(right)
			row.pack(anchor="w", pady=2)
			ttk.Label(row, text=f"{name}:").pack(side="left")
			var = tk.StringVar(value="0")
			self.reg_vars[name] = var
			ttk.Label(row, textvariable=var, width=10).pack(side="left")

		# ================= STATUS =================
		self.status_var = tk.StringVar(value="Desconectado")
		ttk.Label(main, textvariable=self.status_var)\
			.pack(fill="x", padx=6, pady=4)

	def _update_register_view_initial(self):
		for v in self.reg_vars.values():
			v.set("0")

	def _set_actions_enabled(self, enabled: bool):
		state = "normal" if enabled else "disabled"
		for b in (self.btn_send, self.btn_step, self.btn_run, self.btn_reset, self.btn_bp):
			b.config(state=state)

	# ================= REDE =================

	def connect(self):
		try:
			ip = self.ip_var.get().strip()
			port = int(self.port_var.get())

			self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
			self.client_socket.connect((ip, port))
			self.running_net = True

			threading.Thread(target=self._recv_loop, daemon=True).start()

			self.status_var.set(f"Conectado a {ip}:{port}")
			self._set_actions_enabled(True)
		except Exception as e:
			messagebox.showerror("Conexão", str(e))
			self._set_actions_enabled(False)

	def _recv_loop(self):
		while self.running_net:
			try:
				data = self.client_socket.recv(2048)
				if not data:
					break
				self._handle_server_message(data)
			except:
				break

	def _handle_server_message(self, data: bytes):
		text = data.decode(errors="ignore")

		matches = re.findall(r"(R[0-6]|A|PC)=(-?\d+)", text)
		if matches:
			def update():
				for k, v in matches:
					self.reg_vars[k].set(v)
					if k == "PC":
						self._highlight_pc(int(v))
			self.root.after(0, update)

	def _send_framed(self, msg: str):
		self.client_socket.sendall(msg.encode())

	# ================= HIGHLIGHT =================

	def _instruction_lines(self):
		lines = []
		for idx, line in enumerate(self.text.get("1.0", "end").splitlines()):
			l = line.strip()
			if l and not l.startswith(("#", ";")):
				lines.append(idx + 1)
		return lines

	def _clear_pc_highlight(self):
		self.text.tag_remove("pc_line", "1.0", "end")

	def _clear_bp_highlight(self):
		self.text.tag_remove("bp_line", "1.0", "end")

	def _highlight_pc(self, pc_value: int):
		if pc_value == self.last_pc:
			return

		self.last_pc = pc_value
		self._clear_pc_highlight()

		instr_lines = self._instruction_lines()
		if pc_value < 0 or pc_value >= len(instr_lines):
			return

		line = instr_lines[pc_value]
		start = f"{line}.0"
		end = f"{line}.end"

		self.text.tag_add("pc_line", start, end)

		if self.auto_scroll:
			self.text.see(start)

	def _highlight_bp(self, bp_index: int):
		self._clear_bp_highlight()

		instr_lines = self._instruction_lines()
		if bp_index < 0 or bp_index >= len(instr_lines):
			return

		line = instr_lines[bp_index]
		start = f"{line}.0"
		end = f"{line}.end"

		self.text.tag_add("bp_line", start, end)

	# ================= BREAKPOINT =================

	def _cursor_instruction_index(self) -> int:
		cursor_line = int(self.text.index("insert").split(".")[0])
		instr_lines = self._instruction_lines()

		if cursor_line not in instr_lines:
			raise ValueError("Cursor não está em uma instrução válida")

		return instr_lines.index(cursor_line)

	def _clear_breakpoint(self):
		self.bp_index = None
		self._clear_bp_highlight()
		self._send_framed("BP 127")
		self.status_var.set("Breakpoint removido")

	def send_breakpoint(self):
		try:
			# Toggle: se já existe, remove
			if self.bp_index is not None:
				self._clear_breakpoint()
				return

			idx = self._cursor_instruction_index()
			self.bp_index = idx
			self._highlight_bp(idx)
			self._send_framed(f"BP {idx}")
			self.status_var.set(f"Breakpoint definido na instrução {idx}")

		except Exception as e:
			messagebox.showerror("Breakpoint", str(e))

	# ================= AÇÕES =================

	def assemble_program_text(self) -> str:
		out = []
		for line in self.text.get("1.0", "end").splitlines():
			line = line.strip()
			if line and not line.startswith(("#", ";")):
				out.append(assembler.assemble(line))
		if not out:
			raise ValueError("Programa vazio")
		return "\n".join(out)

	def send_program(self):
		try:
			self.auto_scroll = False
			self.last_pc = None
			self._send_framed(self.assemble_program_text())
			self.status_var.set("Programa enviado")
		except Exception as e:
			messagebox.showerror("Erro", str(e))

	def send_step(self):
		self.auto_scroll = True
		self._send_framed("STEP")
		self.status_var.set("STEP enviado")

	def send_run(self):
		self.auto_scroll = False
		self._send_framed("RUN")
		self.status_var.set("RUN enviado")

	def send_reset(self):
		self.auto_scroll = False
		self.last_pc = None
		self.bp_index = None
		self._send_framed("RESET")
		self._clear_pc_highlight()
		self._clear_bp_highlight()
		self.status_var.set("RESET enviado")

	def save_code(self):
		with open("assembly.s", "w") as f:
			f.write(self.text.get("1.0", "end"))
		self.status_var.set("Código salvo")


def main():
	root = tk.Tk()
	AssemblyIDE(root)
	root.mainloop()


if __name__ == "__main__":
	main()

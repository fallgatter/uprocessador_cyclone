import socket
import threading
import re
import tkinter as tk
from tkinter import ttk, messagebox
from typing import Dict, Optional, List
import assembler

HARD_CODED_HOST = "127.0.0.1"
HARD_CODED_PORT = 65535


class AssemblyIDE:
	def __init__(self, root: tk.Tk) -> None:
		self.root = root
		self.root.title("IDE Assembly (Cliente) - Envia binário via socket")

		# Conexão
		self.client_socket: Optional[socket.socket] = None
		self.recv_thread: Optional[threading.Thread] = None
		self.running_net: bool = False

		# Registradores mostrados (valores chegam do servidor)
		self.reg_vars: Dict[str, tk.StringVar] = {}

		# Estado de envio step-by-step
		self._step_bins: List[str] = []
		self._step_idx: int = 0
		self._step_source: str = ""

		self._build_ui()
		self._update_register_view_initial()
		self._auto_connect()

	def _build_ui(self) -> None:
		main = ttk.Frame(self.root)
		main.pack(fill="both", expand=True)

		# Botões de ação
		btns = ttk.Frame(main)
		btns.pack(side="top", fill="x")
		#self.btn_send = ttk.Button(btns, text="Enviar Programa (ASM)", command=self.send_program, state="disabled")
		self.btn_save = ttk.Button(btns, text="Salvar código", command=self.save_code, state="normal")
		self.btn_step = ttk.Button(btns, text="Step", command=self.step, state="disabled")
		self.btn_run = ttk.Button(btns, text="Executar tudo", command=self.run_send_all, state="disabled")

		#self.btn_send.pack(side="left", padx=4, pady=4)
		self.btn_save.pack(side="left", padx=4, pady=4)
		self.btn_step.pack(side="left", padx=4, pady=4)
		self.btn_run.pack(side="left", padx=4, pady=4)

		content = ttk.Frame(main)
		content.pack(side="top", fill="both", expand=True)

		# Editor
		editor_frame = ttk.Frame(content)
		editor_frame.pack(side="left", fill="both", expand=True)

		self.text = tk.Text(editor_frame, wrap="none", undo=True, height=28, width=80)
		ys = ttk.Scrollbar(editor_frame, orient="vertical", command=self.text.yview)
		self.text.configure(yscrollcommand=ys.set)
		self.text.pack(side="left", fill="both", expand=True)
		ys.pack(side="right", fill="y")

		# Painel direito
		right = ttk.Frame(content)
		right.pack(side="right", fill="both")

		lbl = ttk.Label(right, text="Registradores (do servidor)", font=("TkDefaultFont", 10, "bold"))
		lbl.pack(side="top", anchor="w", padx=8, pady=(8, 4))

		self.reg_grid = ttk.Frame(right)
		self.reg_grid.pack(side="top", fill="x", padx=8)

		all_regs = [f"R{i}" for i in range(7)] + ["A", "PC"]
		for idx, name in enumerate(all_regs):
			row = idx // 2
			col = (idx % 2) * 2
			label = ttk.Label(self.reg_grid, text=name + ":")
			value_var = tk.StringVar(value="0")
			value = ttk.Label(self.reg_grid, textvariable=value_var, width=12)
			label.grid(row=row, column=col, sticky="w", padx=(0, 6), pady=2)
			value.grid(row=row, column=col + 1, sticky="w", pady=2)
			self.reg_vars[name] = value_var

		# Status
		self.status_var = tk.StringVar(value="Conectando...")
		status = ttk.Label(main, textvariable=self.status_var, anchor="w")
		status.pack(side="bottom", fill="x", padx=6, pady=4)

	def _update_register_view_initial(self) -> None:
		for i in range(7):
			self.reg_vars[f"R{i}"].set("0")
		self.reg_vars["A"].set("0")
		self.reg_vars["PC"].set("0")

	def _auto_connect(self) -> None:
		if self.client_socket is not None:
			return
		try:
			sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
			sock.settimeout(10)
			sock.connect((HARD_CODED_HOST, HARD_CODED_PORT))
			self.client_socket = sock
			self.running_net = True
			self.recv_thread = threading.Thread(target=self._recv_loop, daemon=True)
			self.recv_thread.start()
			self.status_var.set(f"Conectado a {HARD_CODED_HOST}:{HARD_CODED_PORT}")
			self._set_actions_enabled(True)
		except Exception as ex:
			self.client_socket = None
			self.status_var.set(f"Falha na conexão: {ex}")
			self._set_actions_enabled(False)

	def _set_actions_enabled(self, enabled: bool) -> None:
		state = "normal" if enabled else "disabled"
		self.btn_step.configure(state=state)
		self.btn_run.configure(state=state)

	def _recv_loop(self) -> None:
		assert self.client_socket is not None
		sock = self.client_socket
		sock.settimeout(1)
		buffer = b""
		while self.running_net:
			try:
				chunk = sock.recv(2048)
				if not chunk:
					break
				self._handle_server_message(chunk)
			except socket.timeout:
				continue
			except Exception as ex:
				self.root.after(0, lambda: self.status_var.set(f"Erro de recepção: {ex}"))
				break
		self.root.after(0, lambda: self.status_var.set("Conexão encerrada pelo servidor."))
		self.root.after(0, lambda: self._set_actions_enabled(False))
		self.client_socket = None
		self.running_net = False

	def _handle_server_message(self, data: bytes) -> None:
		try:
			text = data.decode("utf-8", errors="replace")
		except Exception:
			text = f"<{len(data)} bytes binários>"
		self._maybe_update_registers_from_text(text)

	def _maybe_update_registers_from_text(self, text: str) -> None:
		# Tenta extrair registradores de respostas no formato:
		# "R0=10 R1=0 R2=0 R3=0 R4=0 R5=0 R6=0 A=0 PC=3"
		pat = r"\b(R[0-6]|A|PC)=(-?\d+)\b"
		matches = re.findall(pat, text)
		if not matches:
			return
		def update():
			for name, val in matches:
				if name in self.reg_vars:
					self.reg_vars[name].set(val)
		self.root.after(0, update)

	def _send_framed(self, msg: str) -> None:
		if self.client_socket is None:
			raise RuntimeError("Não conectado.")
		data = msg.encode("utf-8")
		frame = f"{len(data)};".encode("utf-8") + data
		self.client_socket.sendall(frame)

	def save_code(self) -> None:
		try:
			code = self.text.get("1.0", "end")
			with open("/home/kauan/Documents/log-rec/assembly.s", "w") as f:
				f.write(code)
			self.status_var.set("Código salvo em assembly.s")
		except Exception as ex:
			messagebox.showerror("Salvar código", f"Falha ao salvar: {ex}")

	def assemble_program_text(self) -> str:
		lines = self.text.get("1.0", "end").splitlines()
		out: List[str] = []
		for raw in lines:
			code = raw.strip()
			if not code:
				continue
			# suporta comentários iniciando com '#' ou ';'
			if code.startswith("#") or code.startswith(";"):
				continue
			try:
				binstr = assembler.assemble(code)
			except Exception as ex:
				raise ValueError(f"Erro ao montar '{code}': {ex}")
			if binstr:
				out.append(binstr)
		if not out:
			raise ValueError("Nenhuma instrução válida para montar.")
		return "\n".join(out)

	def step(self) -> None:
		try:
			prog = self.assemble_program_text()
			prog = "STEP" + prog
			print(prog)
			self._send_framed(prog)
			self.status_var.set("Programa completo enviado para execução.")
			self._step_source = self.text.get("1.0", "end")
			self._step_bins = prog.split("\n")
			self._step_idx = len(self._step_bins)
		except Exception as ex:
			messagebox.showerror("Step", f"Falha no Step: {ex}")

	def run_send_all(self) -> None:
		try:
			prog = self.assemble_program_text()
			self._send_framed(prog)
			self.status_var.set("Programa completo enviado para execução.")
			self._step_source = self.text.get("1.0", "end")
			self._step_bins = prog.split("\n")
			self._step_idx = len(self._step_bins)
		except Exception as ex:
			messagebox.showerror("Executar tudo", f"Falha ao enviar programa: {ex}")

def main() -> None:
	root = tk.Tk()
	app = AssemblyIDE(root)
	root.mainloop()


if __name__ == "__main__":
	main()



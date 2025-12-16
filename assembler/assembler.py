OPCODES = {
    "NOP":  "0000",
    "I":   "0001",
    "R":  "0010",
    "J":  "0011"
}

FUNCT_R = {
    "ADD":  "000",
    "SUB":  "001",
    "XOR":  "010",
    "SRLI": "011",
    "MOV":  "100",
    "CMPR": "101",
    "LW":   "110",
    "SW":   "111"
}

FUNCT_J = {
    "JUMP": "000",
    "CMPI": "001",
    "BLE":  "010",
    "BMI":  "011"
}

REGS = {
    "R0": "000",
    "R1": "001",
    "R2": "010",
    "R3": "011",
    "R4": "100",
    "R5": "101",
    "R6": "110",
    "A": "111"
}

def assemble(instr):
    instr = instr.strip()
    instr = instr.replace(",", " ")
    if not instr:
        return None
    
    parts = instr.split(" ")
    opcode = parts[0]
    ops = parts[1:]
    opcode = opcode.upper()

    if opcode == "NOP":
        return "0" * 13 + OPCODES["NOP"]

    if opcode == "LD":
        rd = ops[0]
        imm = ops[1]
        rd_bin = REGS[rd.upper()]
        imm_bin = format(int(imm) & ((1 << 10) - 1), "010b")
        return imm_bin + rd_bin + OPCODES["I"]
    
    if opcode in FUNCT_R:
        funct = FUNCT_R[opcode]
        if opcode == "LW":
            rs = ops[0]
            rd = "A"
        elif opcode == "SW":
            rs = "A"
            rd = ops[0]
        elif opcode != "MOV":
            rd = "A"
            rs = ops[0]
        else:
            rd = ops[0]
            rs = ops[1]
        
        rd_bin = REGS[rd.upper()]
        rs_bin = REGS[rs.upper()]
        return "0000" + rs_bin + funct+ rd_bin + OPCODES["R"]

    if opcode in FUNCT_J:
        funct = FUNCT_J[opcode]
        imm = ops[0]
        imm_bin = format(int(imm) & ((1 << 7) - 1), "07b")
        return imm_bin + funct + "000" + OPCODES["J"]
    
    raise ValueError(f"Unknown instruction: {instr}")

INPUT_FILE  = "assembly.txt"
OUTPUT_FILE = "programa.txt" 

def assemble_file(input_file, output_file):
    with open(input_file, "r") as infile, open(output_file, "w") as outfile:
        for line in infile:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            binary_instr = assemble(line)
            if binary_instr:
                outfile.write(binary_instr + "\n")

assemble_file(INPUT_FILE, OUTPUT_FILE)
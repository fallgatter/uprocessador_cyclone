# ------------------------------------------------------------------------------
# Top Level Simulation Script to source msim_setup.tcl
# ------------------------------------------------------------------------------
set QSYS_SIMDIR obj/default/runtime/sim
source msim_setup.tcl
# Copy generated memory initialization hex and dat file(s) to current directory
file copy -force C:/FPGAEncrypt/workspace/FPGAEncrypt/mem_init/hdl_sim/q_sys_descriptor_memory.dat ./ 
file copy -force C:/FPGAEncrypt/workspace/FPGAEncrypt/mem_init/hdl_sim/q_sys_onchip_ram.dat ./ 
file copy -force C:/FPGAEncrypt/workspace/FPGAEncrypt/mem_init/q_sys_descriptor_memory.hex ./ 
file copy -force C:/FPGAEncrypt/workspace/FPGAEncrypt/mem_init/ext_epcq_flash.hex ./ 
file copy -force C:/FPGAEncrypt/workspace/FPGAEncrypt/mem_init/q_sys_onchip_ram.hex ./ 

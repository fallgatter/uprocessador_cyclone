
# (C) 2001-2025 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 17.1 590 win32 2025.07.12.19:06:37
# ----------------------------------------
# Auto-generated simulation script rivierapro_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     q_sys
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "aldec.do", and modify the text as directed.
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/aldec/rivierapro_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# set USER_DEFINED_VHDL_COMPILE_OPTIONS <compilation options for VHDL>
# set USER_DEFINED_VERILOG_COMPILE_OPTIONS <compilation options for Verilog>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog -sv2k5 <your compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If q_sys is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "q_sys"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/intelfpga_lite/17.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VHDL_COMPILE_OPTIONS] { 
  set USER_DEFINED_VHDL_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VERILOG_COMPILE_OPTIONS] { 
  set USER_DEFINED_VERILOG_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_bht_ram.dat ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_bht_ram.hex ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_bht_ram.mif ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_dc_tag_ram.dat ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_dc_tag_ram.hex ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_dc_tag_ram.mif ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ic_tag_ram.dat ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ic_tag_ram.hex ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ic_tag_ram.mif ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ociram_default_contents.dat ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ociram_default_contents.hex ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ociram_default_contents.mif ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_a.dat ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_a.hex ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_a.mif ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_b.dat ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_b.hex ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_b.mif ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_onchip_ram.hex ./
  file copy -force C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_descriptor_memory.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                  ./libraries/altera_ver      
vmap       altera_ver       ./libraries/altera_ver      
ensure_lib                  ./libraries/lpm_ver         
vmap       lpm_ver          ./libraries/lpm_ver         
ensure_lib                  ./libraries/sgate_ver       
vmap       sgate_ver        ./libraries/sgate_ver       
ensure_lib                  ./libraries/altera_mf_ver   
vmap       altera_mf_ver    ./libraries/altera_mf_ver   
ensure_lib                  ./libraries/altera_lnsim_ver
vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver
ensure_lib                  ./libraries/cyclone10lp_ver 
vmap       cyclone10lp_ver  ./libraries/cyclone10lp_ver 
ensure_lib                  ./libraries/altera          
vmap       altera           ./libraries/altera          
ensure_lib                  ./libraries/lpm             
vmap       lpm              ./libraries/lpm             
ensure_lib                  ./libraries/sgate           
vmap       sgate            ./libraries/sgate           
ensure_lib                  ./libraries/altera_mf       
vmap       altera_mf        ./libraries/altera_mf       
ensure_lib                  ./libraries/altera_lnsim    
vmap       altera_lnsim     ./libraries/altera_lnsim    
ensure_lib                  ./libraries/cyclone10lp     
vmap       cyclone10lp      ./libraries/cyclone10lp     
ensure_lib                                       ./libraries/avst_fifo                            
vmap       avst_fifo                             ./libraries/avst_fifo                            
ensure_lib                                       ./libraries/error_adapter_0                      
vmap       error_adapter_0                       ./libraries/error_adapter_0                      
ensure_lib                                       ./libraries/asmi2_qspi_interface_0               
vmap       asmi2_qspi_interface_0                ./libraries/asmi2_qspi_interface_0               
ensure_lib                                       ./libraries/asmi2_cmd_generator_0                
vmap       asmi2_cmd_generator_0                 ./libraries/asmi2_cmd_generator_0                
ensure_lib                                       ./libraries/multiplexer                          
vmap       multiplexer                           ./libraries/multiplexer                          
ensure_lib                                       ./libraries/merlin_demultiplexer_0               
vmap       merlin_demultiplexer_0                ./libraries/merlin_demultiplexer_0               
ensure_lib                                       ./libraries/xip_controller                       
vmap       xip_controller                        ./libraries/xip_controller                       
ensure_lib                                       ./libraries/csr_controller                       
vmap       csr_controller                        ./libraries/csr_controller                       
ensure_lib                                       ./libraries/timing_adapter_0                     
vmap       timing_adapter_0                      ./libraries/timing_adapter_0                     
ensure_lib                                       ./libraries/rsp_mux_004                          
vmap       rsp_mux_004                           ./libraries/rsp_mux_004                          
ensure_lib                                       ./libraries/rsp_mux                              
vmap       rsp_mux                               ./libraries/rsp_mux                              
ensure_lib                                       ./libraries/rsp_demux                            
vmap       rsp_demux                             ./libraries/rsp_demux                            
ensure_lib                                       ./libraries/cmd_mux_001                          
vmap       cmd_mux_001                           ./libraries/cmd_mux_001                          
ensure_lib                                       ./libraries/cmd_mux                              
vmap       cmd_mux                               ./libraries/cmd_mux                              
ensure_lib                                       ./libraries/cmd_demux_004                        
vmap       cmd_demux_004                         ./libraries/cmd_demux_004                        
ensure_lib                                       ./libraries/cmd_demux                            
vmap       cmd_demux                             ./libraries/cmd_demux                            
ensure_lib                                       ./libraries/router_006                           
vmap       router_006                            ./libraries/router_006                           
ensure_lib                                       ./libraries/router_005                           
vmap       router_005                            ./libraries/router_005                           
ensure_lib                                       ./libraries/router_004                           
vmap       router_004                            ./libraries/router_004                           
ensure_lib                                       ./libraries/router                               
vmap       router                                ./libraries/router                               
ensure_lib                                       ./libraries/avalon_st_adapter                    
vmap       avalon_st_adapter                     ./libraries/avalon_st_adapter                    
ensure_lib                                       ./libraries/crosser                              
vmap       crosser                               ./libraries/crosser                              
ensure_lib                                       ./libraries/rsp_mux_002                          
vmap       rsp_mux_002                           ./libraries/rsp_mux_002                          
ensure_lib                                       ./libraries/rsp_mux_001                          
vmap       rsp_mux_001                           ./libraries/rsp_mux_001                          
ensure_lib                                       ./libraries/rsp_demux_004                        
vmap       rsp_demux_004                         ./libraries/rsp_demux_004                        
ensure_lib                                       ./libraries/rsp_demux_003                        
vmap       rsp_demux_003                         ./libraries/rsp_demux_003                        
ensure_lib                                       ./libraries/rsp_demux_002                        
vmap       rsp_demux_002                         ./libraries/rsp_demux_002                        
ensure_lib                                       ./libraries/cmd_mux_004                          
vmap       cmd_mux_004                           ./libraries/cmd_mux_004                          
ensure_lib                                       ./libraries/cmd_mux_002                          
vmap       cmd_mux_002                           ./libraries/cmd_mux_002                          
ensure_lib                                       ./libraries/cmd_demux_002                        
vmap       cmd_demux_002                         ./libraries/cmd_demux_002                        
ensure_lib                                       ./libraries/cmd_demux_001                        
vmap       cmd_demux_001                         ./libraries/cmd_demux_001                        
ensure_lib                                       ./libraries/ext_epcq_flash_avl_csr_burst_adapter 
vmap       ext_epcq_flash_avl_csr_burst_adapter  ./libraries/ext_epcq_flash_avl_csr_burst_adapter 
ensure_lib                                       ./libraries/cpu_data_master_limiter              
vmap       cpu_data_master_limiter               ./libraries/cpu_data_master_limiter              
ensure_lib                                       ./libraries/router_008                           
vmap       router_008                            ./libraries/router_008                           
ensure_lib                                       ./libraries/router_002                           
vmap       router_002                            ./libraries/router_002                           
ensure_lib                                       ./libraries/router_001                           
vmap       router_001                            ./libraries/router_001                           
ensure_lib                                       ./libraries/ext_epcq_flash_avl_csr_agent_rsp_fifo
vmap       ext_epcq_flash_avl_csr_agent_rsp_fifo ./libraries/ext_epcq_flash_avl_csr_agent_rsp_fifo
ensure_lib                                       ./libraries/ext_epcq_flash_avl_csr_agent         
vmap       ext_epcq_flash_avl_csr_agent          ./libraries/ext_epcq_flash_avl_csr_agent         
ensure_lib                                       ./libraries/cpu_data_master_agent                
vmap       cpu_data_master_agent                 ./libraries/cpu_data_master_agent                
ensure_lib                                       ./libraries/ext_epcq_flash_avl_csr_translator    
vmap       ext_epcq_flash_avl_csr_translator     ./libraries/ext_epcq_flash_avl_csr_translator    
ensure_lib                                       ./libraries/cpu_data_master_translator           
vmap       cpu_data_master_translator            ./libraries/cpu_data_master_translator           
ensure_lib                                       ./libraries/remote_update_controller             
vmap       remote_update_controller              ./libraries/remote_update_controller             
ensure_lib                                       ./libraries/remote_update_core                   
vmap       remote_update_core                    ./libraries/remote_update_core                   
ensure_lib                                       ./libraries/read_mstr_internal                   
vmap       read_mstr_internal                    ./libraries/read_mstr_internal                   
ensure_lib                                       ./libraries/write_mstr_internal                  
vmap       write_mstr_internal                   ./libraries/write_mstr_internal                  
ensure_lib                                       ./libraries/prefetcher_internal                  
vmap       prefetcher_internal                   ./libraries/prefetcher_internal                  
ensure_lib                                       ./libraries/dispatcher_internal                  
vmap       dispatcher_internal                   ./libraries/dispatcher_internal                  
ensure_lib                                       ./libraries/addr_adaption_0                      
vmap       addr_adaption_0                       ./libraries/addr_adaption_0                      
ensure_lib                                       ./libraries/asmi2_inst_epcq_ctrl                 
vmap       asmi2_inst_epcq_ctrl                  ./libraries/asmi2_inst_epcq_ctrl                 
ensure_lib                                       ./libraries/i_tse_mac                            
vmap       i_tse_mac                             ./libraries/i_tse_mac                            
ensure_lib                                       ./libraries/cpu                                  
vmap       cpu                                   ./libraries/cpu                                  
ensure_lib                                       ./libraries/rst_controller                       
vmap       rst_controller                        ./libraries/rst_controller                       
ensure_lib                                       ./libraries/irq_mapper                           
vmap       irq_mapper                            ./libraries/irq_mapper                           
ensure_lib                                       ./libraries/mm_interconnect_1                    
vmap       mm_interconnect_1                     ./libraries/mm_interconnect_1                    
ensure_lib                                       ./libraries/mm_interconnect_0                    
vmap       mm_interconnect_0                     ./libraries/mm_interconnect_0                    
ensure_lib                                       ./libraries/userhw_0                             
vmap       userhw_0                              ./libraries/userhw_0                             
ensure_lib                                       ./libraries/user_dipsw                           
vmap       user_dipsw                            ./libraries/user_dipsw                           
ensure_lib                                       ./libraries/sysid                                
vmap       sysid                                 ./libraries/sysid                                
ensure_lib                                       ./libraries/sys_clk_timer                        
vmap       sys_clk_timer                         ./libraries/sys_clk_timer                        
ensure_lib                                       ./libraries/sll_hyperbus_controller_top_0        
vmap       sll_hyperbus_controller_top_0         ./libraries/sll_hyperbus_controller_top_0        
ensure_lib                                       ./libraries/remote_update                        
vmap       remote_update                         ./libraries/remote_update                        
ensure_lib                                       ./libraries/opencores_i2c_0                      
vmap       opencores_i2c_0                       ./libraries/opencores_i2c_0                      
ensure_lib                                       ./libraries/onchip_ram                           
vmap       onchip_ram                            ./libraries/onchip_ram                           
ensure_lib                                       ./libraries/msgdma_tx                            
vmap       msgdma_tx                             ./libraries/msgdma_tx                            
ensure_lib                                       ./libraries/msgdma_rx                            
vmap       msgdma_rx                             ./libraries/msgdma_rx                            
ensure_lib                                       ./libraries/mm_bridge_0                          
vmap       mm_bridge_0                           ./libraries/mm_bridge_0                          
ensure_lib                                       ./libraries/led_pio                              
vmap       led_pio                               ./libraries/led_pio                              
ensure_lib                                       ./libraries/jtag_uart                            
vmap       jtag_uart                             ./libraries/jtag_uart                            
ensure_lib                                       ./libraries/ext_epcq_flash                       
vmap       ext_epcq_flash                        ./libraries/ext_epcq_flash                       
ensure_lib                                       ./libraries/eth_tse                              
vmap       eth_tse                               ./libraries/eth_tse                              
ensure_lib                                       ./libraries/enet_pll                             
vmap       enet_pll                              ./libraries/enet_pll                             
ensure_lib                                       ./libraries/descriptor_memory                    
vmap       descriptor_memory                     ./libraries/descriptor_memory                    

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  eval vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"              -work altera_ver      
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                       -work lpm_ver         
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                          -work sgate_ver       
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                      -work altera_mf_ver   
  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim_ver
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclone10lp_atoms.v"              -work cyclone10lp_ver 
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"        -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"    -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"       -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"    -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd" -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"            -work altera          
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                      -work lpm             
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                     -work lpm             
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                   -work sgate           
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                        -work sgate           
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"         -work altera_mf       
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                    -work altera_mf       
  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim    
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"      -work altera_lnsim    
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclone10lp_atoms.vhd"            -work cyclone10lp     
  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclone10lp_components.vhd"       -work cyclone10lp     
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "C:/FPGAEncrypt/q_sys/simulation/submodules/avst_fifo.vhd"                                                       -work avst_fifo                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"        -work error_adapter_0                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_asmi2_qspi_interface_asmiblock.sv"                            -work asmi2_qspi_interface_0               
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_asmi2_qspi_interface.sv"                                      -work asmi2_qspi_interface_0               
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_asmi2_cmd_generator.sv"                                       -work asmi2_cmd_generator_0                
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_ext_epcq_flash_asmi2_inst_epcq_ctrl_multiplexer.sv"            -work multiplexer                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work multiplexer                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_ext_epcq_flash_asmi2_inst_epcq_ctrl_merlin_demultiplexer_0.sv" -work merlin_demultiplexer_0               
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_asmi2_xip_controller.sv"                                      -work xip_controller                       
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_ext_epcq_flash_asmi2_inst_epcq_ctrl_csr_controller.sv"         -work csr_controller                       
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_avalon_st_adapter_timing_adapter_0.sv"                         -work timing_adapter_0                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_avalon_st_adapter_timing_adapter_0_fifo.sv"                    -work timing_adapter_0                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_rsp_mux_004.sv"                              -work rsp_mux_004                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux_004                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_rsp_mux.sv"                                  -work rsp_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_rsp_demux.sv"                                -work rsp_demux                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_cmd_mux_001.sv"                              -work cmd_mux_001                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux_001                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_cmd_mux.sv"                                  -work cmd_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_cmd_demux_004.sv"                            -work cmd_demux_004                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_cmd_demux.sv"                                -work cmd_demux                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_router_006.sv"                               -work router_006                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_router_005.sv"                               -work router_005                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_router_004.sv"                               -work router_004                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_router.sv"                                   -work router                               
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_avalon_st_adapter.vhd"                       -work avalon_st_adapter                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_handshake_clock_crosser.v"                          -work crosser                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_clock_crosser.v"                                    -work crosser                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_pipeline_base.v"                                    -work crosser                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_std_synchronizer_nocut.v"                                     -work crosser                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_mux_002.sv"                              -work rsp_mux_002                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux_002                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_mux_001.sv"                              -work rsp_mux_001                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux_001                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_mux.sv"                                  -work rsp_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_demux_004.sv"                            -work rsp_demux_004                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_demux_003.sv"                            -work rsp_demux_003                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_demux_002.sv"                            -work rsp_demux_002                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_demux.sv"                                -work rsp_demux                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_mux_004.sv"                              -work cmd_mux_004                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux_004                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_mux_002.sv"                              -work cmd_mux_002                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux_002                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_mux.sv"                                  -work cmd_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux                              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_demux_002.sv"                            -work cmd_demux_002                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_demux_001.sv"                            -work cmd_demux_001                        
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_demux.sv"                                -work cmd_demux                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_burst_adapter.sv"                                      -work ext_epcq_flash_avl_csr_burst_adapter 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_burst_adapter_uncmpr.sv"                               -work ext_epcq_flash_avl_csr_burst_adapter 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_burst_adapter_13_1.sv"                                 -work ext_epcq_flash_avl_csr_burst_adapter 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_burst_adapter_new.sv"                                  -work ext_epcq_flash_avl_csr_burst_adapter 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_incr_burst_converter.sv"                                      -work ext_epcq_flash_avl_csr_burst_adapter 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_wrap_burst_converter.sv"                                      -work ext_epcq_flash_avl_csr_burst_adapter 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_default_burst_converter.sv"                                   -work ext_epcq_flash_avl_csr_burst_adapter 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_address_alignment.sv"                                  -work ext_epcq_flash_avl_csr_burst_adapter 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                  -work ext_epcq_flash_avl_csr_burst_adapter 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_pipeline_base.v"                                    -work ext_epcq_flash_avl_csr_burst_adapter 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_traffic_limiter.sv"                                    -work cpu_data_master_limiter              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_reorder_memory.sv"                                     -work cpu_data_master_limiter              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_sc_fifo.v"                                             -work cpu_data_master_limiter              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_pipeline_base.v"                                    -work cpu_data_master_limiter              
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router_008.sv"                               -work router_008                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router_006.sv"                               -work router_006                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router_004.sv"                               -work router_004                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router_002.sv"                               -work router_002                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router_001.sv"                               -work router_001                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router.sv"                                   -work router                               
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_sc_fifo.v"                                             -work ext_epcq_flash_avl_csr_agent_rsp_fifo
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_slave_agent.sv"                                        -work ext_epcq_flash_avl_csr_agent         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                 -work ext_epcq_flash_avl_csr_agent         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_master_agent.sv"                                       -work cpu_data_master_agent                
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_slave_translator.sv"                                   -work ext_epcq_flash_avl_csr_translator    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_master_translator.sv"                                  -work cpu_data_master_translator           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_remote_update_remote_update_controller.sv"                     -work remote_update_controller             
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_remote_update_core.v"                                         -work remote_update_core                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/read_master.v"                                                       -work read_mstr_internal                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/MM_to_ST_Adapter.v"                                                  -work read_mstr_internal                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/read_burst_control.v"                                                -work read_mstr_internal                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/write_master.v"                                                      -work write_mstr_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/byte_enable_generator.v"                                             -work write_mstr_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/ST_to_MM_Adapter.v"                                                  -work write_mstr_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/write_burst_control.v"                                               -work write_mstr_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher.v"                                          -work prefetcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher_read.v"                                     -work prefetcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher_write_back.v"                               -work prefetcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher_fifo.v"                                     -work prefetcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher_interrrupt.v"                               -work prefetcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher_csr.v"                                      -work prefetcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/dispatcher.v"                                                        -work dispatcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/descriptor_buffers.v"                                                -work dispatcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/csr_block.v"                                                         -work dispatcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/response_block.v"                                                    -work dispatcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/fifo_with_byteenables.v"                                             -work dispatcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/read_signal_breakout.v"                                              -work dispatcher_internal                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/write_signal_breakout.v"                                             -work dispatcher_internal                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_qspi_address_adaption.sv"                                     -work addr_adaption_0                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_qspi_address_adaption_core.sv"                                -work addr_adaption_0                      
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_ext_epcq_flash_asmi2_inst_epcq_ctrl.vhd"                       -work asmi2_inst_epcq_ctrl                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_eth_tse_mac.v"                                          -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_clk_cntl.v"                                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_crc328checker.v"                                    -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_crc328generator.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_crc32ctl8.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_crc32galois8.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_gmii_io.v"                                          -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_lb_read_cntl.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_lb_wrt_cntl.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_hashing.v"                                          -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_host_control.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_host_control_small.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_mac_control.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_register_map.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_register_map_small.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rx_counter_cntl.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_shared_mac_control.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_shared_register_map.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_tx_counter_cntl.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_lfsr_10.v"                                          -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_loopback_ff.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_altshifttaps.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_fifoless_mac_rx.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_mac_rx.v"                                           -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_fifoless_mac_tx.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_mac_tx.v"                                           -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_magic_detection.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_mdio.v"                                             -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_mdio_clk_gen.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_mdio_cntl.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_top_mdio.v"                                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_mii_rx_if.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_mii_tx_if.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_pipeline_base.v"                                    -work i_tse_mac                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_pipeline_stage.sv"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_dpram_16x32.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_dpram_8x32.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_dpram_ecc_16x32.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_fifoless_retransmit_cntl.v"                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_retransmit_cntl.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rgmii_in1.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rgmii_in4.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_nf_rgmii_module.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rgmii_module.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rgmii_out1.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rgmii_out4.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rx_ff.v"                                            -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rx_min_ff.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rx_ff_cntrl.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rx_ff_cntrl_32.v"                                   -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rx_ff_cntrl_32_shift16.v"                           -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rx_ff_length.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_rx_stat_extract.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_timing_adapter32.v"                                 -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_timing_adapter8.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_timing_adapter_fifo32.v"                            -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_timing_adapter_fifo8.v"                             -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_top_1geth.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_top_fifoless_1geth.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_top_w_fifo.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_top_w_fifo_10_100_1000.v"                           -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_top_wo_fifo.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_top_wo_fifo_10_100_1000.v"                          -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_top_gen_host.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_tx_ff.v"                                            -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_tx_min_ff.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_tx_ff_cntrl.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_tx_ff_cntrl_32.v"                                   -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_tx_ff_cntrl_32_shift16.v"                           -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_tx_ff_length.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_tx_ff_read_cntl.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_tx_stat_extract.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_eth_tse_std_synchronizer.v"                             -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_eth_tse_std_synchronizer_bundle.v"                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_eth_tse_ptp_std_synchronizer.v"                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_false_path_marker.v"                                -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_reset_synchronizer.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_clock_crosser.v"                                    -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_a_fifo_13.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_a_fifo_24.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_a_fifo_34.v"                                        -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_a_fifo_opt_1246.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_a_fifo_opt_14_44.v"                                 -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_a_fifo_opt_36_10.v"                                 -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_gray_cnt.v"                                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_sdpm_altsyncram.v"                                  -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_altsyncram_dpm_fifo.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_bin_cnt.v"                                          -work i_tse_mac                            
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ph_calculator.sv"                                   -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_sdpm_gen.v"                                         -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_dec_x10.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x10.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x10_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_dec_x14.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x14.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x14_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_dec_x2.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x2.v"                                       -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x2_wrapper.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_dec_x23.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x23.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x23_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_dec_x36.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x36.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x36_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_dec_x40.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x40.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x40_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_dec_x30.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x30.v"                                      -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_enc_x30_wrapper.v"                              -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/aldec/altera_tse_ecc_status_crosser.v"                               -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_std_synchronizer_nocut.v"                                     -work i_tse_mac                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu.vo"                                                    -work cpu                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_debug_slave_sysclk.v"                                  -work cpu                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_debug_slave_tck.v"                                     -work cpu                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_debug_slave_wrapper.v"                                 -work cpu                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_mult_cell.v"                                           -work cpu                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_test_bench.v"                                          -work cpu                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_reset_controller.v"                                           -work rst_controller                       
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_reset_synchronizer.v"                                         -work rst_controller                       
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_avalon_st_adapter.vhd"                                         -work avalon_st_adapter                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_irq_mapper.sv"                                                 -work irq_mapper                           
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1.v"                                           -work mm_interconnect_1                    
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0.v"                                           -work mm_interconnect_0                    
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "C:/FPGAEncrypt/q_sys/simulation/submodules/userhw.vhd"                                                          -work userhw_0                             
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_user_dipsw.v"                                                  -work user_dipsw                           
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_sysid.v"                                                       -work sysid                                
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_sys_clk_timer.v"                                               -work sys_clk_timer                        
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_gpio_lite.sv"                                                 -work sll_hyperbus_controller_top_0        
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_remote_update.v"                                               -work remote_update                        
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/opencores_i2c.v"                                                     -work opencores_i2c_0                      
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/i2c_master_bit_ctrl.v"                                               -work opencores_i2c_0                      
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/i2c_master_byte_ctrl.v"                                              -work opencores_i2c_0                      
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/i2c_master_defines.v"                                                -work opencores_i2c_0                      
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/i2c_master_top.v"                                                    -work opencores_i2c_0                      
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/timescale.v"                                                         -work opencores_i2c_0                      
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_onchip_ram.v"                                                  -work onchip_ram                           
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_msgdma_tx.v"                                                   -work msgdma_tx                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_msgdma_rx.v"                                                   -work msgdma_rx                            
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_mm_bridge.v"                                           -work mm_bridge_0                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_led_pio.v"                                                     -work led_pio                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_jtag_uart.v"                                                   -work jtag_uart                            
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_ext_epcq_flash.vhd"                                            -work ext_epcq_flash                       
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_eth_tse.vhd"                                                   -work eth_tse                              
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_enet_pll.vho"                                                  -work enet_pll                             
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_descriptor_memory.v"                                           -work descriptor_memory                    
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu.v"                                                         -work cpu                                  
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "C:/FPGAEncrypt/q_sys/simulation/q_sys.vhd"                                                                                                                 
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "C:/FPGAEncrypt/q_sys/simulation/q_sys_rst_controller.vhd"                                                                                                  
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS          "C:/FPGAEncrypt/q_sys/simulation/q_sys_rst_controller_001.vhd"                                                                                              
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L avst_fifo -L error_adapter_0 -L asmi2_qspi_interface_0 -L asmi2_cmd_generator_0 -L multiplexer -L merlin_demultiplexer_0 -L xip_controller -L csr_controller -L timing_adapter_0 -L rsp_mux_004 -L rsp_mux -L rsp_demux -L cmd_mux_001 -L cmd_mux -L cmd_demux_004 -L cmd_demux -L router_006 -L router_005 -L router_004 -L router -L avalon_st_adapter -L crosser -L rsp_mux_002 -L rsp_mux_001 -L rsp_demux_004 -L rsp_demux_003 -L rsp_demux_002 -L cmd_mux_004 -L cmd_mux_002 -L cmd_demux_002 -L cmd_demux_001 -L ext_epcq_flash_avl_csr_burst_adapter -L cpu_data_master_limiter -L router_008 -L router_002 -L router_001 -L ext_epcq_flash_avl_csr_agent_rsp_fifo -L ext_epcq_flash_avl_csr_agent -L cpu_data_master_agent -L ext_epcq_flash_avl_csr_translator -L cpu_data_master_translator -L remote_update_controller -L remote_update_core -L read_mstr_internal -L write_mstr_internal -L prefetcher_internal -L dispatcher_internal -L addr_adaption_0 -L asmi2_inst_epcq_ctrl -L i_tse_mac -L cpu -L rst_controller -L irq_mapper -L mm_interconnect_1 -L mm_interconnect_0 -L userhw_0 -L user_dipsw -L sysid -L sys_clk_timer -L sll_hyperbus_controller_top_0 -L remote_update -L opencores_i2c_0 -L onchip_ram -L msgdma_tx -L msgdma_rx -L mm_bridge_0 -L led_pio -L jtag_uart -L ext_epcq_flash -L eth_tse -L enet_pll -L descriptor_memory -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclone10lp $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L avst_fifo -L error_adapter_0 -L asmi2_qspi_interface_0 -L asmi2_cmd_generator_0 -L multiplexer -L merlin_demultiplexer_0 -L xip_controller -L csr_controller -L timing_adapter_0 -L rsp_mux_004 -L rsp_mux -L rsp_demux -L cmd_mux_001 -L cmd_mux -L cmd_demux_004 -L cmd_demux -L router_006 -L router_005 -L router_004 -L router -L avalon_st_adapter -L crosser -L rsp_mux_002 -L rsp_mux_001 -L rsp_demux_004 -L rsp_demux_003 -L rsp_demux_002 -L cmd_mux_004 -L cmd_mux_002 -L cmd_demux_002 -L cmd_demux_001 -L ext_epcq_flash_avl_csr_burst_adapter -L cpu_data_master_limiter -L router_008 -L router_002 -L router_001 -L ext_epcq_flash_avl_csr_agent_rsp_fifo -L ext_epcq_flash_avl_csr_agent -L cpu_data_master_agent -L ext_epcq_flash_avl_csr_translator -L cpu_data_master_translator -L remote_update_controller -L remote_update_core -L read_mstr_internal -L write_mstr_internal -L prefetcher_internal -L dispatcher_internal -L addr_adaption_0 -L asmi2_inst_epcq_ctrl -L i_tse_mac -L cpu -L rst_controller -L irq_mapper -L mm_interconnect_1 -L mm_interconnect_0 -L userhw_0 -L user_dipsw -L sysid -L sys_clk_timer -L sll_hyperbus_controller_top_0 -L remote_update -L opencores_i2c_0 -L onchip_ram -L msgdma_tx -L msgdma_rx -L mm_bridge_0 -L led_pio -L jtag_uart -L ext_epcq_flash -L eth_tse -L enet_pll -L descriptor_memory -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclone10lp $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                                         -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                                           -- Compile device library files"
  echo
  echo "com                                               -- Compile the design files in correct order"
  echo
  echo "elab                                              -- Elaborate top level design"
  echo
  echo "elab_debug                                        -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                                                -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                                          -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                                    -- Top level module name."
  echo "                                                     For most designs, this should be overridden"
  echo "                                                     to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME                              -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                                       -- Platform Designer base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR                               -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS                      -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS                         -- User-defined elaboration options, added to elab/elab_debug aliases."
  echo
  echo "USER_DEFINED_VHDL_COMPILE_OPTIONS                 -- User-defined vhdl compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_VERILOG_COMPILE_OPTIONS              -- User-defined verilog compile options, added to com/dev_com aliases."
}
file_copy
h

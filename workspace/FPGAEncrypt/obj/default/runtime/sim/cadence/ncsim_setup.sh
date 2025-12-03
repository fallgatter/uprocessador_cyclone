
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
# ncsim - auto-generated simulation script

# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     q_sys
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level shell script that compiles Altera simulation libraries
# and the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "ncsim.sh", and modify text as directed.
# 
# You can also modify the simulation flow to suit your needs. Set the
# following variables to 1 to disable their corresponding processes:
# - SKIP_FILE_COPY: skip copying ROM/RAM initialization files
# - SKIP_DEV_COM: skip compiling the Quartus EDA simulation library
# - SKIP_COM: skip compiling Quartus-generated IP simulation files
# - SKIP_ELAB and SKIP_SIM: skip elaboration and simulation
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
# # the simulator. In this case, you must also copy the generated files
# # "cds.lib" and "hdl.var" - plus the directory "cds_libs" if generated - 
# # into the location from which you launch the simulator, or incorporate
# # into any existing library setup.
# #
# # Run Quartus-generated IP simulation script once to compile Quartus EDA
# # simulation libraries and Quartus-generated IP simulation files, and copy
# # any ROM/RAM initialization files to the simulation directory.
# # - If necessary, specify any compilation options:
# #   USER_DEFINED_COMPILE_OPTIONS
# #   USER_DEFINED_VHDL_COMPILE_OPTIONS applied to vhdl compiler
# #   USER_DEFINED_VERILOG_COMPILE_OPTIONS applied to verilog compiler
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_ELAB=1 \
# SKIP_SIM=1 \
# USER_DEFINED_COMPILE_OPTIONS=<compilation options for your design> \
# USER_DEFINED_VHDL_COMPILE_OPTIONS=<VHDL compilation options for your design> \
# USER_DEFINED_VERILOG_COMPILE_OPTIONS=<Verilog compilation options for your design> \
# QSYS_SIMDIR=<script generation output directory>
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the IP script)
# #
# ncvlog <compilation options> <design and testbench files>
# #
# # TOP_LEVEL_NAME is used in this script to set the top-level simulation or
# # testbench module/entity name.
# #
# # Run the IP script again to elaborate and simulate the top level:
# # - Specify TOP_LEVEL_NAME and USER_DEFINED_ELAB_OPTIONS.
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# #
# source <script generation output directory>/cadence/ncsim_setup.sh \
# SKIP_FILE_COPY=1 \
# SKIP_DEV_COM=1 \
# SKIP_COM=1 \
# TOP_LEVEL_NAME=<simulation top> \
# USER_DEFINED_ELAB_OPTIONS=<elaboration options for your design> \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
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
# ACDS 17.1 590 win32 2025.07.12.19:06:37
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="q_sys"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/intelfpga_lite/17.1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `ncsim -version` != *"ncsim(64)"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/avst_fifo/
mkdir -p ./libraries/error_adapter_0/
mkdir -p ./libraries/asmi2_qspi_interface_0/
mkdir -p ./libraries/asmi2_cmd_generator_0/
mkdir -p ./libraries/multiplexer/
mkdir -p ./libraries/merlin_demultiplexer_0/
mkdir -p ./libraries/xip_controller/
mkdir -p ./libraries/csr_controller/
mkdir -p ./libraries/timing_adapter_0/
mkdir -p ./libraries/rsp_mux_004/
mkdir -p ./libraries/rsp_mux/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux_001/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux_004/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/router_006/
mkdir -p ./libraries/router_005/
mkdir -p ./libraries/router_004/
mkdir -p ./libraries/router/
mkdir -p ./libraries/avalon_st_adapter/
mkdir -p ./libraries/crosser/
mkdir -p ./libraries/rsp_mux_002/
mkdir -p ./libraries/rsp_mux_001/
mkdir -p ./libraries/rsp_demux_004/
mkdir -p ./libraries/rsp_demux_003/
mkdir -p ./libraries/rsp_demux_002/
mkdir -p ./libraries/cmd_mux_004/
mkdir -p ./libraries/cmd_mux_002/
mkdir -p ./libraries/cmd_demux_002/
mkdir -p ./libraries/cmd_demux_001/
mkdir -p ./libraries/ext_epcq_flash_avl_csr_burst_adapter/
mkdir -p ./libraries/cpu_data_master_limiter/
mkdir -p ./libraries/router_008/
mkdir -p ./libraries/router_002/
mkdir -p ./libraries/router_001/
mkdir -p ./libraries/ext_epcq_flash_avl_csr_agent_rsp_fifo/
mkdir -p ./libraries/ext_epcq_flash_avl_csr_agent/
mkdir -p ./libraries/cpu_data_master_agent/
mkdir -p ./libraries/ext_epcq_flash_avl_csr_translator/
mkdir -p ./libraries/cpu_data_master_translator/
mkdir -p ./libraries/remote_update_controller/
mkdir -p ./libraries/remote_update_core/
mkdir -p ./libraries/read_mstr_internal/
mkdir -p ./libraries/write_mstr_internal/
mkdir -p ./libraries/prefetcher_internal/
mkdir -p ./libraries/dispatcher_internal/
mkdir -p ./libraries/addr_adaption_0/
mkdir -p ./libraries/asmi2_inst_epcq_ctrl/
mkdir -p ./libraries/i_tse_mac/
mkdir -p ./libraries/cpu/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/mm_interconnect_1/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/userhw_0/
mkdir -p ./libraries/user_dipsw/
mkdir -p ./libraries/sysid/
mkdir -p ./libraries/sys_clk_timer/
mkdir -p ./libraries/sll_hyperbus_controller_top_0/
mkdir -p ./libraries/remote_update/
mkdir -p ./libraries/opencores_i2c_0/
mkdir -p ./libraries/onchip_ram/
mkdir -p ./libraries/msgdma_tx/
mkdir -p ./libraries/msgdma_rx/
mkdir -p ./libraries/mm_bridge_0/
mkdir -p ./libraries/led_pio/
mkdir -p ./libraries/jtag_uart/
mkdir -p ./libraries/ext_epcq_flash/
mkdir -p ./libraries/eth_tse/
mkdir -p ./libraries/enet_pll/
mkdir -p ./libraries/descriptor_memory/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/cyclone10lp_ver/
mkdir -p ./libraries/altera/
mkdir -p ./libraries/lpm/
mkdir -p ./libraries/sgate/
mkdir -p ./libraries/altera_mf/
mkdir -p ./libraries/altera_lnsim/
mkdir -p ./libraries/cyclone10lp/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_bht_ram.dat ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_bht_ram.hex ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_bht_ram.mif ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_dc_tag_ram.dat ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_dc_tag_ram.hex ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_dc_tag_ram.mif ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ic_tag_ram.dat ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ic_tag_ram.hex ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ic_tag_ram.mif ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ociram_default_contents.dat ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ociram_default_contents.hex ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_ociram_default_contents.mif ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_a.dat ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_a.hex ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_a.mif ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_b.dat ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_b.hex ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_rf_ram_b.mif ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_onchip_ram.hex ./
  cp -f C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_descriptor_memory.hex ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"              -work altera_ver     
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                       -work lpm_ver        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                          -work sgate_ver      
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                      -work altera_mf_ver  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclone10lp_atoms.v"              -work cyclone10lp_ver
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"        -work altera         
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"    -work altera         
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"       -work altera         
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"    -work altera         
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd" -work altera         
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"            -work altera         
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                      -work lpm            
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                     -work lpm            
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                   -work sgate          
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                        -work sgate          
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"         -work altera_mf      
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                    -work altera_mf      
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                  -work altera_lnsim   
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"      -work altera_lnsim   
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclone10lp_atoms.vhd"            -work cyclone10lp    
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclone10lp_components.vhd"       -work cyclone10lp    
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "C:/FPGAEncrypt/q_sys/simulation/submodules/avst_fifo.vhd"                                                       -work avst_fifo                             -cdslib ./cds_libs/avst_fifo.cds.lib                            
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"        -work error_adapter_0                       -cdslib ./cds_libs/error_adapter_0.cds.lib                      
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_asmi2_qspi_interface_asmiblock.sv"                            -work asmi2_qspi_interface_0                -cdslib ./cds_libs/asmi2_qspi_interface_0.cds.lib               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_asmi2_qspi_interface.sv"                                      -work asmi2_qspi_interface_0                -cdslib ./cds_libs/asmi2_qspi_interface_0.cds.lib               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_asmi2_cmd_generator.sv"                                       -work asmi2_cmd_generator_0                 -cdslib ./cds_libs/asmi2_cmd_generator_0.cds.lib                
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_ext_epcq_flash_asmi2_inst_epcq_ctrl_multiplexer.sv"            -work multiplexer                           -cdslib ./cds_libs/multiplexer.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work multiplexer                           -cdslib ./cds_libs/multiplexer.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_ext_epcq_flash_asmi2_inst_epcq_ctrl_merlin_demultiplexer_0.sv" -work merlin_demultiplexer_0                -cdslib ./cds_libs/merlin_demultiplexer_0.cds.lib               
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_asmi2_xip_controller.sv"                                      -work xip_controller                        -cdslib ./cds_libs/xip_controller.cds.lib                       
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_ext_epcq_flash_asmi2_inst_epcq_ctrl_csr_controller.sv"         -work csr_controller                        -cdslib ./cds_libs/csr_controller.cds.lib                       
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_avalon_st_adapter_timing_adapter_0.sv"                         -work timing_adapter_0                      -cdslib ./cds_libs/timing_adapter_0.cds.lib                     
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_avalon_st_adapter_timing_adapter_0_fifo.sv"                    -work timing_adapter_0                      -cdslib ./cds_libs/timing_adapter_0.cds.lib                     
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_rsp_mux_004.sv"                              -work rsp_mux_004                           -cdslib ./cds_libs/rsp_mux_004.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux_004                           -cdslib ./cds_libs/rsp_mux_004.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_rsp_mux.sv"                                  -work rsp_mux                               -cdslib ./cds_libs/rsp_mux.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux                               -cdslib ./cds_libs/rsp_mux.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_rsp_demux.sv"                                -work rsp_demux                             -cdslib ./cds_libs/rsp_demux.cds.lib                            
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_cmd_mux_001.sv"                              -work cmd_mux_001                           -cdslib ./cds_libs/cmd_mux_001.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux_001                           -cdslib ./cds_libs/cmd_mux_001.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_cmd_mux.sv"                                  -work cmd_mux                               -cdslib ./cds_libs/cmd_mux.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux                               -cdslib ./cds_libs/cmd_mux.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_cmd_demux_004.sv"                            -work cmd_demux_004                         -cdslib ./cds_libs/cmd_demux_004.cds.lib                        
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_cmd_demux.sv"                                -work cmd_demux                             -cdslib ./cds_libs/cmd_demux.cds.lib                            
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_router_006.sv"                               -work router_006                            -cdslib ./cds_libs/router_006.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_router_005.sv"                               -work router_005                            -cdslib ./cds_libs/router_005.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_router_004.sv"                               -work router_004                            -cdslib ./cds_libs/router_004.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1_router.sv"                                   -work router                                -cdslib ./cds_libs/router.cds.lib                               
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_avalon_st_adapter.vhd"                       -work avalon_st_adapter                     -cdslib ./cds_libs/avalon_st_adapter.cds.lib                    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_handshake_clock_crosser.v"                          -work crosser                               -cdslib ./cds_libs/crosser.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_clock_crosser.v"                                    -work crosser                               -cdslib ./cds_libs/crosser.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_pipeline_base.v"                                    -work crosser                               -cdslib ./cds_libs/crosser.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_std_synchronizer_nocut.v"                                     -work crosser                               -cdslib ./cds_libs/crosser.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_mux_002.sv"                              -work rsp_mux_002                           -cdslib ./cds_libs/rsp_mux_002.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux_002                           -cdslib ./cds_libs/rsp_mux_002.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_mux_001.sv"                              -work rsp_mux_001                           -cdslib ./cds_libs/rsp_mux_001.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux_001                           -cdslib ./cds_libs/rsp_mux_001.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_mux.sv"                                  -work rsp_mux                               -cdslib ./cds_libs/rsp_mux.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work rsp_mux                               -cdslib ./cds_libs/rsp_mux.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_demux_004.sv"                            -work rsp_demux_004                         -cdslib ./cds_libs/rsp_demux_004.cds.lib                        
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_demux_003.sv"                            -work rsp_demux_003                         -cdslib ./cds_libs/rsp_demux_003.cds.lib                        
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_demux_002.sv"                            -work rsp_demux_002                         -cdslib ./cds_libs/rsp_demux_002.cds.lib                        
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_rsp_demux.sv"                                -work rsp_demux                             -cdslib ./cds_libs/rsp_demux.cds.lib                            
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_mux_004.sv"                              -work cmd_mux_004                           -cdslib ./cds_libs/cmd_mux_004.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux_004                           -cdslib ./cds_libs/cmd_mux_004.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_mux_002.sv"                              -work cmd_mux_002                           -cdslib ./cds_libs/cmd_mux_002.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux_002                           -cdslib ./cds_libs/cmd_mux_002.cds.lib                          
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_mux.sv"                                  -work cmd_mux                               -cdslib ./cds_libs/cmd_mux.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                         -work cmd_mux                               -cdslib ./cds_libs/cmd_mux.cds.lib                              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_demux_002.sv"                            -work cmd_demux_002                         -cdslib ./cds_libs/cmd_demux_002.cds.lib                        
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_demux_001.sv"                            -work cmd_demux_001                         -cdslib ./cds_libs/cmd_demux_001.cds.lib                        
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_cmd_demux.sv"                                -work cmd_demux                             -cdslib ./cds_libs/cmd_demux.cds.lib                            
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_burst_adapter.sv"                                      -work ext_epcq_flash_avl_csr_burst_adapter  -cdslib ./cds_libs/ext_epcq_flash_avl_csr_burst_adapter.cds.lib 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_burst_adapter_uncmpr.sv"                               -work ext_epcq_flash_avl_csr_burst_adapter  -cdslib ./cds_libs/ext_epcq_flash_avl_csr_burst_adapter.cds.lib 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_burst_adapter_13_1.sv"                                 -work ext_epcq_flash_avl_csr_burst_adapter  -cdslib ./cds_libs/ext_epcq_flash_avl_csr_burst_adapter.cds.lib 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_burst_adapter_new.sv"                                  -work ext_epcq_flash_avl_csr_burst_adapter  -cdslib ./cds_libs/ext_epcq_flash_avl_csr_burst_adapter.cds.lib 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_incr_burst_converter.sv"                                      -work ext_epcq_flash_avl_csr_burst_adapter  -cdslib ./cds_libs/ext_epcq_flash_avl_csr_burst_adapter.cds.lib 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_wrap_burst_converter.sv"                                      -work ext_epcq_flash_avl_csr_burst_adapter  -cdslib ./cds_libs/ext_epcq_flash_avl_csr_burst_adapter.cds.lib 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_default_burst_converter.sv"                                   -work ext_epcq_flash_avl_csr_burst_adapter  -cdslib ./cds_libs/ext_epcq_flash_avl_csr_burst_adapter.cds.lib 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_address_alignment.sv"                                  -work ext_epcq_flash_avl_csr_burst_adapter  -cdslib ./cds_libs/ext_epcq_flash_avl_csr_burst_adapter.cds.lib 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                  -work ext_epcq_flash_avl_csr_burst_adapter  -cdslib ./cds_libs/ext_epcq_flash_avl_csr_burst_adapter.cds.lib 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_pipeline_base.v"                                    -work ext_epcq_flash_avl_csr_burst_adapter  -cdslib ./cds_libs/ext_epcq_flash_avl_csr_burst_adapter.cds.lib 
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_traffic_limiter.sv"                                    -work cpu_data_master_limiter               -cdslib ./cds_libs/cpu_data_master_limiter.cds.lib              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_reorder_memory.sv"                                     -work cpu_data_master_limiter               -cdslib ./cds_libs/cpu_data_master_limiter.cds.lib              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_sc_fifo.v"                                             -work cpu_data_master_limiter               -cdslib ./cds_libs/cpu_data_master_limiter.cds.lib              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_st_pipeline_base.v"                                    -work cpu_data_master_limiter               -cdslib ./cds_libs/cpu_data_master_limiter.cds.lib              
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router_008.sv"                               -work router_008                            -cdslib ./cds_libs/router_008.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router_006.sv"                               -work router_006                            -cdslib ./cds_libs/router_006.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router_004.sv"                               -work router_004                            -cdslib ./cds_libs/router_004.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router_002.sv"                               -work router_002                            -cdslib ./cds_libs/router_002.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router_001.sv"                               -work router_001                            -cdslib ./cds_libs/router_001.cds.lib                           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0_router.sv"                                   -work router                                -cdslib ./cds_libs/router.cds.lib                               
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_sc_fifo.v"                                             -work ext_epcq_flash_avl_csr_agent_rsp_fifo -cdslib ./cds_libs/ext_epcq_flash_avl_csr_agent_rsp_fifo.cds.lib
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_slave_agent.sv"                                        -work ext_epcq_flash_avl_csr_agent          -cdslib ./cds_libs/ext_epcq_flash_avl_csr_agent.cds.lib         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_burst_uncompressor.sv"                                 -work ext_epcq_flash_avl_csr_agent          -cdslib ./cds_libs/ext_epcq_flash_avl_csr_agent.cds.lib         
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_master_agent.sv"                                       -work cpu_data_master_agent                 -cdslib ./cds_libs/cpu_data_master_agent.cds.lib                
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_slave_translator.sv"                                   -work ext_epcq_flash_avl_csr_translator     -cdslib ./cds_libs/ext_epcq_flash_avl_csr_translator.cds.lib    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_merlin_master_translator.sv"                                  -work cpu_data_master_translator            -cdslib ./cds_libs/cpu_data_master_translator.cds.lib           
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_remote_update_remote_update_controller.sv"                     -work remote_update_controller              -cdslib ./cds_libs/remote_update_controller.cds.lib             
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_remote_update_core.v"                                         -work remote_update_core                    -cdslib ./cds_libs/remote_update_core.cds.lib                   
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/read_master.v"                                                       -work read_mstr_internal                    -cdslib ./cds_libs/read_mstr_internal.cds.lib                   
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/MM_to_ST_Adapter.v"                                                  -work read_mstr_internal                    -cdslib ./cds_libs/read_mstr_internal.cds.lib                   
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/read_burst_control.v"                                                -work read_mstr_internal                    -cdslib ./cds_libs/read_mstr_internal.cds.lib                   
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/write_master.v"                                                      -work write_mstr_internal                   -cdslib ./cds_libs/write_mstr_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/byte_enable_generator.v"                                             -work write_mstr_internal                   -cdslib ./cds_libs/write_mstr_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/ST_to_MM_Adapter.v"                                                  -work write_mstr_internal                   -cdslib ./cds_libs/write_mstr_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/write_burst_control.v"                                               -work write_mstr_internal                   -cdslib ./cds_libs/write_mstr_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher.v"                                          -work prefetcher_internal                   -cdslib ./cds_libs/prefetcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher_read.v"                                     -work prefetcher_internal                   -cdslib ./cds_libs/prefetcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher_write_back.v"                               -work prefetcher_internal                   -cdslib ./cds_libs/prefetcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher_fifo.v"                                     -work prefetcher_internal                   -cdslib ./cds_libs/prefetcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher_interrrupt.v"                               -work prefetcher_internal                   -cdslib ./cds_libs/prefetcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_msgdma_prefetcher_csr.v"                                      -work prefetcher_internal                   -cdslib ./cds_libs/prefetcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/dispatcher.v"                                                        -work dispatcher_internal                   -cdslib ./cds_libs/dispatcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/descriptor_buffers.v"                                                -work dispatcher_internal                   -cdslib ./cds_libs/dispatcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/csr_block.v"                                                         -work dispatcher_internal                   -cdslib ./cds_libs/dispatcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/response_block.v"                                                    -work dispatcher_internal                   -cdslib ./cds_libs/dispatcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/fifo_with_byteenables.v"                                             -work dispatcher_internal                   -cdslib ./cds_libs/dispatcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/read_signal_breakout.v"                                              -work dispatcher_internal                   -cdslib ./cds_libs/dispatcher_internal.cds.lib                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/write_signal_breakout.v"                                             -work dispatcher_internal                   -cdslib ./cds_libs/dispatcher_internal.cds.lib                  
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_qspi_address_adaption.sv"                                     -work addr_adaption_0                       -cdslib ./cds_libs/addr_adaption_0.cds.lib                      
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_qspi_address_adaption_core.sv"                                -work addr_adaption_0                       -cdslib ./cds_libs/addr_adaption_0.cds.lib                      
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_ext_epcq_flash_asmi2_inst_epcq_ctrl.vhd"                       -work asmi2_inst_epcq_ctrl                  -cdslib ./cds_libs/asmi2_inst_epcq_ctrl.cds.lib                 
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_std_synchronizer_nocut.v"                                     -work i_tse_mac                             -cdslib ./cds_libs/i_tse_mac.cds.lib                            
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu.vo"                                                    -work cpu                                   -cdslib ./cds_libs/cpu.cds.lib                                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_debug_slave_sysclk.v"                                  -work cpu                                   -cdslib ./cds_libs/cpu.cds.lib                                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_debug_slave_tck.v"                                     -work cpu                                   -cdslib ./cds_libs/cpu.cds.lib                                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_debug_slave_wrapper.v"                                 -work cpu                                   -cdslib ./cds_libs/cpu.cds.lib                                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_mult_cell.v"                                           -work cpu                                   -cdslib ./cds_libs/cpu.cds.lib                                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu_cpu_test_bench.v"                                          -work cpu                                   -cdslib ./cds_libs/cpu.cds.lib                                  
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_reset_controller.v"                                           -work rst_controller                        -cdslib ./cds_libs/rst_controller.cds.lib                       
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_reset_synchronizer.v"                                         -work rst_controller                        -cdslib ./cds_libs/rst_controller.cds.lib                       
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_avalon_st_adapter.vhd"                                         -work avalon_st_adapter                     -cdslib ./cds_libs/avalon_st_adapter.cds.lib                    
  ncvlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_irq_mapper.sv"                                                 -work irq_mapper                            -cdslib ./cds_libs/irq_mapper.cds.lib                           
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_1.v"                                           -work mm_interconnect_1                     -cdslib ./cds_libs/mm_interconnect_1.cds.lib                    
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_mm_interconnect_0.v"                                           -work mm_interconnect_0                     -cdslib ./cds_libs/mm_interconnect_0.cds.lib                    
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "C:/FPGAEncrypt/q_sys/simulation/submodules/userhw.vhd"                                                          -work userhw_0                              -cdslib ./cds_libs/userhw_0.cds.lib                             
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_user_dipsw.v"                                                  -work user_dipsw                            -cdslib ./cds_libs/user_dipsw.cds.lib                           
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_sysid.v"                                                       -work sysid                                 -cdslib ./cds_libs/sysid.cds.lib                                
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_sys_clk_timer.v"                                               -work sys_clk_timer                         -cdslib ./cds_libs/sys_clk_timer.cds.lib                        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_gpio_lite.sv"                                                 -work sll_hyperbus_controller_top_0         -cdslib ./cds_libs/sll_hyperbus_controller_top_0.cds.lib        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_remote_update.v"                                               -work remote_update                         -cdslib ./cds_libs/remote_update.cds.lib                        
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/opencores_i2c.v"                                                     -work opencores_i2c_0                       -cdslib ./cds_libs/opencores_i2c_0.cds.lib                      
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/i2c_master_bit_ctrl.v"                                               -work opencores_i2c_0                       -cdslib ./cds_libs/opencores_i2c_0.cds.lib                      
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/i2c_master_byte_ctrl.v"                                              -work opencores_i2c_0                       -cdslib ./cds_libs/opencores_i2c_0.cds.lib                      
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/i2c_master_defines.v"                                                -work opencores_i2c_0                       -cdslib ./cds_libs/opencores_i2c_0.cds.lib                      
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/i2c_master_top.v"                                                    -work opencores_i2c_0                       -cdslib ./cds_libs/opencores_i2c_0.cds.lib                      
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/timescale.v"                                                         -work opencores_i2c_0                       -cdslib ./cds_libs/opencores_i2c_0.cds.lib                      
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_onchip_ram.v"                                                  -work onchip_ram                            -cdslib ./cds_libs/onchip_ram.cds.lib                           
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_msgdma_tx.v"                                                   -work msgdma_tx                             -cdslib ./cds_libs/msgdma_tx.cds.lib                            
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_msgdma_rx.v"                                                   -work msgdma_rx                             -cdslib ./cds_libs/msgdma_rx.cds.lib                            
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/altera_avalon_mm_bridge.v"                                           -work mm_bridge_0                           -cdslib ./cds_libs/mm_bridge_0.cds.lib                          
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_led_pio.v"                                                     -work led_pio                               -cdslib ./cds_libs/led_pio.cds.lib                              
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_jtag_uart.v"                                                   -work jtag_uart                             -cdslib ./cds_libs/jtag_uart.cds.lib                            
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_ext_epcq_flash.vhd"                                            -work ext_epcq_flash                        -cdslib ./cds_libs/ext_epcq_flash.cds.lib                       
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_eth_tse.vhd"                                                   -work eth_tse                               -cdslib ./cds_libs/eth_tse.cds.lib                              
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_enet_pll.vho"                                                  -work enet_pll                              -cdslib ./cds_libs/enet_pll.cds.lib                             
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_descriptor_memory.v"                                           -work descriptor_memory                     -cdslib ./cds_libs/descriptor_memory.cds.lib                    
  ncvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "C:/FPGAEncrypt/q_sys/simulation/submodules/q_sys_cpu.v"                                                         -work cpu                                   -cdslib ./cds_libs/cpu.cds.lib                                  
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "C:/FPGAEncrypt/q_sys/simulation/q_sys.vhd"                                                                                                                                                                                  
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "C:/FPGAEncrypt/q_sys/simulation/q_sys_rst_controller.vhd"                                                                                                                                                                   
  ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS   "C:/FPGAEncrypt/q_sys/simulation/q_sys_rst_controller_001.vhd"                                                                                                                                                               
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  export GENERIC_PARAM_COMPAT_CHECK=1
  ncelab -access +w+r+c -namemap_mixgen -relax $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi

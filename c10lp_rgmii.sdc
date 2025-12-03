#**************************************************************
# Create Clock
#**************************************************************
create_clock -name {c10_clk50m} -period 20.000 {c10_clk50m}
create_clock -name {hbus_clk_50m} -period 20.000 {hbus_clk_50m}
#create_clock -name {c10_clk_adj} -period 20.000 {c10_clk_adj}
create_clock -name {enet_clk_125m} -period 8.000 {enet_clk_125m}



# JTAG Signal Constraints constrain the TCK port, assuming a 10MHz JTAG clock and 3ns delays
create_clock -name {altera_reserved_tck} -period 41.667 [get_ports { altera_reserved_tck }]
set_input_delay -clock altera_reserved_tck -clock_fall -max 5 [get_ports altera_reserved_tdi]
set_input_delay -clock altera_reserved_tck -clock_fall -max 5 [get_ports altera_reserved_tms]
set_output_delay -clock altera_reserved_tck 5 [get_ports altera_reserved_tdo]


################################ SDC for RGMII interface #################################################


set enet_pll_125 { q_sys_inst|enet_pll|sd1|pll7|clk[3] };
set enet_pll_25  { q_sys_inst|enet_pll|sd1|pll7|clk[4] };
set enet_pll_2p5 { q_sys_inst|enet_pll|sd1|pll7|clk[2] };

#call sdc files for rgmii interface
#source rgmii_sdc/rgmii_clocks.sdc
#source rgmii_sdc/rgmii_input.sdc
#source rgmii_sdc/rgmii_output.sdc

derive_pll_clocks

#Timing constraint for RGMII interface
#Timing constraint for RGMII RX interface
#Virtual clock has no phase shift
create_clock -name {virt_enet_rx_clk_125m} -period 8.000 
create_clock -name {virt_enet_rx_clk_25m} -period 40.000
create_clock -name {virt_enet_rx_clk_2m5} -period 400.000 

#input clock has 90 degree phase shift
create_clock -name {enet_rx_clk_125m} -period 8.000 {enet_rx_clk} -waveform {2 6}
create_clock -name {enet_rx_clk_25m} -period 40.000 {enet_rx_clk} -waveform {10 30} -add
create_clock -name {enet_rx_clk_2m5} -period 400.000 {enet_rx_clk} -waveform {100 300} -add

## Constraint the path to the rising/falling edge of the phy clock
## setup time: 2ns-0.75ns=1.25ns, 0.75ns skew, 
## hold time: 0.75ns skew, 2-1.5-0.75=-0.25ns
## clock edge is 1.5 ns delay with data
set_input_delay -add_delay -clock virt_enet_rx_clk_125m -max 1.25 [get_ports {enet_rx_dv enet_rx_d*}]
set_input_delay -add_delay -clock virt_enet_rx_clk_125m -min -0.25 [get_ports {enet_rx_dv enet_rx_d*}]
set_input_delay -add_delay -clock virt_enet_rx_clk_125m -clock_fall -max 1.25 [get_ports {enet_rx_dv enet_rx_d*}]
set_input_delay -add_delay -clock virt_enet_rx_clk_125m -clock_fall -min -0.25 [get_ports {enet_rx_dv enet_rx_d*}]

set_input_delay -add_delay -clock virt_enet_rx_clk_25m -max 1.25 [get_ports {enet_rx_dv enet_rx_d*}]
set_input_delay -add_delay -clock virt_enet_rx_clk_25m -min -0.25 [get_ports {enet_rx_dv enet_rx_d*}]
#set_input_delay -add_delay -clock virt_enet_rx_clk_25m -clock_fall -max 1.25 [get_ports {enet_rx_dv enet_rx_d*}]
#set_input_delay -add_delay -clock virt_enet_rx_clk_25m -clock_fall -min -0.25 [get_ports {enet_rx_dv enet_rx_d*}]

set_input_delay -add_delay -clock virt_enet_rx_clk_2m5 -max 1.25 [get_ports {enet_rx_dv enet_rx_d*}]
set_input_delay -add_delay -clock virt_enet_rx_clk_2m5 -min -0.25 [get_ports {enet_rx_dv enet_rx_d*}]
#set_input_delay -add_delay -clock virt_enet_rx_clk_2m5 -clock_fall -max 1.25 [get_ports {enet_rx_dv enet_rx_d*}]
#set_input_delay -add_delay -clock virt_enet_rx_clk_2m5 -clock_fall -min -0.25 [get_ports {enet_rx_dv enet_rx_d*}]



set_clock_groups \
    -exclusive \
    -group [get_clocks enet_rx_clk_125m] \
    -group [get_clocks enet_rx_clk_25m] \
    -group [get_clocks enet_rx_clk_2m5]

##setup time, set false path, rise-->fall, fall-->rise
set_false_path -rise_from [get_clocks {virt_enet_rx_clk_125m}] -fall_to [get_clocks {enet_rx_clk_125m}] -setup 
set_false_path -fall_from [get_clocks {virt_enet_rx_clk_125m}] -rise_to [get_clocks {enet_rx_clk_125m}] -setup 

#set_false_path -rise_from [get_clocks {virt_enet_rx_clk_25m}] -fall_to [get_clocks {enet_rx_clk_25m}] -setup 
#set_false_path -fall_from [get_clocks {virt_enet_rx_clk_25m}] -rise_to [get_clocks {enet_rx_clk_25m}] -setup 
#
#set_false_path -rise_from [get_clocks {virt_enet_rx_clk_2m5}] -fall_to [get_clocks {enet_rx_clk_2m5}] -setup 
#set_false_path -fall_from [get_clocks {virt_enet_rx_clk_2m5}] -rise_to [get_clocks {enet_rx_clk_2m5}] -setup 


##hold time, set false path, rise-->rise, fall-->fall
set_false_path -rise_from [get_clocks {virt_enet_rx_clk_125m}] -rise_to [get_clocks {enet_rx_clk_125m}] -hold 
set_false_path -fall_from [get_clocks {virt_enet_rx_clk_125m}] -fall_to [get_clocks {enet_rx_clk_125m}] -hold 

#set_false_path -rise_from [get_clocks {virt_enet_rx_clk_25m}] -rise_to [get_clocks {enet_rx_clk_25m}] -hold 
#set_false_path -fall_from [get_clocks {virt_enet_rx_clk_25m}] -fall_to [get_clocks {enet_rx_clk_25m}] -hold
#
#set_false_path -rise_from [get_clocks {virt_enet_rx_clk_2m5}] -rise_to [get_clocks {enet_rx_clk_2m5}] -hold
#set_false_path -fall_from [get_clocks {virt_enet_rx_clk_2m5}] -fall_to [get_clocks {enet_rx_clk_2m5}] -hold

##RGMII TX clock timing constraint
##1ns setup time and 1ns hold time
##
create_generated_clock -name enet_tx_clk_125m -source [get_pins {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] [get_ports {enet_tx_clk}]
create_generated_clock -name enet_tx_clk_25m -source [get_pins {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] [get_ports {enet_tx_clk}] -add
create_generated_clock -name enet_tx_clk_2m5 -source [get_pins {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -phase 90 [get_ports {enet_tx_clk}] -add

set_output_delay -add_delay -clock [get_clocks enet_tx_clk_125m] -max 1 [get_ports {enet_tx_en enet_tx_d*}]
set_output_delay -add_delay -clock [get_clocks enet_tx_clk_125m] -min -1 [get_ports {enet_tx_en enet_tx_d*}]
set_output_delay -add_delay -clock [get_clocks enet_tx_clk_125m] -max 1 -clock_fall [get_ports {enet_tx_en enet_tx_d*}]
set_output_delay -add_delay -clock [get_clocks enet_tx_clk_125m] -min -1 -clock_fall [get_ports {enet_tx_en enet_tx_d*}]


set_output_delay -add_delay -clock [get_clocks enet_tx_clk_25m] -max 1 [get_ports {enet_tx_en enet_tx_d*}]
set_output_delay -add_delay -clock [get_clocks enet_tx_clk_25m] -min -1 [get_ports {enet_tx_en enet_tx_d*}]
#set_output_delay -add_delay -clock [get_clocks enet_tx_clk_25m] -max 1 -clock_fall [get_ports {enet_tx_en enet_tx_d*}]
#set_output_delay -add_delay -clock [get_clocks enet_tx_clk_25m] -min -1 -clock_fall [get_ports {enet_tx_en enet_tx_d*}]

set_output_delay -add_delay -clock [get_clocks enet_tx_clk_2m5] -max 1 [get_ports {enet_tx_en enet_tx_d*}]
set_output_delay -add_delay -clock [get_clocks enet_tx_clk_2m5] -min -1 [get_ports {enet_tx_en enet_tx_d*}]
#set_output_delay -add_delay -clock [get_clocks enet_tx_clk_2m5] -max 1 -clock_fall [get_ports {enet_tx_en enet_tx_d*}]
#set_output_delay -add_delay -clock [get_clocks enet_tx_clk_2m5] -min -1 -clock_fall [get_ports {enet_tx_en enet_tx_d*}]


set_false_path -from {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|ena_10} -to {enet_tx_d*}
set_false_path -from {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|ena_10} -to {enet_tx_en}
set_false_path -from {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|eth_mode} -to {enet_tx_d*}
set_false_path -from {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|eth_mode} -to {enet_tx_en}

set_clock_groups \
    -exclusive \
    -group {virt_enet_rx_clk_125m enet_rx_clk_125m}  \
    -group {virt_enet_rx_clk_25m enet_rx_clk_25m}  \
    -group {virt_enet_rx_clk_2m5 enet_rx_clk_2m5} 



set_clock_groups \
    -exclusive \
    -group {q_sys_inst|enet_pll|sd1|pll7|clk[0] enet_tx_clk_125m}  \
    -group {q_sys_inst|enet_pll|sd1|pll7|clk[1] enet_tx_clk_25m}  \
    -group {q_sys_inst|enet_pll|sd1|pll7|clk[2] enet_tx_clk_2m5} 
	
#set_clock_groups \
#    -group {hbus_clk_50m q_sys_inst|enet_pll|sd1|pll7|clk[3]}

##setup time, set false path, rise-->fall, fall-->rise
set_false_path -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -fall_to [get_clocks {enet_tx_clk_125m}] -setup 
set_false_path -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -rise_to [get_clocks {enet_tx_clk_125m}] -setup 

#set_false_path -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {enet_tx_clk_25m}] -setup 
#set_false_path -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {enet_tx_clk_25m}] -setup 
#
#set_false_path -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -fall_to [get_clocks {enet_tx_clk_2m5}] -setup 
#set_false_path -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -rise_to [get_clocks {enet_tx_clk_2m5}] -setup 


##hold time, set false path, rise-->rise, fall-->fall
set_false_path -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -rise_to [get_clocks {enet_tx_clk_125m}] -hold 
set_false_path -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -fall_to [get_clocks {enet_tx_clk_125m}] -hold 
#
#set_false_path -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {enet_tx_clk_25m}] -hold 
#set_false_path -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {enet_tx_clk_25m}] -hold
#
#set_false_path -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -rise_to [get_clocks {enet_tx_clk_2m5}] -hold
#set_false_path -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -fall_to [get_clocks {enet_tx_clk_2m5}] -hold




# Create false paths between clock domains that are not fully constrained by the IP that makes these paths.
# Ideally we should not have to do this, however, these paths must be cut to meet timing and in most cases
# the IP should be accounting for synchronization between these paths.
# The risk of a global cut like these is that if the IP is not synchronizing properly between the two domains
# then you have significant problems with the design.  Ideally the IP should synchronize it's clock crossing
# paths and create constraints to cut those paths so we don't have to perform a global cut like this.
#

set_clock_groups \
    -exclusive \
    -group [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}] \
    -group [get_clocks enet_rx_clk] \
    -group [get_clocks hbus_clk_50m]


#
#some clock uncertainty is required
#
derive_clock_uncertainty

# QSPI interface
set_output_delay -clock { q_sys_inst|enet_pll|sd1|pll7|clk[1] } -rise -min 6 [get_ports {qspi_io[*]}]
set_output_delay -clock { q_sys_inst|enet_pll|sd1|pll7|clk[1] } -rise -min 6 [get_ports {qspi_clk}]
set_output_delay -clock { q_sys_inst|enet_pll|sd1|pll7|clk[1] } -rise -min 6 [get_ports {qspi_csn}]
set_input_delay  -clock { q_sys_inst|enet_pll|sd1|pll7|clk[1] } -rise -min 5 [get_ports {qspi_io[*]}]


set_false_path -from [get_ports {fpga_resetn}] 
set_false_path -from [get_ports {user_dipsw[*]}] 
set_false_path -from [get_ports {user_pb[*]}] 
set_false_path -to [get_ports {user_led[*]}]
set_false_path -to [get_ports {enet_resetn}]

set_false_path -from {epcount[19]} -to {enet_gtx_clk_ddio*}

set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller|r_sync_rst} -to {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_reset_synchronizer:reset_sync_1|*}
set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller|r_sync_rst} -to {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_reset_synchronizer:reset_sync_0|*}


set_false_path -from * -to {sld_signaltap:auto_signaltap_0|*}
set_false_path -from {sld_signaltap:auto_signaltap_0|*} -to *

set_false_path -from {epcount[19]} -to {enet_clk_ddio:enet_clk_ddio_inst|altddio_out:ALTDDIO_OUT_component|ddio_out_knj:auto_generated|*}


set_false_path -from [get_clocks {hbus_clk_50m}] -to [get_clocks {q_sys_inst|sll_hyperbus_controller_top_0|U_IO|U_SLL_HBC_T001_PLL|altpll_component|auto_generated|pll1|clk[4]}]

set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_00?|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|sll_hyperbus_controller_top:sll_hyperbus_controller_top_0|sll_ca_hbc_t001_io:U_IO|sll_ca_hbc_t001_ddio_out:U_CLK0|altddio_out:ALTDDIO_OUT_component|*}
set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_00?|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|sll_hyperbus_controller_top:sll_hyperbus_controller_top_0|sll_ca_hbc_t001_io:U_IO|sll_ca_hbc_t001_ddio_out:U_CLK0n|altddio_out:ALTDDIO_OUT_component|*}
set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_00?|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|sll_hyperbus_controller_top:sll_hyperbus_controller_top_0|sll_ca_hbc_t001_io:U_IO|sll_ca_hbc_t001_ddio_out:U_DQ|altddio_out:ALTDDIO_OUT_component|*}
set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_00?|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|sll_hyperbus_controller_top:sll_hyperbus_controller_top_0|sll_ca_hbc_t001_io:U_IO|sll_ca_hbc_t001_ddio_out:U_RWDS|altddio_out:ALTDDIO_OUT_component|*}
set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_00?|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|sll_hyperbus_controller_top:sll_hyperbus_controller_top_0|sll_ca_hbc_t001_io:U_IO|sll_ca_hbc_t001_ddio_out:csn_[0].U_CS1n|altddio_out:ALTDDIO_OUT_component|*}

set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_00?|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|sll_hyperbus_controller_top:sll_hyperbus_controller_top_0|*}
                 
#set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_00?|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|q_sys_mm_interconnect_0:mm_interconnect_0|*}
#set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_00?|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|q_sys_msgdma_rx:msgdma_rx|*}
#set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_00?|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|altera_avalon_mm_bridge:mm_bridge_0|*}
#set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_00?|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|q_sys_mm_interconnect_1:mm_interconnect_1|*}
#set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_002|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|opencores_i2c:opencores_i2c_0|i2c_master_top:i2c_master_top_inst|*}
#set_false_path -from {q_sys:q_sys_inst|altera_reset_controller:rst_controller_002|altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out} -to {q_sys:q_sys_inst|q_sys_user_dipsw:user_pb|*}

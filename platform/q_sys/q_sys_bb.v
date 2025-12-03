
module q_sys (
	clock_bridge_0_in_clk_clk,
	enet_clk_125m_in_clk,
	enet_pll_areset_conduit_export,
	enet_pll_c0_125m_clk,
	enet_pll_c1_25m_clk,
	enet_pll_c2_2m5_clk,
	enet_pll_c3_125m_shift_clk,
	enet_pll_c4_25m_shift_clk,
	enet_pll_locked_conduit_export,
	eth_tse_mac_mdio_connection_mdc,
	eth_tse_mac_mdio_connection_mdio_in,
	eth_tse_mac_mdio_connection_mdio_out,
	eth_tse_mac_mdio_connection_mdio_oen,
	eth_tse_mac_rgmii_connection_rgmii_in,
	eth_tse_mac_rgmii_connection_rgmii_out,
	eth_tse_mac_rgmii_connection_rx_control,
	eth_tse_mac_rgmii_connection_tx_control,
	eth_tse_mac_status_connection_set_10,
	eth_tse_mac_status_connection_set_1000,
	eth_tse_mac_status_connection_eth_mode,
	eth_tse_mac_status_connection_ena_10,
	eth_tse_pcs_mac_rx_clock_connection_clk,
	eth_tse_pcs_mac_tx_clock_connection_clk,
	hbus_clk_clk,
	hbus_reset_reset_n,
	hyperbus_controller_top_HB_RSTn,
	hyperbus_controller_top_HB_CLK0,
	hyperbus_controller_top_HB_CLK0n,
	hyperbus_controller_top_HB_CLK1,
	hyperbus_controller_top_HB_CLK1n,
	hyperbus_controller_top_HB_CS0n,
	hyperbus_controller_top_HB_CS1n,
	hyperbus_controller_top_HB_WPn,
	hyperbus_controller_top_HB_RWDS,
	hyperbus_controller_top_HB_dq,
	hyperbus_controller_top_HB_RSTOn,
	hyperbus_controller_top_HB_INTn,
	led_pio_external_connection_export,
	opencores_i2c_scl_pad_io,
	opencores_i2c_sda_pad_io,
	reset_enet_reset_n,
	user_dipsw_external_connection_export,
	user_pb_external_connection_export);	

	input		clock_bridge_0_in_clk_clk;
	input		enet_clk_125m_in_clk;
	input		enet_pll_areset_conduit_export;
	output		enet_pll_c0_125m_clk;
	output		enet_pll_c1_25m_clk;
	output		enet_pll_c2_2m5_clk;
	output		enet_pll_c3_125m_shift_clk;
	output		enet_pll_c4_25m_shift_clk;
	output		enet_pll_locked_conduit_export;
	output		eth_tse_mac_mdio_connection_mdc;
	input		eth_tse_mac_mdio_connection_mdio_in;
	output		eth_tse_mac_mdio_connection_mdio_out;
	output		eth_tse_mac_mdio_connection_mdio_oen;
	input	[3:0]	eth_tse_mac_rgmii_connection_rgmii_in;
	output	[3:0]	eth_tse_mac_rgmii_connection_rgmii_out;
	input		eth_tse_mac_rgmii_connection_rx_control;
	output		eth_tse_mac_rgmii_connection_tx_control;
	input		eth_tse_mac_status_connection_set_10;
	input		eth_tse_mac_status_connection_set_1000;
	output		eth_tse_mac_status_connection_eth_mode;
	output		eth_tse_mac_status_connection_ena_10;
	input		eth_tse_pcs_mac_rx_clock_connection_clk;
	input		eth_tse_pcs_mac_tx_clock_connection_clk;
	input		hbus_clk_clk;
	input		hbus_reset_reset_n;
	output		hyperbus_controller_top_HB_RSTn;
	output		hyperbus_controller_top_HB_CLK0;
	output		hyperbus_controller_top_HB_CLK0n;
	output		hyperbus_controller_top_HB_CLK1;
	output		hyperbus_controller_top_HB_CLK1n;
	output		hyperbus_controller_top_HB_CS0n;
	output		hyperbus_controller_top_HB_CS1n;
	output		hyperbus_controller_top_HB_WPn;
	inout		hyperbus_controller_top_HB_RWDS;
	inout	[7:0]	hyperbus_controller_top_HB_dq;
	input		hyperbus_controller_top_HB_RSTOn;
	input		hyperbus_controller_top_HB_INTn;
	output	[3:0]	led_pio_external_connection_export;
	inout		opencores_i2c_scl_pad_io;
	inout		opencores_i2c_sda_pad_io;
	input		reset_enet_reset_n;
	input	[3:0]	user_dipsw_external_connection_export;
	input	[3:0]	user_pb_external_connection_export;
endmodule

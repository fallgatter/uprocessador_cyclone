	component q_sys is
		port (
			clock_bridge_0_in_clk_clk               : in    std_logic                    := 'X';             -- clk
			enet_clk_125m_in_clk                    : in    std_logic                    := 'X';             -- clk
			enet_pll_areset_conduit_export          : in    std_logic                    := 'X';             -- export
			enet_pll_c0_125m_clk                    : out   std_logic;                                       -- clk
			enet_pll_c1_25m_clk                     : out   std_logic;                                       -- clk
			enet_pll_c2_2m5_clk                     : out   std_logic;                                       -- clk
			enet_pll_c3_125m_shift_clk              : out   std_logic;                                       -- clk
			enet_pll_c4_25m_shift_clk               : out   std_logic;                                       -- clk
			enet_pll_locked_conduit_export          : out   std_logic;                                       -- export
			eth_tse_mac_mdio_connection_mdc         : out   std_logic;                                       -- mdc
			eth_tse_mac_mdio_connection_mdio_in     : in    std_logic                    := 'X';             -- mdio_in
			eth_tse_mac_mdio_connection_mdio_out    : out   std_logic;                                       -- mdio_out
			eth_tse_mac_mdio_connection_mdio_oen    : out   std_logic;                                       -- mdio_oen
			eth_tse_mac_rgmii_connection_rgmii_in   : in    std_logic_vector(3 downto 0) := (others => 'X'); -- rgmii_in
			eth_tse_mac_rgmii_connection_rgmii_out  : out   std_logic_vector(3 downto 0);                    -- rgmii_out
			eth_tse_mac_rgmii_connection_rx_control : in    std_logic                    := 'X';             -- rx_control
			eth_tse_mac_rgmii_connection_tx_control : out   std_logic;                                       -- tx_control
			eth_tse_mac_status_connection_set_10    : in    std_logic                    := 'X';             -- set_10
			eth_tse_mac_status_connection_set_1000  : in    std_logic                    := 'X';             -- set_1000
			eth_tse_mac_status_connection_eth_mode  : out   std_logic;                                       -- eth_mode
			eth_tse_mac_status_connection_ena_10    : out   std_logic;                                       -- ena_10
			eth_tse_pcs_mac_rx_clock_connection_clk : in    std_logic                    := 'X';             -- clk
			eth_tse_pcs_mac_tx_clock_connection_clk : in    std_logic                    := 'X';             -- clk
			hbus_clk_clk                            : in    std_logic                    := 'X';             -- clk
			hbus_reset_reset_n                      : in    std_logic                    := 'X';             -- reset_n
			hyperbus_controller_top_HB_RSTn         : out   std_logic;                                       -- HB_RSTn
			hyperbus_controller_top_HB_CLK0         : out   std_logic;                                       -- HB_CLK0
			hyperbus_controller_top_HB_CLK0n        : out   std_logic;                                       -- HB_CLK0n
			hyperbus_controller_top_HB_CLK1         : out   std_logic;                                       -- HB_CLK1
			hyperbus_controller_top_HB_CLK1n        : out   std_logic;                                       -- HB_CLK1n
			hyperbus_controller_top_HB_CS0n         : out   std_logic;                                       -- HB_CS0n
			hyperbus_controller_top_HB_CS1n         : out   std_logic;                                       -- HB_CS1n
			hyperbus_controller_top_HB_WPn          : out   std_logic;                                       -- HB_WPn
			hyperbus_controller_top_HB_RWDS         : inout std_logic                    := 'X';             -- HB_RWDS
			hyperbus_controller_top_HB_dq           : inout std_logic_vector(7 downto 0) := (others => 'X'); -- HB_dq
			hyperbus_controller_top_HB_RSTOn        : in    std_logic                    := 'X';             -- HB_RSTOn
			hyperbus_controller_top_HB_INTn         : in    std_logic                    := 'X';             -- HB_INTn
			led_pio_external_connection_export      : out   std_logic_vector(3 downto 0);                    -- export
			opencores_i2c_scl_pad_io                : inout std_logic                    := 'X';             -- scl_pad_io
			opencores_i2c_sda_pad_io                : inout std_logic                    := 'X';             -- sda_pad_io
			reset_enet_reset_n                      : in    std_logic                    := 'X';             -- reset_n
			user_dipsw_external_connection_export   : in    std_logic_vector(3 downto 0) := (others => 'X'); -- export
			user_pb_external_connection_export      : in    std_logic_vector(3 downto 0) := (others => 'X')  -- export
		);
	end component q_sys;

	u0 : component q_sys
		port map (
			clock_bridge_0_in_clk_clk               => CONNECTED_TO_clock_bridge_0_in_clk_clk,               --               clock_bridge_0_in_clk.clk
			enet_clk_125m_in_clk                    => CONNECTED_TO_enet_clk_125m_in_clk,                    --                    enet_clk_125m_in.clk
			enet_pll_areset_conduit_export          => CONNECTED_TO_enet_pll_areset_conduit_export,          --             enet_pll_areset_conduit.export
			enet_pll_c0_125m_clk                    => CONNECTED_TO_enet_pll_c0_125m_clk,                    --                    enet_pll_c0_125m.clk
			enet_pll_c1_25m_clk                     => CONNECTED_TO_enet_pll_c1_25m_clk,                     --                     enet_pll_c1_25m.clk
			enet_pll_c2_2m5_clk                     => CONNECTED_TO_enet_pll_c2_2m5_clk,                     --                     enet_pll_c2_2m5.clk
			enet_pll_c3_125m_shift_clk              => CONNECTED_TO_enet_pll_c3_125m_shift_clk,              --              enet_pll_c3_125m_shift.clk
			enet_pll_c4_25m_shift_clk               => CONNECTED_TO_enet_pll_c4_25m_shift_clk,               --               enet_pll_c4_25m_shift.clk
			enet_pll_locked_conduit_export          => CONNECTED_TO_enet_pll_locked_conduit_export,          --             enet_pll_locked_conduit.export
			eth_tse_mac_mdio_connection_mdc         => CONNECTED_TO_eth_tse_mac_mdio_connection_mdc,         --         eth_tse_mac_mdio_connection.mdc
			eth_tse_mac_mdio_connection_mdio_in     => CONNECTED_TO_eth_tse_mac_mdio_connection_mdio_in,     --                                    .mdio_in
			eth_tse_mac_mdio_connection_mdio_out    => CONNECTED_TO_eth_tse_mac_mdio_connection_mdio_out,    --                                    .mdio_out
			eth_tse_mac_mdio_connection_mdio_oen    => CONNECTED_TO_eth_tse_mac_mdio_connection_mdio_oen,    --                                    .mdio_oen
			eth_tse_mac_rgmii_connection_rgmii_in   => CONNECTED_TO_eth_tse_mac_rgmii_connection_rgmii_in,   --        eth_tse_mac_rgmii_connection.rgmii_in
			eth_tse_mac_rgmii_connection_rgmii_out  => CONNECTED_TO_eth_tse_mac_rgmii_connection_rgmii_out,  --                                    .rgmii_out
			eth_tse_mac_rgmii_connection_rx_control => CONNECTED_TO_eth_tse_mac_rgmii_connection_rx_control, --                                    .rx_control
			eth_tse_mac_rgmii_connection_tx_control => CONNECTED_TO_eth_tse_mac_rgmii_connection_tx_control, --                                    .tx_control
			eth_tse_mac_status_connection_set_10    => CONNECTED_TO_eth_tse_mac_status_connection_set_10,    --       eth_tse_mac_status_connection.set_10
			eth_tse_mac_status_connection_set_1000  => CONNECTED_TO_eth_tse_mac_status_connection_set_1000,  --                                    .set_1000
			eth_tse_mac_status_connection_eth_mode  => CONNECTED_TO_eth_tse_mac_status_connection_eth_mode,  --                                    .eth_mode
			eth_tse_mac_status_connection_ena_10    => CONNECTED_TO_eth_tse_mac_status_connection_ena_10,    --                                    .ena_10
			eth_tse_pcs_mac_rx_clock_connection_clk => CONNECTED_TO_eth_tse_pcs_mac_rx_clock_connection_clk, -- eth_tse_pcs_mac_rx_clock_connection.clk
			eth_tse_pcs_mac_tx_clock_connection_clk => CONNECTED_TO_eth_tse_pcs_mac_tx_clock_connection_clk, -- eth_tse_pcs_mac_tx_clock_connection.clk
			hbus_clk_clk                            => CONNECTED_TO_hbus_clk_clk,                            --                            hbus_clk.clk
			hbus_reset_reset_n                      => CONNECTED_TO_hbus_reset_reset_n,                      --                          hbus_reset.reset_n
			hyperbus_controller_top_HB_RSTn         => CONNECTED_TO_hyperbus_controller_top_HB_RSTn,         --             hyperbus_controller_top.HB_RSTn
			hyperbus_controller_top_HB_CLK0         => CONNECTED_TO_hyperbus_controller_top_HB_CLK0,         --                                    .HB_CLK0
			hyperbus_controller_top_HB_CLK0n        => CONNECTED_TO_hyperbus_controller_top_HB_CLK0n,        --                                    .HB_CLK0n
			hyperbus_controller_top_HB_CLK1         => CONNECTED_TO_hyperbus_controller_top_HB_CLK1,         --                                    .HB_CLK1
			hyperbus_controller_top_HB_CLK1n        => CONNECTED_TO_hyperbus_controller_top_HB_CLK1n,        --                                    .HB_CLK1n
			hyperbus_controller_top_HB_CS0n         => CONNECTED_TO_hyperbus_controller_top_HB_CS0n,         --                                    .HB_CS0n
			hyperbus_controller_top_HB_CS1n         => CONNECTED_TO_hyperbus_controller_top_HB_CS1n,         --                                    .HB_CS1n
			hyperbus_controller_top_HB_WPn          => CONNECTED_TO_hyperbus_controller_top_HB_WPn,          --                                    .HB_WPn
			hyperbus_controller_top_HB_RWDS         => CONNECTED_TO_hyperbus_controller_top_HB_RWDS,         --                                    .HB_RWDS
			hyperbus_controller_top_HB_dq           => CONNECTED_TO_hyperbus_controller_top_HB_dq,           --                                    .HB_dq
			hyperbus_controller_top_HB_RSTOn        => CONNECTED_TO_hyperbus_controller_top_HB_RSTOn,        --                                    .HB_RSTOn
			hyperbus_controller_top_HB_INTn         => CONNECTED_TO_hyperbus_controller_top_HB_INTn,         --                                    .HB_INTn
			led_pio_external_connection_export      => CONNECTED_TO_led_pio_external_connection_export,      --         led_pio_external_connection.export
			opencores_i2c_scl_pad_io                => CONNECTED_TO_opencores_i2c_scl_pad_io,                --                       opencores_i2c.scl_pad_io
			opencores_i2c_sda_pad_io                => CONNECTED_TO_opencores_i2c_sda_pad_io,                --                                    .sda_pad_io
			reset_enet_reset_n                      => CONNECTED_TO_reset_enet_reset_n,                      --                          reset_enet.reset_n
			user_dipsw_external_connection_export   => CONNECTED_TO_user_dipsw_external_connection_export,   --      user_dipsw_external_connection.export
			user_pb_external_connection_export      => CONNECTED_TO_user_pb_external_connection_export       --         user_pb_external_connection.export
		);


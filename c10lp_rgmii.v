module  c10lp_rgmii (
        //Clock and Reset
        input  wire        c10_clk50m    ,
        input  wire        hbus_clk_50m  ,  
        input  wire        c10_clk_adj   ,  
        input  wire        enet_clk_125m ,
        input  wire        c10_resetn    ,

        //LED PB DIPSW
        output wire [3:0]  user_led ,
        input  wire [3:0]  user_pb  ,
        input  wire [2:0]  user_dip ,

        //Ethernet Port 
        output wire        enet_mdc        ,
        inout  wire        enet_mdio       ,
        
        input  wire        enet_int        ,     
        output wire        enet_resetn     ,	    
        input  wire        enet_rx_clk     ,     
        output wire        enet_tx_clk     ,    
        input  wire [3:0]  enet_rx_d       ,       
        output wire [3:0]  enet_tx_d       ,       
        output wire        enet_tx_en      ,      
        input  wire        enet_rx_dv      ,      
//        input  wire        enet_led_link100,

        //PMOD PORT
        inout  wire [7:0]  pmod_d   ,

        //Side Bus
        input  wire         usb_reset_n        ,
        input  wire         c10_usb_clk        ,
        input  wire         usb_wr_n           ,
        input  wire         usb_rd_n           ,
        input  wire         usb_oe_n           ,
        output wire         usb_full           ,
        output wire         usb_empty          ,
        inout  wire   [7:0] usb_data           ,
        inout  wire   [1:0] usb_addr           ,
        inout  tri1         usb_scl            ,
        inout  tri1         usb_sda            ,
        
        
        //User IO & Clock
        inout  wire [35:0]  gpio            ,
        
        //ARDUINO IO
        inout  wire [13:0]  arduino_io      ,
        output wire         arduino_rstn    ,
        inout  wire         arduino_sda     ,
        inout  wire         arduino_scl     ,        
        inout  wire         arduino_adc_sda ,
        inout  wire         arduino_adc_scl ,

        //Cyclone 10 to MAX 10 IO
        inout  wire [3:0]  c10_m10_io   ,       
        
        //HyperRAM IO
        output wire         hbus_rstn   ,
        output wire         hbus_clk0p  ,
        output wire         hbus_clk0n  ,
        output wire         hbus_cs2n   , //HyperRAM chip select
        inout  wire         hbus_rwds   ,
        inout  wire [7:0]   hbus_dq     ,
        output wire         hbus_cs1n   , //For HyperFlash
        input  wire         hbus_rston  , //For HyperFlash
        input  wire         hbus_intn     //For HyperFlash

        //QSPI
//        output wire    qspi_dclk   ,
//        output wire    qspi_sce    ,
//        output wire    qspi_sdo    ,
//        input  wire    qspi_data0  

        );

//Heart-beat counter
reg   [25:0]  heart_beat_cnt;

////DDR3 interface assignments
//wire          local_init_done;
//wire          local_cal_success;
//wire          local_cal_fail;

//Ethernet interface assignments
wire          phy_resetn   ;
wire          system_resetn;

wire          mdio_oen_from_the_tse_mac;
wire          mdio_out_from_the_tse_mac;
wire          eth_mode_from_the_tse_mac;
wire          ena_10_from_the_tse_mac  ;
wire          enet_tx_125              ;
wire          enet_tx_25               ;
wire          enet_tx_2p5              ;
wire          locked_from_the_enet_pll ;
wire          tx_clk_to_the_tse_mac    ;
wire          tx_clk_to_the_tse_mac_g  ;

wire          enet_tx_125_shift  ;
wire          enet_tx_25_shift   ;
reg           enet_tx_2p5_shift  ;
wire          enet_tx_250_shift  ; // signaltap sample clock
wire          locked_from_the_shift_pll    ;
wire          tx_clk_to_the_tse_mac_shift  ;
wire          tx_clk_to_the_tse_mac_shift_g;

assign system_resetn = c10_resetn ;

//PHY power-on reset control
parameter MSB = 20; // PHY interface: need minimum 10ms delay for POR
reg [MSB:0] epcount;

always @(posedge hbus_clk_50m or negedge c10_resetn)
  if (!c10_resetn)
      epcount <= MSB + 1'b0;
  else if (epcount[MSB] == 1'b0)
      epcount <= epcount + 1;
  else
      epcount <= epcount;

assign phy_resetn    = user_pb[0] & !epcount[MSB-1];
assign enet_resetn   = phy_resetn;

//MDIO output control
assign enet_mdio = ( !mdio_oen_from_the_tse_mac ) ? ( mdio_out_from_the_tse_mac ) : ( 1'bz );



reg [11:0] enet_tx_2p5_delay = 12'h0;
always@(posedge enet_tx_125)
begin
enet_tx_2p5_delay[0]    <= enet_tx_2p5            ;
enet_tx_2p5_delay[11:1] <= enet_tx_2p5_delay[10:0];
enet_tx_2p5_shift       <= enet_tx_2p5_delay[10]  ;
end


//RGMII clock solution
assign tx_clk_to_the_tse_mac = ( eth_mode_from_the_tse_mac ) ? ( enet_tx_125 ) :  // GbE Mode = 125MHz clock
                               ( ena_10_from_the_tse_mac ) ? ( enet_tx_2p5 ) :    // 10Mb Mode = 2.5MHz clock
                               ( enet_tx_25 );                                    // 100Mb Mode = 25MHz clock

assign tx_clk_to_the_tse_mac_shift = ( eth_mode_from_the_tse_mac ) ? ( enet_tx_125_shift ) :  // GbE Mode = 125MHz clock
                                     ( ena_10_from_the_tse_mac ) ? ( enet_tx_2p5_shift ) :    // 10Mb Mode = 2.5MHz clock
                                     ( enet_tx_25_shift);                                     // 100Mb Mode = 25MHz clock

enet_clk_ddio   enet_clk_ddio_inst (
                    .outclock              (tx_clk_to_the_tse_mac_shift ), // tx_clk_to_the_tse_mac_g ),
                    .datain_h              (1'b1                        ),
                    .datain_l              (1'b0                        ),
                    .dataout               (enet_tx_clk                 ),
                    .aclr                  (!phy_resetn                 )
                    );


q_sys               q_sys_inst (
                    .hbus_clk_clk                                                  (c10_clk50m                ),     
                    .hbus_reset_reset_n                                            (c10_resetn                ),
                    .enet_clk_125m_in_clk                                          (enet_clk_125m             ),
                    .reset_enet_reset_n                                            (c10_resetn                ),
                    .clock_bridge_0_in_clk_clk                                     (enet_tx_25                ), //               clock_bridge_0_in_clk.clk
                    .enet_pll_c0_125m_clk                                          (enet_tx_125               ), //                         enet_pll_c0.clk
                    .enet_pll_c1_25m_clk                                           (enet_tx_25                ), //                         enet_pll_c1.clk
                    .enet_pll_c2_2m5_clk                                           (enet_tx_2p5               ), //                         enet_pll_c2.clk
                    .enet_pll_c3_125m_shift_clk                                    (enet_tx_125_shift         ), //                         enet_pll_c3.clk
                    .enet_pll_c4_25m_shift_clk                                     (enet_tx_25_shift          ), //                         enet_pll_c4.clk
                    .enet_pll_locked_conduit_export                                (locked_from_the_enet_pll  ), //             enet_pll_locked_conduit.export
                    .eth_tse_mac_mdio_connection_mdc                               (enet_mdc                  ), //         eth_tse_mac_mdio_connection.mdc
                    .eth_tse_mac_mdio_connection_mdio_in                           (enet_mdio                 ), //                                    .mdio_in
                    .eth_tse_mac_mdio_connection_mdio_out                          (mdio_out_from_the_tse_mac ), //                                    .mdio_out
                    .eth_tse_mac_mdio_connection_mdio_oen                          (mdio_oen_from_the_tse_mac ), //                                    .mdio_oen
                    .eth_tse_mac_rgmii_connection_rgmii_in                         (enet_rx_d                 ), //        eth_tse_mac_rgmii_connection.rgmii_in
                    .eth_tse_mac_rgmii_connection_rgmii_out                        (enet_tx_d                 ), //                                    .rgmii_out
                    .eth_tse_mac_rgmii_connection_rx_control                       (enet_rx_dv                ), //                                    .rx_control
                    .eth_tse_mac_rgmii_connection_tx_control                       (enet_tx_en                ), //                                    .tx_control
                    //.eth_tse_mac_status_connection_set_10                        (user_dip[0]               ), //       eth_tse_mac_status_connection.set_10
                    //.eth_tse_mac_status_connection_set_1000                      (user_dip[1]               ), //                                    .set_1000
                    .eth_tse_mac_status_connection_set_10                          (                          ), //       eth_tse_mac_status_connection.set_10
                    .eth_tse_mac_status_connection_set_1000                        (                          ), //                                    .set_1000
                    .eth_tse_mac_status_connection_eth_mode                        (eth_mode_from_the_tse_mac ), //                                    .eth_mode
                    .eth_tse_mac_status_connection_ena_10                          (ena_10_from_the_tse_mac   ), //                                    .ena_10
                    .eth_tse_pcs_mac_rx_clock_connection_clk                       (enet_rx_clk               ), // eth_tse_pcs_mac_rx_clock_connection.clk
                    .eth_tse_pcs_mac_tx_clock_connection_clk                       (tx_clk_to_the_tse_mac     ), // eth_tse_pcs_mac_tx_clock_connection.clk
//                    .ext_epcq_flash_external_dclk                                    (qspi_dclk                 ),
//                    .ext_epcq_flash_external_sce                                     (qspi_sce                  ),
//                    .ext_epcq_flash_external_sdo                                     (qspi_sdo                  ),
//                    .ext_epcq_flash_external_data0                                   (qspi_data0                ),
		                .hyperbus_controller_top_HB_RSTn                                 (hbus_rstn                 ) ,          //             hyperbus_controller_top.HB_RSTn
		                .hyperbus_controller_top_HB_CLK0                                 (hbus_clk0p                ) ,          //                                    .HB_CLK0
		                .hyperbus_controller_top_HB_CLK0n                                (hbus_clk0n                ) ,          //                                    .HB_CLK0n
		                .hyperbus_controller_top_HB_CLK1                                 (                          ) ,          //                                    .HB_CLK1
		                .hyperbus_controller_top_HB_CLK1n                                (                          ) ,          //                                    .HB_CLK1n
		                .hyperbus_controller_top_HB_CS0n                                 (                          ) ,          //                                    .HB_CS0n
		                .hyperbus_controller_top_HB_CS1n                                 (hbus_cs2n                 ) ,          //                                    .HB_CS1n
		                .hyperbus_controller_top_HB_WPn                                  (                          ) ,          //                                    .HB_WPn
		                .hyperbus_controller_top_HB_RWDS                                 (hbus_rwds                 ) ,          //                                    .HB_RWDS
		                .hyperbus_controller_top_HB_dq                                   (hbus_dq                   ) ,          //                                    .HB_dq
		                .hyperbus_controller_top_HB_RSTOn                                (hbus_rston                ) ,          //                                    .HB_RSTOn
		                .hyperbus_controller_top_HB_INTn                                 (hbus_intn                 ) ,          //                                    .HB_INTn
		                .opencores_i2c_scl_pad_io                                        (arduino_adc_scl           ) ,
		                .opencores_i2c_sda_pad_io                                        (arduino_adc_sda           ) ,
		                .user_dipsw_external_connection_export                           (user_dip                  ) ,
		                .user_pb_external_connection_export                              (user_pb                   ) ,
                    .led_pio_external_connection_export                              (user_led[3:0]             )            //         led_pio_external_connection.export
                    );


endmodule

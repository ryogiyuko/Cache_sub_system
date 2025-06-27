`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/04 10:18:39
// Design Name: 
// Module Name: axi_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Axi_TOP(

    input            clk                          ,
    input            rstn                         ,
    input            i_axi_write_drive            ,
    input            i_axi_read_drive             ,
    input  [33:0]    i_axi_write_addr_34          ,
	input  [33:0]    i_axi_read_addr_34           ,
    input  [255:0]   i_axi_from_cache_data_256    ,

    output           o_axi_write_free             ,
    output           o_axi_read_free              ,
    output [255:0]   o_axi_to_cache_data_256      ,
    output           o_axi_drive_cache            ,
	input            i_axi_free_cache             


    // 仿真
    // ,output          o_r_write_start
    // ,output          o_r_read_start
    ,output [255:0]  o_slave_buffer_data
	,output [255:0]  o_ddr_out_data
	,output [15:0]   o_ddr_read_out
    );


    // 写地址通道
		wire [33:0]      w_axi_awaddr  ;
        wire             w_axi_awvalid ;
		wire             w_axi_awready ;
		
    // 写数据通道
	    wire [15:0]      w_axi_wdata   ;
	    wire             w_axi_wlast   ;
	    wire             w_axi_wvalid  ;
	    wire             w_axi_wready  ;
 
    // 写响应通道
		wire [1:0]       w_axi_bresp   ;
		wire             w_axi_bvalid  ;
		wire             w_axi_bready  ;

    // 读地址通道
		wire [33:0]      w_axi_araddr  ;
		wire             w_axi_arvalid ;
		wire             w_axi_arready ;
       
    // 读数据通道
		wire [15:0]      w_axi_rdata   ;
		wire             w_axi_rlast   ;
        wire             w_axi_rvalid  ;
		wire             w_axi_rready  ;



(*dont_touch = "true"*)
Axi_Master #(
		.C_M_AXI_BURST_LEN	    (16), //支持（1 2 4 8 16 32 64 128 256）
		.C_M_AXI_ADDR_WIDTH	    (34),
        .C_M_AXI_DATA_WIDTH	    (16)
)
u_AXI_Master
(
        .M_AXI_ACLK              (clk)   ,
		.rstn		             (rstn)   ,
		
		.M_AXI_WRITE_DRIVE	     (i_axi_write_drive)   ,   
		.M_AXI_READ_DRIVE        (i_axi_read_drive)   ,   
        .M_AXI_WRITE_DRIVE_FREE	 (o_axi_write_free)   ,   
		.M_AXI_READ_DRIVE_FREE   (o_axi_read_free)   ,   

		.M_AXI_WRITE_ADDR        (i_axi_write_addr_34)    ,   // 接收传输地址
		.M_AXI_READ_ADDR         (i_axi_read_addr_34 )  ,
		.M_AXI_FROM_CACHE_DATA   (i_axi_from_cache_data_256)   ,   // 接收传输数据
		.M_AXI_TO_CACHE_DATA     (o_axi_to_cache_data_256)   ,   // 接收传输数据 

        .M_AXI_DRIVE_CACHE       (o_axi_drive_cache),
		.M_AXI_FREE_CACHE		 (i_axi_free_cache),

        // 写地址通道
		.M_AXI_AWADDR       (w_axi_awaddr ),   // 34位地址
        .M_AXI_AWVALID      (w_axi_awvalid),  
		.M_AXI_AWREADY      (w_axi_awready),
		
        // 写数据通道
	    .M_AXI_WDATA       (w_axi_wdata ) ,   // 数据位宽 16
	    .M_AXI_WLAST       (w_axi_wlast ) ,
	    .M_AXI_WVALID      (w_axi_wvalid) ,
	    .M_AXI_WREADY      (w_axi_wready) ,
 
        // 写响应通道
		.M_AXI_BRESP       (w_axi_bresp ) ,   // 表示写状态
		.M_AXI_BVALID      (w_axi_bvalid) ,
		.M_AXI_BREADY      (w_axi_bready) ,

        // 读地址通道
		.M_AXI_ARADDR      (w_axi_araddr ) ,
		.M_AXI_ARVALID     (w_axi_arvalid) ,
		.M_AXI_ARREADY     (w_axi_arready) ,
       
        // 读数据通道
		.M_AXI_RDATA        (w_axi_rdata ),
		.M_AXI_RLAST        (w_axi_rlast ),
        .M_AXI_RVALID       (w_axi_rvalid),
		.M_AXI_RREADY       (w_axi_rready)


        // // 仿真
        // ,.o_r_write_start   (o_r_write_start)
        // ,.o_r_read_start    (o_r_read_start)
);



(*dont_touch = "true"*)
Axi_Slave #(
		.C_S_AXI_ID_WIDTH	    (1 )  ,
		.C_S_AXI_DATA_WIDTH	    (16)  ,
		.C_S_AXI_ADDR_WIDTH	    (34)  
	)
u_AXI_Slave(
        .S_AXI_ACLK     (clk) ,
		.rstn           (rstn) ,

        // 写地址通道
		.S_AXI_AWADDR    (w_axi_awaddr ), // 34位地址
        .S_AXI_AWVALID   (w_axi_awvalid),
		.S_AXI_AWREADY   (w_axi_awready),
		
        // 写数据通道
		.S_AXI_WDATA     (w_axi_wdata ),
		.S_AXI_WLAST     (w_axi_wlast ),
        .S_AXI_WVALID    (w_axi_wvalid),
		.S_AXI_WREADY    (w_axi_wready),

        // 写响应通道
		.S_AXI_BRESP     (w_axi_bresp ),
        .S_AXI_BVALID    (w_axi_bvalid),
		.S_AXI_BREADY    (w_axi_bready),

        // 读地址通道
		.S_AXI_ARADDR    (w_axi_araddr ),
        .S_AXI_ARVALID   (w_axi_arvalid),
		.S_AXI_ARREADY   (w_axi_arready),

        // 读数据通道
		.S_AXI_RDATA     (w_axi_rdata ),
		.S_AXI_RLAST     (w_axi_rlast ),
        .S_AXI_RVALID    (w_axi_rvalid),
		.S_AXI_RREADY    (w_axi_rready),

        .S_BUFFER_DATA   (o_slave_buffer_data),
		.S_DDR_OUT_DATA  (o_ddr_out_data),
		.S_DDR_READ_OUT  (o_ddr_read_out)
		
    );


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/03 15:37:33
// Design Name: 
// Module Name: AXI_Slave
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


module Axi_Slave
#
	(
		parameter                                   C_S_AXI_ID_WIDTH	    = 1   ,
		parameter                                   C_S_AXI_DATA_WIDTH	    = 16  ,
		parameter                                   C_S_AXI_ADDR_WIDTH	    = 34  
		
	)
    (
        input  wire                                  S_AXI_ACLK      ,
		input  wire                                  rstn            ,

        // 写地址通道
		input  wire [C_S_AXI_ADDR_WIDTH-1 : 0]       S_AXI_AWADDR    , // 34位地址
        input  wire                                  S_AXI_AWVALID   ,
		output wire                                  S_AXI_AWREADY   ,

		
        // 写数据通道
		input  wire [C_S_AXI_DATA_WIDTH-1 : 0]       S_AXI_WDATA     ,
		input  wire                                  S_AXI_WLAST     ,
        input  wire                                  S_AXI_WVALID    ,
		output wire                                  S_AXI_WREADY    ,

        // 写响应通道
		output wire [1 : 0]                          S_AXI_BRESP     ,
        output wire                                  S_AXI_BVALID    ,
		input  wire                                  S_AXI_BREADY    ,

        // 读地址通道
		input  wire [C_S_AXI_ADDR_WIDTH-1 : 0]       S_AXI_ARADDR    ,
        input  wire                                  S_AXI_ARVALID   ,
		output wire                                  S_AXI_ARREADY   ,


        // 读数据通道
		output wire [C_S_AXI_DATA_WIDTH-1 : 0]       S_AXI_RDATA     ,
		output wire                                  S_AXI_RLAST     ,
        output wire                                  S_AXI_RVALID    ,
		input  wire                                  S_AXI_RREADY    ,

		output wire [255:0]                          S_BUFFER_DATA   ,
        output wire [255:0]                          S_DDR_OUT_DATA  ,
        output wire [15:0]                           S_DDR_READ_OUT
    );

/**********************寄存器*************************/
reg [C_S_AXI_ADDR_WIDTH-1 : 0]  r_awaddr                                ;
reg [7 : 0]                     r_awlen                                 ;
reg                             r_awready                               ;
reg                             r_wready                                ;
//reg                             r_wready_1b                             ;

reg                             r_arready                               ;
reg [C_S_AXI_ADDR_WIDTH-1 : 0]  r_araddr                                ;
//reg [7 : 0]                     r_arlen                                 ;
reg [3 : 0]                     r_read_cnt                              ;
reg [7 : 0]                     r_write_cnt                             ;

reg                             r_rvalid                                ;
reg                             r_rvalid_1b                             ;
reg                             r_rvalid_2b                             ;
reg                             r_rvalid_3b                             ;
reg                             r_rvalid_4b                             ;
reg                             r_bvalid                                ;
reg [1:0]                       r_bresp                                 ;

// 从机缓存
reg [C_S_AXI_DATA_WIDTH-1 : 0]  r_ram[0 : 15]                           ;
reg [3:0]                       r_ram_addr                              ;
reg [3:0]                       r_ram_read_addr                         ;
reg [3:0]                       r_ram_addr_1b                           ;   
reg [C_S_AXI_DATA_WIDTH-1 : 0]  r_ram_write_data                        ;
reg [C_S_AXI_DATA_WIDTH-1 : 0]  r_ram_read_data                         ;
reg                             r_ram_rh_wl                             ;   // 读：1 写：0
reg                             r_ram_en                                ;

reg                             r_rlast                                 ;

//reg                             r_w_active                              ;
/**********************网表型*************************/ 
// 各通道有效信号
wire                w_aw_active                                         ;
wire                w_w_active                                          ;
wire                w_b_active                                          ;
wire                w_ar_active                                         ;
wire                w_r_active                                          ;


/**********************SRAM***********************/
wire rclk;
wire [10:0]  RAM_addr       ;
reg  [15:0]  r_WEB_16       ;
reg  [15:0]  r_WEB1_16      ;

reg [15:0] r_web_16;
reg [15:0] r_next_web;

reg  [15:0]  w_ram_read_data;
wire [127:0] RAM0_data_out  ;
wire [127:0] RAM1_data_out  ;

reg  [15:0] r_sram_read_data;

/**********************组合逻辑***********************/

assign              w_aw_active     = S_AXI_AWVALID   & S_AXI_AWREADY   ;
assign              w_w_active      = S_AXI_WVALID    & S_AXI_WREADY    ;
assign              w_b_active      = S_AXI_BVALID    & S_AXI_BREADY    ;
assign              w_ar_active     = S_AXI_ARVALID   & S_AXI_ARREADY   ;
assign              w_r_active      = S_AXI_RVALID    & S_AXI_RREADY    ;

assign              S_AXI_AWREADY   = r_awready                         ;
assign              S_AXI_WREADY    = r_wready                          ;
assign              S_AXI_ARREADY   = r_arready                         ;

// assign              S_AXI_RID       = 'd0                               ;
assign              S_AXI_RDATA     = r_sram_read_data                  ;
// assign              S_AXI_RRESP     = 'd0                               ;
// assign              S_AXI_RLAST     = (r_read_cnt == 15) ? 
//                                       w_r_active : 1'b0                 ; 

assign              S_AXI_RLAST     = r_rlast                           ;
// assign              S_AXI_RUSER     = 'd0                               ;
assign              S_AXI_RVALID    = r_rvalid_4b                       ;

//assign              S_AXI_RVALID    = r_rvalid                          ;
// assign              S_AXI_BID       = 'd0                               ;
assign              S_AXI_BRESP     = r_bresp                           ;
// assign              S_AXI_BUSER     = 'd0                               ;
assign              S_AXI_BVALID    = r_bvalid                          ;

assign S_BUFFER_DATA[15:0]      =   r_ram[0]  ;
assign S_BUFFER_DATA[47:32]     =   r_ram[2]  ;
assign S_BUFFER_DATA[79:64]     =   r_ram[4]  ;
assign S_BUFFER_DATA[111:96]    =   r_ram[6]  ;
assign S_BUFFER_DATA[143:128]   =   r_ram[8]  ;
assign S_BUFFER_DATA[175:160]   =   r_ram[10] ;
assign S_BUFFER_DATA[207:192]   =   r_ram[12] ;
assign S_BUFFER_DATA[239:224]   =   r_ram[14] ;
assign S_BUFFER_DATA[31:16]     =   r_ram[1]  ;
assign S_BUFFER_DATA[63:48]     =   r_ram[3]  ;
assign S_BUFFER_DATA[95:80]     =   r_ram[5]  ;
assign S_BUFFER_DATA[127:112]   =   r_ram[7]  ;
assign S_BUFFER_DATA[159:144]   =   r_ram[9]  ;
assign S_BUFFER_DATA[191:176]   =   r_ram[11] ;
assign S_BUFFER_DATA[223:208]   =   r_ram[13] ;
assign S_BUFFER_DATA[255:240]   =   r_ram[15] ;
/**********************时序逻辑***********************/
always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_awaddr <= 34'b0;
    end
    else begin 
        if(w_aw_active) begin 
            r_awaddr <= S_AXI_AWADDR;
        end
        else begin 
            r_awaddr <= r_awaddr;
        end
    end
end


always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_awready <= 1'b1;
    end 
    else begin 
        if(S_AXI_WLAST) begin 
            r_awready <= 1'b1;
        end
        else if(w_w_active) begin 
            r_awready <= 1'b0;
        end
        else begin 
            r_awready <= 1'b1;
        end
    end
end


always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_wready <= 1'b0;
    end 
    else begin 
        if(S_AXI_WLAST) begin 
            r_wready <= 1'b0;
        end
        else if(w_aw_active) begin 
            r_wready <= 1'b1;
        end
        else begin 
            r_wready <= r_wready;
        end
    end
end


// ram write
always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_ram[0]  <= 16'b0;        r_ram[1]  <= 16'b0;
        r_ram[2]  <= 16'b0;        r_ram[3]  <= 16'b0;
        r_ram[4]  <= 16'b0;        r_ram[5]  <= 16'b0;
        r_ram[6]  <= 16'b0;        r_ram[7]  <= 16'b0;
        r_ram[8]  <= 16'b0;        r_ram[9]  <= 16'b0;
        r_ram[10] <= 16'b0;        r_ram[11] <= 16'b0;
        r_ram[12] <= 16'b0;        r_ram[13] <= 16'b0;
        r_ram[14] <= 16'b0;        r_ram[15] <= 16'b0;

        // r_ram[0]  <= 16'h1234;        r_ram[1]  <= 16'h4321;
        // r_ram[2]  <= 16'h2222;        r_ram[3]  <= 16'h3333;
        // r_ram[4]  <= 16'h4444;        r_ram[5]  <= 16'h5555;
        // r_ram[6]  <= 16'h6666;        r_ram[7]  <= 16'h7777;
        // r_ram[8]  <= 16'h8888;        r_ram[9]  <= 16'h9999;
        // r_ram[10] <= 16'haaaa;        r_ram[11] <= 16'hbbbb;
        // r_ram[12] <= 16'hcccc;        r_ram[13] <= 16'hdddd;
        // r_ram[14] <= 16'heeee;        r_ram[15] <= 16'hffff;
    end
    else begin 
        if(!r_ram_rh_wl && r_ram_en) begin  
            r_ram[r_ram_addr_1b] <= r_ram_write_data;
        end
        // else begin 
        //     // r_ram[0]  <= r_ram[0] ;        r_ram[1]  <= r_ram[1] ;
        //     // r_ram[2]  <= r_ram[2] ;        r_ram[3]  <= r_ram[3] ;
        //     // r_ram[4]  <= r_ram[4] ;        r_ram[5]  <= r_ram[5] ;
        //     // r_ram[6]  <= r_ram[6] ;        r_ram[7]  <= r_ram[7] ;
        //     // r_ram[8]  <= r_ram[8] ;        r_ram[9]  <= r_ram[9] ;
        //     // r_ram[10] <= r_ram[10];        r_ram[11] <= r_ram[11];
        //     // r_ram[12] <= r_ram[12];        r_ram[13] <= r_ram[13];
        //     // r_ram[14] <= r_ram[14];        r_ram[15] <= r_ram[15];

        //     r_ram[r_ram_addr_1b] <= r_ram[r_ram_addr_1b];
        // end
    end
end


// ram write data
always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_ram_write_data <= 16'b0;
    end
    else begin 
        if(w_w_active || r_ram_addr == 4'b1111)
            r_ram_write_data <= S_AXI_WDATA;
        else    
            r_ram_write_data <= r_ram_write_data;
    end
end

// ram write enable
always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_ram_en <= 1'b0;
    end
    else begin 
        if(w_w_active || r_ram_addr == 4'b1111)
            r_ram_en <= 1'b1;
        else    
            r_ram_en <= 1'b0;
    end
end


// ram read
always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_ram_read_data <= 16'b0;
    end 
    else begin 
        if(r_ram_rh_wl) begin 
            r_ram_read_data <= r_ram[r_ram_read_addr];  
        end
        else begin 
            r_ram_read_data <= r_ram_read_data;
        end
    end
end


// ram read or write
always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_ram_rh_wl <= 1'b0;
    end 
    else begin 
        if(w_ar_active)
            r_ram_rh_wl <= 1'b1;
        else if(w_aw_active)
            r_ram_rh_wl <= 1'b0;
        else 
            r_ram_rh_wl <= r_ram_rh_wl;
    end
end

always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_write_cnt <= 8'b0;
    end
    else begin 
        if(S_AXI_WLAST) begin 
            r_write_cnt <= 8'b0;
        end
        else if(w_w_active) begin
            r_write_cnt <= r_write_cnt + 1;
        end
        // else begin 
        //     r_write_cnt <= r_write_cnt;
        // end
    end
end


// ram addr
always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_ram_addr <= 4'b0;
    end
    else begin 
        if(S_AXI_WLAST || S_AXI_RLAST) begin 
            r_ram_addr <= 4'b0;
        end
        else if(w_aw_active || w_ar_active) begin
            r_ram_addr <= 4'b0;
        end
        //else if(w_w_active || (r_rvalid && S_AXI_RREADY)) begin
        //else if(w_w_active || (w_r_active & !(w_ar_active))) begin
        else if(w_w_active || ((r_rvalid_2b && S_AXI_RREADY) & !(w_ar_active))) begin
            r_ram_addr <= r_ram_addr + 1;
        end
        // else begin
        //     r_ram_addr <= 4'b0;
        // end
    end
end
always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_ram_read_addr <= 4'b0;
    end
    else begin 
        if(S_AXI_RLAST) begin 
            r_ram_read_addr <= 4'b0;
        end
        //else if(w_r_active) begin 
        //else if(w_r_active & !(w_ar_active)) begin 
        else if(r_rvalid_3b & S_AXI_RREADY & !(w_ar_active)) begin 
            r_ram_read_addr <= r_ram_read_addr + 1;
        end
        else begin 
            r_ram_read_addr <= r_ram_read_addr;
        end
    end
end

// ram地址打一拍
always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_ram_addr_1b <= 4'b0;
    end
    else begin 
        r_ram_addr_1b <= r_ram_addr;
    end
end



always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_arready <= 1'b1;
    end
    else begin 
        if(S_AXI_RLAST) begin 
            r_arready <= 1'b1;
        end
        //else if(w_r_active) begin 
        else if(r_rvalid_2b && S_AXI_RREADY) begin
            r_arready <= 1'b0;
        end
        else begin 
            r_arready <= r_arready;
        end
    end
end


always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_araddr <= 16'b0;
    end
    else begin 
        if(w_ar_active) begin 
            r_araddr <= S_AXI_ARADDR;
        end
        else begin 
            r_araddr <= r_araddr;
        end
    end
end




always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_read_cnt <= 4'b0;
    end
    else begin 
        if(S_AXI_RLAST) begin 
            r_read_cnt <= 4'b0;
        end
        //else if(w_r_active) begin 
        //else if(w_r_active & !(w_ar_active)) begin 
        else if((r_rvalid_2b && S_AXI_RREADY) & !(w_ar_active)) begin
            r_read_cnt <= r_read_cnt + 1;
        end
        else begin 
            r_read_cnt <= r_read_cnt;
        end
    end
end





always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_rvalid <= 1'b0;
    end
    else begin 
        if(S_AXI_RLAST) begin 
            r_rvalid <= 1'b0;
        end
        else if(w_ar_active) begin 
            r_rvalid <= 1'b1;
        end
        else begin 
            r_rvalid <= r_rvalid;
        end
    end
end


always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_rvalid_1b <= 1'b0;
    end
    else begin 
        if(S_AXI_RLAST) begin 
            r_rvalid_1b <= 1'b0;
        end
        else begin 
            r_rvalid_1b <= r_rvalid;
        end
    end
end


always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_rvalid_2b <= 1'b0;
    end
    else begin 
        if(S_AXI_RLAST) begin 
            r_rvalid_2b <= 1'b0;
        end
        else begin 
            r_rvalid_2b <= r_rvalid_1b;
        end
    end
end

always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_rvalid_3b <= 1'b0;
    end
    else begin 
        if(S_AXI_RLAST) begin 
            r_rvalid_3b <= 1'b0;
        end
        else begin 
            r_rvalid_3b <= r_rvalid_2b;
        end
    end
end

always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_rvalid_4b <= 1'b0;
    end
    else begin 
        if(S_AXI_RLAST) begin 
            r_rvalid_4b <= 1'b0;
        end
        else begin 
            r_rvalid_4b <= r_rvalid_3b;
        end
    end
end

always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_rlast <= 1'b0;
    end
    else begin 
        if(r_read_cnt == 4'b1111) begin 
            r_rlast <= 1'b1;
        end
        else begin 
            r_rlast <= 1'b0;
        end
    end
end


always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_bvalid <= 1'b0;
    end
    else begin 
        if(S_AXI_WLAST) begin 
            r_bvalid <= 1'b1;
        end
        else if(w_b_active) begin 
            r_bvalid <= 1'b0;
        end
        else begin 
            r_bvalid <= r_bvalid;
        end
    end
end



always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_bresp <= 2'b0;
    end
    else begin 
        if(S_AXI_WLAST && w_b_active) begin 
            r_bresp <= 2'b00;
        end
        else begin 
            r_bresp <= r_bresp;
        end
    end
end




/************SRAM******************/
assign RAM_addr = r_ram_rh_wl ? S_AXI_ARADDR[15:5] : S_AXI_AWADDR[15:5];
assign S_DDR_OUT_DATA = {RAM1_data_out, RAM0_data_out};
//assign S_DDR_READ_OUT = w_ram_read_data;
assign S_DDR_READ_OUT = r_sram_read_data;

assign rclk = ~S_AXI_ACLK;

always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_WEB_16 <= 16'b0;
    end
    else begin 
        if(S_AXI_WLAST) begin 
            r_WEB_16 <= 16'b0;
        end
        else if(w_aw_active ) begin
            r_WEB_16 <= 16'b0000000000000001;
        end
        else if(w_w_active) begin
            //r_WEB_16 <= (r_web_16 << 1);
            r_WEB_16 <= r_next_web;
        end
    end
end

always @(r_WEB_16) begin 
    case(r_WEB_16) 
        16'b0000000000000001: r_next_web = 16'b0000000000000010;
        16'b0000000000000010: r_next_web = 16'b0000000000000100;
        16'b0000000000000100: r_next_web = 16'b0000000000001000;
        16'b0000000000001000: r_next_web = 16'b0000000000010000;
        16'b0000000000010000: r_next_web = 16'b0000000000100000;
        16'b0000000000100000: r_next_web = 16'b0000000001000000;
        16'b0000000001000000: r_next_web = 16'b0000000010000000;
        16'b0000000010000000: r_next_web = 16'b0000000100000000;
        16'b0000000100000000: r_next_web = 16'b0000001000000000;
        16'b0000001000000000: r_next_web = 16'b0000010000000000;
        16'b0000010000000000: r_next_web = 16'b0000100000000000;
        16'b0000100000000000: r_next_web = 16'b0001000000000000;
        16'b0001000000000000: r_next_web = 16'b0010000000000000;
        16'b0010000000000000: r_next_web = 16'b0100000000000000;
        16'b0100000000000000: r_next_web = 16'b1000000000000000;
        16'b1000000000000000: r_next_web = 16'b0000000000000000;
                     default: r_next_web = 16'b0000000000000000;
    endcase
end

always @(posedge rclk or negedge rstn)begin
    if(rstn == 0) begin 
        r_web_16 <= 16'b0;
    end
    else begin
        r_web_16 <= r_WEB_16;
    end

end







always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_WEB1_16 <= 16'b0;
    end
    else begin 
        r_WEB1_16 <= r_WEB_16;
    end
end

always @(posedge S_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_sram_read_data <= 16'b0;
    end
    else begin 
        r_sram_read_data <= w_ram_read_data;
    end
end


always @(r_ram_read_addr) begin 
    case(r_ram_read_addr) 
        4'b0000: w_ram_read_data = RAM0_data_out[15:0]   ;
        4'b0001: w_ram_read_data = RAM0_data_out[31:16]  ;
        4'b0010: w_ram_read_data = RAM0_data_out[47:32]  ;
        4'b0011: w_ram_read_data = RAM0_data_out[63:48]  ;
        4'b0100: w_ram_read_data = RAM0_data_out[79:64]  ;
        4'b0101: w_ram_read_data = RAM0_data_out[95:80]  ;
        4'b0110: w_ram_read_data = RAM0_data_out[111:96] ;
        4'b0111: w_ram_read_data = RAM0_data_out[127:112];
        4'b1000: w_ram_read_data = RAM1_data_out[15:0]   ;
        4'b1001: w_ram_read_data = RAM1_data_out[31:16]  ;
        4'b1010: w_ram_read_data = RAM1_data_out[47:32]  ;
        4'b1011: w_ram_read_data = RAM1_data_out[63:48]  ;
        4'b1100: w_ram_read_data = RAM1_data_out[79:64]  ;
        4'b1101: w_ram_read_data = RAM1_data_out[95:80]  ;
        4'b1110: w_ram_read_data = RAM1_data_out[111:96] ;
        4'b1111: w_ram_read_data = RAM1_data_out[127:112];
        default: w_ram_read_data = 16'b0;
    endcase
end

SHKD110_2048X16X8BM1 u_ddr0_SHKD110_2048X16X8BM1(
    .DO0   (RAM0_data_out[0  ] ),    .DO1   (RAM0_data_out[1  ] ),    .DO2   (RAM0_data_out[2  ] ),    .DO3   (RAM0_data_out[3  ] ),
    .DO4   (RAM0_data_out[4  ] ),    .DO5   (RAM0_data_out[5  ] ),    .DO6   (RAM0_data_out[6  ] ),    .DO7   (RAM0_data_out[7  ] ),
    .DO8   (RAM0_data_out[8  ] ),    .DO9   (RAM0_data_out[9  ] ),    .DO10  (RAM0_data_out[10 ] ),    .DO11  (RAM0_data_out[11 ] ),
    .DO12  (RAM0_data_out[12 ] ),    .DO13  (RAM0_data_out[13 ] ),    .DO14  (RAM0_data_out[14 ] ),    .DO15  (RAM0_data_out[15 ] ),
    .DO16  (RAM0_data_out[16 ] ),    .DO17  (RAM0_data_out[17 ] ),    .DO18  (RAM0_data_out[18 ] ),    .DO19  (RAM0_data_out[19 ] ),
    .DO20  (RAM0_data_out[20 ] ),    .DO21  (RAM0_data_out[21 ] ),    .DO22  (RAM0_data_out[22 ] ),    .DO23  (RAM0_data_out[23 ] ),
    .DO24  (RAM0_data_out[24 ] ),    .DO25  (RAM0_data_out[25 ] ),    .DO26  (RAM0_data_out[26 ] ),    .DO27  (RAM0_data_out[27 ] ),
    .DO28  (RAM0_data_out[28 ] ),    .DO29  (RAM0_data_out[29 ] ),    .DO30  (RAM0_data_out[30 ] ),    .DO31  (RAM0_data_out[31 ] ),
    .DO32  (RAM0_data_out[32 ] ),    .DO33  (RAM0_data_out[33 ] ),    .DO34  (RAM0_data_out[34 ] ),    .DO35  (RAM0_data_out[35 ] ),
    .DO36  (RAM0_data_out[36 ] ),    .DO37  (RAM0_data_out[37 ] ),    .DO38  (RAM0_data_out[38 ] ),    .DO39  (RAM0_data_out[39 ] ),
    .DO40  (RAM0_data_out[40 ] ),    .DO41  (RAM0_data_out[41 ] ),    .DO42  (RAM0_data_out[42 ] ),    .DO43  (RAM0_data_out[43 ] ),
    .DO44  (RAM0_data_out[44 ] ),    .DO45  (RAM0_data_out[45 ] ),    .DO46  (RAM0_data_out[46 ] ),    .DO47  (RAM0_data_out[47 ] ),
    .DO48  (RAM0_data_out[48 ] ),    .DO49  (RAM0_data_out[49 ] ),    .DO50  (RAM0_data_out[50 ] ),    .DO51  (RAM0_data_out[51 ] ),
    .DO52  (RAM0_data_out[52 ] ),    .DO53  (RAM0_data_out[53 ] ),    .DO54  (RAM0_data_out[54 ] ),    .DO55  (RAM0_data_out[55 ] ),
    .DO56  (RAM0_data_out[56 ] ),    .DO57  (RAM0_data_out[57 ] ),    .DO58  (RAM0_data_out[58 ] ),    .DO59  (RAM0_data_out[59 ] ),
    .DO60  (RAM0_data_out[60 ] ),    .DO61  (RAM0_data_out[61 ] ),    .DO62  (RAM0_data_out[62 ] ),    .DO63  (RAM0_data_out[63 ] ),
    .DO64  (RAM0_data_out[64 ] ),    .DO65  (RAM0_data_out[65 ] ),    .DO66  (RAM0_data_out[66 ] ),    .DO67  (RAM0_data_out[67 ] ),
    .DO68  (RAM0_data_out[68 ] ),    .DO69  (RAM0_data_out[69 ] ),    .DO70  (RAM0_data_out[70 ] ),    .DO71  (RAM0_data_out[71 ] ),
    .DO72  (RAM0_data_out[72 ] ),    .DO73  (RAM0_data_out[73 ] ),    .DO74  (RAM0_data_out[74 ] ),    .DO75  (RAM0_data_out[75 ] ),
    .DO76  (RAM0_data_out[76 ] ),    .DO77  (RAM0_data_out[77 ] ),    .DO78  (RAM0_data_out[78 ] ),    .DO79  (RAM0_data_out[79 ] ),
    .DO80  (RAM0_data_out[80 ] ),    .DO81  (RAM0_data_out[81 ] ),    .DO82  (RAM0_data_out[82 ] ),    .DO83  (RAM0_data_out[83 ] ),
    .DO84  (RAM0_data_out[84 ] ),    .DO85  (RAM0_data_out[85 ] ),    .DO86  (RAM0_data_out[86 ] ),    .DO87  (RAM0_data_out[87 ]),
    .DO88  (RAM0_data_out[88 ] ),    .DO89  (RAM0_data_out[89 ] ),    .DO90  (RAM0_data_out[90 ] ),    .DO91  (RAM0_data_out[91 ] ),
    .DO92  (RAM0_data_out[92 ] ),    .DO93  (RAM0_data_out[93 ] ),    .DO94  (RAM0_data_out[94 ] ),    .DO95  (RAM0_data_out[95 ] ),
    .DO96  (RAM0_data_out[96 ] ),    .DO97  (RAM0_data_out[97 ] ),    .DO98  (RAM0_data_out[98 ] ),    .DO99  (RAM0_data_out[99 ] ),
    .DO100 (RAM0_data_out[100] ),    .DO101 (RAM0_data_out[101] ),    .DO102 (RAM0_data_out[102] ),    .DO103 (RAM0_data_out[103] ),
    .DO104 (RAM0_data_out[104] ),    .DO105 (RAM0_data_out[105] ),    .DO106 (RAM0_data_out[106] ),    .DO107 (RAM0_data_out[107] ),
    .DO108 (RAM0_data_out[108] ),    .DO109 (RAM0_data_out[109] ),    .DO110 (RAM0_data_out[110] ),    .DO111 (RAM0_data_out[111] ),
    .DO112 (RAM0_data_out[112] ),    .DO113 (RAM0_data_out[113] ),    .DO114 (RAM0_data_out[114] ),    .DO115 (RAM0_data_out[115] ),
    .DO116 (RAM0_data_out[116] ),    .DO117 (RAM0_data_out[117] ),    .DO118 (RAM0_data_out[118] ),    .DO119 (RAM0_data_out[119] ),
    .DO120 (RAM0_data_out[120] ),    .DO121 (RAM0_data_out[121] ),    .DO122 (RAM0_data_out[122] ),    .DO123 (RAM0_data_out[123] ),
    .DO124 (RAM0_data_out[124] ),    .DO125 (RAM0_data_out[125] ),    .DO126 (RAM0_data_out[126] ),    .DO127 (RAM0_data_out[127] ),

    .DI0   (r_ram_write_data[0  ] ),    .DI1   (r_ram_write_data[1  ] ),    .DI2   (r_ram_write_data[2  ] ),    .DI3   (r_ram_write_data[3  ] ),
    .DI4   (r_ram_write_data[4  ] ),    .DI5   (r_ram_write_data[5  ] ),    .DI6   (r_ram_write_data[6  ] ),    .DI7   (r_ram_write_data[7  ] ),
    .DI8   (r_ram_write_data[8  ] ),    .DI9   (r_ram_write_data[9  ] ),    .DI10  (r_ram_write_data[10 ] ),    .DI11  (r_ram_write_data[11 ] ),
    .DI12  (r_ram_write_data[12 ] ),    .DI13  (r_ram_write_data[13 ] ),    .DI14  (r_ram_write_data[14 ] ),    .DI15  (r_ram_write_data[15 ] ),
    .DI16  (r_ram_write_data[0  ] ),    .DI17  (r_ram_write_data[1  ] ),    .DI18  (r_ram_write_data[2  ] ),    .DI19  (r_ram_write_data[3  ] ),
    .DI20  (r_ram_write_data[4  ] ),    .DI21  (r_ram_write_data[5  ] ),    .DI22  (r_ram_write_data[6  ] ),    .DI23  (r_ram_write_data[7  ] ),
    .DI24  (r_ram_write_data[8  ] ),    .DI25  (r_ram_write_data[9  ] ),    .DI26  (r_ram_write_data[10 ] ),    .DI27  (r_ram_write_data[11 ] ),
    .DI28  (r_ram_write_data[12 ] ),    .DI29  (r_ram_write_data[13 ] ),    .DI30  (r_ram_write_data[14 ] ),    .DI31  (r_ram_write_data[15 ] ),
    .DI32  (r_ram_write_data[0  ] ),    .DI33  (r_ram_write_data[1  ] ),    .DI34  (r_ram_write_data[2  ] ),    .DI35  (r_ram_write_data[3  ] ),
    .DI36  (r_ram_write_data[4  ] ),    .DI37  (r_ram_write_data[5  ] ),    .DI38  (r_ram_write_data[6  ] ),    .DI39  (r_ram_write_data[7  ] ),
    .DI40  (r_ram_write_data[8  ] ),    .DI41  (r_ram_write_data[9  ] ),    .DI42  (r_ram_write_data[10 ] ),    .DI43  (r_ram_write_data[11 ] ),
    .DI44  (r_ram_write_data[12 ] ),    .DI45  (r_ram_write_data[13 ] ),    .DI46  (r_ram_write_data[14 ] ),    .DI47  (r_ram_write_data[15 ] ),
    .DI48  (r_ram_write_data[0  ] ),    .DI49  (r_ram_write_data[1  ] ),    .DI50  (r_ram_write_data[2  ] ),    .DI51  (r_ram_write_data[3  ] ),
    .DI52  (r_ram_write_data[4  ] ),    .DI53  (r_ram_write_data[5  ] ),    .DI54  (r_ram_write_data[6  ] ),    .DI55  (r_ram_write_data[7  ] ),
    .DI56  (r_ram_write_data[8  ] ),    .DI57  (r_ram_write_data[9  ] ),    .DI58  (r_ram_write_data[10 ] ),    .DI59  (r_ram_write_data[11 ] ),
    .DI60  (r_ram_write_data[12 ] ),    .DI61  (r_ram_write_data[13 ] ),    .DI62  (r_ram_write_data[14 ] ),    .DI63  (r_ram_write_data[15 ] ),
    .DI64  (r_ram_write_data[0  ] ),    .DI65  (r_ram_write_data[1  ] ),    .DI66  (r_ram_write_data[2  ] ),    .DI67  (r_ram_write_data[3  ] ),
    .DI68  (r_ram_write_data[4  ] ),    .DI69  (r_ram_write_data[5  ] ),    .DI70  (r_ram_write_data[6  ] ),    .DI71  (r_ram_write_data[7  ] ),
    .DI72  (r_ram_write_data[8  ] ),    .DI73  (r_ram_write_data[9  ] ),    .DI74  (r_ram_write_data[10 ] ),    .DI75  (r_ram_write_data[11 ] ),
    .DI76  (r_ram_write_data[12 ] ),    .DI77  (r_ram_write_data[13 ] ),    .DI78  (r_ram_write_data[14 ] ),    .DI79  (r_ram_write_data[15 ] ),
    .DI80  (r_ram_write_data[0  ] ),    .DI81  (r_ram_write_data[1  ] ),    .DI82  (r_ram_write_data[2  ] ),    .DI83  (r_ram_write_data[3  ] ),
    .DI84  (r_ram_write_data[4  ] ),    .DI85  (r_ram_write_data[5  ] ),    .DI86  (r_ram_write_data[6  ] ),    .DI87  (r_ram_write_data[7  ]),
    .DI88  (r_ram_write_data[8  ] ),    .DI89  (r_ram_write_data[9  ] ),    .DI90  (r_ram_write_data[10 ] ),    .DI91  (r_ram_write_data[11 ] ),
    .DI92  (r_ram_write_data[12 ] ),    .DI93  (r_ram_write_data[13 ] ),    .DI94  (r_ram_write_data[14 ] ),    .DI95  (r_ram_write_data[15 ] ),
    .DI96  (r_ram_write_data[0  ] ),    .DI97  (r_ram_write_data[1  ] ),    .DI98  (r_ram_write_data[2  ] ),    .DI99  (r_ram_write_data[3  ] ),
    .DI100 (r_ram_write_data[4  ] ),    .DI101 (r_ram_write_data[5  ] ),    .DI102 (r_ram_write_data[6  ] ),    .DI103 (r_ram_write_data[7  ] ),
    .DI104 (r_ram_write_data[8  ] ),    .DI105 (r_ram_write_data[9  ] ),    .DI106 (r_ram_write_data[10 ] ),    .DI107 (r_ram_write_data[11 ] ),
    .DI108 (r_ram_write_data[12 ] ),    .DI109 (r_ram_write_data[13 ] ),    .DI110 (r_ram_write_data[14 ] ),    .DI111 (r_ram_write_data[15 ] ),
    .DI112 (r_ram_write_data[0  ] ),    .DI113 (r_ram_write_data[1  ] ),    .DI114 (r_ram_write_data[2  ] ),    .DI115 (r_ram_write_data[3  ] ),
    .DI116 (r_ram_write_data[4  ] ),    .DI117 (r_ram_write_data[5  ] ),    .DI118 (r_ram_write_data[6  ] ),    .DI119 (r_ram_write_data[7  ] ),
    .DI120 (r_ram_write_data[8  ] ),    .DI121 (r_ram_write_data[9  ] ),    .DI122 (r_ram_write_data[10 ] ),    .DI123 (r_ram_write_data[11 ] ),
    .DI124 (r_ram_write_data[12 ] ),    .DI125 (r_ram_write_data[13 ] ),    .DI126 (r_ram_write_data[14 ] ),    .DI127 (r_ram_write_data[15 ] ),

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),
    .A4   (RAM_addr[4]   ),.A5   (RAM_addr[5]   ),.A6   (RAM_addr[6]   ),.A7    (RAM_addr[7]    ),
    .A8    (RAM_addr[8]    ),.A9    (RAM_addr[9]    ),.A10   (RAM_addr[10]   ),
    //.DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),

    .WEB0 (~r_WEB1_16[0] ),.WEB1 (~r_WEB1_16[1] ),.WEB2 (~r_WEB1_16[2] ),.WEB3 (~r_WEB1_16[3] ),
    .WEB4 (~r_WEB1_16[4] ),.WEB5 (~r_WEB1_16[5] ),.WEB6 (~r_WEB1_16[6] ),.WEB7 (~r_WEB1_16[7] ),
    .CK    (~S_AXI_ACLK),
    .CS    (1'b1    ),
    .OE    (1'b1   )
    //.CSB   (1'b0   )
);
    
SHKD110_2048X16X8BM1 u_ddr1_SHKD110_2048X16X8BM1(
    .DO0   (RAM1_data_out[0  ] ),    .DO1   (RAM1_data_out[1  ] ),    .DO2   (RAM1_data_out[2  ] ),    .DO3   (RAM1_data_out[3  ] ),
    .DO4   (RAM1_data_out[4  ] ),    .DO5   (RAM1_data_out[5  ] ),    .DO6   (RAM1_data_out[6  ] ),    .DO7   (RAM1_data_out[7  ] ),
    .DO8   (RAM1_data_out[8  ] ),    .DO9   (RAM1_data_out[9  ] ),    .DO10  (RAM1_data_out[10 ] ),    .DO11  (RAM1_data_out[11 ] ),
    .DO12  (RAM1_data_out[12 ] ),    .DO13  (RAM1_data_out[13 ] ),    .DO14  (RAM1_data_out[14 ] ),    .DO15  (RAM1_data_out[15 ] ),
    .DO16  (RAM1_data_out[16 ] ),    .DO17  (RAM1_data_out[17 ] ),    .DO18  (RAM1_data_out[18 ] ),    .DO19  (RAM1_data_out[19 ] ),
    .DO20  (RAM1_data_out[20 ] ),    .DO21  (RAM1_data_out[21 ] ),    .DO22  (RAM1_data_out[22 ] ),    .DO23  (RAM1_data_out[23 ] ),
    .DO24  (RAM1_data_out[24 ] ),    .DO25  (RAM1_data_out[25 ] ),    .DO26  (RAM1_data_out[26 ] ),    .DO27  (RAM1_data_out[27 ] ),
    .DO28  (RAM1_data_out[28 ] ),    .DO29  (RAM1_data_out[29 ] ),    .DO30  (RAM1_data_out[30 ] ),    .DO31  (RAM1_data_out[31 ] ),
    .DO32  (RAM1_data_out[32 ] ),    .DO33  (RAM1_data_out[33 ] ),    .DO34  (RAM1_data_out[34 ] ),    .DO35  (RAM1_data_out[35 ] ),
    .DO36  (RAM1_data_out[36 ] ),    .DO37  (RAM1_data_out[37 ] ),    .DO38  (RAM1_data_out[38 ] ),    .DO39  (RAM1_data_out[39 ] ),
    .DO40  (RAM1_data_out[40 ] ),    .DO41  (RAM1_data_out[41 ] ),    .DO42  (RAM1_data_out[42 ] ),    .DO43  (RAM1_data_out[43 ] ),
    .DO44  (RAM1_data_out[44 ] ),    .DO45  (RAM1_data_out[45 ] ),    .DO46  (RAM1_data_out[46 ] ),    .DO47  (RAM1_data_out[47 ] ),
    .DO48  (RAM1_data_out[48 ] ),    .DO49  (RAM1_data_out[49 ] ),    .DO50  (RAM1_data_out[50 ] ),    .DO51  (RAM1_data_out[51 ] ),
    .DO52  (RAM1_data_out[52 ] ),    .DO53  (RAM1_data_out[53 ] ),    .DO54  (RAM1_data_out[54 ] ),    .DO55  (RAM1_data_out[55 ] ),
    .DO56  (RAM1_data_out[56 ] ),    .DO57  (RAM1_data_out[57 ] ),    .DO58  (RAM1_data_out[58 ] ),    .DO59  (RAM1_data_out[59 ] ),
    .DO60  (RAM1_data_out[60 ] ),    .DO61  (RAM1_data_out[61 ] ),    .DO62  (RAM1_data_out[62 ] ),    .DO63  (RAM1_data_out[63 ] ),
    .DO64  (RAM1_data_out[64 ] ),    .DO65  (RAM1_data_out[65 ] ),    .DO66  (RAM1_data_out[66 ] ),    .DO67  (RAM1_data_out[67 ] ),
    .DO68  (RAM1_data_out[68 ] ),    .DO69  (RAM1_data_out[69 ] ),    .DO70  (RAM1_data_out[70 ] ),    .DO71  (RAM1_data_out[71 ] ),
    .DO72  (RAM1_data_out[72 ] ),    .DO73  (RAM1_data_out[73 ] ),    .DO74  (RAM1_data_out[74 ] ),    .DO75  (RAM1_data_out[75 ] ),
    .DO76  (RAM1_data_out[76 ] ),    .DO77  (RAM1_data_out[77 ] ),    .DO78  (RAM1_data_out[78 ] ),    .DO79  (RAM1_data_out[79 ] ),
    .DO80  (RAM1_data_out[80 ] ),    .DO81  (RAM1_data_out[81 ] ),    .DO82  (RAM1_data_out[82 ] ),    .DO83  (RAM1_data_out[83 ] ),
    .DO84  (RAM1_data_out[84 ] ),    .DO85  (RAM1_data_out[85 ] ),    .DO86  (RAM1_data_out[86 ] ),    .DO87  (RAM1_data_out[87 ]),
    .DO88  (RAM1_data_out[88 ] ),    .DO89  (RAM1_data_out[89 ] ),    .DO90  (RAM1_data_out[90 ] ),    .DO91  (RAM1_data_out[91 ] ),
    .DO92  (RAM1_data_out[92 ] ),    .DO93  (RAM1_data_out[93 ] ),    .DO94  (RAM1_data_out[94 ] ),    .DO95  (RAM1_data_out[95 ] ),
    .DO96  (RAM1_data_out[96 ] ),    .DO97  (RAM1_data_out[97 ] ),    .DO98  (RAM1_data_out[98 ] ),    .DO99  (RAM1_data_out[99 ] ),
    .DO100 (RAM1_data_out[100] ),    .DO101 (RAM1_data_out[101] ),    .DO102 (RAM1_data_out[102] ),    .DO103 (RAM1_data_out[103] ),
    .DO104 (RAM1_data_out[104] ),    .DO105 (RAM1_data_out[105] ),    .DO106 (RAM1_data_out[106] ),    .DO107 (RAM1_data_out[107] ),
    .DO108 (RAM1_data_out[108] ),    .DO109 (RAM1_data_out[109] ),    .DO110 (RAM1_data_out[110] ),    .DO111 (RAM1_data_out[111] ),
    .DO112 (RAM1_data_out[112] ),    .DO113 (RAM1_data_out[113] ),    .DO114 (RAM1_data_out[114] ),    .DO115 (RAM1_data_out[115] ),
    .DO116 (RAM1_data_out[116] ),    .DO117 (RAM1_data_out[117] ),    .DO118 (RAM1_data_out[118] ),    .DO119 (RAM1_data_out[119] ),
    .DO120 (RAM1_data_out[120] ),    .DO121 (RAM1_data_out[121] ),    .DO122 (RAM1_data_out[122] ),    .DO123 (RAM1_data_out[123] ),
    .DO124 (RAM1_data_out[124] ),    .DO125 (RAM1_data_out[125] ),    .DO126 (RAM1_data_out[126] ),    .DO127 (RAM1_data_out[127] ),

    .DI0   (r_ram_write_data[0  ] ),    .DI1   (r_ram_write_data[1  ] ),    .DI2   (r_ram_write_data[2  ] ),    .DI3   (r_ram_write_data[3  ] ),
    .DI4   (r_ram_write_data[4  ] ),    .DI5   (r_ram_write_data[5  ] ),    .DI6   (r_ram_write_data[6  ] ),    .DI7   (r_ram_write_data[7  ] ),
    .DI8   (r_ram_write_data[8  ] ),    .DI9   (r_ram_write_data[9  ] ),    .DI10  (r_ram_write_data[10 ] ),    .DI11  (r_ram_write_data[11 ] ),
    .DI12  (r_ram_write_data[12 ] ),    .DI13  (r_ram_write_data[13 ] ),    .DI14  (r_ram_write_data[14 ] ),    .DI15  (r_ram_write_data[15 ] ),
    .DI16  (r_ram_write_data[0  ] ),    .DI17  (r_ram_write_data[1  ] ),    .DI18  (r_ram_write_data[2  ] ),    .DI19  (r_ram_write_data[3  ] ),
    .DI20  (r_ram_write_data[4  ] ),    .DI21  (r_ram_write_data[5  ] ),    .DI22  (r_ram_write_data[6  ] ),    .DI23  (r_ram_write_data[7  ] ),
    .DI24  (r_ram_write_data[8  ] ),    .DI25  (r_ram_write_data[9  ] ),    .DI26  (r_ram_write_data[10 ] ),    .DI27  (r_ram_write_data[11 ] ),
    .DI28  (r_ram_write_data[12 ] ),    .DI29  (r_ram_write_data[13 ] ),    .DI30  (r_ram_write_data[14 ] ),    .DI31  (r_ram_write_data[15 ] ),
    .DI32  (r_ram_write_data[0  ] ),    .DI33  (r_ram_write_data[1  ] ),    .DI34  (r_ram_write_data[2  ] ),    .DI35  (r_ram_write_data[3  ] ),
    .DI36  (r_ram_write_data[4  ] ),    .DI37  (r_ram_write_data[5  ] ),    .DI38  (r_ram_write_data[6  ] ),    .DI39  (r_ram_write_data[7  ] ),
    .DI40  (r_ram_write_data[8  ] ),    .DI41  (r_ram_write_data[9  ] ),    .DI42  (r_ram_write_data[10 ] ),    .DI43  (r_ram_write_data[11 ] ),
    .DI44  (r_ram_write_data[12 ] ),    .DI45  (r_ram_write_data[13 ] ),    .DI46  (r_ram_write_data[14 ] ),    .DI47  (r_ram_write_data[15 ] ),
    .DI48  (r_ram_write_data[0  ] ),    .DI49  (r_ram_write_data[1  ] ),    .DI50  (r_ram_write_data[2  ] ),    .DI51  (r_ram_write_data[3  ] ),
    .DI52  (r_ram_write_data[4  ] ),    .DI53  (r_ram_write_data[5  ] ),    .DI54  (r_ram_write_data[6  ] ),    .DI55  (r_ram_write_data[7  ] ),
    .DI56  (r_ram_write_data[8  ] ),    .DI57  (r_ram_write_data[9  ] ),    .DI58  (r_ram_write_data[10 ] ),    .DI59  (r_ram_write_data[11 ] ),
    .DI60  (r_ram_write_data[12 ] ),    .DI61  (r_ram_write_data[13 ] ),    .DI62  (r_ram_write_data[14 ] ),    .DI63  (r_ram_write_data[15 ] ),
    .DI64  (r_ram_write_data[0  ] ),    .DI65  (r_ram_write_data[1  ] ),    .DI66  (r_ram_write_data[2  ] ),    .DI67  (r_ram_write_data[3  ] ),
    .DI68  (r_ram_write_data[4  ] ),    .DI69  (r_ram_write_data[5  ] ),    .DI70  (r_ram_write_data[6  ] ),    .DI71  (r_ram_write_data[7  ] ),
    .DI72  (r_ram_write_data[8  ] ),    .DI73  (r_ram_write_data[9  ] ),    .DI74  (r_ram_write_data[10 ] ),    .DI75  (r_ram_write_data[11 ] ),
    .DI76  (r_ram_write_data[12 ] ),    .DI77  (r_ram_write_data[13 ] ),    .DI78  (r_ram_write_data[14 ] ),    .DI79  (r_ram_write_data[15 ] ),
    .DI80  (r_ram_write_data[0  ] ),    .DI81  (r_ram_write_data[1  ] ),    .DI82  (r_ram_write_data[2  ] ),    .DI83  (r_ram_write_data[3  ] ),
    .DI84  (r_ram_write_data[4  ] ),    .DI85  (r_ram_write_data[5  ] ),    .DI86  (r_ram_write_data[6  ] ),    .DI87  (r_ram_write_data[7  ]),
    .DI88  (r_ram_write_data[8  ] ),    .DI89  (r_ram_write_data[9  ] ),    .DI90  (r_ram_write_data[10 ] ),    .DI91  (r_ram_write_data[11 ] ),
    .DI92  (r_ram_write_data[12 ] ),    .DI93  (r_ram_write_data[13 ] ),    .DI94  (r_ram_write_data[14 ] ),    .DI95  (r_ram_write_data[15 ] ),
    .DI96  (r_ram_write_data[0  ] ),    .DI97  (r_ram_write_data[1  ] ),    .DI98  (r_ram_write_data[2  ] ),    .DI99  (r_ram_write_data[3  ] ),
    .DI100 (r_ram_write_data[4  ] ),    .DI101 (r_ram_write_data[5  ] ),    .DI102 (r_ram_write_data[6  ] ),    .DI103 (r_ram_write_data[7  ] ),
    .DI104 (r_ram_write_data[8  ] ),    .DI105 (r_ram_write_data[9  ] ),    .DI106 (r_ram_write_data[10 ] ),    .DI107 (r_ram_write_data[11 ] ),
    .DI108 (r_ram_write_data[12 ] ),    .DI109 (r_ram_write_data[13 ] ),    .DI110 (r_ram_write_data[14 ] ),    .DI111 (r_ram_write_data[15 ] ),
    .DI112 (r_ram_write_data[0  ] ),    .DI113 (r_ram_write_data[1  ] ),    .DI114 (r_ram_write_data[2  ] ),    .DI115 (r_ram_write_data[3  ] ),
    .DI116 (r_ram_write_data[4  ] ),    .DI117 (r_ram_write_data[5  ] ),    .DI118 (r_ram_write_data[6  ] ),    .DI119 (r_ram_write_data[7  ] ),
    .DI120 (r_ram_write_data[8  ] ),    .DI121 (r_ram_write_data[9  ] ),    .DI122 (r_ram_write_data[10 ] ),    .DI123 (r_ram_write_data[11 ] ),
    .DI124 (r_ram_write_data[12 ] ),    .DI125 (r_ram_write_data[13 ] ),    .DI126 (r_ram_write_data[14 ] ),    .DI127 (r_ram_write_data[15 ] ),

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),
    .A4   (RAM_addr[4]   ),.A5   (RAM_addr[5]   ),.A6   (RAM_addr[6]   ),.A7    (RAM_addr[7]    ),
    .A8    (RAM_addr[8]    ),.A9    (RAM_addr[9]    ),.A10   (RAM_addr[10]   ),
    //.DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    
    .WEB0 (~r_WEB1_16[8] ), .WEB1 (~r_WEB1_16[9] ), .WEB2 (~r_WEB1_16[10] ),.WEB3 (~r_WEB1_16[11] ),
    .WEB4 (~r_WEB1_16[12] ),.WEB5 (~r_WEB1_16[13] ),.WEB6 (~r_WEB1_16[14] ),.WEB7 (~r_WEB1_16[15] ),
    .CK    (~S_AXI_ACLK  ),
    .CS    (1'b1    ),
    .OE    (1'b1    )
);















endmodule



`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 19:41:03
// Design Name: 
// Module Name: AXI_Master
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


module Axi_Master 
#(
		parameter integer C_M_AXI_BURST_LEN	    = 16, //支持（1 2 4 8 16 32 64 128 256）
		parameter integer C_M_AXI_ADDR_WIDTH	= 34,
        parameter integer C_M_AXI_DATA_WIDTH	= 16
)
(
        input   wire                                 M_AXI_ACLK                  ,
		input   wire                                 rstn               ,
		             
		input   wire 								 M_AXI_WRITE_DRIVE	         ,   
		input   wire 								 M_AXI_READ_DRIVE            ,   
        output  wire 								 M_AXI_WRITE_DRIVE_FREE	     ,   
		output  wire 								 M_AXI_READ_DRIVE_FREE       ,   

        output  wire                                 M_AXI_DRIVE_CACHE           ,
		input   wire                                 M_AXI_FREE_CACHE            ,

		input   wire [C_M_AXI_ADDR_WIDTH-1 : 0]      M_AXI_WRITE_ADDR             ,   // 接收传输地址
		input   wire [C_M_AXI_ADDR_WIDTH-1 : 0]      M_AXI_READ_ADDR             ,
        // input   wire [C_M_AXI_DATA_WIDTH-1 : 0]      M_AXI_FROM_BUFFER_DATA      ,   // 接收传输数据
		// output  wire [C_M_AXI_DATA_WIDTH-1 : 0]      M_AXI_TO_BUFFER_DATA        ,   // 接收传输数据 
        input   wire [255:0]                         M_AXI_FROM_CACHE_DATA       ,
        output  wire [255:0]                         M_AXI_TO_CACHE_DATA         ,

        // 写地址通道
		output  wire [C_M_AXI_ADDR_WIDTH-1 : 0]      M_AXI_AWADDR       ,   // 34位地址
        output  wire                                 M_AXI_AWVALID      ,  
		input   wire                                 M_AXI_AWREADY      ,
		
        // 写数据通道
		output  wire [C_M_AXI_DATA_WIDTH-1 : 0]      M_AXI_WDATA        ,   // 数据位宽 16
		output  wire                                 M_AXI_WLAST        ,
		output  wire                                 M_AXI_WVALID       ,
		input   wire                                 M_AXI_WREADY       ,

        // 写响应通道
		input   wire [1 : 0]                         M_AXI_BRESP        ,   // 表示写状态
		input   wire                                 M_AXI_BVALID       ,
		output  wire                                 M_AXI_BREADY       ,


        // 读地址通道
		output  wire [C_M_AXI_ADDR_WIDTH-1 : 0]      M_AXI_ARADDR       ,
		output  wire                                 M_AXI_ARVALID      ,
		input   wire                                 M_AXI_ARREADY      ,
       
        // 读数据通道
		input   wire [C_M_AXI_DATA_WIDTH-1 : 0]      M_AXI_RDATA        ,
	 // input   wire [1 : 0]                         M_AXI_RRESP        ,
		input   wire                                 M_AXI_RLAST        ,
        input   wire                                 M_AXI_RVALID       ,
		output  wire                                 M_AXI_RREADY    




        // // 仿真
        // ,output wire                                 o_r_write_start
        // ,output wire                                 o_r_read_start
 

);


/**********************参数***************************/
localparam  P_ST_IDLE        = 'd0 ,

            P_ST_WRITE_START = 'd1 ,
            P_ST_WRITE_TRANS = 'd2 ,
            P_ST_WRITE_END   = 'd3 ,

            P_ST_READ_START  = 'd4 ,
            P_ST_READ_TRANS  = 'd5 ,
            P_ST_READ_END    = 'd6 ;

// parameter integer  P_ST_IDLE        = 0 ;

// parameter integer  P_ST_WRITE_START = 1 ;
// parameter integer  P_ST_WRITE_TRANS = 2 ;
// parameter integer  P_ST_WRITE_END   = 3 ;

// parameter integer  P_ST_READ_START  = 4 ;
// parameter integer  P_ST_READ_TRANS  = 5 ;
// parameter integer  P_ST_READ_END    = 6 ;

/**********************网表型*************************/
wire       w_write_last                            ;

wire [1:0] w_mutex_data                            ;
wire       w_mutex_drive_cfifo2                    ;
// wire       w_mutex_drive_cfifo2_delay              ;
// wire       w_mutex_free_cfifo1                     ;
wire [1:0] w_cfifo2_fire                           ;

wire       w_write_start_fire                      ;
wire       w_read_start_fire                       ;

reg        w_all_write_enable                      ;
reg        w_line_write_enable                     ;

wire       w_data_buffer_fire                      ;
wire       w_buffer_clk                            ;

wire       w_read_free_delay                       ;

//wire       rclk									   ;
/**********************状态机*************************/
reg [2:0]  r_st_current_write    ;
reg [2:0]  r_st_next_write       ;

reg [2:0]  r_st_current_read     ;
reg [2:0]  r_st_next_read        ;

/**********************寄存器*************************/
reg  [C_M_AXI_ADDR_WIDTH - 1 : 0]    r_m_axi_awaddr        ;
reg                                  r_m_axi_awvalid       ;
reg                                  r_m_axi_wlast         ;
reg                                  r_m_axi_wvalid        ;
reg  [C_M_AXI_ADDR_WIDTH - 1 : 0]    r_m_axi_araddr        ;
reg                                  r_m_axi_arvalid       ;
reg                                  r_m_axi_rready        ;

reg                                  r_write_start         ;
reg                                  r_read_start          ;
reg  [7:0]                           r_burst_cnt           ;
reg  [C_M_AXI_DATA_WIDTH - 1 : 0]    r_axi_read_data       ;

reg  [3:0]                           r_buffer_addr         ;


/**********************控制链***************************/
(*dont_touch = "true"*)cMutexMerge2_2b_cache u_cMutexMerge2_2b( // 必须后接fifo
    .rstn          (rstn),
    
    .i_drive0      (M_AXI_WRITE_DRIVE), 
    .i_drive1      (M_AXI_READ_DRIVE),
    .i_data0       (2'b01), 
    .i_data1       (2'b10),
    .o_data        (w_mutex_data),
    
    .o_free0       (M_AXI_WRITE_DRIVE_FREE),
    .o_free1       (w_read_free_delay),
    .o_driveNext   (w_mutex_drive_cfifo2), 
    .i_freeNext    ((M_AXI_ACLK & M_AXI_WLAST) || (M_AXI_ACLK & M_AXI_RLAST))
    //.i_freeNext    ((M_AXI_ACLK & (r_st_current_write == P_ST_WRITE_END)) || (M_AXI_ACLK & (r_st_current_read == P_ST_READ_END)))
);


(*dont_touch = "true"*)cFifo2_cache u_cFifo2(

    .rstn               (rstn),
    // .i_drive            (w_mutex_drive_cfifo2_delay), 
    .i_drive            (w_mutex_drive_cfifo2), 
    .o_free             (), 
    .o_driveNext        (),
    //.i_freeNext         ((M_AXI_ACLK & M_AXI_WLAST) || (M_AXI_ACLK & M_AXI_RLAST)),
	.i_freeNext         ((M_AXI_ACLK & M_AXI_WLAST) || M_AXI_FREE_CACHE),
    .o_fire_2           (w_cfifo2_fire)
);


(*dont_touch = "true"*)delay3U u_delay3U_1(
    .rstn   (rstn),
    .inR    (w_read_free_delay), 
    .outR   (M_AXI_READ_DRIVE_FREE)
);

(*dont_touch = "true"*)delay32U u_delay32U_1(
    .rstn   (rstn),
    .inR    (w_read_free_delay), 
    .outR   (M_AXI_DRIVE_CACHE)
);

/**********************数据缓存***********************/

(*dont_touch = "true"*)Data_Buffer u_Data_buffer(
        .rstn                          (rstn),
        // .fire                          (w_data_buffer_fire),
        .fire                          (~M_AXI_ACLK),
    
        .i_allData_in_256              (M_AXI_FROM_CACHE_DATA),
        .i_lineData_in_16              (M_AXI_RDATA),
    
        .o_allData_out_256             (M_AXI_TO_CACHE_DATA),
        .o_lineData_out_16             (M_AXI_WDATA),
    
        .i_buffer_addr_4               (r_buffer_addr),

        .i_all_write_enable            (w_all_write_enable ),
        .i_line_write_enable           (w_line_write_enable)  
);

/**********************组合逻辑***********************/
//assign rclk   		   = ~M_AXI_ACLK													;
//assign M_AXI_DRIVE_CACHE  = M_AXI_READ_DRIVE_FREE                         ;
// 写地址通道
assign M_AXI_AWADDR    = r_m_axi_awaddr													;   // 34位地址
assign M_AXI_AWVALID   = r_m_axi_awvalid												;  


// 写数据通道
assign M_AXI_WLAST     = (C_M_AXI_BURST_LEN == 1) ? w_write_last : r_m_axi_wlast		;
assign M_AXI_WVALID    = r_m_axi_wvalid													;


// 写响应通道
assign M_AXI_BREADY    = 1'b1															;

// 读地址通道
assign M_AXI_ARADDR    = r_m_axi_araddr													;
assign M_AXI_ARVALID   = r_m_axi_arvalid												;


// 读数据通道
assign M_AXI_RREADY         = r_m_axi_rready											;
// assign M_AXI_TO_BUFFER_DATA = r_axi_read_data                                           ;


                                                 
assign w_write_last   = M_AXI_WVALID && M_AXI_WREADY                                     ;	// 只有一次突发传输 直接传LAST


assign w_write_start_fire = w_cfifo2_fire[1] || (M_AXI_ACLK & M_AXI_WLAST);
assign w_read_start_fire  = w_cfifo2_fire[1] || (M_AXI_ACLK & M_AXI_RLAST);


assign w_buffer_clk       = ((M_AXI_WVALID & M_AXI_WREADY) || (M_AXI_RVALID & M_AXI_RREADY)) ? M_AXI_ACLK : 1'b0;
assign w_data_buffer_fire = w_cfifo2_fire[0] || w_buffer_clk              ;




always @(w_mutex_data or r_st_current_write) begin 
    if((w_mutex_data == 2'b01) && (r_st_current_write == P_ST_IDLE)) begin 
        w_all_write_enable = 1'b1;
    end
    else begin 
        w_all_write_enable = 1'b0;
    end
end

always @(M_AXI_RVALID or M_AXI_RREADY) begin 
    if(M_AXI_RVALID & M_AXI_RREADY) begin 
        w_line_write_enable = 1'b1;
    end
    else begin 
        w_line_write_enable = 1'b0;
    end
end

// always @(M_AXI_WVALID or M_AXI_WREADY or M_AXI_RVALID or M_AXI_RREADY) begin 
//     if ((M_AXI_WVALID & M_AXI_WREADY) || (M_AXI_RVALID & M_AXI_RREADY)) begin 
//         w_buffer_clk = M_AXI_ACLK;
//     end
//     else begin 
//         w_buffer_clk = 1'b0;
//     end
// end


// // 仿真
// assign  o_r_write_start = r_write_start;
// assign  o_r_read_start  = r_read_start;

/**********************时序逻辑***************************/
// 写操作状态机 
always @(posedge M_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_st_current_write <= P_ST_IDLE         ;
	end
    else begin 
        r_st_current_write <= r_st_next_write   ;
	end
end


always @(*) begin
    case(r_st_current_write)
        P_ST_IDLE        : r_st_next_write = r_write_start ? P_ST_WRITE_START : P_ST_IDLE		          ;
        P_ST_WRITE_START : r_st_next_write = P_ST_WRITE_TRANS 									          ;
        P_ST_WRITE_TRANS : r_st_next_write = M_AXI_WLAST   ? P_ST_WRITE_END   : P_ST_WRITE_TRANS          ;
        P_ST_WRITE_END   : r_st_next_write = P_ST_IDLE 											          ;
        default          : r_st_next_write = P_ST_IDLE 											          ;
    endcase
end


always @(posedge w_write_start_fire or negedge rstn)
	if(rstn == 0) 
		r_write_start <= 1'b0;
	else begin 
		if(M_AXI_WLAST)
			r_write_start <= 1'b0;
		else if(w_mutex_data == 2'b01)
			r_write_start <= 1'b1;
        else
            r_write_start <= r_write_start;
	end
    
/*--------------------------------*/

// 读操作状态机
always @(posedge M_AXI_ACLK or negedge rstn)
    if(rstn == 0)
        r_st_current_read <= P_ST_IDLE         ;
    else 
        r_st_current_read <= r_st_next_read    ;

always @(*)
    case(r_st_current_read)
        P_ST_IDLE        : r_st_next_read = r_read_start ? P_ST_READ_START : P_ST_IDLE       ;
        P_ST_READ_START  : r_st_next_read = P_ST_READ_TRANS                                  ;
        P_ST_READ_TRANS  : r_st_next_read = M_AXI_RLAST  ? P_ST_READ_END   : P_ST_READ_TRANS ;
        P_ST_READ_END    : r_st_next_read = P_ST_IDLE                                        ;
        default          : r_st_next_read = P_ST_IDLE                                        ;
    endcase

always @(posedge w_read_start_fire or negedge rstn)
    if(rstn == 0) begin 
		r_read_start <= 1'b0;
	end
	else begin 
		if(M_AXI_RLAST)
			r_read_start <= 1'b0;
		else if(w_mutex_data == 2'b10)
			r_read_start <= 1'b1;
        else 
            r_read_start <= r_read_start;
	end

/*--------------------------------*/
always @(posedge M_AXI_ACLK or negedge rstn) begin 
	if(rstn == 0) begin 
		r_m_axi_awvalid <= 1'b0;
	end
	else begin 
		if(M_AXI_AWVALID && M_AXI_AWREADY) begin 
			r_m_axi_awvalid <= 1'b0;
		end
		else if(r_write_start && (r_st_current_write == P_ST_IDLE || r_st_current_write == P_ST_WRITE_START)) begin 
			r_m_axi_awvalid <= 1'b1;
		end
		else begin 
			r_m_axi_awvalid <= r_m_axi_awvalid;
		end
	end
end


always @(posedge M_AXI_ACLK or negedge rstn) begin 
	if(rstn == 0) begin 
		r_m_axi_awaddr <= 34'b0;
	end
	else begin 
		if(r_write_start) begin 
			r_m_axi_awaddr <= M_AXI_WRITE_ADDR;
		end
		else if(M_AXI_AWVALID && M_AXI_AWREADY) begin 
			r_m_axi_awaddr <= 34'b0;
		end
		else begin 
			r_m_axi_awaddr <= r_m_axi_awaddr;
		end
	end
end


always @(posedge M_AXI_ACLK or negedge rstn) begin 
    if(rstn == 0) begin 
        r_buffer_addr <= 4'b0;
    end
    else begin 
        if((r_write_start && (r_st_current_write == P_ST_IDLE)) || (r_read_start && (r_st_current_read == P_ST_IDLE))) begin 
			r_buffer_addr <= 4'b0;
		end
		else if((M_AXI_WVALID && M_AXI_WREADY) || (M_AXI_RVALID && M_AXI_RREADY)) begin 
			r_buffer_addr <= r_buffer_addr + 1;
		end
		else begin 
			r_buffer_addr <= 4'b0;
		end
    end
end




always @(posedge M_AXI_ACLK or negedge rstn) begin 
	if(rstn == 0) begin 
		r_m_axi_wvalid <= 1'b0;
	end
	else begin 
		if(M_AXI_WLAST) begin 
			r_m_axi_wvalid <= 1'b0;
		end
		else if(M_AXI_AWVALID && M_AXI_AWREADY) begin 
			r_m_axi_wvalid <= 1'b1;
		end
		else begin 
			r_m_axi_wvalid <= r_m_axi_wvalid;
		end
	end
end


always @(posedge M_AXI_ACLK or negedge rstn) begin 
	if(rstn == 0) begin 
		r_m_axi_wlast <= 1'b0;
	end
	else begin 
		if(C_M_AXI_BURST_LEN == 1) begin 
			r_m_axi_wlast <= 1'b0;
		end
		else if(C_M_AXI_BURST_LEN == 2 && (M_AXI_WVALID && M_AXI_WREADY && !r_m_axi_wlast)) begin 
			r_m_axi_wlast <= M_AXI_WVALID & M_AXI_WREADY;
		end
		else if(C_M_AXI_BURST_LEN > 2 && r_burst_cnt == C_M_AXI_BURST_LEN - 2) begin 
			r_m_axi_wlast <= 1'b1;
		end
		else begin 
			r_m_axi_wlast <= 1'b0;
		end
	end
end


always @(posedge M_AXI_ACLK or negedge rstn) begin 
	if(rstn == 0) begin 
		r_burst_cnt <= 8'b0;
	end
	else begin 
		if(M_AXI_WLAST) begin 
			r_burst_cnt <= 8'b0;
		end
		else if(M_AXI_WVALID && M_AXI_WREADY) begin 
			r_burst_cnt <= r_burst_cnt + 1;
		end
		else begin 
			r_burst_cnt <= r_burst_cnt;
		end
	end
end


always @(posedge M_AXI_ACLK or negedge rstn) begin 
	if(rstn == 0) begin 
		r_m_axi_arvalid <= 1'b0;
	end
	else begin 
		if(M_AXI_RVALID && M_AXI_RREADY) begin 
			r_m_axi_arvalid <= 1'b0;
		end
		else if(r_read_start && (r_st_current_read == P_ST_IDLE || r_st_current_read == P_ST_READ_START)) begin 
			r_m_axi_arvalid <= 1'b1;
		end
		else begin 
			r_m_axi_arvalid <= r_m_axi_arvalid;
		end
	end
end


always @(posedge M_AXI_ACLK or negedge rstn) begin 
	if(rstn == 0) begin 
		r_m_axi_araddr <= 34'b0;
	end
	else begin 
		if(r_read_start) begin 
			r_m_axi_araddr <= M_AXI_READ_ADDR;
		end
		else if(M_AXI_ARVALID && M_AXI_ARREADY) begin 
			r_m_axi_araddr <= 34'b0;
		end
		else begin 
			r_m_axi_araddr <= r_m_axi_araddr;
		end
	end
end


always @(posedge M_AXI_ACLK or negedge rstn) begin 
	if(rstn == 0) begin 
		r_m_axi_rready <= 1'b0;
	end
	else begin 
		if(M_AXI_RLAST) begin 
			r_m_axi_rready <= 1'b0;
		end
		else if(M_AXI_ARVALID && M_AXI_ARREADY) begin 
			r_m_axi_rready <= 1'b1;
		end
		else begin 
			r_m_axi_rready <= r_m_axi_rready;
		end
	end
end


always @(posedge M_AXI_ACLK or negedge rstn) begin 
	if(rstn == 0) begin 
		r_axi_read_data <= 16'b0;
	end
	else begin 
        if(M_AXI_RLAST) 
            r_axi_read_data <= 16'b0;
		else if(M_AXI_RVALID && M_AXI_RREADY)
			r_axi_read_data <= M_AXI_RDATA;
		else
			r_axi_read_data <= r_axi_read_data;
	end
end




/*--------------------------------*/




/*--------------------------------*/




/*--------------------------------*/














endmodule

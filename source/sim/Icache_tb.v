`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/13 19:34:26
// Design Name: 
// Module Name: Icache_tb
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


module Icache_tb;

// Icache Parameters
parameter PERIOD    = 5;
parameter rst_cycle  = 50;
parameter run_time  = 35;

reg [6:0] count = 0;

// Icache Inputs
reg   rstn                                  ;
reg   i_Itlb_drive                         ;
reg   [33:0]  i_Itlb_PA_34                 ;
reg   i_L2Cache_drive                      ;
reg   i_freeNext_L2Cache                   ;
reg   [255:0]  i_L2Cache_refillLine_32B    ;
//reg [127:0] i_L2Cache_refillLine_H16B, i_L2Cache_refillLine_L16B;
reg   i_freeNext_ifu                       ;

// Icache Outputs
wire  o_Itlb_free                          ;
wire  o_L2Cache_free                       ;
wire  o_driveNext_L2Cache                  ;
wire  [33:0]  o_miss_Addr_to_L2cache_34    ;
wire  o_driveNext_ifu                      ;
wire  [255:0]  o_hit_data_to_ifu_32B       ;
wire  [1:0]  o_fifo_buffer_write_enable_2  ;
wire  [33:0]  o_fifo2_1_addr_34            ;
wire  o_write_enable                       ;
wire  o_fifo_buffer_data_out               ;



initial 
begin
    $sdf_annotate("/team/users/zhao.kangli/2024-superscalarProcessor/DC/DC_zjy/DC_Icache/output/Icache.sdf",u_Icache); 
end

integer i;

initial
begin
    for (i = 0;i < 128 ;i=i+1 ) begin
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Icache.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Icache.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Icache.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Icache.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte0[i][6:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte1[i][6:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte2[i][6:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte3[i][6:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte4[i][6:0] = 0;
        u_Icache.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte5[i][6:0] = 0;
    end

end

Icache  u_Icache (
    .rstn                        ( rstn                                ),
    .i_Itlb_drive               ( i_Itlb_drive                       ),
    .i_Itlb_PA_34               ( i_Itlb_PA_34               [33:0]  ),
    .i_L2Cache_drive            ( i_L2Cache_drive                    ),
    .i_freeNext_L2Cache         ( i_freeNext_L2Cache                 ),
    .i_L2Cache_refillLine_32B   ( i_L2Cache_refillLine_32B    ),
    .i_freeNext_ifu             ( i_freeNext_ifu                     ),

    .o_Itlb_free                ( o_Itlb_free                        ),
    .o_L2Cache_free             ( o_L2Cache_free                     ),
    .o_driveNext_L2Cache        ( o_driveNext_L2Cache                ),
    .o_miss_Addr_to_L2cache_34  ( o_miss_Addr_to_L2cache_34  [33:0]  ),
    .o_driveNext_ifu            ( o_driveNext_ifu                    ),
    .o_hit_data_to_ifu_32B      ( o_hit_data_to_ifu_32B      [255:0] ),
    
    .o_fifo_buffer_write_enable_2  ( o_fifo_buffer_write_enable_2  [1:0]   ),
    .o_fifo2_1_addr_34             ( o_fifo2_1_addr_34             [33:0]  ),
    .o_write_enable                ( o_write_enable                        ),
    .o_fifo_buffer_data_out        ( o_fifo_buffer_data_out                )
);



// i_Itlb_drive                         = 0 ;
// i_Itlb_PA_34                 = 0 ;
// i_L2Cache_drive                      = 0 ;
// i_freeNext_L2Cache                   = 0 ;
// i_L2Cache_refillLine_32B    = 0 ;
// i_freeNext_ifu                       = 0 ;

initial
begin
    rstn = 1;
    #5; 
    rstn = 0;
    i_Itlb_drive                         = 0 ;
    i_Itlb_PA_34                         = 0 ;
    i_L2Cache_drive                      = 0 ;
    i_freeNext_L2Cache                   = 0 ;
    i_L2Cache_refillLine_32B            = 0 ;
    i_freeNext_ifu                       = 0 ;
    
    #(PERIOD*rst_cycle-5) rstn  =  1;
    #20;

    //case1 ��ȱʧ������L2
    count = count +1'b1;
    
    i_Itlb_PA_34 = 34'h234567_abc;

    #(PERIOD/2.0) i_Itlb_drive = 1'b1;
    #(PERIOD/2.0) i_Itlb_drive = 1'b0;

    #run_time;
	#(PERIOD/2.0)		i_freeNext_L2Cache =  1'b1;
    #(PERIOD/2.0)       i_freeNext_L2Cache =  1'b0;
    #(PERIOD);
  

    //case2 L2����
    count = count +1'b1;

    i_Itlb_PA_34 = 34'h256789_abc; //Ӧ�ò���ֵ
    i_L2Cache_refillLine_32B = 256'hfea5bf5c4ee8c293_ead6fe726109b4f8_6d1c1c1b60d277f3_8f227c1d5e91b527; //64λ16����
    // i_L2Cache_refillLine_H16B = 128'hfea5bf5c4ee8c293_ead6fe726109b4f8;
    // i_L2Cache_refillLine_L16B = 128'h6d1c1c1b60d277f3_8f227c1d5e91b527;

    #(PERIOD/2.0) i_L2Cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2Cache_drive = 1'b0;

    #run_time;
    #(PERIOD/2.0)		i_freeNext_ifu		=		1'b1;
    #(PERIOD/2.0) i_freeNext_ifu =  1'b0;
    #(PERIOD);

    //case3 ��ȱʧ������L2
    count = count +1'b1;

    i_Itlb_PA_34 = 34'h256789_abc;

    #(PERIOD/2.0) i_Itlb_drive = 1'b1;
    #(PERIOD/2.0) i_Itlb_drive = 1'b0;

    #run_time;
	#(PERIOD/2.0)		i_freeNext_L2Cache =  1'b1;
    #(PERIOD/2.0)       i_freeNext_L2Cache =  1'b0;
    #(PERIOD);
    
    //case3 ����
    count = count +1'b1;

    i_Itlb_PA_34 = 34'h256789_abc;
    i_L2Cache_refillLine_32B = 256'h1c7e7580_0d3abd0c_c0a08d74_0dc16ff0_c1d55647_421fdea6_47b6810a_637f1a83;

    #(PERIOD/2.0) i_L2Cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2Cache_drive = 1'b0;

    #run_time;
	#(PERIOD/2.0)		i_freeNext_ifu =  1'b1;
    #(PERIOD/2.0)       i_freeNext_ifu =  1'b0;
    #(PERIOD);
    
    //case4 ������
    count = count +1'b1;

    i_Itlb_PA_34 = 34'h234567_abc;

    #(PERIOD/2.0) i_Itlb_drive = 1'b1;
    #(PERIOD/2.0) i_Itlb_drive = 1'b0;

    #run_time;
	#(PERIOD/2.0)		i_freeNext_ifu =  1'b1;
    #(PERIOD/2.0)       i_freeNext_ifu =  1'b0;
    #(PERIOD);


    $stop;
end


endmodule

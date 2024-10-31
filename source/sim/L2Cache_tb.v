`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/04 16:14:54
// Design Name: 
// Module Name: L2Cache_tb
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


module L2Cache_tb;


    reg [6:0] count = 0;
    
    // L2Cache Inputs
    // �����õļ����ź� һ�㶼��reg��
    
    reg rstn = 1;
    // DCache
    reg i_DCache_miss_drive = 0;
    reg i_DCache_writeBack_drive = 0;
    reg i_freeNext_DCache = 0;
    reg [33:0] i_miss_Addr_from_DCache_34 = 0;
    reg [33:0] i_writeBack_Addr_from_DCache_34 = 0;
    reg [255:0] i_L1Cache_writeBackLine_32B = 0;
    
    wire o_Dcache_miss_free;
    wire o_DCache_writeBack_free;
    wire o_driveNext_DCache;
    wire [255:0] o_refillLine_to_L1Cache_32B;
   
    // ICache
    reg i_ICache_miss_drive = 0;
    reg i_freeNext_ICache = 0;
    reg [33:0] i_miss_Addr_from_ICache_34 = 0;
    
    wire o_ICache_miss_free;
    wire o_driveNext_ICache;
    wire [1:0] o_DCache_or_ICache_2;
    
    // DDR
    reg i_DDR_drive = 0;
    reg i_freeNext_DDR_miss = 0;
    reg i_freeNext_DDR_writeBack = 0;
    reg [255:0] i_DDR_refillLine_32B = 0;
    
    wire o_DDR_free;
    wire o_driveNext_DDR_miss;
    wire o_driveNext_DDR_writeBack;
    wire [33:0] o_miss_Addr_to_DDR_34;
    wire [33:0] o_writeBack_Addr_to_DDR_34;
    wire [255:0] o_writeBackLine_to_DDR_32B;
    
    
    wire o_selector1_valid;
    wire [3:0] r_case_number_4;
    wire [3:0] o_r_case_number_4;
    wire [1:0] o_r_DCache_or_ICache_2;
    //wire [4:0] o_r_mutex1_data_to_cfifo1_5;
    wire o_w_need_writeBack;
    wire [33:0] o_r_physical_Addr_34;
    wire o_w_hit;
    wire o_w_have_empty;
    //wire o_r_refill_way_3;
    wire [6:0] o_w_2_plruSRAM_addr_7;
    wire [6:0] o_w_2_plruSRAM_in_7;
    wire o_w_2_read_or_write_plruSRAM;
    wire o_w_read_or_write_plruSRAM;
    wire o_r_dvSRAM_OP_sel;
    wire o_r_plruSRAM_OP_sel;
    wire o_r_OP_sel1;
    wire o_r_OP_sel2;
    wire o_w_1_read_or_write_plruSRAM;
    wire [255:0] o_r_refillLine_to_L2Cache_32B;
    wire o_r_selector1_valid;
    wire o_r_2_plruSRAM_in_7;
    wire [255:0] o_r_result_data_32B;
    
initial 
begin
    $sdf_annotate("/team/users/zhao.kangli/2024-superscalarProcessor/DC/DC_zjy/DC_L2cache/output/L2Cache.sdf",u_L2Cache); 
end

integer i;

initial begin
    for ( i= 0; i<128 ; i=i+1) begin
        // tagSRAM
        u_L2Cache.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_L2Cache.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_L2Cache.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_L2Cache.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;

        u_L2Cache.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_L2Cache.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_L2Cache.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_L2Cache.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;
        
        // plruSRAM
        u_L2Cache.u_L2Cache_plruSRAM.u_L2plru_SYKB110_128X7X1CM4.Memory[i][6:0] = 0;

        // dvSRAM
        u_L2Cache.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte0[i][1:0] = 0;
        u_L2Cache.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte1[i][1:0] = 0;
        u_L2Cache.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte2[i][1:0] = 0;
        u_L2Cache.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte3[i][1:0] = 0;
        u_L2Cache.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte4[i][1:0] = 0;
        u_L2Cache.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte5[i][1:0] = 0;
        u_L2Cache.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte6[i][1:0] = 0;
        u_L2Cache.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte7[i][1:0] = 0;

        // dataSRAM
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_L2Cache.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_L2Cache.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;
    end
end

    L2Cache u_L2Cache (
        .rstn                            (rstn),
        // DCache
        .i_DCache_miss_drive            (i_DCache_miss_drive),
        .i_DCache_writeBack_drive       (i_DCache_writeBack_drive),
        .i_freeNext_DCache              (i_freeNext_DCache),
        .i_miss_Addr_from_DCache_34     (i_miss_Addr_from_DCache_34 [33:0]),
        .i_writeBack_Addr_from_DCache_34(i_writeBack_Addr_from_DCache_34 [33:0]),
        .i_L1Cache_writeBackLine_32B    (i_L1Cache_writeBackLine_32B [255:0]),
        
        .o_DCache_miss_free             (o_Dcache_miss_free),
        .o_DCache_writeBack_free        (o_DCache_writeBack_free),
        .o_driveNext_DCache             (o_driveNext_DCache),
        .o_refillLine_to_L1Cache_32B    (o_refillLine_to_L1Cache_32B [255:0]),
       
        // ICache
        .i_ICache_miss_drive            (i_ICache_miss_drive),
        .i_freeNext_ICache              (i_freeNext_ICache),
        .i_miss_Addr_from_ICache_34     (i_miss_Addr_from_ICache_34 [33:0]),
        
        .o_ICache_miss_free             (o_ICache_miss_free),
        .o_driveNext_ICache             (o_driveNext_ICache),
        .o_DCache_or_ICache_2           (o_DCache_or_ICache_2 [1:0]),
        
        // DDR
        .i_DDR_drive                    (i_DDR_drive),
        .i_freeNext_DDR_miss            (i_freeNext_DDR_miss),
        .i_freeNext_DDR_writeBack       (i_freeNext_DDR_writeBack),
        .i_DDR_refillLine_32B           (i_DDR_refillLine_32B [255:0]),
        
        .o_DDR_free                     (o_DDR_free),
        .o_driveNext_DDR_miss           (o_driveNext_DDR_miss),
        .o_driveNext_DDR_writeBack      (o_driveNext_DDR_writeBack),
        .o_miss_Addr_to_DDR_34          (o_miss_Addr_to_DDR_34 [33:0]),
        .o_writeBack_Addr_to_DDR_34     (o_writeBack_Addr_to_DDR_34 [33:0]),
        .o_writeBackLine_to_DDR_32B     (o_writeBackLine_to_DDR_32B [255:0]),
        
        .o_r_case_number_4              (o_r_case_number_4),
        .o_r_DCache_or_ICache_2         (o_r_DCache_or_ICache_2),
        //.o_r_mutex1_data_to_cfifo1_5(o_r_mutex1_data_to_cfifo1_5)
        .o_w_need_writeBack             (o_w_need_writeBack),
        .o_w_hit                        (o_w_hit),
        
        .o_w_have_empty                 (w_have_empty),
        .o_r_physical_Addr_34           (o_r_physical_Addr_34 [33:0]),
        //.o_r_refill_way_3(o_r_refill_way_3)
        .o_w_2_plruSRAM_addr_7          (o_w_2_plruSRAM_addr_7),
        .o_w_2_plruSRAM_in_7            (o_w_2_plruSRAM_in_7),
        .o_w_2_read_or_write_plruSRAM   (o_w_2_read_or_write_plruSRAM),
        .o_w_read_or_write_plruSRAM     (o_w_read_or_write_plruSRAM),
        .o_r_dvSRAM_OP_sel              (o_r_dvSRAM_OP_sel),
        .o_r_plruSRAM_OP_sel            (o_r_plruSRAM_OP_sel),
        .o_r_OP_sel1                    (o_r_OP_sel1),
        .o_r_OP_sel2                    (o_r_OP_sel2),
        .o_w_1_read_or_write_plruSRAM   (o_w_1_read_or_write_plruSRAM),
        .o_r_refillLine_to_L2Cache_32B  (o_r_refillLine_to_L2Cache_32B),
        .o_r_selector1_valid            (o_r_selector1_valid),
        .o_r_2_plruSRAM_in_7            (o_r_2_plruSRAM_in_7),
        .o_r_result_data_32B            (o_r_result_data_32B)
    );
    
    initial
    begin
        #5;
        rstn = 1;
        #20;
        rstn = 0;
        #200;
        rstn = 1;

        //count = count +1'b1;
        // DCache test
//            i_miss_Addr_from_DCache_34 = 34'h001000_abc;
//            i_writeBack_Addr_from_DCache_34 = 34'h001000_a11;
//            i_L1Cache_writeBackLine_32B = 256'b11;
//            i_DCache_writeBack_drive = 1'b0;
//            i_DDR_drive = 1'b0;
//            i_freeNext_DDR_miss = 1'b0;
            
//            i_DDR_refillLine_32B = 256'b0;
//            #3;
//            //i_DCache_miss_drive = 1'b1;
//            i_DCache_writeBack_drive = 1'b1;

//            #3;
//            //i_DCache_miss_drive = 1'b0;
//            i_DCache_writeBack_drive = 1'b0;
//            #20;
            
//            #200;
//            i_freeNext_DDR_miss = 1'b1;
//            i_DDR_drive = 1'b1;
//            #3;
//            i_freeNext_DDR_miss = 1'b0;
//            i_DDR_drive = 1'b0;
            
            
//            #100;
//            i_freeNext_DDR_miss = 1'b1;
//            #3;
//            i_freeNext_DDR_miss = 1'b0;
//            #3;
//            i_DDR_drive = 1'b1;
//            i_DDR_refillLine_32B = 256'b1111111;
//            #3;
//            i_DDR_drive = 1'b0;
            
//            #200;
 
 
 
 
           // ICache test
           i_miss_Addr_from_ICache_34 = 34'h001000_abc;
           i_DDR_refillLine_32B = 256'h7777c6ac74539c8ac7ccf47aa750243eb6777410902a42464699ad22e42efe88;
           i_ICache_miss_drive = 1'b0;
           i_DDR_drive = 1'b0;
           i_freeNext_ICache = 1'b0;
           i_freeNext_DDR_miss = 1'b0;

           #3;
           i_ICache_miss_drive = 1'b1;
           #3;
           i_ICache_miss_drive = 1'b0;

           #100;

           i_freeNext_DDR_miss = 1'b1;
           #3;
           i_freeNext_DDR_miss = 1'b0;
           #3;
           i_DDR_drive = 1'b1;
           
           #3;
           i_DDR_drive = 1'b0;
            
           #200;
           i_freeNext_ICache = 1'b1;
           #3;
           i_freeNext_ICache = 1'b0;
           #10;



        //    // ICache test
        //    i_miss_Addr_from_ICache_34 = 34'h004000_abc;
        //    i_DDR_refillLine_32B = 256'h8888c6ac74539c8ac7ccf47aa750243eb6777410902a42464699ad22e42efe88;
        //    i_ICache_miss_drive = 1'b0;
        //    i_DDR_drive = 1'b0;
        //    i_freeNext_ICache = 1'b0;
        //    i_freeNext_DDR_miss = 1'b0;

        //    #3;
        //    i_ICache_miss_drive = 1'b1;
        //    #3;
        //    i_ICache_miss_drive = 1'b0;

        //    #100;

        //    i_freeNext_DDR_miss = 1'b1;
        //    #3;
        //    i_freeNext_DDR_miss = 1'b0;
        //    #3;
        //    i_DDR_drive = 1'b1;
           
        //    #3;
        //    i_DDR_drive = 1'b0;
            
        //    #200;
        //    i_freeNext_ICache = 1'b1;
        //    #3;
        //    i_freeNext_ICache = 1'b0;
        //    #10;




            // // writeBack test
            // count = count +1'b1;    // д����
          
            // i_writeBack_Addr_from_DCache_34 = 34'h000100_111;
            // i_miss_Addr_from_DCache_34 = 34'h000200_111;
            // i_L1Cache_writeBackLine_32B = 256'hae48c6ac74539c8ac7ccf47aa750243eb6777410902a42464699ad22e42efe88;
            // i_DDR_refillLine_32B = 256'h45b0bce7ad0a65568a38f835a3218bf12490225986f14b0564059c16e9e37ae6;
            
            // i_DCache_writeBack_drive = 1'b0;
            // i_DDR_drive = 1'b0;
            // i_freeNext_DDR_miss = 1'b0;
            
            // #3;
            // i_DCache_writeBack_drive = 1'b1;
            // #3;
            // i_DCache_writeBack_drive = 1'b0;
            
            // #200;
            // i_freeNext_DDR_miss = 1'b1;
            // i_DDR_drive = 1'b1;
            // #3;
            // i_freeNext_DDR_miss = 1'b0;
            // i_DDR_drive = 1'b0;
            
            // #100;
            
            // i_freeNext_DDR_miss = 1'b1;
            // #3;
            // i_freeNext_DDR_miss = 1'b0;
            
            // #3;
            // i_DDR_drive = 1'b1;
            // #3;
            // i_DDR_drive = 1'b0;
            
            // i_freeNext_DCache = 1'b0;
            // #200;
            // i_freeNext_DCache = 1'b1;
            // #3;
            // i_freeNext_DCache = 1'b0;
            


            // count = count +1'b1;    // д����
          
            // i_writeBack_Addr_from_DCache_34 = 34'h000300_111;
            // i_miss_Addr_from_DCache_34 = 34'h000400_111;
            // i_L1Cache_writeBackLine_32B = 256'h71bcef8098677529eef4e0660045c627d42384fb5c9c5db03fb80cce2b90df3d;
            // i_DDR_refillLine_32B = 256'h163d1a5c7f7b340aaea214de76983e7b46d469b39accef2cec0ad504cfde6986;
            
            // i_DCache_writeBack_drive = 1'b0;
            // i_DDR_drive = 1'b0;
            // i_freeNext_DDR_miss = 1'b0;
            
            // #3;
            // i_DCache_writeBack_drive = 1'b1;
            // #3;
            // i_DCache_writeBack_drive = 1'b0;
            
            // #200;
            // i_freeNext_DDR_miss = 1'b1;
            // i_DDR_drive = 1'b1;
            // #3;
            // i_freeNext_DDR_miss = 1'b0;
            // i_DDR_drive = 1'b0;
            
            // #100;
            
            // i_freeNext_DDR_miss = 1'b1;
            // #3;
            // i_freeNext_DDR_miss = 1'b0;
            
            // #3;
            // i_DDR_drive = 1'b1;
            // #3;
            // i_DDR_drive = 1'b0;
            
            // i_freeNext_DCache = 1'b0;
            // #200;
            // i_freeNext_DCache = 1'b1;
            // #3;
            // i_freeNext_DCache = 1'b0;

            
            
            
            // count = count +1'b1;    // д����
          
            // i_writeBack_Addr_from_DCache_34 = 34'h000500_111;
            // i_miss_Addr_from_DCache_34 = 34'h000600_111;
            // i_L1Cache_writeBackLine_32B = 256'h8888ef8098677529eef4e0660045c627d42384fb5c9c5db03fb80cce2b90df3d;
            // i_DDR_refillLine_32B = 256'h25671a5c7f7b340aaea214de76983e7b46d469b39accef2cec0ad504cfde6986;
            
            // i_DCache_writeBack_drive = 1'b0;
            // i_DDR_drive = 1'b0;
            // i_freeNext_DDR_miss = 1'b0;
            
            // #3;
            // i_DCache_writeBack_drive = 1'b1;
            // #3;
            // i_DCache_writeBack_drive = 1'b0;
            
            // #200;
            // i_freeNext_DDR_miss = 1'b1;
            // i_DDR_drive = 1'b1;
            // #3;
            // i_freeNext_DDR_miss = 1'b0;
            // i_DDR_drive = 1'b0;
            
            // #100;
            
            // i_freeNext_DDR_miss = 1'b1;
            // #3;
            // i_freeNext_DDR_miss = 1'b0;
            
            // #3;
            // i_DDR_drive = 1'b1;
            // #3;
            // i_DDR_drive = 1'b0;
            
            // i_freeNext_DCache = 1'b0;
            // #200;
            // i_freeNext_DCache = 1'b1;
            // #3;
            // i_freeNext_DCache = 1'b0;
            
            
            // count = count +1'b1;    // д����
          
            // i_writeBack_Addr_from_DCache_34 = 34'h000700_111;
            // i_miss_Addr_from_DCache_34 = 34'h000800_111;
            // i_L1Cache_writeBackLine_32B = 256'hc60ba136e8ff7b44e0bb117ecc8461f3d1b92d11aa7521ad406fd270d8219f7f;
            // i_DDR_refillLine_32B = 256'h3ca488308d7b8947257b2abf7def0d0282b3f4aa32b1bfbf38890bf67c178b06;
            
            // i_DCache_writeBack_drive = 1'b0;
            // i_DDR_drive = 1'b0;
            // i_freeNext_DDR_miss = 1'b0;
            
            // #3;
            // i_DCache_writeBack_drive = 1'b1;
            // #3;
            // i_DCache_writeBack_drive = 1'b0;
            
            // #200;
            // i_freeNext_DDR_miss = 1'b1;
            // i_DDR_drive = 1'b1;
            // #3;
            // i_freeNext_DDR_miss = 1'b0;
            // i_DDR_drive = 1'b0;
            
            // #100;
            
            // i_freeNext_DDR_miss = 1'b1;
            // #3;
            // i_freeNext_DDR_miss = 1'b0;
            
            // #3;
            // i_DDR_drive = 1'b1;
            // #3;
            // i_DDR_drive = 1'b0;
            
            // i_freeNext_DCache = 1'b0;
            // #200;
            // i_freeNext_DCache = 1'b1;
            // #3;
            // i_freeNext_DCache = 1'b0;




            //             // ����д�ز���1 ��Ҫд��
            // count = count +1'b1;    
          
            // i_writeBack_Addr_from_DCache_34 = 34'h000100_111;
            // i_miss_Addr_from_DCache_34 = 34'h000100_111;
            // i_L1Cache_writeBackLine_32B = 256'h9fb903a3855e72f0c69cca93fb8ac6ae121d895d0baf02756f8776d1479493fd;

            // i_freeNext_DCache = 1'b0;
            
            // i_DCache_writeBack_drive = 1'b0;
            // i_DDR_drive = 1'b0;
            // i_freeNext_DDR_writeBack = 1'b0;
            
            // #3;
            // i_DCache_writeBack_drive = 1'b1;
            // #3;
            // i_DCache_writeBack_drive = 1'b0;
            
            // #200;
            // i_freeNext_DDR_writeBack = 1'b1;
            // i_DDR_drive = 1'b1;
            // #3;
            // i_freeNext_DDR_writeBack = 1'b0;
            // i_DDR_drive = 1'b0;
            
            // #100;

            // i_freeNext_DCache = 1'b1;
            // #3;
            // i_freeNext_DCache = 1'b0;
            // #10;




            //             // ����д�ز���2 ����Ҫд��
            // count = count +1'b1;    
          
            // i_writeBack_Addr_from_DCache_34 = 34'h000200_111;
            // i_miss_Addr_from_DCache_34 = 34'h000200_111;
            // i_L1Cache_writeBackLine_32B = 256'h9fb903a3855e72f0c69cca93fb8ac6ae121d895d0baf02756f8776d1479493fd;

            // i_freeNext_DCache = 1'b0;
            
            // i_DCache_writeBack_drive = 1'b0;
            // i_DDR_drive = 1'b0;
            // i_freeNext_DDR_writeBack = 1'b0;
            
            // #3;
            // i_DCache_writeBack_drive = 1'b1;
            // #3;
            // i_DCache_writeBack_drive = 1'b0;
            
            // #200;

            // i_freeNext_DCache = 1'b1;
            // #3;
            // i_freeNext_DCache = 1'b0;
            // #10;






        //    count = count +1'b1;
        //    // DCache miss test
        //    i_miss_Addr_from_DCache_34 = 34'h000100_111;
        //    i_DCache_miss_drive = 1'b0;
        //    #3;
        //    i_DCache_miss_drive = 1'b1;
        //    #3;
        //    i_DCache_miss_drive = 1'b0;
            
        //    i_freeNext_DCache = 1'b0;
        //    #200;
        //    i_freeNext_DCache = 1'b1;
        //    #3;
        //    i_freeNext_DCache = 1'b0;
            
            
            
            // count = count +1'b1;
            // // ICache miss test
            // i_miss_Addr_from_ICache_34 = 34'h000200_111;
            // i_ICache_miss_drive = 1'b0;
            // #3;
            // i_ICache_miss_drive = 1'b1;
            // #3;
            // i_ICache_miss_drive = 1'b0;
            
            // i_freeNext_ICache = 1'b0;
            // #200;
            // i_freeNext_ICache = 1'b1;
            // #3;
            // i_freeNext_ICache = 1'b0;
            // #100;
            
        //     count = count +1'b1;
        //     // DCache miss test
        //     i_miss_Addr_from_DCache_34 = 34'h000400_111;
        //     i_DCache_miss_drive = 1'b0;
        //     #3;
        //     i_DCache_miss_drive = 1'b1;
        //     #3;
        //     i_DCache_miss_drive = 1'b0;
            
        //     i_freeNext_DCache = 1'b0;
        //     #200;
        //     i_freeNext_DCache = 1'b1;
        //     #3;
        //     i_freeNext_DCache = 1'b0;
        //     #100;
            
            // count = count +1'b1;
            // // ICache miss test
            // i_miss_Addr_from_ICache_34 = 34'h000800_111;
            // i_ICache_miss_drive = 1'b0;
            // #3;
            // i_ICache_miss_drive = 1'b1;
            // #3;
            // i_ICache_miss_drive = 1'b0;
            
            // i_freeNext_ICache = 1'b0;
            // #200;
            // i_freeNext_ICache = 1'b1;
            // #3;
            // i_freeNext_ICache = 1'b0;
            // #100;
            



            // count = count +1'b1;
            // // ICache miss test
            // i_miss_Addr_from_DCache_34 = 34'h000100_111;
            // i_DCache_miss_drive = 1'b0;
            // #3;
            // i_DCache_miss_drive = 1'b1;
            // #3;
            // i_DCache_miss_drive = 1'b0;
            
            // i_freeNext_DCache = 1'b0;
            // #200;
            // i_freeNext_DCache = 1'b1;
            // #3;
            // i_freeNext_DCache = 1'b0;
            // #100;
            

            // count = count +1'b1;
            // // ICache miss test
            // i_miss_Addr_from_ICache_34 = 34'h000300_111;
            // i_ICache_miss_drive = 1'b0;
            // #3;
            // i_ICache_miss_drive = 1'b1;
            // #3;
            // i_ICache_miss_drive = 1'b0;
            
            // i_freeNext_ICache = 1'b0;
            // #200;
            // i_freeNext_ICache = 1'b1;
            // #3;
            // i_freeNext_ICache = 1'b0;
            // #100;
            
            
            // count = count +1'b1;
            // // ICache miss test
            // i_miss_Addr_from_ICache_34 = 34'h000500_111;
            // i_ICache_miss_drive = 1'b0;
            // #3;
            // i_ICache_miss_drive = 1'b1;
            // #3;
            // i_ICache_miss_drive = 1'b0;
            
            // i_freeNext_ICache = 1'b0;
            // #200;
            // i_freeNext_ICache = 1'b1;
            // #3;
            // i_freeNext_ICache = 1'b0;
            // #100;
            
            
            
            // count = count +1'b1;
            // // ICache miss test
            // i_miss_Addr_from_ICache_34 = 34'h000700_111;
            // i_ICache_miss_drive = 1'b0;
            // #3;
            // i_ICache_miss_drive = 1'b1;
            // #3;
            // i_ICache_miss_drive = 1'b0;
            
            // i_freeNext_ICache = 1'b0;
            // #200;
            // i_freeNext_ICache = 1'b1;
            // #3;
            // i_freeNext_ICache = 1'b0;
            // #100;
            
            
            
            // count = count +1'b1;
            // // ICache miss test
            // i_miss_Addr_from_ICache_34 = 34'h000200_111;
            // i_ICache_miss_drive = 1'b0;
            // #3;
            // i_ICache_miss_drive = 1'b1;
            // #3;
            // i_ICache_miss_drive = 1'b0;
            
            // i_freeNext_ICache = 1'b0;
            // #200;
            // i_freeNext_ICache = 1'b1;
            // #3;
            // i_freeNext_ICache = 1'b0;
            // #100;
            
            
            
            // count = count +1'b1;
            // // ICache miss test
            // i_miss_Addr_from_ICache_34 = 34'h000600_111;
            // i_ICache_miss_drive = 1'b0;
            // #3;
            // i_ICache_miss_drive = 1'b1;
            // #3;
            // i_ICache_miss_drive = 1'b0;
            
            // i_freeNext_ICache = 1'b0;
            // #200;
            // i_freeNext_ICache = 1'b1;
            // #3;
            // i_freeNext_ICache = 1'b0;
            // #100;
            
            
            
            // count = count +1'b1;
            // // ICache miss test
            // i_miss_Addr_from_ICache_34 = 34'h000500_111;
            // i_ICache_miss_drive = 1'b0;
            // #3;
            // i_ICache_miss_drive = 1'b1;
            // #3;
            // i_ICache_miss_drive = 1'b0;
            
            // i_freeNext_ICache = 1'b0;
            // #200;
            // i_freeNext_ICache = 1'b1;
            // #3;
            // i_freeNext_ICache = 1'b0;
            // #100;
            
            // count = count +1'b1;
            // // ICache miss test
            // i_miss_Addr_from_ICache_34 = 34'h000600_111;
            // i_ICache_miss_drive = 1'b0;
            // #3;
            // i_ICache_miss_drive = 1'b1;
            // #3;
            // i_ICache_miss_drive = 1'b0;
            
            // i_freeNext_ICache = 1'b0;
            // #200;
            // i_freeNext_ICache = 1'b1;
            // #3;
            // i_freeNext_ICache = 1'b0;
            // #100;
            
            


            // count = count +1'b1;
            // // ICache miss test  δ����
            // i_freeNext_ICache = 1'b0;
            // i_miss_Addr_from_ICache_34 = 34'h010000_111;
            // i_ICache_miss_drive = 1'b0;
            // i_freeNext_DDR_miss = 1'b0;
            // i_DDR_drive = 1'b0;
            // i_DDR_refillLine_32B = 256'h111118308d7b8947257b2abf7def0d0282b3f4aa32b1bfbf38890bf67c178b06;
            // #3;
            // i_ICache_miss_drive = 1'b1;
            // #3;
            // i_ICache_miss_drive = 1'b0;
            
            // #200;
            
            
            
            
            
            
            // i_freeNext_DDR_writeBack = 1'b1;
            // i_DDR_drive = 1'b1;
            // #3;
            // i_freeNext_DDR_writeBack = 1'b0;
            // i_DDR_drive = 1'b0;
              
            // #200;
            // i_freeNext_ICache = 1'b1;
            // #3;
            // i_freeNext_ICache = 1'b0;
            // #100;
            




//             count = count +1'b1;
//             // ICache miss test
//             i_freeNext_ICache = 1'b0;
//             i_miss_Addr_from_ICache_34 = 34'h020000_111;
//             i_ICache_miss_drive = 1'b0;
//             i_freeNext_DDR_miss = 1'b0;
//             i_DDR_drive = 1'b0;
//             i_DDR_refillLine_32B = 256'h222228308d7b8947257b2abf7def0d0282b3f4aa32b1bfbf38890bf67c178b06;
//             #3;
//             i_ICache_miss_drive = 1'b1;
//             #3;
//             i_ICache_miss_drive = 1'b0;
            
//             #200;
//             i_freeNext_DDR_writeBack = 1'b1;
//             i_DDR_drive = 1'b1;
//             #3;
//             i_freeNext_DDR_writeBack = 1'b0;
//             i_DDR_drive = 1'b0;
              
//             #200;
//             i_freeNext_ICache = 1'b1;
//             #3;
//             i_freeNext_ICache = 1'b0;
//             #100;
            
            
            
//             count = count +1'b1;
//             // ICache miss test
//             i_freeNext_ICache = 1'b0;
//             i_miss_Addr_from_ICache_34 = 34'h030000_111;
//             i_ICache_miss_drive = 1'b0;
//             i_freeNext_DDR_miss = 1'b0;
//             i_DDR_drive = 1'b0;
//             i_DDR_refillLine_32B = 256'h333338308d7b8947257b2abf7def0d0282b3f4aa32b1bfbf38890bf67c178b06;
//             #3;
//             i_ICache_miss_drive = 1'b1;
//             #3;
//             i_ICache_miss_drive = 1'b0;
            
//             #200;
//             i_freeNext_DDR_writeBack = 1'b1;
//             i_DDR_drive = 1'b1;
//             #3;
//             i_freeNext_DDR_writeBack = 1'b0;
//             i_DDR_drive = 1'b0;
              
//             #200;
//             i_freeNext_ICache = 1'b1;
//             #3;
//             i_freeNext_ICache = 1'b0;
//             #100;
            
            
//             count = count +1'b1;
//             // ICache miss test
//             i_miss_Addr_from_ICache_34 = 34'h030000_111;
//             i_ICache_miss_drive = 1'b0;
//             #3;
//             i_ICache_miss_drive = 1'b1;
//             #3;
//             i_ICache_miss_drive = 1'b0;
            
//             i_freeNext_ICache = 1'b0;
//             #200;
//             i_freeNext_ICache = 1'b1;
//             #3;
//             i_freeNext_ICache = 1'b0;
//             #100;




            
        //    count = count +1'b1;
        //    // writeBack DDR test
          
        //    i_writeBack_Addr_from_DCache_34 = 34'h000100_111;
        //    i_miss_Addr_from_DCache_34 = 34'h000800_111;
        //    i_L1Cache_writeBackLine_32B = 256'h00bcf5e00de5fd0c8d6609d8fff8e775649c41736ed45ec04ed302e8f2267da0;
        //    //i_DDR_refillLine_32B = 256'h3ca488308d7b8947257b2abf7def0d0282b3f4aa32b1bfbf38890bf67c178b06;
            
        //    i_DCache_writeBack_drive = 1'b0;
        //    i_DDR_drive = 1'b0;
        //    i_freeNext_DDR_writeBack = 1'b0;
            
        //    #3;
        //    i_DCache_writeBack_drive = 1'b1;
        //    #3;
        //    i_DCache_writeBack_drive = 1'b0;
            
        //    #200;
        //    i_freeNext_DDR_writeBack = 1'b1;
        //    i_DDR_drive = 1'b1;
        //    #3;
        //    i_freeNext_DDR_writeBack = 1'b0;
        //    i_DDR_drive = 1'b0;
            
        //    #100;
            
            
            
            
            
            
//            i_freeNext_DDR_miss = 1'b1;
//            #3;
//            i_freeNext_DDR_miss = 1'b0;
            
//            #3;
//            i_DDR_drive = 1'b1;
//            #3;
//            i_DDR_drive = 1'b0;
            
//            i_freeNext_DCache = 1'b0;
//            #200;
//            i_freeNext_DCache = 1'b1;
//            #3;
//            i_freeNext_DCache = 1'b0;
            
           
        $stop;
        
    end
endmodule

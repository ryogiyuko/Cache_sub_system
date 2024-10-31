`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/28 19:30:16
// Design Name: 
// Module Name: Dcache_tb
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


module Dcache_tb;

// Dcache Parameters
parameter PERIOD    = 5;
parameter rst_cycle  = 30;
parameter run_time  = 57;

reg [6:0] count = 0;



// Dcache Inputs
reg   rstn                                  = 1 ;
reg   i_lsu_drive                          = 0 ;
reg   i_freeNext_lsu                       = 0 ;
reg   [33:0]  i_lsu_PA_34                  = 0 ;
reg   [31:0]  i_lsu_storeData_32           = 0 ;
reg   [5:0]  i_lsu_storeIndex_6            = 0 ;
reg   i_lsu_load_or_store                  = 0 ;
reg   i_freeNext_retire_store              = 0 ;
reg   i_freeNext_retire_load               = 0 ;
reg   i_ptw_drive                          = 0 ;
reg   i_freeNext_ptw                       = 0 ;
reg   [33:0]  i_ptw_ptePA_34               = 0 ;
reg   i_L2cache_drive                      = 0 ;
reg   i_freeNext_L2cache_writeBack         = 0 ;
reg   i_freeNext_L2cache_miss              = 0 ;
reg   [255:0]  i_L2cache_refill_32B        = 0 ;

// Dcache Outputs
wire  o_lsu_free                           ;
wire  o_driveNext_lsu                      ;
wire  [5:0]  o_storeIndex_to_lsu_6         ;
wire  o_driveNext_retire_store             ;
wire  o_driveNext_retire_load              ;
wire  [31:0]  o_loadData_to_retire_32      ;
wire  o_ptw_free                           ;
wire  o_driveNext_ptw                      ;
wire  [31:0]  o_pte_32                     ;
wire  o_L2cache_free                       ;
wire  o_driveNext_L2cache_writeBack        ;
wire  o_driveNext_L2cache_miss             ;
wire  [33:0]  o_miss_addr_34               ;
wire  [33:0]  o_writeBack_addr_34          ;
wire  [255:0]  o_writeBack_32B             ;
wire  [5:0]  o_r_case_number_6             ;
wire  [11:0]  o_dcache_offset_12           ;
wire  [2:0]  o_plru_evictWay_3             ;
wire  [2:0]  o_r_hit_way_3                 ;
wire  [33:0]  o_dcache_PA_34               ;
wire  [33:0]  o_r_writeBack_addr_34        ;
wire  o_r_hit                              ;
wire  o_r_dirty                            ;


initial
begin
    #5; rstn = 0;
    #(PERIOD*rst_cycle-5);

end

initial 
begin
    $sdf_annotate("/team/users/zhao.kangli/2024-superscalarProcessor/DC/DC_zjy/DC_Dcache/output/Dcache.sdf",u_Dcache); 
end

integer i;

initial
begin
    for (i = 0;i < 32 ;i=i+1 ) begin
        //sram0
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;
    
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;
        
        //sram1
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;
    
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_Dcache.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_Dcache.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte0[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte1[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte2[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte3[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte4[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte5[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte6[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte7[i][10:0] = 0;
        
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte0[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte1[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte2[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte3[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte4[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte5[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte6[i][10:0] = 0;
        u_Dcache.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte7[i][10:0] = 0;
    end

end

Dcache  u_Dcache (
    .rstn                            ( rstn                                    ),
    .i_lsu_drive                    ( i_lsu_drive                            ),
    .i_freeNext_lsu                 ( i_freeNext_lsu                         ),
    .i_lsu_PA_34                    ( i_lsu_PA_34                    [33:0]  ),
    .i_lsu_storeData_32             ( i_lsu_storeData_32             [31:0]  ),
    .i_lsu_storeIndex_6             ( i_lsu_storeIndex_6             [5:0]   ),
    .i_lsu_load_or_store            ( i_lsu_load_or_store                    ),
    .i_freeNext_retire_store        ( i_freeNext_retire_store                ),
    .i_freeNext_retire_load         ( i_freeNext_retire_load                 ),
    .i_ptw_drive                    ( i_ptw_drive                            ),
    .i_freeNext_ptw                 ( i_freeNext_ptw                         ),
    .i_ptw_ptePA_34                 ( i_ptw_ptePA_34                 [33:0]  ),
    .i_L2cache_drive                ( i_L2cache_drive                        ),
    .i_freeNext_L2cache_writeBack   ( i_freeNext_L2cache_writeBack           ),
    .i_freeNext_L2cache_miss        ( i_freeNext_L2cache_miss                ),
    .i_L2cache_refill_32B           ( i_L2cache_refill_32B           [255:0] ),

    .o_lsu_free                     ( o_lsu_free                             ),
    .o_driveNext_lsu                ( o_driveNext_lsu                        ),
    .o_storeIndex_to_lsu_6          ( o_storeIndex_to_lsu_6          [5:0]   ),
    .o_driveNext_retire_store       ( o_driveNext_retire_store               ),
    .o_driveNext_retire_load        ( o_driveNext_retire_load                ),
    .o_loadData_to_retire_32        ( o_loadData_to_retire_32        [31:0]  ),
    .o_ptw_free                     ( o_ptw_free                             ),
    .o_driveNext_ptw                ( o_driveNext_ptw                        ),
    .o_pte_32                       ( o_pte_32                       [31:0]  ),
    .o_L2cache_free                 ( o_L2cache_free                         ),
    .o_driveNext_L2cache_writeBack  ( o_driveNext_L2cache_writeBack          ),
    .o_driveNext_L2cache_miss       ( o_driveNext_L2cache_miss               ),
    .o_miss_addr_34                 ( o_miss_addr_34                 [33:0]  ),
    .o_writeBack_addr_34            ( o_writeBack_addr_34            [33:0]  ),
    .o_writeBack_32B                ( o_writeBack_32B                [255:0] ),
    .o_r_case_number_6              ( o_r_case_number_6              [5:0]   ),
    .o_dcache_offset_12             ( o_dcache_offset_12             [11:0]  ),
    .o_plru_evictWay_3              ( o_plru_evictWay_3              [2:0]   ),
    .o_r_hit_way_3                  ( o_r_hit_way_3                  [2:0]   ),
    .o_dcache_PA_34                 ( o_dcache_PA_34                 [33:0]  ),
    .o_r_writeBack_addr_34          ( o_r_writeBack_addr_34          [33:0]  ),
    .o_r_hit                        ( o_r_hit                                ),
    .o_r_dirty                      ( o_r_dirty                              )
);


// rstn                                  = 1 ;
// i_lsu_drive                          = 0 ;
// i_freeNext_lsu                       = 0 ;
// i_lsu_PA_34                  = 0 ;
// i_lsu_storeData_32           = 0 ;
// i_lsu_storeIndex_6            = 0 ;
// i_lsu_load_or_store                  = 0 ;
// i_freeNext_retire_store              = 0 ;
// i_freeNext_retire_load               = 0 ;
// i_Dtlb_drive                         = 0 ;
// i_ptw_drive                          = 0 ;
// i_freeNext_ptw                       = 0 ;
// i_Dtlb_PA_ppn_22             = 0 ;
// i_ptw_ptePA_34               = 0 ;
// i_L2cache_drive                      = 0 ;
// i_freeNext_L2cache                   = 0 ;
// i_L2cache_refill_32B        = 0 ;

initial
begin
    #(PERIOD*rst_cycle) rstn  =  1;
    #20;

//һ��dcache bank��32���� ��ַ 11:7 �������ĸ���

//case1 
    count = count +1'b1;
    //��ȱʧ(��д��)      �������L2����ȱʧ�źţ�r_miss_or_writeBack = 0 Ϊȱʧ     
    
    i_lsu_PA_34 = 34'h298756_abc;  //1010011000011101010110_10101_01_11100   [33:12]��� [11:7]��� [6:5]ѡbank [4:0]����
    i_lsu_load_or_store = 1;   //load
    i_lsu_storeIndex_6       = 6'b101000;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;

	#(PERIOD/2.0)		i_freeNext_L2cache_miss =  1'b1;
    #(PERIOD/2.0)       i_freeNext_L2cache_miss =  1'b0;
    #(PERIOD);

    //L2����   ��������Ļ�����λ������� o_driveNext_retire_load  o_loadData_to_retire_32 = fea5bf5c��i_lsu_PA_34[4:2]λ������
    
    i_L2cache_refill_32B = 256'hfea5bf5c_4ee8c293_ead6fe72_6109b4f8_6d1c1c1b_60d277f3_8f227c1d_5e91b527; //64λ16����

    #(PERIOD/2.0) i_L2cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2cache_drive = 1'b0;

    #run_time;//һ�λ���
    #run_time;//���λ���

    #(PERIOD/2.0)		i_freeNext_retire_load		=		1'b1;
    #(PERIOD/2.0)       i_freeNext_retire_load      =       1'b0;
    #(PERIOD);

//case2  ��ҳ��ȱʧ������L2 
    count = count +1'b1;

    i_ptw_ptePA_34 = 34'h256789_efc; //1001010110011110001001_11101_11_11100

    #(PERIOD/2.0) i_ptw_drive = 1'b1;
    #(PERIOD/2.0) i_ptw_drive = 1'b0;

    #run_time;

	#(PERIOD/2.0)	i_freeNext_L2cache_miss	 =  1'b1;
    #(PERIOD/2.0)   i_freeNext_L2cache_miss   =  1'b0;
    #(PERIOD);
    
    //L2����    �������ҳ���Ļ�����λ������� o_driveNext_ptw o_pte_32 = 1c7e7580

    i_L2cache_refill_32B = 256'h1c7e7580_0d3abd0c_c0a08d74_0dc16ff0_c1d55647_421fdea6_47b6810a_637f1a83; //64λ16����
    
    #(PERIOD/2.0) i_L2cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2cache_drive = 1'b0;

    #run_time;//һ�λ���
    #run_time;//���λ���

    #(PERIOD/2.0)		i_freeNext_ptw		=		1'b1;
    #(PERIOD/2.0)       i_freeNext_ptw      =       1'b0;
    #(PERIOD);
    
//case3 ������
    count = count +1'b1;

    i_lsu_PA_34 = 34'h298756_abc; //1010011000011101010110_10101_01_11100
    i_lsu_load_or_store = 1;   //load
    i_lsu_storeIndex_6       = 6'b101000;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;
    #6;

	#(PERIOD/2.0)		i_freeNext_retire_load =  1'b1;
    #(PERIOD/2.0)       i_freeNext_retire_load =  1'b0;
    #(PERIOD);
    
//case4 ��ҳ������
    count = count +1'b1;

    i_ptw_ptePA_34 = 34'h256789_efc; //1001010110011110001001_11101_11_11100

    #(PERIOD/2.0) i_ptw_drive = 1'b1;
    #(PERIOD/2.0) i_ptw_drive = 1'b0;

    #run_time;

	#(PERIOD/2.0)	i_freeNext_ptw	 =  1'b1;
    #(PERIOD/2.0)   i_freeNext_ptw   =  1'b0;
    #(PERIOD);

//case5 д����
    count = count +1'b1;

    i_lsu_PA_34 = 34'h298756_abc;  //1010011000011101010110_10101_01_11100
    i_lsu_load_or_store = 0;   //store
    i_lsu_storeIndex_6       = 6'h2E;
    i_lsu_storeData_32 = 32'h47b6810a;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;//����
    #run_time;//д

	#(PERIOD/2.0)		i_freeNext_lsu =  1'b1;
    #(PERIOD/2.0)       i_freeNext_lsu =  1'b0;
    #(PERIOD);

// case6 ������ ��֤case5д
    count = count +1'b1;

    i_lsu_PA_34 = 34'h298756_abc; //1010011000011101010110_10101_01_11100
    i_lsu_load_or_store = 1;   //load
    i_lsu_storeIndex_6       = 6'b101000;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;
    #10;

	#(PERIOD/2.0)		i_freeNext_retire_load =  1'b1;
    #(PERIOD/2.0)       i_freeNext_retire_load =  1'b0;
    #(PERIOD);

//case 7 дȱʧ + ����plru0
    // 256'h2c4d24af_dab8a58d_e4723be3_680216da_3e745f72_86c908fa_db1e3009_510b3236
    // 256'h84dc4355_5970318c_acab6104_b65fdd37_a9d39843_a13c91e4_7dbe7e2a_f4496680
    // 256'h2b89718a_c3ce4c8c_77ac0274_80ae157e_06d55e58_881486d9_cb6b353c_dea3791c
    // 256'h7e1bcc6e_c0236e43_3d4ac21a_5ed12a33_39177964_d4f17ee7_22060117_d5e43b21
    // 256'h7c2237a9_359e1ab9_2660b691_513fcccf_f44c4fe2_332c8cb3_b611efeb_637d2056
    // 256'h3d73262a_2ffc9e9f_d552e991_8e1cdabc_7cc0440d_6ee1310d_16ee0b1f_fa547f2b
    // 256'ha65b0664_3b22aec7_cda136f7_08c3eb8c_bdc34e00_c3430ffe_adac6a5e_bfd20642
    // 256'hd1f9598b_77d84657_ce7377dc_43952290_b4ec9ff1_a4898e0c_0e034858_0b588997
    
    count = count +1'b1;
    
    //[33:12]��� [11:7]��� [6:5]ѡbank [4:0]����  ���һ���ñ䣬��Ų��ܱ䣬ѡbank����������
    i_lsu_PA_34 = 34'h26c756_8a8; //1001101100011101010110_10001_01_01000 
    i_lsu_load_or_store = 0;   //store
    i_lsu_storeIndex_6       = 6'h20;
    i_lsu_storeData_32 = 32'h637f1a83;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;

	#(PERIOD/2.0)		i_freeNext_L2cache_miss =  1'b1;
    #(PERIOD/2.0)       i_freeNext_L2cache_miss =  1'b0;
    #(PERIOD);

    //L2���� 
    
    i_L2cache_refill_32B = 256'h2c4d24af_dab8a58d_e4723be3_680216da_3e745f72_86c908fa_db1e3009_510b3236;

    #(PERIOD/2.0) i_L2cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2cache_drive = 1'b0;

    #run_time;//һ�λ���
    #run_time;//���λ���
    #run_time;//�����д

    #(PERIOD/2.0)		i_freeNext_lsu		=		1'b1;
    #(PERIOD/2.0)       i_freeNext_lsu      =       1'b0;
    #(PERIOD);

//case 8 дȱʧ + ����plru1
    count = count +1'b1;

    i_lsu_PA_34 = 34'h26c766_8a8; //1001101100011101100110_10001_01_01000
    i_lsu_load_or_store = 0;   //store
    i_lsu_storeIndex_6       = 6'h20;
    i_lsu_storeData_32 = 32'h637f1a83;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;

	#(PERIOD/2.0)		i_freeNext_L2cache_miss =  1'b1;
    #(PERIOD/2.0)       i_freeNext_L2cache_miss =  1'b0;
    #(PERIOD);

    //L2���� 
    
    i_L2cache_refill_32B = 256'h2b89718a_c3ce4c8c_77ac0274_80ae157e_06d55e58_881486d9_cb6b353c_dea3791c;

    #(PERIOD/2.0) i_L2cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2cache_drive = 1'b0;

    #run_time;//һ�λ���
    #run_time;//���λ���
    #run_time;//�����д

    #(PERIOD/2.0)		i_freeNext_lsu		=		1'b1;
    #(PERIOD/2.0)       i_freeNext_lsu      =       1'b0;
    #(PERIOD);

//case 9 ��ȱʧ + ����plru2
    count = count +1'b1;
    //��ȱʧ(��д��)      �������L2����ȱʧ�źţ�r_miss_or_writeBack = 0 Ϊȱʧ     
    
    i_lsu_PA_34 = 34'h27c766_8ac;  //1001111100011101100110_10001_01_01100
    i_lsu_load_or_store = 1;   //load
    i_lsu_storeIndex_6       = 6'b101000;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;

	#(PERIOD/2.0)		i_freeNext_L2cache_miss =  1'b1;
    #(PERIOD/2.0)       i_freeNext_L2cache_miss =  1'b0;
    #(PERIOD);

    //L2����   ��������Ļ�����λ������� o_driveNext_retire_load  o_loadData_to_retire_32 = fea5bf5c��i_lsu_PA_34[4:2]λ������
    
    i_L2cache_refill_32B = 256'h7e1bcc6e_c0236e43_3d4ac21a_5ed12a33_39177964_d4f17ee7_22060117_d5e43b21;

    #(PERIOD/2.0) i_L2cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2cache_drive = 1'b0;

    #run_time;//һ�λ���
    #run_time;//���λ���

    #(PERIOD/2.0)		i_freeNext_retire_load		=		1'b1;
    #(PERIOD/2.0)       i_freeNext_retire_load      =       1'b0;
    #(PERIOD);

//case 10 ��ȱʧ + ����plru3
    count = count +1'b1;
    //��ȱʧ(��д��)      �������L2����ȱʧ�źţ�r_miss_or_writeBack = 0 Ϊȱʧ     
    
    i_lsu_PA_34 = 34'h28c756_8b0; //1010001100011101010110_10001_01_10000
    i_lsu_load_or_store = 1;   //load
    i_lsu_storeIndex_6       = 6'b101000;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;

	#(PERIOD/2.0)		i_freeNext_L2cache_miss =  1'b1;
    #(PERIOD/2.0)       i_freeNext_L2cache_miss =  1'b0;
    #(PERIOD);

    //L2����   ��������Ļ�����λ������� o_driveNext_retire_load  o_loadData_to_retire_32 = fea5bf5c��i_lsu_PA_34[4:2]λ������
    
    i_L2cache_refill_32B = 256'h7c2237a9_359e1ab9_2660b691_513fcccf_f44c4fe2_332c8cb3_b611efeb_637d2056;

    #(PERIOD/2.0) i_L2cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2cache_drive = 1'b0;

    #run_time;//һ�λ���
    #run_time;//���λ���

    #(PERIOD/2.0)		i_freeNext_retire_load		=		1'b1;
    #(PERIOD/2.0)       i_freeNext_retire_load      =       1'b0;
    #(PERIOD);

//case 11 ��ȱʧ + ����plru4
    count = count +1'b1;
    //��ȱʧ(��д��)      �������L2����ȱʧ�źţ�r_miss_or_writeBack = 0 Ϊȱʧ     
    
    i_lsu_PA_34 = 34'h26d756_8a8; //1001101101011101100110_10001_01_01000
    i_lsu_load_or_store = 1;   //load
    i_lsu_storeIndex_6       = 6'b101000;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;

	#(PERIOD/2.0)		i_freeNext_L2cache_miss =  1'b1;
    #(PERIOD/2.0)       i_freeNext_L2cache_miss =  1'b0;
    #(PERIOD);

    //L2����   ��������Ļ�����λ������� o_driveNext_retire_load  o_loadData_to_retire_32 = fea5bf5c��i_lsu_PA_34[4:2]λ������
    
    i_L2cache_refill_32B = 256'h3d73262a_2ffc9e9f_d552e991_8e1cdabc_7cc0440d_6ee1310d_16ee0b1f_fa547f2b;

    #(PERIOD/2.0) i_L2cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2cache_drive = 1'b0;

    #run_time;//һ�λ���
    #run_time;//���λ���

    #(PERIOD/2.0)		i_freeNext_retire_load		=		1'b1;
    #(PERIOD/2.0)       i_freeNext_retire_load      =       1'b0;
    #(PERIOD);

//case 12 дȱʧ + ����plru5
    count = count +1'b1;

    i_lsu_PA_34 = 34'h26e756_8b8; //1001101110011101100110_10001_01_11000
    i_lsu_load_or_store = 0;   //store
    i_lsu_storeIndex_6       = 6'h20;
    i_lsu_storeData_32 = 32'h637f1a83;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;

	#(PERIOD/2.0)		i_freeNext_L2cache_miss =  1'b1;
    #(PERIOD/2.0)       i_freeNext_L2cache_miss =  1'b0;
    #(PERIOD);

    //L2���� 
    
    i_L2cache_refill_32B = 256'ha65b0664_3b22aec7_cda136f7_08c3eb8c_bdc34e00_c3430ffe_adac6a5e_bfd20642;

    #(PERIOD/2.0) i_L2cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2cache_drive = 1'b0;

    #run_time;//һ�λ���
    #run_time;//���λ���
    #run_time;//�����д

    #(PERIOD/2.0)		i_freeNext_lsu		=		1'b1;
    #(PERIOD/2.0)       i_freeNext_lsu      =       1'b0;
    #(PERIOD);

//case 13 ��ȱʧ + ����plru6
    count = count +1'b1;
    //��ȱʧ(��д��)      �������L2����ȱʧ�źţ�r_miss_or_writeBack = 0 Ϊȱʧ     
    
    i_lsu_PA_34 = 34'h26f756_8a8; //1001101111011101100110_10001_01_01000
    i_lsu_load_or_store = 1;   //load
    i_lsu_storeIndex_6       = 6'b101000;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;

	#(PERIOD/2.0)		i_freeNext_L2cache_miss =  1'b1;
    #(PERIOD/2.0)       i_freeNext_L2cache_miss =  1'b0;
    #(PERIOD);

    //L2����   ��������Ļ�����λ������� o_driveNext_retire_load  o_loadData_to_retire_32 = fea5bf5c��i_lsu_PA_34[4:2]λ������
    
    i_L2cache_refill_32B = 256'hd1f9598b_77d84657_ce7377dc_43952290_b4ec9ff1_a4898e0c_0e034858_0b588997;

    #(PERIOD/2.0) i_L2cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2cache_drive = 1'b0;

    #run_time;//һ�λ���
    #run_time;//���λ���

    #(PERIOD/2.0)		i_freeNext_retire_load		=		1'b1;
    #(PERIOD/2.0)       i_freeNext_retire_load      =       1'b0;
    #(PERIOD);

//case 14 дȱʧ + ����plru7
    count = count +1'b1;

    i_lsu_PA_34 = 34'h26f769_8a8; //1001101111011101101001_10001_01_01000
    i_lsu_load_or_store = 0;   //store
    i_lsu_storeIndex_6       = 6'h20;
    i_lsu_storeData_32 = 32'h637f1a83;

    #(PERIOD/2.0) i_lsu_drive = 1'b1;
    #(PERIOD/2.0) i_lsu_drive = 1'b0;

    #run_time;

	#(PERIOD/2.0)		i_freeNext_L2cache_miss =  1'b1;
    #(PERIOD/2.0)       i_freeNext_L2cache_miss =  1'b0;
    #(PERIOD);

    //L2���� 
    
    i_L2cache_refill_32B = 256'h2b89718a_c3ce4c8c_77ac0274_80ae157e_06d55e58_881486d9_cb6b353c_dea3791c;

    #(PERIOD/2.0) i_L2cache_drive = 1'b1;
    #(PERIOD/2.0) i_L2cache_drive = 1'b0;

    #run_time;//һ�λ���
    #run_time;//���λ���
    #run_time;//�����д

    #(PERIOD/2.0)		i_freeNext_lsu		=		1'b1;
    #(PERIOD/2.0)       i_freeNext_lsu      =       1'b0;
    #(PERIOD);

//case 15 lsu �� ptw ͬʱ���¼� 
    count = count +1'b1;

    i_lsu_PA_34 = 34'h26e756_8b8; //1001101110011101100110_10001_01_11000
    i_lsu_load_or_store = 1;   //load
    i_lsu_storeIndex_6       = 6'h20;
    i_lsu_storeData_32 = 32'h637f1a83;

    i_ptw_ptePA_34 = 34'h26f756_8a8;

    #(PERIOD/2.0);
    i_lsu_drive = 1'b1;
    i_ptw_drive = 1;
    
    #(PERIOD/2.0); 
    i_lsu_drive = 1'b0;
    i_ptw_drive = 0;

    #run_time;

	#(PERIOD/2.0)		i_freeNext_retire_load =  1'b1;
    #(PERIOD/2.0)       i_freeNext_retire_load =  1'b0;
    
    #run_time;

    #(PERIOD/2.0)		i_freeNext_ptw =  1'b1;
    #(PERIOD/2.0)       i_freeNext_ptw =  1'b0;
    
    


    $stop;
end

endmodule


module CacheTop_tb;

// CacheTop Parameters
parameter PERIOD    = 30;
parameter rst_cycle  = 50;
parameter run_time  = 65;
parameter wait_arb = 60;

reg [6:0] count = 0;


// CacheTop Inputs
reg   rstn                                 = 1 ;
reg   init_sign                            = 0 ;
reg   init_clk                             = 0 ;
reg   init_wea                             = 0 ;
reg   [33:0]  init_PA_34                   = 0 ;
reg   [255:0]  init_datain_256             = 0 ;
reg   i_lsu_drive0_cache                   = 0 ;
reg   i_lsu_drive1_cache                   = 0 ;
reg   i_lsu_drive2_cache                   = 0 ;
reg   i_lsu_drive3_cache                   = 0 ;
reg   i_freeNext0_lsu                      = 0 ;
reg   i_freeNext1_lsu                      = 0 ;
reg   i_freeNext2_lsu                      = 0 ;
reg   i_freeNext3_lsu                      = 0 ;
reg   [33:0]  i_lsu_PA0_34                 = 0 ;
reg   [33:0]  i_lsu_PA1_34                 = 0 ;
reg   [33:0]  i_lsu_PA2_34                 = 0 ;
reg   [33:0]  i_lsu_PA3_34                 = 0 ;
reg   [31:0]  i_lsu_storeData0_32          = 0 ;
reg   [31:0]  i_lsu_storeData1_32          = 0 ;
reg   [31:0]  i_lsu_storeData2_32          = 0 ;
reg   [31:0]  i_lsu_storeData3_32          = 0 ;
reg   [3:0]  i_store0_Type_4               = 0 ;
reg   [3:0]  i_store1_Type_4               = 0 ;
reg   [3:0]  i_store2_Type_4               = 0 ;
reg   [3:0]  i_store3_Type_4               = 0 ;
reg   i_loadType0                          = 0 ;
reg   i_loadType1                          = 0 ;
reg   i_loadType2                          = 0 ;
reg   i_loadType3                          = 0 ;
reg   [2:0]  i_store_bypass0_3             = 0 ;
reg   [2:0]  i_store_bypass1_3             = 0 ;
reg   [2:0]  i_store_bypass2_3             = 0 ;
reg   [2:0]  i_store_bypass3_3             = 0 ;
reg   [4:0]  i_lsu_rd0_5                   = 0 ;
reg   [4:0]  i_lsu_rd1_5                   = 0 ;
reg   [4:0]  i_lsu_rd2_5                   = 0 ;
reg   [4:0]  i_lsu_rd3_5                   = 0 ;
reg   [5:0]  i_lsu_index0_6                = 0 ;
reg   [5:0]  i_lsu_index1_6                = 0 ;
reg   [5:0]  i_lsu_index2_6                = 0 ;
reg   [5:0]  i_lsu_index3_6                = 0 ;
reg   [9:0]  i_lsu_flag0_10                = 0 ;
reg   [9:0]  i_lsu_flag1_10                = 0 ;
reg   [9:0]  i_lsu_flag2_10                = 0 ;
reg   [9:0]  i_lsu_flag3_10                = 0 ;
reg   i_lsu_bypass0                        = 0 ;
reg   i_lsu_bypass1                        = 0 ;
reg   i_lsu_bypass2                        = 0 ;
reg   i_lsu_bypass3                        = 0 ;
reg   i_ptw0_drive                         = 0 ;
reg   i_ptw1_drive                         = 0 ;
reg   i_ptw2_drive                         = 0 ;
reg   i_ptw3_drive                         = 0 ;
reg   i_freeNext_ptw                       = 0 ;
reg   [33:0]  i_ptw_ptePA_34               = 0 ;
reg   i_ifu_drive0                         = 0 ;
reg   i_ifu_drive1                         = 0 ;
reg   i_ifu_drive2                         = 0 ;
reg   i_ifu_drive3                         = 0 ;
reg   i_freeNext0_ifu                      = 0 ;
reg   i_freeNext1_ifu                      = 0 ;
reg   i_freeNext2_ifu                      = 0 ;
reg   i_freeNext3_ifu                      = 0 ;
reg   [33:0]  i_ifu_PA0_34                 = 0 ;
reg   [33:0]  i_ifu_PA1_34                 = 0 ;
reg   [33:0]  i_ifu_PA2_34                 = 0 ;
reg   [33:0]  i_ifu_PA3_34                 = 0 ;
reg   i_freeNext0_lsu_load                 = 0 ;
reg   i_freeNext1_lsu_load                 = 0 ;
reg   i_freeNext2_lsu_load                 = 0 ;
reg   i_freeNext3_lsu_load                 = 0 ;
reg   i_DDR_drive_cache                    = 0 ;
reg   i_read_freeNext_DDR                  = 0 ;
reg   i_write_freeNext_DDR                 = 0 ;
reg   [255:0]  i_DDR_refill_data_256       = 0 ;

// CacheTop Outputs
wire  o_lsu_free0_cache                    ;
wire  o_lsu_free1_cache                    ;
wire  o_lsu_free2_cache                    ;
wire  o_lsu_free3_cache                    ;
wire  o_driveNext0_lsu                     ;
wire  o_driveNext1_lsu                     ;
wire  o_driveNext2_lsu                     ;
wire  o_driveNext3_lsu                     ;
wire  o_loadType0                          ;
wire  o_loadType1                          ;
wire  o_loadType2                          ;
wire  o_loadType3                          ;
wire  [2:0]  o_store_bypass0_3             ;
wire  [2:0]  o_store_bypass1_3             ;
wire  [2:0]  o_store_bypass2_3             ;
wire  [2:0]  o_store_bypass3_3             ;
wire  [4:0]  o_lsu_rd0_5                   ;
wire  [4:0]  o_lsu_rd1_5                   ;
wire  [4:0]  o_lsu_rd2_5                   ;
wire  [4:0]  o_lsu_rd3_5                   ;
wire  [5:0]  o_lsu_index0_6                ;
wire  [5:0]  o_lsu_index1_6                ;
wire  [5:0]  o_lsu_index2_6                ;
wire  [5:0]  o_lsu_index3_6                ;
wire  [9:0]  o_lsu_flag0_10                ;
wire  [9:0]  o_lsu_flag1_10                ;
wire  [9:0]  o_lsu_flag2_10                ;
wire  [9:0]  o_lsu_flag3_10                ;
wire  o_lsu_bypass0                        ;
wire  o_lsu_bypass1                        ;
wire  o_lsu_bypass2                        ;
wire  o_lsu_bypass3                        ;
wire  o_ptw0_free                          ;
wire  o_ptw1_free                          ;
wire  o_ptw2_free                          ;
wire  o_ptw3_free                          ;
wire  o_driveNext_ptw                      ;
wire  [31:0]  o_pte_32                     ;
wire  o_ifu_free0                          ;
wire  o_ifu_free1                          ;
wire  o_ifu_free2                          ;
wire  o_ifu_free3                          ;
wire  o_driveNext0_ifu                     ;
wire  o_driveNext1_ifu                     ;
wire  o_driveNext2_ifu                     ;
wire  o_driveNext3_ifu                     ;
wire  [255:0]  o_instr0_to_ifu_256         ;
wire  [255:0]  o_instr1_to_ifu_256         ;
wire  [255:0]  o_instr2_to_ifu_256         ;
wire  [255:0]  o_instr3_to_ifu_256         ;
wire  o_driveNext0_lsu_load                ;
wire  o_driveNext1_lsu_load                ;
wire  o_driveNext2_lsu_load                ;
wire  o_driveNext3_lsu_load                ;
wire  [37:0]  o_loadData0_to_lsu_38        ;
wire  [37:0]  o_loadData1_to_lsu_38        ;
wire  [37:0]  o_loadData2_to_lsu_38        ;
wire  [37:0]  o_loadData3_to_lsu_38        ;
wire  o_DDR_free_cache                     ;
wire  o_read_driveNext_DDR                 ;
wire  o_write_driveNext_DDR                ;
wire  [33:0]  o_read_addr_to_DDR_34        ;
wire  [33:0]  o_write_addr_to_DDR_34       ;
wire  [255:0]  o_write_data_to_DDR_256     ;


initial 
begin
    $sdf_annotate("/team/users/zhao.kangli/2024-superscalarProcessor/DC/DC_zjy/DC_cacheTOP_db/output/CacheTop.sdf",u_CacheTop); 
end

integer i,j,k,t;
initial begin
    //Icache & L2cache SRAM
    for (i = 0;i < 128 ;i=i+1 ) begin
    //Icache
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte0[i][6:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte1[i][6:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte2[i][6:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte3[i][6:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte4[i][6:0] = 0;
        u_CacheTop.u_Icache_bank0.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte5[i][6:0] = 0;

        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte0[i][6:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte1[i][6:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte2[i][6:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte3[i][6:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte4[i][6:0] = 0;
        u_CacheTop.u_Icache_bank1.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte5[i][6:0] = 0;

        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte0[i][6:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte1[i][6:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte2[i][6:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte3[i][6:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte4[i][6:0] = 0;
        u_CacheTop.u_Icache_bank2.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte5[i][6:0] = 0;

        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_data_3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0] = 0;

        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte0[i][6:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte1[i][6:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte2[i][6:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte3[i][6:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte4[i][6:0] = 0;
        u_CacheTop.u_Icache_bank3.u_Icache_SRAM_bank.u_Icache_tag_SYKB110_128X7X6CM4.Memory_byte5[i][6:0] = 0;

    //L2 other
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_plruSRAM.u_L2plru_SYKB110_128X7X1CM4.Memory[i][6:0] = 0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte0[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte1[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte2[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte3[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte4[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte5[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte6[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte7[i][1:0] = 0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_plruSRAM.u_L2plru_SYKB110_128X7X1CM4.Memory[i][6:0] = 0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte0[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte1[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte2[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte3[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte4[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte5[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte6[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte7[i][1:0] = 0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_plruSRAM.u_L2plru_SYKB110_128X7X1CM4.Memory[i][6:0] = 0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte0[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte1[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte2[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte3[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte4[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte5[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte6[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte7[i][1:0] = 0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_plruSRAM.u_L2plru_SYKB110_128X7X1CM4.Memory[i][6:0] = 0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte0[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte1[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte2[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte3[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte4[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte5[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte6[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte7[i][1:0] = 0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_plruSRAM.u_L2plru_SYKB110_128X7X1CM4.Memory[i][6:0] = 0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte0[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte1[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte2[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte3[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte4[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte5[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte6[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte7[i][1:0] = 0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_plruSRAM.u_L2plru_SYKB110_128X7X1CM4.Memory[i][6:0] = 0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte0[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte1[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte2[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte3[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte4[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte5[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte6[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte7[i][1:0] = 0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_plruSRAM.u_L2plru_SYKB110_128X7X1CM4.Memory[i][6:0] = 0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte0[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte1[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte2[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte3[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte4[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte5[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte6[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte7[i][1:0] = 0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_tagSRAM.u_L2tag0_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte0[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte1[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte2[i][18:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_tagSRAM.u_L2tag1_SYKB110_128X19X4CM2.Memory_byte3[i][18:0] = 0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_plruSRAM.u_L2plru_SYKB110_128X7X1CM4.Memory[i][6:0] = 0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte0[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte1[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte2[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte3[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte4[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte5[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte6[i][1:0] = 0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dvSRAM.u_L2dv_SYKB110_128X2X8CM4.Memory_byte7[i][1:0] = 0;

    //L2 data
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank7.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;
        
         u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank6.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

         u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank5.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;
        
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;
        
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank4.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank3.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;
        
         u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank2.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

         u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank1.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;
        
         u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data0_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data1_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data2_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data3_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data4_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data5_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data6_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data7_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data8_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data9_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data10_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data11_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data12_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data13_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data14_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;
        
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte0[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte1[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte2[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte3[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte4[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte5[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte6[i][15:0]  =  0;
        u_CacheTop.u_L2Cache_bank0.u_L2Cache_dataSRAM.u_L2data15_SYKB110_128X16X8CM2.Memory_byte7[i][15:0]  =  0;

    end

//Dcache SRAM
    for (j = 0;j < 32 ;j=j+1 ) begin
    //tag
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte0[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte1[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte2[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte3[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte4[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte5[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte6[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte7[j][10:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte0[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte1[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte2[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte3[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte4[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte5[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte6[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte7[j][10:0] = 0;

       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte0[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte1[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte2[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte3[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte4[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte5[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte6[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte7[j][10:0] = 0;

       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte0[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte1[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte2[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte3[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte4[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte5[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte6[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte7[j][10:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte0[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte1[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte2[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte3[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte4[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte5[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte6[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte7[j][10:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte0[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte1[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte2[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte3[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte4[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte5[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte6[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte7[j][10:0] = 0;

       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte0[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte1[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte2[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte3[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte4[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte5[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte6[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag1_SYKB110_32X11X8CM2.Memory_byte7[j][10:0] = 0;

       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte0[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte1[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte2[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte3[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte4[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte5[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte6[j][10:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_tagSRAM.u_tag0_SYKB110_32X11X8CM2.Memory_byte7[j][10:0] = 0;
       
    //data
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata0_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata1_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata2_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata3_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

              u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata4_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata5_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata6_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank0.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank1.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank2.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;


       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram1.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;

       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte0[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte1[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte2[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte3[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte4[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte5[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte6[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte7[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte8[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte9[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte10[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte11[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte12[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte13[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte14[j][8:0] = 0;
       u_CacheTop.u_Dcache_bank3.u_Dcache_bank_dataSram0.u_Ddata7_SYKB110_32X8X16CM2.Memory_byte15[j][8:0] = 0;   
    end
end

CacheTop  u_CacheTop (
    .rstn                     ( rstn                             ),
    .init_sign                ( init_sign                        ),
    .init_clk                 ( init_clk                         ),
    .init_wea                 ( init_wea                         ),
    .init_PA_34               ( init_PA_34               [33:0]  ),
    .init_datain_256          ( init_datain_256          [255:0] ),
    .i_lsu_drive0_cache       ( i_lsu_drive0_cache               ),
    .i_lsu_drive1_cache       ( i_lsu_drive1_cache               ),
    .i_lsu_drive2_cache       ( i_lsu_drive2_cache               ),
    .i_lsu_drive3_cache       ( i_lsu_drive3_cache               ),
    .i_freeNext0_lsu          ( i_freeNext0_lsu                  ),
    .i_freeNext1_lsu          ( i_freeNext1_lsu                  ),
    .i_freeNext2_lsu          ( i_freeNext2_lsu                  ),
    .i_freeNext3_lsu          ( i_freeNext3_lsu                  ),
    .i_lsu_PA0_34             ( i_lsu_PA0_34             [33:0]  ),
    .i_lsu_PA1_34             ( i_lsu_PA1_34             [33:0]  ),
    .i_lsu_PA2_34             ( i_lsu_PA2_34             [33:0]  ),
    .i_lsu_PA3_34             ( i_lsu_PA3_34             [33:0]  ),
    .i_lsu_storeData0_32      ( i_lsu_storeData0_32      [31:0]  ),
    .i_lsu_storeData1_32      ( i_lsu_storeData1_32      [31:0]  ),
    .i_lsu_storeData2_32      ( i_lsu_storeData2_32      [31:0]  ),
    .i_lsu_storeData3_32      ( i_lsu_storeData3_32      [31:0]  ),
    .i_store0_Type_4          ( i_store0_Type_4          [3:0]   ),
    .i_store1_Type_4          ( i_store1_Type_4          [3:0]   ),
    .i_store2_Type_4          ( i_store2_Type_4          [3:0]   ),
    .i_store3_Type_4          ( i_store3_Type_4          [3:0]   ),
    .i_loadType0              ( i_loadType0                      ),
    .i_loadType1              ( i_loadType1                      ),
    .i_loadType2              ( i_loadType2                      ),
    .i_loadType3              ( i_loadType3                      ),
    .i_store_bypass0_3        ( i_store_bypass0_3        [2:0]   ),
    .i_store_bypass1_3        ( i_store_bypass1_3        [2:0]   ),
    .i_store_bypass2_3        ( i_store_bypass2_3        [2:0]   ),
    .i_store_bypass3_3        ( i_store_bypass3_3        [2:0]   ),
    .i_lsu_rd0_5              ( i_lsu_rd0_5              [4:0]   ),
    .i_lsu_rd1_5              ( i_lsu_rd1_5              [4:0]   ),
    .i_lsu_rd2_5              ( i_lsu_rd2_5              [4:0]   ),
    .i_lsu_rd3_5              ( i_lsu_rd3_5              [4:0]   ),
    .i_lsu_index0_6           ( i_lsu_index0_6           [5:0]   ),
    .i_lsu_index1_6           ( i_lsu_index1_6           [5:0]   ),
    .i_lsu_index2_6           ( i_lsu_index2_6           [5:0]   ),
    .i_lsu_index3_6           ( i_lsu_index3_6           [5:0]   ),
    .i_lsu_flag0_10           ( i_lsu_flag0_10           [9:0]   ),
    .i_lsu_flag1_10           ( i_lsu_flag1_10           [9:0]   ),
    .i_lsu_flag2_10           ( i_lsu_flag2_10           [9:0]   ),
    .i_lsu_flag3_10           ( i_lsu_flag3_10           [9:0]   ),
    .i_lsu_bypass0            ( i_lsu_bypass0                    ),
    .i_lsu_bypass1            ( i_lsu_bypass1                    ),
    .i_lsu_bypass2            ( i_lsu_bypass2                    ),
    .i_lsu_bypass3            ( i_lsu_bypass3                    ),
    .i_ptw0_drive             ( i_ptw0_drive                     ),
    .i_ptw1_drive             ( i_ptw1_drive                     ),
    .i_ptw2_drive             ( i_ptw2_drive                     ),
    .i_ptw3_drive             ( i_ptw3_drive                     ),
    .i_freeNext_ptw           ( i_freeNext_ptw                   ),
    .i_ptw_ptePA_34           ( i_ptw_ptePA_34           [33:0]  ),
    .i_ifu_drive0             ( i_ifu_drive0                     ),
    .i_ifu_drive1             ( i_ifu_drive1                     ),
    .i_ifu_drive2             ( i_ifu_drive2                     ),
    .i_ifu_drive3             ( i_ifu_drive3                     ),
    .i_freeNext0_ifu          ( i_freeNext0_ifu                  ),
    .i_freeNext1_ifu          ( i_freeNext1_ifu                  ),
    .i_freeNext2_ifu          ( i_freeNext2_ifu                  ),
    .i_freeNext3_ifu          ( i_freeNext3_ifu                  ),
    .i_ifu_PA0_34             ( i_ifu_PA0_34             [33:0]  ),
    .i_ifu_PA1_34             ( i_ifu_PA1_34             [33:0]  ),
    .i_ifu_PA2_34             ( i_ifu_PA2_34             [33:0]  ),
    .i_ifu_PA3_34             ( i_ifu_PA3_34             [33:0]  ),
    .i_freeNext0_lsu_load     ( i_freeNext0_lsu_load             ),
    .i_freeNext1_lsu_load     ( i_freeNext1_lsu_load             ),
    .i_freeNext2_lsu_load     ( i_freeNext2_lsu_load             ),
    .i_freeNext3_lsu_load     ( i_freeNext3_lsu_load             ),
    .i_DDR_drive_cache        ( i_DDR_drive_cache                ),
    .i_read_freeNext_DDR      ( i_read_freeNext_DDR              ),
    .i_write_freeNext_DDR     ( i_write_freeNext_DDR             ),
    .i_DDR_refill_data_256    ( i_DDR_refill_data_256    [255:0] ),

    .o_lsu_free0_cache        ( o_lsu_free0_cache                ),
    .o_lsu_free1_cache        ( o_lsu_free1_cache                ),
    .o_lsu_free2_cache        ( o_lsu_free2_cache                ),
    .o_lsu_free3_cache        ( o_lsu_free3_cache                ),
    .o_driveNext0_lsu         ( o_driveNext0_lsu                 ),
    .o_driveNext1_lsu         ( o_driveNext1_lsu                 ),
    .o_driveNext2_lsu         ( o_driveNext2_lsu                 ),
    .o_driveNext3_lsu         ( o_driveNext3_lsu                 ),
    .o_loadType0              ( o_loadType0                      ),
    .o_loadType1              ( o_loadType1                      ),
    .o_loadType2              ( o_loadType2                      ),
    .o_loadType3              ( o_loadType3                      ),
    .o_store_bypass0_3        ( o_store_bypass0_3        [2:0]   ),
    .o_store_bypass1_3        ( o_store_bypass1_3        [2:0]   ),
    .o_store_bypass2_3        ( o_store_bypass2_3        [2:0]   ),
    .o_store_bypass3_3        ( o_store_bypass3_3        [2:0]   ),
    .o_lsu_rd0_5              ( o_lsu_rd0_5              [4:0]   ),
    .o_lsu_rd1_5              ( o_lsu_rd1_5              [4:0]   ),
    .o_lsu_rd2_5              ( o_lsu_rd2_5              [4:0]   ),
    .o_lsu_rd3_5              ( o_lsu_rd3_5              [4:0]   ),
    .o_lsu_index0_6           ( o_lsu_index0_6           [5:0]   ),
    .o_lsu_index1_6           ( o_lsu_index1_6           [5:0]   ),
    .o_lsu_index2_6           ( o_lsu_index2_6           [5:0]   ),
    .o_lsu_index3_6           ( o_lsu_index3_6           [5:0]   ),
    .o_lsu_flag0_10           ( o_lsu_flag0_10           [9:0]   ),
    .o_lsu_flag1_10           ( o_lsu_flag1_10           [9:0]   ),
    .o_lsu_flag2_10           ( o_lsu_flag2_10           [9:0]   ),
    .o_lsu_flag3_10           ( o_lsu_flag3_10           [9:0]   ),
    .o_lsu_bypass0            ( o_lsu_bypass0                    ),
    .o_lsu_bypass1            ( o_lsu_bypass1                    ),
    .o_lsu_bypass2            ( o_lsu_bypass2                    ),
    .o_lsu_bypass3            ( o_lsu_bypass3                    ),
    .o_ptw0_free              ( o_ptw0_free                      ),
    .o_ptw1_free              ( o_ptw1_free                      ),
    .o_ptw2_free              ( o_ptw2_free                      ),
    .o_ptw3_free              ( o_ptw3_free                      ),
    .o_driveNext_ptw          ( o_driveNext_ptw                  ),
    .o_pte_32                 ( o_pte_32                 [31:0]  ),
    .o_ifu_free0              ( o_ifu_free0                      ),
    .o_ifu_free1              ( o_ifu_free1                      ),
    .o_ifu_free2              ( o_ifu_free2                      ),
    .o_ifu_free3              ( o_ifu_free3                      ),
    .o_driveNext0_ifu         ( o_driveNext0_ifu                 ),
    .o_driveNext1_ifu         ( o_driveNext1_ifu                 ),
    .o_driveNext2_ifu         ( o_driveNext2_ifu                 ),
    .o_driveNext3_ifu         ( o_driveNext3_ifu                 ),
    .o_instr0_to_ifu_256      ( o_instr0_to_ifu_256      [255:0] ),
    .o_instr1_to_ifu_256      ( o_instr1_to_ifu_256      [255:0] ),
    .o_instr2_to_ifu_256      ( o_instr2_to_ifu_256      [255:0] ),
    .o_instr3_to_ifu_256      ( o_instr3_to_ifu_256      [255:0] ),
    .o_driveNext0_lsu_load    ( o_driveNext0_lsu_load            ),
    .o_driveNext1_lsu_load    ( o_driveNext1_lsu_load            ),
    .o_driveNext2_lsu_load    ( o_driveNext2_lsu_load            ),
    .o_driveNext3_lsu_load    ( o_driveNext3_lsu_load            ),
    .o_loadData0_to_lsu_38    ( o_loadData0_to_lsu_38    [37:0]  ),
    .o_loadData1_to_lsu_38    ( o_loadData1_to_lsu_38    [37:0]  ),
    .o_loadData2_to_lsu_38    ( o_loadData2_to_lsu_38    [37:0]  ),
    .o_loadData3_to_lsu_38    ( o_loadData3_to_lsu_38    [37:0]  ),
    .o_DDR_free_cache         ( o_DDR_free_cache                 ),
    .o_read_driveNext_DDR     ( o_read_driveNext_DDR             ),
    .o_write_driveNext_DDR    ( o_write_driveNext_DDR            ),
    .o_read_addr_to_DDR_34    ( o_read_addr_to_DDR_34    [33:0]  ),
    .o_write_addr_to_DDR_34   ( o_write_addr_to_DDR_34   [33:0]  ),
    .o_write_data_to_DDR_256  ( o_write_data_to_DDR_256  [255:0] )
);

initial
begin
    forever #(PERIOD/2)  init_clk=~init_clk;
end

initial
begin
    #5; 
    rstn = 0;

    #(PERIOD*rst_cycle-5) rstn  =  1;
    #20;#10;

//case0 test data_init
    count = count +1'b1;
    init_PA_34 = 34'b0;
    init_datain_256 = 256'h2c4d24af_dab8a58d_e4723be3_680216da_3e745f72_86c908fa_db1e3009_510b3236;    
    #PERIOD;
    init_sign = 1;
    #PERIOD;
    init_wea = 1;
    #PERIOD;
    
    init_wea = 0;
    count = count +1'b1;
    init_PA_34 = 34'b1010011000011101010110_10101_00_11100;  //298756_a9c
    init_datain_256 = 256'h84dc4355_5970318c_acab6104_b65fdd37_a9d39843_a13c91e4_7dbe7e2a_f4496680;
    #PERIOD;
    init_wea = 1;
    #PERIOD;

    init_wea = 0;
    count = count +1'b1;
    init_PA_34 = 34'b10000110000111010101_1010101_01_00000; // 34'h218756_abc
    init_datain_256 = 256'h7e1bcc6e_c0236e43_3d4ac21a_5ed12a33_39177964_d4f17ee7_22060117_d5e43b21;
    #PERIOD;
    init_wea = 1;
    #PERIOD;

    init_wea = 0;
    count = count +1'b1;
    init_PA_34 = 34'b10000110000111010101_1010101_10_00000; // 34'h 2 1875 6AC0
    init_datain_256 = 256'h2c4d24af_dab8a58d_e4723be3_680216da_3e745f72_86c908fa_db1e3009_510b3236;    
    #PERIOD;
    init_wea = 1;
    #PERIOD;

    init_wea = 0;
    count = count +1'b1;
    init_PA_34 = 34'b10000110000111000001_1010100_11_00000; // 34'h 2 1870 6A60
    init_datain_256 = 256'h2b89718a_c3ce4c8c_77ac0274_80ae157e_06d55e58_881486d9_cb6b353c_dea3791c;
    #PERIOD;
    init_wea = 1;
    #PERIOD;

    init_sign=0;
    #run_time;
    i_lsu_PA0_34 = 34'b1010011000011101010110_10101_00_11100;  //298756_a9c
    i_lsu_PA1_34 = 34'b10000110000111010101_1010101_01_00000; // 34'h218756_abc
    i_lsu_PA2_34 = 34'b10000110000111010101_1010101_10_00000; // 34'h 2 1875 6AC0
    i_lsu_PA3_34 = 34'b10000110000111000001_1010100_11_00000; // 34'h 2 1870 6A60
    i_lsu_flag0_10[9] = 1;
    i_lsu_flag1_10[9] = 1;
    i_lsu_flag2_10[9] = 1;
    i_lsu_flag3_10[9] = 1;

    #3;
    i_lsu_drive0_cache = 1;
    i_lsu_drive1_cache = 1;
    i_lsu_drive2_cache = 1;
    i_lsu_drive3_cache = 1;
    #3;
    i_lsu_drive0_cache = 0;
    i_lsu_drive1_cache = 0;
    i_lsu_drive2_cache = 0;
    i_lsu_drive3_cache = 0;

    #run_time;


// //case1 Dcache、Icache 单独缺失读 + 命中读确认 ， Dcache单独缺失写 + 命中读确认
    
//     count = count +1'b1;

// //Dcache 缺失读
//     i_lsu_rd0_5 = 5'd13;
//     i_lsu_index0_6 = 6'd30;
//     i_lsu_flag0_10 = 10'b1_101010101; //1 load
//     i_lsu_bypass0 = 1'b1;
//     i_lsu_PA0_34 = 34'h298756_a9c;  //1010011000011101010110_10101_00_11100
//     #2.5;i_lsu_drive0_cache = 1'b1;
//     #2.5;i_lsu_drive0_cache = 1'b0;

//     #run_time;//L1缺失
//     #run_time;//L2缺失

//     //o_read_driveNext_DDR
//     i_DDR_refill_data_256 = 256'h2c4d24af_dab8a58d_e4723be3_680216da_3e745f72_86c908fa_db1e3009_510b3236;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;//i_DDR_drive_cache做arbRead的free

//     #run_time;//回填L2
//     #run_time;//回填L1

//     #2.5;i_freeNext_retire_load = 1'b1;
//     #2.5;i_freeNext_retire_load = 1'b0;

// //Dcache 读命中确认
//     i_lsu_PA0_34 = 34'h298756_a9c;  //1010011000011101010110_10101_00_11100
//     #2.5;i_lsu_drive0_cache = 1'b1;
//     #2.5;i_lsu_drive0_cache = 1'b0;

//     #run_time;

//     #2.5;i_freeNext_retire_load = 1'b1;
//     #2.5;i_freeNext_retire_load = 1'b0;

// //Icache 
//     i_ifu_PA1_34 = 34'b10000110000111010101_1010101_01_00000; // 34'h218756_abc
//     #2.5;i_ifu_drive1 = 1'b1;
//     #2.5;i_ifu_drive1 = 1'b0;

//     #run_time;//L1缺失
//     #run_time;//L2缺失

//     i_DDR_refill_data_256 = 256'h84dc4355_5970318c_acab6104_b65fdd37_a9d39843_a13c91e4_7dbe7e2a_f4496680;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;
    
//     #run_time;//回填L2
//     #run_time;//回填L1

//     #2.5;i_freeNext1_ifu = 1'b1;
//     #2.5;i_freeNext1_ifu = 1'b0;

// //Icache 读命中确认
//     i_ifu_PA1_34 = 34'b10000110000111010101_1010101_01_00000; // 34'h218756_abc

//     #2.5;i_ifu_drive1 = 1'b1;
//     #2.5;i_ifu_drive1 = 1'b0;

//     #run_time;

//     #2.5;i_freeNext1_ifu = 1'b1;
//     #2.5;i_freeNext1_ifu = 1'b0;


// //case2 Dcache 单独命中写 + 命中读确认
//     count = count +1'b1;
   
//     //Dcache 命中写
//     i_lsu_rd0_5 = 5'd13;
//     i_lsu_index0_6 = 6'd30;
//     i_lsu_flag0_10 = 10'b0_101010101; //1 load 0 store
//     i_lsu_bypass0 = 1'b1;
//     i_lsu_PA0_34 = 34'h298756_a9c;  //1010011000011101010110_10101_00_11100
//     #2.5;i_lsu_drive0_cache = 1'b1;
//     #2.5;i_lsu_drive0_cache = 1'b0;

//     #run_time;#run_time;//命中+写

//     #2.5;i_freeNext0_lsu = 1'b1;
//     #2.5;i_freeNext0_lsu = 1'b0;

//     //Dcache 读命中确认
//     i_lsu_flag0_10 = 10'b1_101010101; //1 load 0 store
//     i_lsu_PA0_34 = 34'h298756_a9c;  //1010011000011101010110_10101_00_11100
//     #2.5;i_lsu_drive0_cache = 1'b1;
//     #2.5;i_lsu_drive0_cache = 1'b0;

//     #run_time;

//     #2.5;i_freeNext_retire_load = 1'b1;
//     #2.5;i_freeNext_retire_load = 1'b0;

// //case3 Dcache、Icache 单独缺失读 + 命中读确认 ， Dcache单独缺失写 + 命中读确认
   
//     count = count +1'b1;
//     //Dcache 缺失读
//     i_lsu_rd1_5 = 5'd13;
//     i_lsu_index1_6 = 6'd30;
//     i_lsu_flag1_10 = 10'b1_101010101; //1 load
//     i_lsu_bypass1 = 1'b1;
//     i_lsu_PA1_34 = 34'h298756a3c;  //1010011000011101010110_10100_01_11100
//     #2.5;i_lsu_drive1_cache = 1'b1;
//     #2.5;i_lsu_drive1_cache = 1'b0;

//     #run_time;//L1缺失
//     #run_time;//L2缺失

//     //o_read_driveNext_DDR
//     i_DDR_refill_data_256 = 256'h2c4d24af_dab8a58d_e4723be3_680216da_3e745f72_86c908fa_db1e3009_510b3236;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;//i_DDR_drive_cache做arbRead的free

//     #run_time;//回填L2
//     #run_time;//回填L1

//     #2.5;i_freeNext_retire_load = 1'b1;
//     #2.5;i_freeNext_retire_load = 1'b0;

//     //Dcache 读命中确认
//     i_lsu_PA1_34 = 34'h298756a3c;  //1010011000011101010110_10100_01_11100
//     #2.5;i_lsu_drive1_cache = 1'b1;
//     #2.5;i_lsu_drive1_cache = 1'b0;

//     #run_time;

//     #2.5;i_freeNext_retire_load = 1'b1;
//     #2.5;i_freeNext_retire_load = 1'b0;

//     //Icache 
//     i_ifu_PA2_34 = 34'b10000110000111010101_1010101_10_00000; // 218756ac0    
//     #2.5;i_ifu_drive2 = 1'b1;
//     #2.5;i_ifu_drive2 = 1'b0;

//     #run_time;//L1缺失
//     #run_time;//L2缺失

//     i_DDR_refill_data_256 = 256'h7e1bcc6e_c0236e43_3d4ac21a_5ed12a33_39177964_d4f17ee7_22060117_d5e43b21;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;
    
//     #run_time;//回填L2
//     #run_time;//回填L1

//     #2.5;i_freeNext2_ifu = 1'b1;
//     #2.5;i_freeNext2_ifu = 1'b0;

//     //Icache 读命中确认
//     i_ifu_PA2_34 = 34'b10000110000111010101_1010101_10_00000; // 218756ac0    

//     #2.5;i_ifu_drive2 = 1'b1;
//     #2.5;i_ifu_drive2 = 1'b0;

//     #run_time;

//     #2.5;i_freeNext2_ifu = 1'b1;
//     #2.5;i_freeNext2_ifu = 1'b0;

// //case4 Dcache、Icache 同时缺失，且L2重复
//     count = count +1'b1;

//     i_lsu_rd0_5 = 5'd13;
//     i_lsu_index0_6 = 6'd30;
//     i_lsu_flag0_10 = 10'b1_101010101; i_lsu_flag1_10 = 10'b0_101010101; i_lsu_flag2_10 = 10'b0_101010101; i_lsu_flag3_10 = 10'b0_101010101;
//     i_lsu_bypass0 = 1'b1;

//     i_lsu_PA0_34 = 34'b1010011000011100000110_10101_00_11100;    
//     i_lsu_PA1_34 = 34'b1010011000011100000110_10101_01_11100;
//     i_lsu_PA2_34 = 34'b1010011000011100000110_10101_10_11100;
//     i_lsu_PA3_34 = 34'b1010011000011100000110_10101_11_11100;
//     i_lsu_storeData0_32 = 32'b0;
//     i_lsu_storeData1_32 = 32'hd1b62b74;
//     i_lsu_storeData2_32 = 32'h97e0baa6;
//     i_lsu_storeData3_32 = 32'h6154b0e1;

//     i_ifu_PA1_34 = 34'b10000110000111000001_1010100_01_00000; 
//     i_ifu_PA2_34 = 34'b10000110000111000001_1010100_10_00000; 
//     i_ifu_PA3_34 = 34'b10000110000111000001_1010100_11_00000; 

//     #2.5;
//     i_lsu_drive0_cache = 1'b1;i_lsu_drive1_cache = 1'b1;i_lsu_drive2_cache = 1'b1;i_lsu_drive3_cache = 1'b1;
//     i_ifu_drive1 = 1'b1;i_ifu_drive2 = 1'b1;i_ifu_drive3 = 1'b1;

//     #2.5;
//     i_lsu_drive0_cache = 1'b0;i_lsu_drive1_cache = 1'b0;i_lsu_drive2_cache = 1'b0;i_lsu_drive3_cache = 1'b0;
//     i_ifu_drive1 = 1'b0;i_ifu_drive2 = 1'b0;i_ifu_drive3 = 1'b0;

//     #run_time;//L1缺失
//     #run_time;//L2缺失
    
//     //o_read_driveNext_DDR
//     i_DDR_refill_data_256 = 256'h2c4d24af_dab8a58d_e4723be3_680216da_3e745f72_86c908fa_db1e3009_510b3236;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;//i_DDR_drive_cache做arbRead的free

//     #wait_arb;
//     i_DDR_refill_data_256 = 256'h84dc4355_5970318c_acab6104_b65fdd37_a9d39843_a13c91e4_7dbe7e2a_f4496680;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #wait_arb;
//     i_DDR_refill_data_256 = 256'h2b89718a_c3ce4c8c_77ac0274_80ae157e_06d55e58_881486d9_cb6b353c_dea3791c;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;
    
//     #wait_arb;
//     i_DDR_refill_data_256 = 256'h7e1bcc6e_c0236e43_3d4ac21a_5ed12a33_39177964_d4f17ee7_22060117_d5e43b21;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #wait_arb;
//     i_DDR_refill_data_256 = 256'h7c2237a9_359e1ab9_2660b691_513fcccf_f44c4fe2_332c8cb3_b611efeb_637d2056;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #wait_arb;
//     i_DDR_refill_data_256 = 256'h3d73262a_2ffc9e9f_d552e991_8e1cdabc_7cc0440d_6ee1310d_16ee0b1f_fa547f2b;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;
    
//     #wait_arb;
//     i_DDR_refill_data_256 = 256'ha65b0664_3b22aec7_cda136f7_08c3eb8c_bdc34e00_c3430ffe_adac6a5e_bfd20642;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1
//     #30;

//     //cache to retire,IFU     o_loadData0_to_retire_38 o_instr_to_ifu_256
//     #2.5;
//     i_freeNext_retire_load = 1'b1;
//     i_freeNext1_lsu = 1;
//     i_freeNext2_lsu = 1;
//     i_freeNext3_lsu = 1;
//     i_freeNext1_ifu = 1'b1;
//     i_freeNext2_ifu = 1'b1;
//     i_freeNext3_ifu = 1'b1;

//     #2.5;
//     i_freeNext_retire_load = 1'b0;
//     i_freeNext1_lsu = 0;
//     i_freeNext2_lsu = 0;
//     i_freeNext3_lsu = 0;
//     i_freeNext1_ifu = 1'b0;
//     i_freeNext2_ifu = 1'b0;
//     i_freeNext3_ifu = 1'b0;

// //case5 访问同一Dcache 访问同一L2
//     count = count + 1'b1;

//     #10;

//     i_lsu_flag0_10 =  10'b0_111010101;
//     i_lsu_flag3_10 =  10'b1_101010101;

//     i_lsu_PA0_34 = 34'b1010011000011100010110_10101_00_11100;
//     i_lsu_storeData0_32 = 32'h97e0baa6;
//     i_lsu_PA3_34 = 34'b1010011000011100010110_10101_11_01100;
    
//     i_ifu_PA0_34 = 34'b10000110000111000011_1010100_00_00000;
//     i_ifu_PA3_34 = 34'b10000110000111000011_1010100_11_00000;

//     #2.5;
//     i_lsu_drive0_cache = 1;i_ifu_drive0 = 1;
//     i_lsu_drive3_cache = 1;i_ifu_drive3 = 1;

//     #2.5;
//     i_lsu_drive0_cache = 0;i_ifu_drive0 = 0;
//     i_lsu_drive3_cache = 0;i_ifu_drive3 = 0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失

//     #wait_arb;
//     i_DDR_refill_data_256 = 256'h7e1bcc6e_c0236e43_3d4ac21a_5ed12a33_39177964_d4f17ee7_22060117_d5e43b21;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #wait_arb;
//     i_DDR_refill_data_256 = 256'h7c2237a9_359e1ab9_2660b691_513fcccf_f44c4fe2_332c8cb3_b611efeb_637d2056;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #wait_arb;
//     i_DDR_refill_data_256 = 256'h3d73262a_2ffc9e9f_d552e991_8e1cdabc_7cc0440d_6ee1310d_16ee0b1f_fa547f2b;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;
    
//     #wait_arb;
//     i_DDR_refill_data_256 = 256'ha65b0664_3b22aec7_cda136f7_08c3eb8c_bdc34e00_c3430ffe_adac6a5e_bfd20642;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1

//     #2.5;
//     i_freeNext0_lsu=1;i_freeNext0_ifu=1;
//     i_freeNext_retire_load=1;i_freeNext3_ifu=1;

//     #2.5;
//     i_freeNext0_lsu=0;i_freeNext0_ifu=0;
//     i_freeNext_retire_load=0;i_freeNext3_ifu=0;

//     #run_time

// //case6 ptw 和 Dcache
//     count = count + 1'b1;
//     i_lsu_flag3_10 =  10'b0_111010101;
//     i_lsu_PA3_34 = 34'b1010011000011100010111_10101_11_11100;
//     i_lsu_storeData3_32 = 32'h637f1a83;

//     i_ptw_ptePA_34 = 34'b1010011000011100010110_10111_11_11100;

//     #2.5;
//     i_lsu_drive3_cache=1;i_ptw3_drive=1;

//     #2.5;
//     i_lsu_drive3_cache=0;i_ptw3_drive=0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失

//     #wait_arb;
//     i_DDR_refill_data_256 = 256'h2c4d24af_dab8a58d_e4723be3_680216da_3e745f72_86c908fa_db1e3009_510b3236;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;
    
//     #run_time;//回填L2
//     #run_time;//回填L1
    
//     #2.5;i_freeNext3_lsu=1;
//     #2.5;i_freeNext3_lsu=0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失

//     #wait_arb;
//     i_DDR_refill_data_256 = 256'h84dc4355_5970318c_acab6104_b65fdd37_a9d39843_a13c91e4_7dbe7e2a_f4496680;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1

//     #2.5;i_freeNext_ptw=1;
//     #2.5;i_freeNext_ptw=0;

//     #20;

// //case7 writeBack
//     count = count + 1'b1;

//     //0
//     i_lsu_flag3_10 =  10'b0_111010101;
//     i_lsu_PA3_34 = 34'b1010011000011100010111_10001_11_11100;
//     i_lsu_storeData3_32 = 32'h637f1a83;

//     #2.5;i_lsu_drive3_cache=1;
//     #2.5;i_lsu_drive3_cache=0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失

//     i_DDR_refill_data_256 = 256'h2c4d24af_dab8a58d_e4723be3_680216da_3e745f72_86c908fa_db1e3009_510b3236;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1
//     #run_time;//写D

//     #2.5;i_freeNext3_lsu=1;
//     #2.5;i_freeNext3_lsu=0;

//     //1
//     count = count + 1'b1;
    
//     i_lsu_flag3_10 =  10'b0_111010101;
//     i_lsu_PA3_34 = 34'b1010011000011100110111_10001_11_11100;
//     i_lsu_storeData3_32 = 32'h637f1a83;

//     #2.5;i_lsu_drive3_cache=1;
//     #2.5;i_lsu_drive3_cache=0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失

//     i_DDR_refill_data_256 = 256'h84dc4355_5970318c_acab6104_b65fdd37_a9d39843_a13c91e4_7dbe7e2a_f4496680;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1
//     #run_time;//写D

//     #2.5;i_freeNext3_lsu=1;
//     #2.5;i_freeNext3_lsu=0;

//     //2
//     count = count + 1'b1;

//     i_lsu_flag3_10 =  10'b0_111010101;
//     i_lsu_PA3_34 = 34'b1010011000011101010111_10001_11_11100;
//     i_lsu_storeData3_32 = 32'h637f1a83;

//     #2.5;i_lsu_drive3_cache=1;
//     #2.5;i_lsu_drive3_cache=0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失

//     i_DDR_refill_data_256 = 256'h2b89718a_c3ce4c8c_77ac0274_80ae157e_06d55e58_881486d9_cb6b353c_dea3791c;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1
//     #run_time;//写D

//     #2.5;i_freeNext3_lsu=1;
//     #2.5;i_freeNext3_lsu=0;

//     //3
//     count = count + 1'b1;

//     i_lsu_flag3_10 =  10'b0_111010101;
//     i_lsu_PA3_34 = 34'b1010011000011101110111_10001_11_11100;
//     i_lsu_storeData3_32 = 32'h637f1a83;

//     #2.5;i_lsu_drive3_cache=1;
//     #2.5;i_lsu_drive3_cache=0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失

//     i_DDR_refill_data_256 = 256'h7e1bcc6e_c0236e43_3d4ac21a_5ed12a33_39177964_d4f17ee7_22060117_d5e43b21;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1
//     #run_time;//写D

//     #2.5;i_freeNext3_lsu=1;
//     #2.5;i_freeNext3_lsu=0;

//     //4
//     count = count + 1'b1;

//     i_lsu_flag3_10 =  10'b0_111010101;
//     i_lsu_PA3_34 = 34'b1010011000011110010111_10001_11_11100;
//     i_lsu_storeData3_32 = 32'h637f1a83;

//     #2.5;i_lsu_drive3_cache=1;
//     #2.5;i_lsu_drive3_cache=0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失

//     i_DDR_refill_data_256 = 256'h7c2237a9_359e1ab9_2660b691_513fcccf_f44c4fe2_332c8cb3_b611efeb_637d2056;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1
//     #run_time;//写D

//     #2.5;i_freeNext3_lsu=1;
//     #2.5;i_freeNext3_lsu=0;

//     //5
//     count = count + 1'b1;

//     i_lsu_flag3_10 =  10'b0_111010101;
//     i_lsu_PA3_34 = 34'b1010011000011110110111_10001_11_11100;
//     i_lsu_storeData3_32 = 32'h637f1a83;

//     #2.5;i_lsu_drive3_cache=1;
//     #2.5;i_lsu_drive3_cache=0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失

//     i_DDR_refill_data_256 = 256'h3d73262a_2ffc9e9f_d552e991_8e1cdabc_7cc0440d_6ee1310d_16ee0b1f_fa547f2b;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1
//     #run_time;//写D

//     #2.5;i_freeNext3_lsu=1;
//     #2.5;i_freeNext3_lsu=0;

//     //6
//     count = count + 1'b1;

//     i_lsu_flag3_10 =  10'b0_111010101;
//     i_lsu_PA3_34 = 34'b1010011000011111010111_10001_11_11100;
//     i_lsu_storeData3_32 = 32'h637f1a83;

//     #2.5;i_lsu_drive3_cache=1;
//     #2.5;i_lsu_drive3_cache=0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失

//     i_DDR_refill_data_256 = 256'ha65b0664_3b22aec7_cda136f7_08c3eb8c_bdc34e00_c3430ffe_adac6a5e_bfd20642;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1
//     #run_time;//写D

//     #2.5;i_freeNext3_lsu=1;
//     #2.5;i_freeNext3_lsu=0;

//     //7
//     count = count + 1'b1;

//     i_lsu_flag3_10 =  10'b0_111010101;
//     i_lsu_PA3_34 = 34'b1010011000011111110111_10001_11_11100;
//     i_lsu_storeData3_32 = 32'h637f1a83;

//     #2.5;i_lsu_drive3_cache=1;
//     #2.5;i_lsu_drive3_cache=0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失

//     i_DDR_refill_data_256 = 256'hd1f9598b_77d84657_ce7377dc_43952290_b4ec9ff1_a4898e0c_0e034858_0b588997;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1
//     #run_time;//写D

//     #2.5;i_freeNext3_lsu=1;
//     #2.5;i_freeNext3_lsu=0;

//     //8
//     count = count + 1'b1;

//     i_lsu_flag3_10 =  10'b0_111010101;
//     i_lsu_PA3_34 = 34'b1010011000011101010000_10001_11_11100;
//     i_lsu_storeData3_32 = 32'h637f1a83;

//     #2.5;i_lsu_drive3_cache=1;
//     #2.5;i_lsu_drive3_cache=0;

//     #run_time;//L1缺失
//     #run_time;//L2阻塞并缺失
//     #run_time;#run_time;

//     i_DDR_refill_data_256 = 256'hb4ec9ff1_a4898e0c_0e034858_0b588997_a66e095d_5d26e95b_6465cf60_20d00ee4;
//     #2.5;i_DDR_drive_cache = 1'b1;
//     #2.5;i_DDR_drive_cache = 1'b0;

//     #run_time;//回填L2
//     #run_time;//回填L1
//     #run_time;//写D

//     #2.5;i_freeNext3_lsu=1;
//     #2.5;i_freeNext3_lsu=0;


    #2000;
    $stop;

end

endmodule
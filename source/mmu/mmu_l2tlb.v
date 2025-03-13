`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  mmu_l2tlb
// Author:  Yang Yuyuan
// Date:    2024/10/10
// Description: 32 normal, 4 super
//======================================================


module mmu_l2tlb (
    input         rstn,
    // input, l1tlb -> l2tlb, l1Way(4b) + reqIndex(6b) + reqType(2b) + reqVaddr(32b) + cpuMode(2b) + satpAsid(9b) + satpPpn(22b) + mstatusMxr(1b) + mstatusSum(1b)
    input         i_l1_l2tlb_drive_1,
    output        o_l2tlb_l1_free_1,
    input  [78:0] i_l1_l2tlb_data_79,

    // input, sfence -> l2tlb, rs2(5b) + rs1(5b) + asid(9b) + vpn(20b)
    input         i_sfence_l2tlb_drive_1,
    output        o_l2tlb_sfence_free_1,
    input  [38:0] i_sfence_l2tlb_data_39,

    // input, ptw -> l2tlb, wbEn(2b) + wbPte(32b)
    input         i_ptw_l2tlb_drive_1,
    output        o_l2tlb_ptw_free_1,
    input  [33:0] i_ptw_l2tlb_data_34,

    // output, l2tlb -> ifuexp, expIndex(5b)
    output       o_l2tlb_ifuexp_drive_1,
    input        i_ifuexp_l2tlb_free_1,
    output [4:0] o_l2tlb_ifuexp_data_5,

    // output, l2tlb -> lsuexp, reqIndex(6b) + expIndex(5b)
    output        o_l2tlb_lsuexp_drive_1,
    input         i_lsuexp_l2tlb_free_1,
    output [10:0] o_l2tlb_lsuexp_data_11,

    // output, l2tlb -> l1tlb, reqType(2b) + l1Way(4b) + wbEn(2b) + wbPte(32b)
    output        o_l2tlb_l1_drive_1,
    input         i_l1_l2tlb_free_1,
    output [39:0] o_l2tlb_l1_data_40,

    // output, l2tlb -> pmp,  l1tlbIndex(4b) + reqIndex(6b) + pAddr(34b) + cpuMode(2b) + reqType(2b)
    output        o_l2tlb_pmp_drive_1,
    input         i_pmp_l2tlb_free_1,
    output [47:0] o_l2tlb_pmp_data_48,

    // output, l2tlb -> ptw, l2Level(2b) + l1Way(4b) + reqIndex(6b) + reqType(2b) + reqVaddr(32b) + satpPpn(22b) + cpuMode(2b) + satpAsid(9b) + mstatusMxr(1b) + mstatusSum(1b)
    output        o_l2tlb_ptw_drive_1,
    input         i_ptw_l2tlb_free_1,
    output [80:0] o_l2tlb_ptw_data_81
);

    wire [ 3:0] w_l1_way_4;
    wire [ 5:0] w_req_index_6;
    wire [ 1:0] w_req_type_2;
    wire [31:0] w_req_vaddr_32;
    wire [ 1:0] w_cpu_mode_2;
    wire [21:0] w_satp_ppn_22;
    wire [ 8:0] w_satp_asid_9;
    wire        w_mstatus_mxr_1;
    wire        w_mstatus_sum_1;

    assign {w_l1_way_4, w_req_index_6, w_req_type_2, w_req_vaddr_32, w_cpu_mode_2, w_satp_asid_9, w_satp_ppn_22, w_mstatus_mxr_1, w_mstatus_sum_1} = i_l1_l2tlb_data_79;

    //---------------------- Instantiation of secondary tlb ----------------------//
    wire [ 3:0] w_l21_hit_4;
    wire [ 3:0] w_l21_valid_4;
    wire [23:0] w_l21_readData_24;
    wire [23:0] w_l21_readTag_24;
    wire [ 3:0] w_l21_writeEn_4;
    wire [ 5:0] w_l21_writeAddr_6;
    wire [23:0] w_l21_writeData_24;
    wire [23:0] w_l21_writeTag_24;
    wire [ 1:0] w_flush_en_2;
    wire        w_cFifo5_fire_1;

    mmu_l2tlb1 mmu_l2tlb1 (
        .clk               (w_cFifo5_fire_1),
        .rstn              (rstn),
        .i_read_addr_6     (w_req_vaddr_32[27:22]),
        .i_read_contrast_13({w_satp_asid_9, w_req_vaddr_32[31:28]}),
        .o_hit_4           (w_l21_hit_4),
        .o_valid_4         (w_l21_valid_4),
        .o_read_data_24    (w_l21_readData_24),
        .o_read_tag_24     (w_l21_readTag_24),
        .i_write_en_4      (w_l21_writeEn_4),
        .i_write_addr_6    (w_l21_writeAddr_6),
        .i_write_data_24   (w_l21_writeData_24),
        .i_write_tag_24    (w_l21_writeTag_24),
        .i_flush_en_2      (w_flush_en_2)
    );

    wire [3 : 0] w_l22_hit_4;
    wire [3 : 0] w_l22_valid_4;
    wire [ 23:0] w_l22_readData_24;
    wire [ 31:0] w_l22_readTag_32;
    wire [3 : 0] w_l22_writeEn_4;
    wire [7 : 0] w_l22_writeAddr_8;
    wire [ 23:0] w_l22_writeData_24;
    wire [ 31:0] w_l22_writeTag_32;

    mmu_l2tlb2 mmu_l2tlb2 (
        .clk               (w_cFifo5_fire_1),
        .rstn              (rstn),
        .i_read_addr_8     (w_req_vaddr_32[19:12]),
        .i_read_contrast_21({w_satp_asid_9, w_req_vaddr_32[31:20]}),
        .o_hit_4           (w_l22_hit_4),
        .o_valid_4         (w_l22_valid_4),
        .o_read_data_24    (w_l22_readData_24),
        .o_read_tag_32     (w_l22_readTag_32),
        .i_write_en_4      (w_l22_writeEn_4),
        .i_write_addr_8    (w_l22_writeAddr_8),
        .i_write_data_24   (w_l22_writeData_24),
        .i_write_tag_32    (w_l22_writeTag_32),
        .i_flush_en_2      (w_flush_en_2)
    );

    //---------------------- cFork1: Generate read enable signal ----------------------//
    wire w_cFork1_cFifo1_drive_1;
    wire w_cFifo1_cFork1_free_1;
    wire w_cFork1_cMerge2_drive_1;
    wire w_cMerge2_cFork1_free_1;


    cSplitter2_mmu #(2) cFork1 (
        .i_drive     (i_l1_l2tlb_drive_1),
        .o_free      (o_l2tlb_l1_free_1),
        .o_driveNext0(w_cFork1_cFifo1_drive_1),
        .i_freeNext0 (w_cFifo1_cFork1_free_1),
        .o_driveNext1(w_cFork1_cMerge2_drive_1),
        .i_freeNext1 (w_cMerge2_cFork1_free_1),
        .rstn        (rstn)
    );


    //---------------------- cFifo1: Save the information of the read page table entries ----------------------//

    wire w_cFork1_cFifo1_drive_delay_1;
    (* dont_touch="true" *) delay_mmu #(30) cFork1_cFifo1_drive_delay (
        .inR (w_cFork1_cFifo1_drive_1),
        .rstn(rstn),
        .outR(w_cFork1_cFifo1_drive_delay_1)
    );

    wire w_cFifo1_cFork2_drive_1;
    wire w_cFork2_cFifo1_free_1;
    wire w_cFifo1_fire_1;

    cFifo1_mmu cFifo1 (
        .i_drive    (w_cFork1_cFifo1_drive_delay_1),
        .o_free     (w_cFifo1_cFork1_free_1),
        .o_driveNext(w_cFifo1_cFork2_drive_1),
        .i_freeNext (w_cFork2_cFifo1_free_1),
        .o_fire_1   (w_cFifo1_fire_1),
        .rstn       (rstn)
    );

    reg [ 3:0] r_l21_valid_4;
    reg [ 3:0] r_l22_valid_4;
    reg [ 1:0] r_l2_level_2;
    reg [21:0] r_l2_ppn_22;
    reg [30:0] r_l2_tag_31;
    reg [ 3:0] r_l21_hit_4;
    reg [ 3:0] r_l22_hit_4;

    always @(posedge w_cFifo1_fire_1 or negedge rstn) begin
        if (!rstn) begin
            r_l2_level_2  <= 0;
            r_l2_ppn_22   <= 0;
            r_l2_tag_31   <= 0;
            r_l21_valid_4 <= 0;
            r_l22_valid_4 <= 0;
            r_l22_hit_4   <= 0;
            r_l21_hit_4   <= 0;
        end else begin
            r_l22_valid_4 <= w_l22_valid_4;
            r_l21_valid_4 <= w_l21_valid_4;
            r_l22_hit_4   <= w_l22_hit_4;
            r_l21_hit_4   <= w_l21_hit_4;
            if (w_l22_hit_4 != 4'b0) begin
                r_l2_level_2 <= 2'b10;
                r_l2_ppn_22  <= w_l22_readData_24[21:0];
                r_l2_tag_31  <= w_l22_readTag_32[30:0];
            end else if (w_l21_hit_4 != 4'b0) begin
                r_l2_level_2 <= 2'b01;
                r_l2_ppn_22  <= w_l21_readData_24[21:0];
                r_l2_tag_31  <= {8'b0, w_l21_readTag_24[22:0]};
            end else begin
                r_l2_level_2 <= 2'b00;
                r_l2_ppn_22  <= w_satp_ppn_22;
                r_l2_tag_31  <= 31'b0;

            end
        end
    end

    //---------------------- cFork2: Check that the corresponding TLB table entry is found and checked correctly ----------------------//
    wire w_isPte_1;
    wire w_pteFault_1;
    assign w_isPte_1 = r_l2_tag_31[3:1] == 3'b000 ? 1'b0 : 1'b1;
    assign  w_pteFault_1 = (r_l22_hit_4 != 4'b0 || r_l21_hit_4 != 4'b0) && (
        (r_l2_tag_31[0] == 1'b0) ||
        (r_l2_tag_31[2] == 1'b1 && r_l2_tag_31[1] == 1'b0 && w_isPte_1) ||
        (w_req_type_2 == 2'b00 && r_l2_tag_31[3] == 1'b0 && w_isPte_1) ||
        (w_req_type_2 == 2'b10 && r_l2_tag_31[2] == 1'b0 && w_isPte_1) ||
        (w_mstatus_mxr_1 == 1'b0 && w_req_type_2 == 2'b11 && r_l2_tag_31[1] == 1'b0) ||
        (w_mstatus_mxr_1 == 1'b0 && w_req_type_2 == 2'b11 && r_l2_tag_31[3] == 1'b0 && r_l2_tag_31[1] == 1'b0) ||
        (r_l2_tag_31[4] == 1'b1 && w_cpu_mode_2 == 2'b01 && w_req_type_2[1] == 1'b0) ||
        (w_mstatus_sum_1 == 1'b0 && r_l2_tag_31[4] == 1'b1 && w_cpu_mode_2 == 2'b01 && w_req_type_2[1] == 1'b1)
    );

    wire [3:0] w_cFork2_select_4;

    assign w_cFork2_select_4[0] = ((r_l22_hit_4 != 4'b0) || (r_l21_hit_4 != 4'b0)) && (w_pteFault_1 == 1'b1) && (w_req_type_2[1] == 1'b0);
    assign w_cFork2_select_4[1] = ((r_l22_hit_4 != 4'b0) || (r_l21_hit_4 != 4'b0)) && (w_pteFault_1 == 1'b1) && (w_req_type_2[1] == 1'b1);
    assign w_cFork2_select_4[2] = ((r_l22_hit_4 != 4'b0) || (r_l21_hit_4 != 4'b0)) && ~w_pteFault_1 && w_isPte_1;
    assign w_cFork2_select_4[3] = ((r_l21_hit_4 != 4'b0) && ~w_pteFault_1 && ~w_isPte_1) || ((r_l22_hit_4 == 4'b0) && (r_l21_hit_4 == 4'b0));



    wire w_cFork2_cFork3_drive_1;
    wire w_cFork3_cFork2_free_1;
    wire w_cFork2_cFork4_drive_1;
    wire w_cFork4_cFork2_free_1;

    cSelector4_mmu #(4) cFork2 (
        .rstn        (rstn),
        .i_select    (w_cFork2_select_4),
        .i_drive     (w_cFifo1_cFork2_drive_1),
        .o_free      (w_cFork2_cFifo1_free_1),
        .o_driveNext0(o_l2tlb_ifuexp_drive_1),
        .i_freeNext0 (i_ifuexp_l2tlb_free_1),
        .o_driveNext1(o_l2tlb_lsuexp_drive_1),
        .i_freeNext1 (i_lsuexp_l2tlb_free_1),
        .o_driveNext2(w_cFork2_cFork3_drive_1),
        .i_freeNext2 (w_cFork3_cFork2_free_1),
        .o_driveNext3(w_cFork2_cFork4_drive_1),
        .i_freeNext3 (w_cFork4_cFork2_free_1)
    );

    assign o_l2tlb_ifuexp_data_5  = w_cFork2_select_4[0] ? 5'd12 : 5'b0;
    assign o_l2tlb_lsuexp_data_11 = (w_cFork2_select_4[1] == 1'b1 && w_req_type_2 == 2'b10) ? {w_req_index_6, 5'd15} : (w_cFork2_select_4[1] == 1'b1 && w_req_type_2 == 2'b11) ? {w_req_index_6, 5'd13} : 11'b0;

    //---------------------- cFork3: l2 TLB hit and no errors, write back l1, update plru, send to pmp ----------------------//
    wire w_cFork3_cMerge1_drive_1;
    wire w_cMerge1_cFork3_free_1;
    wire w_l2tlb_pmp_drive_1;

    cSplitter3_mmu #(3) cFork3 (
        .rstn        (rstn),
        .i_drive     (w_cFork2_cFork3_drive_1),
        .o_free      (w_cFork3_cFork2_free_1),
        .o_driveNext0(w_l2tlb_pmp_drive_1),
        .i_freeNext0 (i_pmp_l2tlb_free_1),
        .o_driveNext1(o_l2tlb_l1_drive_1),
        .i_freeNext1 (i_l1_l2tlb_free_1),
        .o_driveNext2(w_cFork3_cMerge1_drive_1),
        .i_freeNext2 (w_cMerge1_cFork3_free_1)
    );

    (* dont_touch="true" *) delay_mmu #(2) l2tlb_pmp_drive_delay (
        .inR (w_l2tlb_pmp_drive_1),
        .rstn(rstn),
        .outR(o_l2tlb_pmp_drive_1)
    );

    wire [1:0] w_wb_type_2;
    assign w_wb_type_2 = (r_l22_hit_4 != 4'b0) ? 2'b10 : (r_l21_hit_4 != 4'b0) ? 2'b01 : 2'b00;
    assign	o_l2tlb_pmp_data_48 = (w_cFork2_select_4[2] == 1'b1 && r_l22_hit_4 != 4'b0) ? {w_l1_way_4, w_req_index_6, {r_l2_ppn_22, w_req_vaddr_32[11:0]}, w_cpu_mode_2, w_req_type_2} :
		(w_cFork2_select_4[2] == 1'b1 && r_l21_hit_4 != 4'b0) ? {w_l1_way_4, w_req_index_6, {r_l2_ppn_22[21:10],w_req_vaddr_32[21:0]}} : 48'b0;
    assign o_l2tlb_l1_data_40 = {w_req_type_2, w_l1_way_4, w_wb_type_2, r_l2_ppn_22, r_l2_tag_31[9:0]};

    //---------------------- cFork4: Find ptw, update plru ----------------------//

    wire w_cFork4_cFork5_drive_1;
    wire w_cFork5_cFork4_free_1;
    cSplitter2_mmu #(2) cFork4 (
        .i_drive     (w_cFork2_cFork4_drive_1),
        .o_free      (w_cFork4_cFork2_free_1),
        .o_driveNext0(o_l2tlb_ptw_drive_1),
        .i_freeNext0 (i_ptw_l2tlb_free_1),
        .o_driveNext1(w_cFork4_cFork5_drive_1),
        .i_freeNext1 (w_cFork5_cFork4_free_1),
        .rstn        (rstn)
    );

    assign o_l2tlb_ptw_data_81 = {r_l2_level_2, w_l1_way_4, w_req_index_6, w_req_type_2, w_req_vaddr_32, r_l2_ppn_22, w_cpu_mode_2, w_satp_asid_9, w_mstatus_mxr_1, w_mstatus_sum_1};

    //---------------------- cFork5: Determine whether to update plru ----------------------//
    wire [1:0] w_cFork5_select_2;
    assign w_cFork5_select_2 = (r_l21_hit_4 != 4'b0) ? 2'b01 : 2'b10;

    wire w_cFork5_cFork5_drive_free_1;
    wire w_cFork5_cFork5_drive_free_delay_1;
    (* dont_touch="true" *) delay_mmu #(2) Fork4_cFork5_drive_free_delay (
        .inR (w_cFork5_cFork5_drive_free_1),
        .rstn(rstn),
        .outR(w_cFork5_cFork5_drive_free_delay_1)
    );

    wire w_cFork5_cMerge1_drive_1;
    wire w_cMerge1_cFork5_free_1;

    cSelector2_mmu #(2) cFork5 (
        .rstn        (rstn),
        .i_select    (w_cFork5_select_2),
        .i_drive     (w_cFork4_cFork5_drive_1),
        .o_free      (w_cFork5_cFork4_free_1),
        .o_driveNext0(w_cFork5_cMerge1_drive_1),
        .i_freeNext0 (w_cMerge1_cFork5_free_1),
        .o_driveNext1(w_cFork5_cFork5_drive_free_1),
        .i_freeNext1 (w_cFork5_cFork5_drive_free_delay_1)
    );

    //---------------------- cMerge1 & cFifo2: Update plru ----------------------//

    wire w_cMerge1_cFifo2_drive_1;
    wire w_cFifo2_cMerge1_free_1;

    cMutexMerge2_mmu #(2, 1) cMerge1 (
        .rstn       (rstn),
        .i_drive0   (w_cFork3_cMerge1_drive_1),
        .i_data0    (1'b0),
        .o_free0    (w_cMerge1_cFork3_free_1),
        .i_drive1   (w_cFork5_cMerge1_drive_1),
        .i_data1    (1'b0),
        .o_free1    (w_cMerge1_cFork5_free_1),
        .o_driveNext(w_cMerge1_cFifo2_drive_1),
        .o_data     (),
        .i_freeNext (w_cFifo2_cMerge1_free_1)
    );

    wire w_cFifo2_fire_1;
    cLastFifo1_mmu cFifo2 (
        .rstn       (rstn),
        .i_drive    (w_cMerge1_cFifo2_drive_1),
        .o_free     (w_cFifo2_cMerge1_free_1),
        .o_driveNext(),
        .o_fire_1   (w_cFifo2_fire_1)
    );

    wire [1 : 0] w_update_en_2;
    wire [7 : 0] w_update_position_8;
    wire [3 : 0] w_update_way_4;

    assign w_update_en_2       = (r_l22_hit_4 != 4'b0) ? 2'b01 : (r_l21_hit_4 != 4'b0) ? 2'b10 : 2'b0;
    assign w_update_position_8 = (r_l22_hit_4 != 4'b0) ? {w_req_vaddr_32[19:12]} : (r_l21_hit_4 != 4'b0) ? {2'b0, w_req_vaddr_32[27:22]} : 8'b0;
    assign w_update_way_4      = (r_l22_hit_4 != 4'b0) ? r_l22_hit_4 : (r_l21_hit_4 != 4'b0) ? r_l21_hit_4 : 4'b0;

    //---------------------- cFifo3: Save ptw writeback information ----------------------//
    wire w_cFifo3_fire_1;
    wire w_cFifo3_cMerge2_drive_1;
    wire w_cMerge2_cFifo3_free_1;

    cFifo1_mmu cFifo3 (
        .rstn       (rstn),
        .i_drive    (i_ptw_l2tlb_drive_1),
        .o_free     (o_l2tlb_ptw_free_1),
        .o_driveNext(w_cFifo3_cMerge2_drive_1),
        .i_freeNext (w_cMerge2_cFifo3_free_1),
        .o_fire_1   (w_cFifo3_fire_1)
    );

    wire [ 1:0] w_wb_en_2;
    wire [31:0] w_wb_pte_32;
    assign {w_wb_en_2, w_wb_pte_32} = i_ptw_l2tlb_data_34;

    reg [ 1:0] r_wb_en_2;
    reg [31:0] r_wb_pte_32;

    always @(posedge w_cFifo3_fire_1 or negedge rstn) begin
        if (!rstn) begin
            r_wb_en_2   <= 0;
            r_wb_pte_32 <= 0;
        end else begin
            r_wb_en_2   <= w_wb_en_2;
            r_wb_pte_32 <= w_wb_pte_32;
        end
    end

    wire [ 3:0] w_wb_writeEn_4;
    wire [ 3:0] w_wb_l21_writeEn_4;
    wire [ 5:0] w_wb_l21_writeAddr_6;
    wire [23:0] w_wb_l21_writeData_24;
    wire [23:0] w_wb_l21_writeTag_24;

    wire [ 3:0] w_wb_l22_writeEn_4;
    wire [ 7:0] w_wb_l22_writeAddr_8;
    wire [23:0] w_wb_l22_writeData_24;
    wire [31:0] w_wb_l22_writeTag_32;

    assign w_wb_l21_writeEn_4    = r_wb_en_2[1] ? w_wb_writeEn_4 : 4'b0;
    assign w_wb_l21_writeAddr_6  = w_req_vaddr_32[27:22];
    assign w_wb_l21_writeData_24 = {2'b0, r_wb_pte_32[31:10]};
    assign w_wb_l21_writeTag_24  = {1'b0, w_satp_asid_9, w_req_vaddr_32[31:28], r_wb_pte_32[9:0]};

    assign w_wb_l22_writeEn_4    = r_wb_en_2[0] ? w_wb_writeEn_4 : 4'b0;
    assign w_wb_l22_writeAddr_8  = w_req_vaddr_32[19:12];
    assign w_wb_l22_writeData_24 = {2'b0, r_wb_pte_32[31:10]};
    assign w_wb_l22_writeTag_32  = {1'b0, w_satp_asid_9, w_req_vaddr_32[31:20], r_wb_pte_32[9:0]};

    //---------------------- cFifo4: Reset generates a primary clk signal to activate the sram ----------------------//
    wire w_rstn_delay_1;
    (* dont_touch="true" *) delay_mmu #(2) rstn_delay (
        .inR (rstn),
        .rstn(rstn),
        .outR(w_rstn_delay_1)
    );

    wire w_cFifo4_cMerge2_drive_1;
    wire w_cMerge2_cFifo4_free_1;
    cFifo1_mmu cFifo4 (
        .rstn       (rstn),
        .i_drive    (w_rstn_delay_1),
        .o_free     (),
        .o_driveNext(w_cFifo4_cMerge2_drive_1),
        .i_freeNext (1'b0),
        .o_fire_1   ()
    );

    //---------------------- cMerge2: Combining write-back and refresh signals ----------------------//
    wire [ 8:0] w_flush_asid_9;
    wire [19:0] w_flush_vpn_20;
    wire [ 4:0] w_flush_rs1_5;
    wire [ 4:0] w_flush_rs2_5;
    assign {w_flush_rs2_5, w_flush_rs1_5, w_flush_asid_9, w_flush_vpn_20} = i_sfence_l2tlb_data_39;
    wire [1:0] t_flush_en_2;
    assign t_flush_en_2 = (w_flush_rs1_5 == 5'b0) ? 2'b10 : 2'b01;

    wire w_cMerge2_cFifo5_drive_1;
    wire w_cFifo5_cMerge2_free_1;
    cMutexMerge4_mmu #(4, 128) cMerge2 (
        .rstn       (rstn),
        .i_drive0   (i_sfence_l2tlb_drive_1),
        .i_data0    ({t_flush_en_2, 4'b0, w_flush_vpn_20[15:10], 24'b0, 24'b0, 4'b0, w_flush_vpn_20[7:0], 24'b0, 32'b0}),
        .o_free0    (o_l2tlb_sfence_free_1),
        .i_drive1   (w_cFifo3_cMerge2_drive_1),
        .i_data1    ({2'b0, w_wb_l21_writeEn_4, w_wb_l21_writeAddr_6, w_wb_l21_writeData_24, w_wb_l21_writeTag_24, w_wb_l22_writeEn_4, w_wb_l22_writeAddr_8, w_wb_l22_writeData_24, w_wb_l22_writeTag_32}),
        .o_free1    (w_cMerge2_cFifo3_free_1),
        .i_drive2   (w_cFifo4_cMerge2_drive_1),
        .i_data2    (128'b0),
        .o_free2    (w_cMerge2_cFifo4_free_1),
        .i_drive3   (w_cFork1_cMerge2_drive_1),
        .i_data3    (128'b0),
        .o_free3    (w_cMerge2_cFork1_free_1),
        .o_driveNext(w_cMerge2_cFifo5_drive_1),
        .i_freeNext (w_cFifo5_cMerge2_free_1),
        .o_data     ({w_flush_en_2, w_l21_writeEn_4, w_l21_writeAddr_6, w_l21_writeData_24, w_l21_writeTag_24, w_l22_writeEn_4, w_l22_writeAddr_8, w_l22_writeData_24, w_l22_writeTag_32})
    );

    //---------------------- cFifo5: Write back secondary tlb information ----------------------//
    wire w_cMerge2_cFifo5_drive_delay_1;
    (* dont_touch="true" *) delay_mmu #(4) cMerge2_cFifo5_drive_delay (
        .inR (w_cMerge2_cFifo5_drive_1),
        .rstn(rstn),
        .outR(w_cMerge2_cFifo5_drive_delay_1)
    );


    cLastFifo1_mmu cFifo5 (
        .rstn       (rstn),
        .i_drive    (w_cMerge2_cFifo5_drive_delay_1),
        .o_free     (w_cFifo5_cMerge2_free_1),
        .o_driveNext(),
        .o_fire_1   (w_cFifo5_fire_1)
    );

    //---------------------- Replacement unit instantiation ----------------------//
    mmu_l2tlb_replace mmu_l2tlb_replace (
        .rstn                    (rstn),
        .clk                     (w_cFifo2_fire_1),
        .i_update_en_2           (w_update_en_2),
        .i_update_position_8     (w_update_position_8),
        .i_update_way_4          (w_update_way_4),
        .i_replace_en_2          (r_wb_en_2),
        .i_l21_valid_4           (r_l21_valid_4),
        .i_l22_valid_4           (r_l22_valid_4),
        .i_l21_replace_position_6(w_req_vaddr_32[27:22]),
        .i_l22_replace_position_8(w_req_vaddr_32[19:12]),
        .o_replace_way_4         (w_wb_writeEn_4)
    );

endmodule

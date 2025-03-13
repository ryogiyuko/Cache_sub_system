`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  mmu_ptw
// Author:  Yang Yuyuan
// Date:    2024/10/10
// Description: 
//======================================================

module mmu_ptw (
    input         rstn,
    // input, l2 -> ptw, 2Level(2b) + l1Way(4b) + reqIndex(6b) + reqType(2b) + reqVaddr(32b) + satpPpn(22b) + cpuMode(2b) + satpAsid(9b) + mstatusMxr(1b) + mstatusSum(1b)
    input         i_l2_ptw_drive_1,
    output        o_ptw_l2_free_1,
    input  [80:0] i_l2_ptw_data_81,

    // input, dcache -> ptw, pte(32b)
    input         i_dcache_ptw_drive_1,
    input  [31:0] i_dcache_ptw_data_32,
    output        o_ptw_dcache_free_1,

    // output, ptw -> ifuexp, 
    output       o_ptw_ifuexp_drive_1,
    input        i_ifuexp_ptw_free_1,
    output [4:0] o_ptw_ifuexp_data_5,

    // output, ptw -> lsuexp, 
    output        o_ptw_lsuexp_drive_1,
    input         i_lsuexp_ptw_free_1,
    output [10:0] o_ptw_lsuexp_data_11,

    // output, ptw -> pmp0(pteAddr),  l1tlbIndex(4b) + reqIndex(6b) + pteAddr(34b) + cpuMode(2b) + reqType(2b)
    output        o_ptw_pmp0_drive_1,
    input         i_pmp0_ptw_free_1,
    output [47:0] o_ptw_pmp0_data_48,

    // output, ptw -> l1, reqType(2b) + l1Way(4b) + wbEn(2b) + wbPte(32b)
    output        o_ptw_l1_drive_1,
    input         i_l1_ptw_free_1,
    output [39:0] o_ptw_l1_data_40,

    // output, ptw -> l2,  wbEn(2b) + wbPte(32b)
    output        o_ptw_l2_drive_1,
    input         i_l2_ptw_free_1,
    output [33:0] o_ptw_l2_data_34,

    // output, ptw -> pmp1(pAddr), l1tlbIndex(4b) + reqIndex(6b) + pAddr(34b) + cpuMode(2b) + reqType(2b)
    output        o_ptw_pmp1_drive_1,
    input         i_pmp1_ptw_free_1,
    output [47:0] o_ptw_pmp1_data_48
);


    wire [ 1:0] w_l2_level_2;
    wire [ 3:0] w_l1_way_4;
    wire [ 5:0] w_req_index_6;
    wire [ 1:0] w_req_type_2;
    wire [31:0] w_req_vaddr_32;
    wire [21:0] w_l2_ppn_22;
    wire [ 1:0] w_cpu_mode_2;
    wire [ 8:0] w_satp_asid_9;
    wire        w_mstatus_mxr_1;
    wire        w_mstatus_sum_1;

    assign {w_l2_level_2, w_l1_way_4, w_req_index_6, w_req_type_2, w_req_vaddr_32, w_l2_ppn_22, w_cpu_mode_2, w_satp_asid_9, w_mstatus_mxr_1, w_mstatus_sum_1} = i_l2_ptw_data_81;

    //---------------------- cMerge1: Updating information such as the number of pte levels read ----------------------//
    wire w_l2_ptw_drive_delay_1;
    (* dont_touch="true" *) delay_mmu #(4) l2_ptw_drive_delay (
        .inR (i_l2_ptw_drive_1),
        .rstn(rstn),
        .outR(w_l2_ptw_drive_delay_1)
    );

    wire [ 1:0] w_pte_level_2;
    wire [21:0] w_pte_ppn_22;
    reg  [ 1:0] r_pte_level_2;
    reg  [21:0] r_pte_ppn_22;
    wire [ 1:0] w_newpte_level_2;
    wire [21:0] w_newpte_ppn_22;
    reg  [31:0] r_pte_32;

    assign w_newpte_level_2 = r_pte_level_2 + 1'b1;
    assign w_newpte_ppn_22  = r_pte_32[31:10];

    wire w_cFork3_cMerge1_drive_1;
    wire w_cMerge1_cFork3_free_1;
    wire w_cMerge1_cFifo1_drive_1;
    wire w_cFifo1_cMerge1_free_1;

    cMutexMerge2_mmu #(2, 24) cMerge1 (
        .rstn       (rstn),
        .i_drive0   (w_l2_ptw_drive_delay_1),
        .i_data0    ({w_l2_level_2, w_l2_ppn_22}),
        .o_free0    (o_ptw_l2_free_1),
        .i_drive1   (w_cFork3_cMerge1_drive_1),
        .i_data1    ({w_newpte_level_2, w_newpte_ppn_22}),
        .o_free1    (w_cMerge1_cFork3_free_1),
        .o_driveNext(w_cMerge1_cFifo1_drive_1),
        .o_data     ({w_pte_level_2, w_pte_ppn_22}),
        .i_freeNext (w_cFifo1_cMerge1_free_1)
    );

    //---------------------- cFifo1: Saves information such as the number of register levels ----------------------//

    wire w_cFifo1_fire_1;
    wire w_ptw_pmp0_drive_before_1;
    cFifo1_mmu cFifo1 (
        .rstn       (rstn),
        .i_drive    (w_cMerge1_cFifo1_drive_1),
        .o_free     (w_cFifo1_cMerge1_free_1),
        .o_driveNext(w_ptw_pmp0_drive_before_1),
        .i_freeNext (i_pmp0_ptw_free_1),
        .o_fire_1   (w_cFifo1_fire_1)
    );

    (* dont_touch="true" *) delay_mmu #(1) ptw_pmp0_drive_delay (
        .inR (w_ptw_pmp0_drive_before_1),
        .rstn(rstn),
        .outR(o_ptw_pmp0_drive_1)
    );

    always @(negedge rstn or posedge w_cFifo1_fire_1) begin
        if (!rstn) begin
            r_pte_level_2 <= 0;
            r_pte_ppn_22  <= 0;
        end else begin
            r_pte_level_2 <= w_pte_level_2;
            r_pte_ppn_22  <= w_pte_ppn_22;
        end
    end

    assign o_ptw_pmp0_data_48 = (r_pte_level_2 == 2'b00) ? {w_l1_way_4, w_req_index_6, {r_pte_ppn_22, w_req_vaddr_32[31:22], 2'b00}, w_cpu_mode_2, w_req_type_2} : (r_pte_level_2 == 2'b01) ? {w_l1_way_4, w_req_index_6, {r_pte_ppn_22, w_req_vaddr_32[21:12], 2'b00}, w_cpu_mode_2, w_req_type_2} : 48'b0;

    //---------------------- cFifo2: Save pte information ----------------------//
    wire w_cFifo2_cFork1_drive_1;
    wire w_cFork1_cFifo2_free_1;
    wire w_cFifo2_fire_1;

    cFifo1_mmu cFifo2 (
        .rstn       (rstn),
        .i_drive    (i_dcache_ptw_drive_1),
        .o_free     (o_ptw_dcache_free_1),
        .o_driveNext(w_cFifo2_cFork1_drive_1),
        .i_freeNext (w_cFork1_cFifo2_free_1),
        .o_fire_1   (w_cFifo2_fire_1)
    );

    always @(negedge rstn or posedge w_cFifo2_fire_1) begin
        if (!rstn) begin
            r_pte_32 <= 0;
        end else begin
            r_pte_32 <= i_dcache_ptw_data_32;
        end
    end

    //---------------------- cFork1: Determines if the page table entries obtained are correct and are leaf table entries ----------------------//
    wire w_isPte_1;
    wire w_pteFault_1;
    assign w_isPte_1 = r_pte_32[3:1] == 3'b000 ? 1'b0 : 1'b1;
    assign  w_pteFault_1 = (r_pte_32[0] == 1'b0) ||
        (r_pte_32[2] == 1'b1 && r_pte_32[1] == 1'b0 && w_isPte_1) ||
        (w_req_type_2 == 2'b00 && r_pte_32[3] == 1'b0 && w_isPte_1) ||
        (w_req_type_2 == 2'b10 && r_pte_32[2] == 1'b0 && w_isPte_1) ||
        (w_mstatus_mxr_1 == 1'b0 && w_req_type_2 == 2'b11 && r_pte_32[1] == 1'b0) ||
        (w_mstatus_mxr_1 == 1'b0 && w_req_type_2 == 2'b11 && r_pte_32[3] == 1'b0 && r_pte_32[1] == 1'b0) ||
        (r_pte_32[4] == 1'b1 && w_cpu_mode_2 == 2'b01 && w_req_type_2[1] == 1'b0) ||
        (w_mstatus_sum_1 == 1'b0 && r_pte_32[4] == 1'b1 && w_cpu_mode_2 == 2'b01 && w_req_type_2[1] == 1'b1) ||
        (r_pte_32[3:1] == 3'b0 && r_pte_level_2 == 2'b01);

    wire [3:0] w_cFork1_select_4;

    assign w_cFork1_select_4[0] = (w_pteFault_1 == 1'b1) && (w_req_type_2[1] == 1'b0);
    assign w_cFork1_select_4[1] = (w_pteFault_1 == 1'b1) && (w_req_type_2[1] == 1'b1);
    assign w_cFork1_select_4[2] = (w_pteFault_1 == 1'b0) && (w_isPte_1 == 1'b1);
    assign w_cFork1_select_4[3] = (w_pteFault_1 == 1'b0) && (w_isPte_1 == 1'b0);

    wire w_cFork1_cFork2_drive_1;
    wire w_cFork2_cFork1_free_1;
    wire w_cFork1_cFork3_drive_1;
    wire w_cFork3_cFork1_free_1;

    cSelector4_mmu #(4) cFork1 (
        .rstn        (rstn),
        .i_select    (w_cFork1_select_4),
        .i_drive     (w_cFifo2_cFork1_drive_1),
        .o_free      (w_cFork1_cFifo2_free_1),
        .o_driveNext0(o_ptw_ifuexp_drive_1),
        .i_freeNext0 (i_ifuexp_ptw_free_1),
        .o_driveNext1(o_ptw_lsuexp_drive_1),
        .i_freeNext1 (i_lsuexp_ptw_free_1),
        .o_driveNext2(w_cFork1_cFork2_drive_1),
        .i_freeNext2 (w_cFork2_cFork1_free_1),
        .o_driveNext3(w_cFork1_cFork3_drive_1),
        .i_freeNext3 (w_cFork3_cFork1_free_1)
    );

    assign o_ptw_ifuexp_data_5  = w_cFork1_select_4[0] ? 5'd12 : 5'b0;
    assign o_ptw_lsuexp_data_11 = (w_cFork1_select_4[1] == 1'b1 && w_req_type_2 == 2'b10) ? {w_req_index_6, 5'd15} : (w_cFork1_select_4[1] == 1'b1 && w_req_type_2 == 2'b11) ? {w_req_index_6, 5'd13} : 11'b0;

    //---------------------- cFork2: Ptw no errors, write back l1, l2, send to pmp ----------------------//
    wire w_cFork2_cMerge2_drive_1;
    wire w_cMerge2_cFork2_free_1;

    cSplitter3_mmu #(3) cFork2 (
        .rstn        (rstn),
        .i_drive     (w_cFork1_cFork2_drive_1),
        .o_free      (w_cFork2_cFork1_free_1),
        .o_driveNext0(o_ptw_pmp1_drive_1),
        .i_freeNext0 (i_pmp1_ptw_free_1),
        .o_driveNext1(o_ptw_l1_drive_1),
        .i_freeNext1 (i_l1_ptw_free_1),
        .o_driveNext2(w_cFork2_cMerge2_drive_1),
        .i_freeNext2 (w_cMerge2_cFork2_free_1)
    );

    wire [1:0] w_wbl1_type_2;
    wire [1:0] w_wbl2_type_2;
    assign w_wbl1_type_2      = (r_pte_level_2 == 2'b00) ? 2'b10 : (r_pte_level_2 == 2'b01) ? 2'b01 : 2'b00;
    assign w_wbl2_type_2      = (r_pte_level_2 == 2'b00) ? 2'b10 : (r_pte_level_2 == 2'b01) ? 2'b01 : 2'b00;

    assign o_ptw_pmp1_data_48 = {w_l1_way_4, w_req_index_6, {r_pte_32[31:10], w_req_vaddr_32[11:0]}, w_cpu_mode_2, w_req_type_2};
    assign o_ptw_l1_data_40   = {w_req_type_2, w_l1_way_4, w_wbl1_type_2, r_pte_32};

    //---------------------- cFork3: Find leaf table entries and write back page directory entries ----------------------//

    wire w_cFork3_cMerge2_drive_1;
    wire w_cMerge2_cFork3_free_1;

    cSplitter2_mmu #(2) cFork3 (
        .rstn        (rstn),
        .i_drive     (w_cFork1_cFork3_drive_1),
        .o_free      (w_cFork3_cFork1_free_1),
        .o_driveNext0(w_cFork3_cMerge2_drive_1),
        .i_freeNext0 (w_cMerge2_cFork3_free_1),
        .o_driveNext1(w_cFork3_cMerge1_drive_1),
        .i_freeNext1 (w_cMerge1_cFork3_free_1)
    );

    //---------------------- cMerge2: write back l2 ----------------------//
    cMutexMerge2_mmu #(2, 34) cMerge2 (
        .rstn       (rstn),
        .i_drive0   (w_cFork2_cMerge2_drive_1),
        .i_data0    ({w_wbl2_type_2, r_pte_32}),
        .o_free0    (w_cMerge2_cFork2_free_1),
        .i_drive1   (w_cFork3_cMerge2_drive_1),
        .i_data1    ({2'b10, r_pte_32}),
        .o_free1    (w_cMerge2_cFork3_free_1),
        .o_driveNext(o_ptw_l2_drive_1),
        .o_data     (o_ptw_l2_data_34),
        .i_freeNext (i_l2_ptw_free_1)
    );

endmodule

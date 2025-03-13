`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  mmu_top
// Author:  Yang Yuyuan
// Date:    2024/11/18
// Description: 
// instType: 00:if  10:store  11:load
// cpuMode: 00:U  01:S  11:M
//======================================================

module mmu_top (
    input rstn,

    // input, ifu -> mmu, va(32b)
    input         i_ifu_mmu_drive_1,
    output        o_mmu_ifu_free_1,
    input  [31:0] i_ifu_mmu_data_32,

    // input, exe0 -> mmu, index(6b) + reqType(2b) + va(32b)
    input         i_exe0_mmu_drive_1,
    output        o_mmu_exe0_free_1,
    input  [39:0] i_exe0_mmu_data_40,

    // input, exe1 -> mmu, index(6b) + reqType(2b) + va(32b)
    input         i_exe1_mmu_drive_1,
    output        o_mmu_exe1_free_1,
    input  [39:0] i_exe1_mmu_data_40,

    // input, exe2 -> mmu, index(6b) + reqType(2b) + va(32b)
    input         i_exe2_mmu_drive_1,
    output        o_mmu_exe2_free_1,
    input  [39:0] i_exe2_mmu_data_40,

    // input, exe3 -> mmu, index(6b) + reqType(2b) + va(32b)
    input         i_exe3_mmu_drive_1,
    output        o_mmu_exe3_free_1,
    input  [39:0] i_exe3_mmu_data_40,

    // input, csr -> mmu, pmpcsr(640b) + cpuMode(2b) + satp(32b) + mstatusMxr(1b) + mstatusSum(1b) + mstatusMprv(1b) + mstatusMpp(2b)
    input [678:0] i_csr_mmu_data_679,

    // input, sfence -> mmu, x[rs2](32b) + rs2(5b) + x[rs1](32b) + rs1(5b) + reqIndex(6b)
    input         i_sfence_mmu_drive_1,
    output        o_mmu_sfence_free_1,
    input  [79:0] i_sfence_mmu_data_80,

    // input, dcache -> mmu, pte(32b)
    input         i_dcache_mmu_drive_1,
    output        o_mmu_dcache_free_1,
    input  [31:0] i_dcache_mmu_data_32,

    // output, mmu -> ifu, pa(34b)
    output        o_mmu_ifu_drive_1,
    input         i_ifu_mmu_free_1,
    output [33:0] o_mmu_ifu_data_34,

    // output, mmu -> lsu0, pa(34b)
    output        o_mmu_lsu0_drive_1,
    input         i_lsu0_mmu_free_1,
    output [33:0] o_mmu_lsu0_data_34,

    // output, mmu -> lsu1, pa(34b)
    output        o_mmu_lsu1_drive_1,
    input         i_lsu1_mmu_free_1,
    output [33:0] o_mmu_lsu1_data_34,

    // output, mmu -> lsu2, pa(34b)
    output        o_mmu_lsu2_drive_1,
    input         i_lsu2_mmu_free_1,
    output [33:0] o_mmu_lsu2_data_34,

    // output, mmu -> lsu3, pa(34b)
    output        o_mmu_lsu3_drive_1,
    input         i_lsu3_mmu_free_1,
    output [33:0] o_mmu_lsu3_data_34,

    // output, mmu -> dcache0, ptePa(34b)
    output        o_mmu_dcache0_drive_1,
    input         i_dcache0_mmu_free_1,
    output [33:0] o_mmu_dcache0_data_34,

    // output, mmu -> dcache1, ptePa(34b)
    output        o_mmu_dcache1_drive_1,
    input         i_dcache1_mmu_free_1,
    output [33:0] o_mmu_dcache1_data_34,

    // output, mmu -> dcache2, ptePa(34b)
    output        o_mmu_dcache2_drive_1,
    input         i_dcache2_mmu_free_1,
    output [33:0] o_mmu_dcache2_data_34,

    // output, mmu -> dcache3, ptePa(34b)
    output        o_mmu_dcache3_drive_1,
    input         i_dcache3_mmu_free_1,
    output [33:0] o_mmu_dcache3_data_34,

    // output, mmu -> retire, index(6b) + expIndex(5b)
    output        o_mmu_retire_drive_1,
    input         i_retire_mmu_free_1,
    output [10:0] o_mmu_retire_data_11,

    // output, mmu -> sretire, index(6b) + expIndex(5b)
    output       o_mmu_sretire_drive_1,
    input        i_sretire_mmu_free_1,
    output [5:0] o_mmu_sretire_data_6,

    // output, mmu -> exp, expIndex(5b)
    output       o_mmu_exp_drive_1,
    input        i_exp_mmu_free_1,
    output [4:0] o_mmu_exp_data_5
);

    //---------------------- cFifo1: Save sfence information ----------------------//
    wire        w_cFifo1_cFork1_drive_1;
    wire        w_cFork1_cFifo1_free_1;
    wire        w_cFifo1_fire_1;
    reg  [ 8:0] r_flush_asid_9;
    reg  [19:0] r_flush_vpn_20;
    reg  [ 4:0] r_flush_rs2_5;
    reg  [ 4:0] r_flush_rs1_5;
    reg  [ 5:0] r_flush_index_6;
    wire [38:0] w_sfence_data_39;


    cFifo1_mmu cFifo1 (
        .i_drive    (i_sfence_mmu_drive_1),
        .i_freeNext (w_cFork1_cFifo1_free_1),
        .o_free     (),
        .o_driveNext(w_cFifo1_cFork1_drive_1),
        .o_fire_1   (w_cFifo1_fire_1),
        .rstn       (rstn)
    );

    always @(posedge w_cFifo1_fire_1 or negedge rstn) begin
        if (!rstn) begin
            r_flush_rs1_5   <= 0;
            r_flush_rs2_5   <= 0;
            r_flush_asid_9  <= 0;
            r_flush_vpn_20  <= 0;
            r_flush_index_6 <= 0;
        end else begin
            r_flush_rs1_5   <= i_sfence_mmu_data_80[10:6];
            r_flush_rs2_5   <= i_sfence_mmu_data_80[47:43];
            r_flush_asid_9  <= i_sfence_mmu_data_80[56:48];
            r_flush_vpn_20  <= i_sfence_mmu_data_80[30:11];
            r_flush_index_6 <= i_sfence_mmu_data_80[5 : 0];
        end
    end

    assign w_sfence_data_39 = {r_flush_rs2_5, r_flush_rs1_5, r_flush_asid_9, r_flush_vpn_20};

    //---------------------- cFork1: Drive the TLB to perform a refresh operation ----------------------//
    wire w_sfence_i0_drive_1;
    wire w_i0_sfence_free_1;
    wire w_sfence_d0_drive_1;
    wire w_d0_sfence_free_1;
    wire w_sfence_d1_drive_1;
    wire w_d1_sfence_free_1;
    wire w_sfence_d2_drive_1;
    wire w_d2_sfence_free_1;
    wire w_sfence_d3_drive_1;
    wire w_d3_sfence_free_1;
    wire w_sfence_l2_drive_1;
    wire w_l2_sfence_free_1;

    cSplitter6_mmu cFork1 (
        .i_drive     (w_cFifo1_cFork1_drive_1),
        .o_free      (w_cFork1_cFifo1_free_1),
        .o_driveNext0(w_sfence_i0_drive_1),
        .i_freeNext0 (w_i0_sfence_free_1),
        .o_driveNext1(w_sfence_d0_drive_1),
        .i_freeNext1 (w_d0_sfence_free_1),
        .o_driveNext2(w_sfence_d1_drive_1),
        .i_freeNext2 (w_d1_sfence_free_1),
        .o_driveNext3(w_sfence_d2_drive_1),
        .i_freeNext3 (w_d2_sfence_free_1),
        .o_driveNext4(w_sfence_d3_drive_1),
        .i_freeNext4 (w_d3_sfence_free_1),
        .o_driveNext5(w_sfence_l2_drive_1),
        .i_freeNext5 (w_l2_sfence_free_1),
        .rstn        (rstn)
    );

    wire w_sfence_isend_1;
    (* dont_touch="true" *) delay_mmu #(40) cFork1_cFork3_drive_delay (
        .inR (w_cFork1_cFifo1_free_1),
        .rstn(rstn),
        .outR(w_sfence_isend_1)
    );

    assign o_mmu_sfence_free_1   = w_sfence_isend_1;
    assign o_mmu_sretire_drive_1 = w_sfence_isend_1;
    assign o_mmu_sretire_data_6  = r_flush_index_6;

    //---------------------- mmu_l1tlb_i0 ----------------------//
    wire        w_l2_i0_drive_1;
    wire [33:0] w_l2_i0_data_34;
    wire        w_i0_l2_free_1;
    wire        w_ptw_i0_drive_1;
    wire [33:0] w_ptw_i0_data_34;
    wire        w_i0_ptw_free_1;
    wire        w_i0_pmp0_drive_1;
    wire [47:0] w_i0_pmp0_data_48;
    wire        w_pmp0_i0_free_1;
    wire        w_i0_pmp1_drive_1;
    wire [47:0] w_i0_pmp1_data_48;
    wire        w_pmp1_i0_free_1;
    wire        w_i0_ifuexp_drive_1;
    wire [ 4:0] w_i0_ifuexp_data_5;
    wire        w_ifuexp_i0_free_1;
    wire        w_i0_l2_drive_1;
    wire [74:0] w_i0_l2_data_75;
    wire        w_l2_i0_free_1;

    mmu_l1tlb mmu_l1tlb_i0 (
        .rstn                  (rstn),
        .i_mmu_l1tlb_drive_1   (i_ifu_mmu_drive_1),
        .i_mmu_l1tlb_data_79   ({6'b0, 2'b0, i_ifu_mmu_data_32, i_csr_mmu_data_679[38:0]}),
        .o_l1tlb_mmu_free_1    (),
        .i_sfence_l1tlb_drive_1(w_sfence_i0_drive_1),
        .i_sfence_l1tlb_data_39(w_sfence_data_39),
        .o_l1tlb_sfence_free_1 (w_i0_sfence_free_1),
        .i_l2_l1tlb_drive_1    (w_l2_i0_drive_1),
        .i_l2_l1tlb_data_34    (w_l2_i0_data_34),
        .o_l1tlb_l2_free_1     (w_i0_l2_free_1),
        .i_ptw_l1tlb_drive_1   (w_ptw_i0_drive_1),
        .i_ptw_l1tlb_data_34   (w_ptw_i0_data_34),
        .o_l1tlb_ptw_free_1    (w_i0_ptw_free_1),
        .o_l1tlb_pmp0_drive_1  (w_i0_pmp0_drive_1),
        .o_l1tlb_pmp0_data_48  (w_i0_pmp0_data_48),
        .i_pmp0_l1tlb_free_1   (w_pmp0_i0_free_1),
        .o_l1tlb_pmp1_drive_1  (w_i0_pmp1_drive_1),
        .o_l1tlb_pmp1_data_48  (w_i0_pmp1_data_48),
        .i_pmp1_l1tlb_free_1   (w_pmp1_i0_free_1),
        .o_l1tlb_ifuexp_drive_1(w_i0_ifuexp_drive_1),
        .o_l1tlb_ifuexp_data_5 (w_i0_ifuexp_data_5),
        .i_ifuexp_l1tlb_free_1 (w_ifuexp_i0_free_1),
        .o_l1tlb_lsuexp_drive_1(),
        .o_l1tlb_lsuexp_data_11(),
        .i_lsuexp_l1tlb_free_1 (1'b0),
        .o_l1tlb_l2_drive_1    (w_i0_l2_drive_1),
        .o_l1tlb_l2_data_75    (w_i0_l2_data_75),
        .i_l2_l1tlb_free_1     (w_l2_i0_free_1)
    );


    //---------------------- mmu_l1tlb_d0 ----------------------//
    wire        w_l2_d0_drive_1;
    wire [33:0] w_l2_d0_data_34;
    wire        w_d0_l2_free_1;
    wire        w_ptw_d0_drive_1;
    wire [33:0] w_ptw_d0_data_34;
    wire        w_d0_ptw_free_1;
    wire        w_d0_pmp0_drive_1;
    wire [47:0] w_d0_pmp0_data_48;
    wire        w_pmp0_d0_free_1;
    wire        w_d0_pmp1_drive_1;
    wire [47:0] w_d0_pmp1_data_48;
    wire        w_pmp1_d0_free_1;
    wire        w_d0_lsuexp_drive_1;
    wire [10:0] w_d0_lsuexp_data_11;
    wire        w_lsuexp_d0_free_1;
    wire        w_d0_l2_drive_1;
    wire [74:0] w_d0_l2_data_75;
    wire        w_l2_d0_free_1;

    mmu_l1tlb mmu_l1tlb_d0 (
        .rstn                  (rstn),
        .i_mmu_l1tlb_drive_1   (i_exe0_mmu_drive_1),
        .i_mmu_l1tlb_data_79   ({i_exe0_mmu_data_40, i_csr_mmu_data_679[38:0]}),
        .o_l1tlb_mmu_free_1    (),
        .i_sfence_l1tlb_drive_1(w_sfence_d0_drive_1),
        .i_sfence_l1tlb_data_39(w_sfence_data_39),
        .o_l1tlb_sfence_free_1 (w_d0_sfence_free_1),
        .i_l2_l1tlb_drive_1    (w_l2_d0_drive_1),
        .i_l2_l1tlb_data_34    (w_l2_d0_data_34),
        .o_l1tlb_l2_free_1     (w_d0_l2_free_1),
        .i_ptw_l1tlb_drive_1   (w_ptw_d0_drive_1),
        .i_ptw_l1tlb_data_34   (w_ptw_d0_data_34),
        .o_l1tlb_ptw_free_1    (w_d0_ptw_free_1),
        .o_l1tlb_pmp0_drive_1  (w_d0_pmp0_drive_1),
        .o_l1tlb_pmp0_data_48  (w_d0_pmp0_data_48),
        .i_pmp0_l1tlb_free_1   (w_pmp0_d0_free_1),
        .o_l1tlb_pmp1_drive_1  (w_d0_pmp1_drive_1),
        .o_l1tlb_pmp1_data_48  (w_d0_pmp1_data_48),
        .i_pmp1_l1tlb_free_1   (w_pmp1_d0_free_1),
        .o_l1tlb_ifuexp_drive_1(),
        .o_l1tlb_ifuexp_data_5 (),
        .i_ifuexp_l1tlb_free_1 (1'b0),
        .o_l1tlb_lsuexp_drive_1(w_d0_lsuexp_drive_1),
        .o_l1tlb_lsuexp_data_11(w_d0_lsuexp_data_11),
        .i_lsuexp_l1tlb_free_1 (w_lsuexp_d0_free_1),
        .o_l1tlb_l2_drive_1    (w_d0_l2_drive_1),
        .o_l1tlb_l2_data_75    (w_d0_l2_data_75),
        .i_l2_l1tlb_free_1     (w_l2_d0_free_1)
    );


    //---------------------- mmu_l1tlb_d1 ----------------------//
    wire        w_l2_d1_drive_1;
    wire [33:0] w_l2_d1_data_34;
    wire        w_d1_l2_free_1;
    wire        w_ptw_d1_drive_1;
    wire [33:0] w_ptw_d1_data_34;
    wire        w_d1_ptw_free_1;
    wire        w_d1_pmp0_drive_1;
    wire [47:0] w_d1_pmp0_data_48;
    wire        w_pmp0_d1_free_1;
    wire        w_d1_pmp1_drive_1;
    wire [47:0] w_d1_pmp1_data_48;
    wire        w_pmp1_d1_free_1;
    wire        w_d1_lsuexp_drive_1;
    wire [10:0] w_d1_lsuexp_data_11;
    wire        w_lsuexp_d1_free_1;
    wire        w_d1_l2_drive_1;
    wire [74:0] w_d1_l2_data_75;
    wire        w_l2_d1_free_1;

    mmu_l1tlb mmu_l1tlb_d1 (
        .rstn                  (rstn),
        .i_mmu_l1tlb_drive_1   (i_exe1_mmu_drive_1),
        .i_mmu_l1tlb_data_79   ({i_exe1_mmu_data_40, i_csr_mmu_data_679[38:0]}),
        .o_l1tlb_mmu_free_1    (),
        .i_sfence_l1tlb_drive_1(w_sfence_d1_drive_1),
        .i_sfence_l1tlb_data_39(w_sfence_data_39),
        .o_l1tlb_sfence_free_1 (w_d1_sfence_free_1),
        .i_l2_l1tlb_drive_1    (w_l2_d1_drive_1),
        .i_l2_l1tlb_data_34    (w_l2_d1_data_34),
        .o_l1tlb_l2_free_1     (w_d1_l2_free_1),
        .i_ptw_l1tlb_drive_1   (w_ptw_d1_drive_1),
        .i_ptw_l1tlb_data_34   (w_ptw_d1_data_34),
        .o_l1tlb_ptw_free_1    (w_d1_ptw_free_1),
        .o_l1tlb_pmp0_drive_1  (w_d1_pmp0_drive_1),
        .o_l1tlb_pmp0_data_48  (w_d1_pmp0_data_48),
        .i_pmp0_l1tlb_free_1   (w_pmp0_d1_free_1),
        .o_l1tlb_pmp1_drive_1  (w_d1_pmp1_drive_1),
        .o_l1tlb_pmp1_data_48  (w_d1_pmp1_data_48),
        .i_pmp1_l1tlb_free_1   (w_pmp1_d1_free_1),
        .o_l1tlb_ifuexp_drive_1(),
        .o_l1tlb_ifuexp_data_5 (),
        .i_ifuexp_l1tlb_free_1 (1'b0),
        .o_l1tlb_lsuexp_drive_1(w_d1_lsuexp_drive_1),
        .o_l1tlb_lsuexp_data_11(w_d1_lsuexp_data_11),
        .i_lsuexp_l1tlb_free_1 (w_lsuexp_d1_free_1),
        .o_l1tlb_l2_drive_1    (w_d1_l2_drive_1),
        .o_l1tlb_l2_data_75    (w_d1_l2_data_75),
        .i_l2_l1tlb_free_1     (w_l2_d1_free_1)
    );

    //---------------------- mmu_l1tlb_d2 ----------------------//
    wire        w_l2_d2_drive_1;
    wire [33:0] w_l2_d2_data_34;
    wire        w_d2_l2_free_1;
    wire        w_ptw_d2_drive_1;
    wire [33:0] w_ptw_d2_data_34;
    wire        w_d2_ptw_free_1;
    wire        w_d2_pmp0_drive_1;
    wire [47:0] w_d2_pmp0_data_48;
    wire        w_pmp0_d2_free_1;
    wire        w_d2_pmp1_drive_1;
    wire [47:0] w_d2_pmp1_data_48;
    wire        w_pmp1_d2_free_1;
    wire        w_d2_lsuexp_drive_1;
    wire [10:0] w_d2_lsuexp_data_11;
    wire        w_lsuexp_d2_free_1;
    wire        w_d2_l2_drive_1;
    wire [74:0] w_d2_l2_data_75;
    wire        w_l2_d2_free_1;

    mmu_l1tlb mmu_l1tlb_d2 (
        .rstn                  (rstn),
        .i_mmu_l1tlb_drive_1   (i_exe2_mmu_drive_1),
        .i_mmu_l1tlb_data_79   ({i_exe2_mmu_data_40, i_csr_mmu_data_679[38:0]}),
        .o_l1tlb_mmu_free_1    (),
        .i_sfence_l1tlb_drive_1(w_sfence_d2_drive_1),
        .i_sfence_l1tlb_data_39(w_sfence_data_39),
        .o_l1tlb_sfence_free_1 (w_d2_sfence_free_1),
        .i_l2_l1tlb_drive_1    (w_l2_d2_drive_1),
        .i_l2_l1tlb_data_34    (w_l2_d2_data_34),
        .o_l1tlb_l2_free_1     (w_d2_l2_free_1),
        .i_ptw_l1tlb_drive_1   (w_ptw_d2_drive_1),
        .i_ptw_l1tlb_data_34   (w_ptw_d2_data_34),
        .o_l1tlb_ptw_free_1    (w_d2_ptw_free_1),
        .o_l1tlb_pmp0_drive_1  (w_d2_pmp0_drive_1),
        .o_l1tlb_pmp0_data_48  (w_d2_pmp0_data_48),
        .i_pmp0_l1tlb_free_1   (w_pmp0_d2_free_1),
        .o_l1tlb_pmp1_drive_1  (w_d2_pmp1_drive_1),
        .o_l1tlb_pmp1_data_48  (w_d2_pmp1_data_48),
        .i_pmp1_l1tlb_free_1   (w_pmp1_d2_free_1),
        .o_l1tlb_ifuexp_drive_1(),
        .o_l1tlb_ifuexp_data_5 (),
        .i_ifuexp_l1tlb_free_1 (1'b0),
        .o_l1tlb_lsuexp_drive_1(w_d2_lsuexp_drive_1),
        .o_l1tlb_lsuexp_data_11(w_d2_lsuexp_data_11),
        .i_lsuexp_l1tlb_free_1 (w_lsuexp_d2_free_1),
        .o_l1tlb_l2_drive_1    (w_d2_l2_drive_1),
        .o_l1tlb_l2_data_75    (w_d2_l2_data_75),
        .i_l2_l1tlb_free_1     (w_l2_d2_free_1)
    );

    //---------------------- mmu_l1tlb_d3 ----------------------//
    wire        w_l2_d3_drive_1;
    wire [33:0] w_l2_d3_data_34;
    wire        w_d3_l2_free_1;
    wire        w_ptw_d3_drive_1;
    wire [33:0] w_ptw_d3_data_34;
    wire        w_d3_ptw_free_1;
    wire        w_d3_pmp0_drive_1;
    wire [47:0] w_d3_pmp0_data_48;
    wire        w_pmp0_d3_free_1;
    wire        w_d3_pmp1_drive_1;
    wire [47:0] w_d3_pmp1_data_48;
    wire        w_pmp1_d3_free_1;
    wire        w_d3_lsuexp_drive_1;
    wire [10:0] w_d3_lsuexp_data_11;
    wire        w_lsuexp_d3_free_1;
    wire        w_d3_l2_drive_1;
    wire [74:0] w_d3_l2_data_75;
    wire        w_l2_d3_free_1;

    mmu_l1tlb mmu_l1tlb_d3 (
        .rstn                  (rstn),
        .i_mmu_l1tlb_drive_1   (i_exe3_mmu_drive_1),
        .i_mmu_l1tlb_data_79   ({i_exe3_mmu_data_40, i_csr_mmu_data_679[38:0]}),
        .o_l1tlb_mmu_free_1    (),
        .i_sfence_l1tlb_drive_1(w_sfence_d3_drive_1),
        .i_sfence_l1tlb_data_39(w_sfence_data_39),
        .o_l1tlb_sfence_free_1 (w_d3_sfence_free_1),
        .i_l2_l1tlb_drive_1    (w_l2_d3_drive_1),
        .i_l2_l1tlb_data_34    (w_l2_d3_data_34),
        .o_l1tlb_l2_free_1     (w_d3_l2_free_1),
        .i_ptw_l1tlb_drive_1   (w_ptw_d3_drive_1),
        .i_ptw_l1tlb_data_34   (w_ptw_d3_data_34),
        .o_l1tlb_ptw_free_1    (w_d3_ptw_free_1),
        .o_l1tlb_pmp0_drive_1  (w_d3_pmp0_drive_1),
        .o_l1tlb_pmp0_data_48  (w_d3_pmp0_data_48),
        .i_pmp0_l1tlb_free_1   (w_pmp0_d3_free_1),
        .o_l1tlb_pmp1_drive_1  (w_d3_pmp1_drive_1),
        .o_l1tlb_pmp1_data_48  (w_d3_pmp1_data_48),
        .i_pmp1_l1tlb_free_1   (w_pmp1_d3_free_1),
        .o_l1tlb_ifuexp_drive_1(),
        .o_l1tlb_ifuexp_data_5 (),
        .i_ifuexp_l1tlb_free_1 (1'b0),
        .o_l1tlb_lsuexp_drive_1(w_d3_lsuexp_drive_1),
        .o_l1tlb_lsuexp_data_11(w_d3_lsuexp_data_11),
        .i_lsuexp_l1tlb_free_1 (w_lsuexp_d3_free_1),
        .o_l1tlb_l2_drive_1    (w_d3_l2_drive_1),
        .o_l1tlb_l2_data_75    (w_d3_l2_data_75),
        .i_l2_l1tlb_free_1     (w_l2_d3_free_1)
    );

    //---------------------- cMerge1: Level 1 TLB to Level 2 TLB ----------------------//

    wire        w_l1_l2_drive_1;
    wire        w_l2_l1_free_1;
    wire [78:0] w_l1_l2_data_79;

    cArbMerge5_mmu #(5, 79) cMerge1 (
        .rstn       (rstn),
        .i_drive0   (w_i0_l2_drive_1),
        .i_data0    ({4'b0000, w_i0_l2_data_75}),
        .o_free0    (w_l2_i0_free_1),
        .i_drive1   (w_d0_l2_drive_1),
        .i_data1    ({4'b0001, w_d0_l2_data_75}),
        .o_free1    (w_l2_d0_free_1),
        .i_drive2   (w_d1_l2_drive_1),
        .i_data2    ({4'b0010, w_d1_l2_data_75}),
        .o_free2    (w_l2_d1_free_1),
        .i_drive3   (w_d2_l2_drive_1),
        .i_data3    ({4'b0100, w_d2_l2_data_75}),
        .o_free3    (w_l2_d2_free_1),
        .i_drive4   (w_d3_l2_drive_1),
        .i_data4    ({4'b1000, w_d3_l2_data_75}),
        .o_free4    (w_l2_d3_free_1),
        .o_driveNext(w_l1_l2_drive_1),
        .o_data     (w_l1_l2_data_79),
        .i_freeNext (w_l2_l1_free_1)
    );

    //---------------------- mmu_l2tlb ----------------------//
    wire        w_ptw_l2_drive_1;
    wire [33:0] w_ptw_l2_data_34;
    wire        w_l2_ptw_free_1;
    wire        w_l2_ifuexp_drive_1;
    wire [ 4:0] w_l2_ifuexp_data_5;
    wire        w_ifuexp_l2_free_1;
    wire        w_l2_lsuexp_drive_1;
    wire [10:0] w_l2_lsuexp_data_11;
    wire        w_lsuexp_l2_free_1;
    wire        w_l2_l1_drive_1;
    wire [39:0] w_l2_l1_data_40;
    wire        w_l1_l2_free_1;
    wire        w_l2_pmp_drive_1;
    wire [47:0] w_l2_pmp_data_48;
    wire        w_pmp_l2_free_1;
    wire        w_l2_ptw_drive_1;
    wire [80:0] w_l2_ptw_data_81;
    wire        w_ptw_l2_free_1;

    mmu_l2tlb mmu_l2tlb (
        .rstn                  (rstn),
        .i_l1_l2tlb_drive_1    (w_l1_l2_drive_1),
        .i_l1_l2tlb_data_79    (w_l1_l2_data_79),
        .o_l2tlb_l1_free_1     (),
        .i_sfence_l2tlb_drive_1(w_sfence_l2_drive_1),
        .i_sfence_l2tlb_data_39(w_sfence_data_39),
        .o_l2tlb_sfence_free_1 (w_l2_sfence_free_1),
        .i_ptw_l2tlb_drive_1   (w_ptw_l2_drive_1),
        .i_ptw_l2tlb_data_34   (w_ptw_l2_data_34),
        .o_l2tlb_ptw_free_1    (w_l2_ptw_free_1),
        .o_l2tlb_ifuexp_drive_1(w_l2_ifuexp_drive_1),
        .o_l2tlb_ifuexp_data_5 (w_l2_ifuexp_data_5),
        .i_ifuexp_l2tlb_free_1 (w_ifuexp_l2_free_1),
        .o_l2tlb_lsuexp_drive_1(w_l2_lsuexp_drive_1),
        .o_l2tlb_lsuexp_data_11(w_l2_lsuexp_data_11),
        .i_lsuexp_l2tlb_free_1 (w_lsuexp_l2_free_1),
        .o_l2tlb_l1_drive_1    (w_l2_l1_drive_1),
        .o_l2tlb_l1_data_40    (w_l2_l1_data_40),
        .i_l1_l2tlb_free_1     (w_l1_l2_free_1),
        .o_l2tlb_pmp_drive_1   (w_l2_pmp_drive_1),
        .o_l2tlb_pmp_data_48   (w_l2_pmp_data_48),
        .i_pmp_l2tlb_free_1    (w_pmp_l2_free_1),
        .o_l2tlb_ptw_drive_1   (w_l2_ptw_drive_1),
        .o_l2tlb_ptw_data_81   (w_l2_ptw_data_81),
        .i_ptw_l2tlb_free_1    (w_ptw_l2_free_1)
    );

    //---------------------- cFork1: Level 2 TLB writeback, Level 1 TLB ----------------------//
    wire [4:0] w_cFork2_select_5;
    assign w_cFork2_select_5[0] = (w_l2_l1_data_40[39] == 1'b0) ? 1'b1 : 1'b0;
    assign w_cFork2_select_5[1] = (w_l2_l1_data_40[39] == 1'b1 && w_l2_l1_data_40[37:34] == 4'b0001) ? 1'b1 : 1'b0;
    assign w_cFork2_select_5[2] = (w_l2_l1_data_40[39] == 1'b1 && w_l2_l1_data_40[37:34] == 4'b0010) ? 1'b1 : 1'b0;
    assign w_cFork2_select_5[3] = (w_l2_l1_data_40[39] == 1'b1 && w_l2_l1_data_40[37:34] == 4'b0100) ? 1'b1 : 1'b0;
    assign w_cFork2_select_5[4] = (w_l2_l1_data_40[39] == 1'b1 && w_l2_l1_data_40[37:34] == 4'b1000) ? 1'b1 : 1'b0;

    cSelector5_mmu #(5) cFork2 (
        .rstn        (rstn),
        .i_select    (w_cFork2_select_5),
        .i_drive     (w_l2_l1_drive_1),
        .o_free      (w_l1_l2_free_1),
        .o_driveNext0(w_l2_i0_drive_1),
        .i_freeNext0 (w_i0_l2_free_1),
        .o_driveNext1(w_l2_d0_drive_1),
        .i_freeNext1 (w_d0_l2_free_1),
        .o_driveNext2(w_l2_d1_drive_1),
        .i_freeNext2 (w_d1_l2_free_1),
        .o_driveNext3(w_l2_d2_drive_1),
        .i_freeNext3 (w_d2_l2_free_1),
        .o_driveNext4(w_l2_d3_drive_1),
        .i_freeNext4 (w_d3_l2_free_1)
    );

    //---------------------- cFork3: Level 2 TLB sends PMP ----------------------//
    wire [4:0] w_cFork3_select_5;
    assign w_cFork3_select_5[0] = (w_l2_pmp_data_48[1] == 1'b0) ? 1'b1 : 1'b0;
    assign w_cFork3_select_5[1] = (w_l2_pmp_data_48[1] == 1'b1 && w_l2_pmp_data_48[47:44] == 4'b0001) ? 1'b1 : 1'b0;
    assign w_cFork3_select_5[2] = (w_l2_pmp_data_48[1] == 1'b1 && w_l2_pmp_data_48[47:44] == 4'b0010) ? 1'b1 : 1'b0;
    assign w_cFork3_select_5[3] = (w_l2_pmp_data_48[1] == 1'b1 && w_l2_pmp_data_48[47:44] == 4'b0100) ? 1'b1 : 1'b0;
    assign w_cFork3_select_5[4] = (w_l2_pmp_data_48[1] == 1'b1 && w_l2_pmp_data_48[47:44] == 4'b1000) ? 1'b1 : 1'b0;

    wire w_l2_pmpi0_drive_1;
    wire w_pmpi0_l2_free_1;
    wire w_l2_pmpd0_drive_1;
    wire w_pmpd0_l2_free_1;
    wire w_l2_pmpd1_drive_1;
    wire w_pmpd1_l2_free_1;
    wire w_l2_pmpd2_drive_1;
    wire w_pmpd2_l2_free_1;
    wire w_l2_pmpd3_drive_1;
    wire w_pmpd3_l2_free_1;

    cSelector5_mmu #(5) cFork3 (
        .rstn        (rstn),
        .i_select    (w_cFork3_select_5),
        .i_drive     (w_l2_pmp_drive_1),
        .o_free      (w_pmp_l2_free_1),
        .o_driveNext0(w_l2_pmpi0_drive_1),
        .i_freeNext0 (w_pmpi0_l2_free_1),
        .o_driveNext1(w_l2_pmpd0_drive_1),
        .i_freeNext1 (w_pmpd0_l2_free_1),
        .o_driveNext2(w_l2_pmpd1_drive_1),
        .i_freeNext2 (w_pmpd1_l2_free_1),
        .o_driveNext3(w_l2_pmpd2_drive_1),
        .i_freeNext3 (w_pmpd2_l2_free_1),
        .o_driveNext4(w_l2_pmpd3_drive_1),
        .i_freeNext4 (w_pmpd3_l2_free_1)
    );

    //---------------------- mmu_ptw ----------------------//
    wire        w_ptw_ifuexp_drive_1;
    wire [ 4:0] w_ptw_ifuexp_data_5;
    wire        w_ifuexp_ptw_free_1;
    wire        w_ptw_lsuexp_drive_1;
    wire [10:0] w_ptw_lsuexp_data_11;
    wire        w_lsuexp_ptw_free_1;
    wire        w_ptw_pmp0_drive_1;
    wire [47:0] w_ptw_pmp0_data_48;
    wire        w_pmp0_ptw_free_1;
    wire        w_ptw_l1_drive_1;
    wire [39:0] w_ptw_l1_data_40;
    wire        w_l1_ptw_free_1;
    wire        w_ptw_pmp1_drive_1;
    wire [47:0] w_ptw_pmp1_data_48;
    wire        w_pmp1_ptw_free_1;

    mmu_ptw mmu_ptw (
        .rstn                (rstn),
        .i_l2_ptw_drive_1    (w_l2_ptw_drive_1),
        .i_l2_ptw_data_81    (w_l2_ptw_data_81),
        .o_ptw_l2_free_1     (w_ptw_l2_free_1),
        .i_dcache_ptw_drive_1(i_dcache_mmu_drive_1),
        .i_dcache_ptw_data_32(i_dcache_mmu_data_32),
        .o_ptw_dcache_free_1 (o_mmu_dcache_free_1),
        .o_ptw_ifuexp_drive_1(w_ptw_ifuexp_drive_1),
        .o_ptw_ifuexp_data_5 (w_ptw_ifuexp_data_5),
        .i_ifuexp_ptw_free_1 (w_ifuexp_ptw_free_1),
        .o_ptw_lsuexp_drive_1(w_ptw_lsuexp_drive_1),
        .o_ptw_lsuexp_data_11(w_ptw_lsuexp_data_11),
        .i_lsuexp_ptw_free_1 (w_lsuexp_ptw_free_1),
        .o_ptw_pmp0_drive_1  (w_ptw_pmp0_drive_1),
        .o_ptw_pmp0_data_48  (w_ptw_pmp0_data_48),
        .i_pmp0_ptw_free_1   (w_pmp0_ptw_free_1),
        .o_ptw_l1_drive_1    (w_ptw_l1_drive_1),
        .o_ptw_l1_data_40    (w_ptw_l1_data_40),
        .i_l1_ptw_free_1     (w_l1_ptw_free_1),
        .o_ptw_l2_drive_1    (w_ptw_l2_drive_1),
        .o_ptw_l2_data_34    (w_ptw_l2_data_34),
        .i_l2_ptw_free_1     (w_l2_ptw_free_1),
        .o_ptw_pmp1_drive_1  (w_ptw_pmp1_drive_1),
        .o_ptw_pmp1_data_48  (w_ptw_pmp1_data_48),
        .i_pmp1_ptw_free_1   (w_pmp1_ptw_free_1)
    );

    //---------------------- cFork4: PTW writeback, Level 1 TLB ----------------------//
    wire [4:0] w_cFork4_select_5;
    assign w_cFork4_select_5[0] = (w_ptw_l1_data_40[39] == 1'b0) ? 1'b1 : 1'b0;
    assign w_cFork4_select_5[1] = (w_ptw_l1_data_40[39] == 1'b1 && w_ptw_l1_data_40[37:34] == 4'b0001) ? 1'b1 : 1'b0;
    assign w_cFork4_select_5[2] = (w_ptw_l1_data_40[39] == 1'b1 && w_ptw_l1_data_40[37:34] == 4'b0010) ? 1'b1 : 1'b0;
    assign w_cFork4_select_5[3] = (w_ptw_l1_data_40[39] == 1'b1 && w_ptw_l1_data_40[37:34] == 4'b0100) ? 1'b1 : 1'b0;
    assign w_cFork4_select_5[4] = (w_ptw_l1_data_40[39] == 1'b1 && w_ptw_l1_data_40[37:34] == 4'b1000) ? 1'b1 : 1'b0;

    cSelector5_mmu #(5) cFork4 (
        .rstn        (rstn),
        .i_select    (w_cFork4_select_5),
        .i_drive     (w_ptw_l1_drive_1),
        .o_free      (w_l1_ptw_free_1),
        .o_driveNext0(w_ptw_i0_drive_1),
        .i_freeNext0 (w_i0_ptw_free_1),
        .o_driveNext1(w_ptw_d0_drive_1),
        .i_freeNext1 (w_d0_ptw_free_1),
        .o_driveNext2(w_ptw_d1_drive_1),
        .i_freeNext2 (w_d1_ptw_free_1),
        .o_driveNext3(w_ptw_d2_drive_1),
        .i_freeNext3 (w_d2_ptw_free_1),
        .o_driveNext4(w_ptw_d3_drive_1),
        .i_freeNext4 (w_d3_ptw_free_1)
    );

    assign w_ptw_i0_data_34 = w_ptw_l1_data_40[33:0];
    assign w_ptw_d0_data_34 = w_ptw_l1_data_40[33:0];
    assign w_ptw_d1_data_34 = w_ptw_l1_data_40[33:0];
    assign w_ptw_d2_data_34 = w_ptw_l1_data_40[33:0];
    assign w_ptw_d3_data_34 = w_ptw_l1_data_40[33:0];

    //---------------------- cFork5: PTW sends PMP ----------------------//
    wire [4:0] w_cFork5_select_5;
    assign w_cFork5_select_5[0] = (w_ptw_pmp1_data_48[1] == 1'b0) ? 1'b1 : 1'b0;
    assign w_cFork5_select_5[1] = (w_ptw_pmp1_data_48[1] == 1'b1 && w_ptw_pmp1_data_48[47:44] == 4'b0001) ? 1'b1 : 1'b0;
    assign w_cFork5_select_5[2] = (w_ptw_pmp1_data_48[1] == 1'b1 && w_ptw_pmp1_data_48[47:44] == 4'b0010) ? 1'b1 : 1'b0;
    assign w_cFork5_select_5[3] = (w_ptw_pmp1_data_48[1] == 1'b1 && w_ptw_pmp1_data_48[47:44] == 4'b0100) ? 1'b1 : 1'b0;
    assign w_cFork5_select_5[4] = (w_ptw_pmp1_data_48[1] == 1'b1 && w_ptw_pmp1_data_48[47:44] == 4'b1000) ? 1'b1 : 1'b0;

    wire w_ptw_pmpi0_drive_1;
    wire w_pmpi0_ptw_free_1;
    wire w_ptw_pmpd0_drive_1;
    wire w_pmpd0_ptw_free_1;
    wire w_ptw_pmpd1_drive_1;
    wire w_pmpd1_ptw_free_1;
    wire w_ptw_pmpd2_drive_1;
    wire w_pmpd2_ptw_free_1;
    wire w_ptw_pmpd3_drive_1;
    wire w_pmpd3_ptw_free_1;

    cSelector5_mmu #(5) cFork5 (
        .rstn        (rstn),
        .i_select    (w_cFork5_select_5),
        .i_drive     (w_ptw_pmp1_drive_1),
        .o_free      (w_pmp1_ptw_free_1),
        .o_driveNext0(w_ptw_pmpi0_drive_1),
        .i_freeNext0 (w_pmpi0_ptw_free_1),
        .o_driveNext1(w_ptw_pmpd0_drive_1),
        .i_freeNext1 (w_pmpd0_ptw_free_1),
        .o_driveNext2(w_ptw_pmpd1_drive_1),
        .i_freeNext2 (w_pmpd1_ptw_free_1),
        .o_driveNext3(w_ptw_pmpd2_drive_1),
        .i_freeNext3 (w_pmpd2_ptw_free_1),
        .o_driveNext4(w_ptw_pmpd3_drive_1),
        .i_freeNext4 (w_pmpd3_ptw_free_1)
    );

    //---------------------- cMerge2: PMP i0 ----------------------//
    wire        w_pmpi0_drive_1;
    wire        w_pmpi0_free_1;
    wire [47:0] w_pmpi0_data_48;

    cMutexMerge4_mmu #(4, 48) cMerge2 (
        .rstn       (rstn),
        .i_drive0   (w_i0_pmp0_drive_1),
        .i_data0    (w_i0_pmp0_data_48),
        .o_free0    (w_pmp0_i0_free_1),
        .i_drive1   (w_i0_pmp1_drive_1),
        .i_data1    (w_i0_pmp1_data_48),
        .o_free1    (w_pmp1_i0_free_1),
        .i_drive2   (w_l2_pmpi0_drive_1),
        .i_data2    (w_l2_pmp_data_48),
        .o_free2    (w_pmpi0_l2_free_1),
        .i_drive3   (w_ptw_pmpi0_drive_1),
        .i_data3    (w_ptw_pmp1_data_48),
        .o_free3    (w_pmpi0_ptw_free_1),
        .o_driveNext(w_pmpi0_drive_1),
        .o_data     (w_pmpi0_data_48),
        .i_freeNext (w_pmpi0_free_1)
    );

    //---------------------- PMP i0 ----------------------//
    wire        w_pmpi0_pmpouti0_drive_1;
    wire [50:0] w_pmpi0_pmpouti0_data_51;
    wire        w_pmpouti0_pmpi0_free_1;

    mmu_pmp mmu_pmpi0 (
        .rstn                   (rstn),
        .i_csr_pmp_data_640     (i_csr_mmu_data_679[678:39]),
        .i_paddr_pmp_drive_1    (w_pmpi0_drive_1),
        .i_paddr_pmp_data_48    (w_pmpi0_data_48),
        .o_pmp_paddr_free_1     (w_pmpi0_free_1),
        .o_pmp_paddr_drivenext_1(w_pmpi0_pmpouti0_drive_1),
        .o_pmp_paddr_data_51    (w_pmpi0_pmpouti0_data_51),
        .i_paddr_pmp_freenext_1 (w_pmpouti0_pmpi0_free_1)
    );

    //---------------------- PMPout i0 ----------------------//
    wire       w_pmpouti0_ifuexp_drive_1;
    wire [4:0] w_pmpouti0_ifuexp_data_5;
    wire       w_ifuexp_pmpouti0_free_1;

    mmu_pmpout mmu_pmpouti0 (
        .rstn                   (rstn),
        .i_pmp_pmpout_drive_1   (w_pmpi0_pmpouti0_drive_1),
        .i_pmp_pmpout_data_51   (w_pmpi0_pmpouti0_data_51),
        .o_pmpout_pmp_free_1    (w_pmpouti0_pmpi0_free_1),
        .o_pmpout_lsu_drive_1   (),
        .o_pmpout_lsu_data_38   (),
        .i_lsu_pmpout_free_1    (1'b0),
        .o_pmpout_retire_drive_1(),
        .o_pmpout_retire_data_11(),
        .i_retire_pmpout_free_1 (1'b0),
        .o_pmpout_ifu_drive_1   (o_mmu_ifu_drive_1),
        .o_pmpout_ifu_data_34   (o_mmu_ifu_data_34),
        .i_ifu_pmpout_free_1    (i_ifu_mmu_free_1),
        .o_pmpout_exp_drive_1   (w_pmpouti0_ifuexp_drive_1),
        .o_pmpout_exp_data_5    (w_pmpouti0_ifuexp_data_5),
        .i_exp_pmpout_free_1    (w_ifuexp_pmpouti0_free_1)
    );

    //---------------------- cMerge3: PMP d0 ----------------------//
    wire        w_pmpd0_drive_1;
    wire        w_pmpd0_free_1;
    wire [47:0] w_pmpd0_data_48;

    cMutexMerge4_mmu #(4, 48) cMerge3 (
        .rstn       (rstn),
        .i_drive0   (w_d0_pmp0_drive_1),
        .i_data0    (w_d0_pmp0_data_48),
        .o_free0    (w_pmp0_d0_free_1),
        .i_drive1   (w_d0_pmp1_drive_1),
        .i_data1    (w_d0_pmp1_data_48),
        .o_free1    (w_pmp1_d0_free_1),
        .i_drive2   (w_l2_pmpd0_drive_1),
        .i_data2    (w_l2_pmp_data_48),
        .o_free2    (w_pmpd0_l2_free_1),
        .i_drive3   (w_ptw_pmpd0_drive_1),
        .i_data3    (w_ptw_pmp1_data_48),
        .o_free3    (w_pmpd0_ptw_free_1),
        .o_driveNext(w_pmpd0_drive_1),
        .o_data     (w_pmpd0_data_48),
        .i_freeNext (w_pmpd0_free_1)
    );


    //---------------------- PMP d0 ----------------------//
    wire        w_pmpd0_pmpoutd0_drive_1;
    wire [50:0] w_pmpd0_pmpoutd0_data_51;
    wire        w_pmpoutd0_pmpd0_free_1;

    mmu_pmp mmu_pmpd0 (
        .rstn                   (rstn),
        .i_csr_pmp_data_640     (i_csr_mmu_data_679[678:39]),
        .i_paddr_pmp_drive_1    (w_pmpd0_drive_1),
        .i_paddr_pmp_data_48    (w_pmpd0_data_48),
        .o_pmp_paddr_free_1     (w_pmpd0_free_1),
        .o_pmp_paddr_drivenext_1(w_pmpd0_pmpoutd0_drive_1),
        .o_pmp_paddr_data_51    (w_pmpd0_pmpoutd0_data_51),
        .i_paddr_pmp_freenext_1 (w_pmpoutd0_pmpd0_free_1)
    );

    //---------------------- PMPout d0 ----------------------//
    wire [37:0] w_pmpoutd0_lsu_data_38;
    assign o_mmu_lsu0_data_34 = w_pmpoutd0_lsu_data_38[33:0];
    wire        w_pmpoutd0_retire_drive_1;
    wire [10:0] w_pmpoutd0_retire_data_11;
    wire        w_retire_pmpoutd0_free_1;

    mmu_pmpout mmu_pmpoutd0 (
        .rstn                   (rstn),
        .i_pmp_pmpout_drive_1   (w_pmpd0_pmpoutd0_drive_1),
        .i_pmp_pmpout_data_51   (w_pmpd0_pmpoutd0_data_51),
        .o_pmpout_pmp_free_1    (w_pmpoutd0_pmpd0_free_1),
        .o_pmpout_lsu_drive_1   (o_mmu_lsu0_drive_1),
        .o_pmpout_lsu_data_38   (w_pmpoutd0_lsu_data_38),
        .i_lsu_pmpout_free_1    (i_lsu0_mmu_free_1),
        .o_pmpout_retire_drive_1(w_pmpoutd0_retire_drive_1),
        .o_pmpout_retire_data_11(w_pmpoutd0_retire_data_11),
        .i_retire_pmpout_free_1 (w_retire_pmpoutd0_free_1),
        .o_pmpout_ifu_drive_1   (),
        .o_pmpout_ifu_data_34   (),
        .i_ifu_pmpout_free_1    (1'b0),
        .o_pmpout_exp_drive_1   (),
        .o_pmpout_exp_data_5    (),
        .i_exp_pmpout_free_1    (1'b0)
    );

    //---------------------- cMerge4: PMP d1 ----------------------//
    wire        w_pmpd1_drive_1;
    wire        w_pmpd1_free_1;
    wire [47:0] w_pmpd1_data_48;

    cMutexMerge4_mmu #(4, 48) cMerge4 (
        .rstn       (rstn),
        .i_drive0   (w_d1_pmp0_drive_1),
        .i_data0    (w_d1_pmp0_data_48),
        .o_free0    (w_pmp0_d1_free_1),
        .i_drive1   (w_d1_pmp1_drive_1),
        .i_data1    (w_d1_pmp1_data_48),
        .o_free1    (w_pmp1_d1_free_1),
        .i_drive2   (w_l2_pmpd1_drive_1),
        .i_data2    (w_l2_pmp_data_48),
        .o_free2    (w_pmpd1_l2_free_1),
        .i_drive3   (w_ptw_pmpd1_drive_1),
        .i_data3    (w_ptw_pmp1_data_48),
        .o_free3    (w_pmpd1_ptw_free_1),
        .o_driveNext(w_pmpd1_drive_1),
        .o_data     (w_pmpd1_data_48),
        .i_freeNext (w_pmpd1_free_1)
    );


    //---------------------- PMP d1 ----------------------//
    wire        w_pmpd1_pmpoutd1_drive_1;
    wire [50:0] w_pmpd1_pmpoutd1_data_51;
    wire        w_pmpoutd1_pmpd1_free_1;

    mmu_pmp mmu_pmpd1 (
        .rstn                   (rstn),
        .i_csr_pmp_data_640     (i_csr_mmu_data_679[678:39]),
        .i_paddr_pmp_drive_1    (w_pmpd1_drive_1),
        .i_paddr_pmp_data_48    (w_pmpd1_data_48),
        .o_pmp_paddr_free_1     (w_pmpd1_free_1),
        .o_pmp_paddr_drivenext_1(w_pmpd1_pmpoutd1_drive_1),
        .o_pmp_paddr_data_51    (w_pmpd1_pmpoutd1_data_51),
        .i_paddr_pmp_freenext_1 (w_pmpoutd1_pmpd1_free_1)
    );

    //---------------------- PMPout d1 ----------------------//
    wire [37:0] w_pmpoutd1_lsu_data_38;
    assign o_mmu_lsu1_data_34 = w_pmpoutd1_lsu_data_38[33:0];
    wire        w_pmpoutd1_retire_drive_1;
    wire [10:0] w_pmpoutd1_retire_data_11;
    wire        w_retire_pmpoutd1_free_1;

    mmu_pmpout mmu_pmpoutd1 (
        .rstn                   (rstn),
        .i_pmp_pmpout_drive_1   (w_pmpd1_pmpoutd1_drive_1),
        .i_pmp_pmpout_data_51   (w_pmpd1_pmpoutd1_data_51),
        .o_pmpout_pmp_free_1    (w_pmpoutd1_pmpd1_free_1),
        .o_pmpout_lsu_drive_1   (o_mmu_lsu1_drive_1),
        .o_pmpout_lsu_data_38   (w_pmpoutd1_lsu_data_38),
        .i_lsu_pmpout_free_1    (i_lsu1_mmu_free_1),
        .o_pmpout_retire_drive_1(w_pmpoutd1_retire_drive_1),
        .o_pmpout_retire_data_11(w_pmpoutd1_retire_data_11),
        .i_retire_pmpout_free_1 (w_retire_pmpoutd1_free_1),
        .o_pmpout_ifu_drive_1   (),
        .o_pmpout_ifu_data_34   (),
        .i_ifu_pmpout_free_1    (1'b0),
        .o_pmpout_exp_drive_1   (),
        .o_pmpout_exp_data_5    (),
        .i_exp_pmpout_free_1    (1'b0)
    );

    //---------------------- cMerge5: PMP d2 ----------------------//
    wire        w_pmpd2_drive_1;
    wire        w_pmpd2_free_1;
    wire [47:0] w_pmpd2_data_48;

    cMutexMerge4_mmu #(4, 48) cMerge5 (
        .rstn       (rstn),
        .i_drive0   (w_d2_pmp0_drive_1),
        .i_data0    (w_d2_pmp0_data_48),
        .o_free0    (w_pmp0_d2_free_1),
        .i_drive1   (w_d2_pmp1_drive_1),
        .i_data1    (w_d2_pmp1_data_48),
        .o_free1    (w_pmp1_d2_free_1),
        .i_drive2   (w_l2_pmpd2_drive_1),
        .i_data2    (w_l2_pmp_data_48),
        .o_free2    (w_pmpd2_l2_free_1),
        .i_drive3   (w_ptw_pmpd2_drive_1),
        .i_data3    (w_ptw_pmp1_data_48),
        .o_free3    (w_pmpd2_ptw_free_1),
        .o_driveNext(w_pmpd2_drive_1),
        .o_data     (w_pmpd2_data_48),
        .i_freeNext (w_pmpd2_free_1)
    );


    //---------------------- PMP d2 ----------------------//
    wire        w_pmpd2_pmpoutd2_drive_1;
    wire [50:0] w_pmpd2_pmpoutd2_data_51;
    wire        w_pmpoutd2_pmpd2_free_1;

    mmu_pmp mmu_pmpd2 (
        .rstn                   (rstn),
        .i_csr_pmp_data_640     (i_csr_mmu_data_679[678:39]),
        .i_paddr_pmp_drive_1    (w_pmpd2_drive_1),
        .i_paddr_pmp_data_48    (w_pmpd2_data_48),
        .o_pmp_paddr_free_1     (w_pmpd2_free_1),
        .o_pmp_paddr_drivenext_1(w_pmpd2_pmpoutd2_drive_1),
        .o_pmp_paddr_data_51    (w_pmpd2_pmpoutd2_data_51),
        .i_paddr_pmp_freenext_1 (w_pmpoutd2_pmpd2_free_1)
    );

    //---------------------- PMPout d2 ----------------------//
    wire [37:0] w_pmpoutd2_lsu_data_38;
    assign o_mmu_lsu2_data_34 = w_pmpoutd2_lsu_data_38[33:0];
    wire        w_pmpoutd2_retire_drive_1;
    wire [10:0] w_pmpoutd2_retire_data_11;
    wire        w_retire_pmpoutd2_free_1;

    mmu_pmpout mmu_pmpoutd2 (
        .rstn                   (rstn),
        .i_pmp_pmpout_drive_1   (w_pmpd2_pmpoutd2_drive_1),
        .i_pmp_pmpout_data_51   (w_pmpd2_pmpoutd2_data_51),
        .o_pmpout_pmp_free_1    (w_pmpoutd2_pmpd2_free_1),
        .o_pmpout_lsu_drive_1   (o_mmu_lsu2_drive_1),
        .o_pmpout_lsu_data_38   (w_pmpoutd2_lsu_data_38),
        .i_lsu_pmpout_free_1    (i_lsu2_mmu_free_1),
        .o_pmpout_retire_drive_1(w_pmpoutd2_retire_drive_1),
        .o_pmpout_retire_data_11(w_pmpoutd2_retire_data_11),
        .i_retire_pmpout_free_1 (w_retire_pmpoutd2_free_1),
        .o_pmpout_ifu_drive_1   (),
        .o_pmpout_ifu_data_34   (),
        .i_ifu_pmpout_free_1    (1'b0),
        .o_pmpout_exp_drive_1   (),
        .o_pmpout_exp_data_5    (),
        .i_exp_pmpout_free_1    (1'b0)
    );

    //---------------------- cMerge6: PMP d3 ----------------------//
    wire        w_pmpd3_drive_1;
    wire        w_pmpd3_free_1;
    wire [47:0] w_pmpd3_data_48;

    cMutexMerge4_mmu #(4, 48) cMerge6 (
        .rstn       (rstn),
        .i_drive0   (w_d3_pmp0_drive_1),
        .i_data0    (w_d3_pmp0_data_48),
        .o_free0    (w_pmp0_d3_free_1),
        .i_drive1   (w_d3_pmp1_drive_1),
        .i_data1    (w_d3_pmp1_data_48),
        .o_free1    (w_pmp1_d3_free_1),
        .i_drive2   (w_l2_pmpd3_drive_1),
        .i_data2    (w_l2_pmp_data_48),
        .o_free2    (w_pmpd3_l2_free_1),
        .i_drive3   (w_ptw_pmpd3_drive_1),
        .i_data3    (w_ptw_pmp1_data_48),
        .o_free3    (w_pmpd3_ptw_free_1),
        .o_driveNext(w_pmpd3_drive_1),
        .o_data     (w_pmpd3_data_48),
        .i_freeNext (w_pmpd3_free_1)
    );

    //---------------------- PMP d3 ----------------------//
    wire        w_pmpd3_pmpoutd3_drive_1;
    wire [50:0] w_pmpd3_pmpoutd3_data_51;
    wire        w_pmpoutd3_pmpd3_free_1;

    mmu_pmp mmu_pmpd3 (
        .rstn                   (rstn),
        .i_csr_pmp_data_640     (i_csr_mmu_data_679[678:39]),
        .i_paddr_pmp_drive_1    (w_pmpd3_drive_1),
        .i_paddr_pmp_data_48    (w_pmpd3_data_48),
        .o_pmp_paddr_free_1     (w_pmpd3_free_1),
        .o_pmp_paddr_drivenext_1(w_pmpd3_pmpoutd3_drive_1),
        .o_pmp_paddr_data_51    (w_pmpd3_pmpoutd3_data_51),
        .i_paddr_pmp_freenext_1 (w_pmpoutd3_pmpd3_free_1)
    );

    //---------------------- PMPout d3 ----------------------//
    wire [37:0] w_pmpoutd3_lsu_data_38;
    assign o_mmu_lsu3_data_34 = w_pmpoutd3_lsu_data_38[33:0];
    wire        w_pmpoutd3_retire_drive_1;
    wire [10:0] w_pmpoutd3_retire_data_11;
    wire        w_retire_pmpoutd3_free_1;

    mmu_pmpout mmu_pmpoutd3 (
        .rstn                   (rstn),
        .i_pmp_pmpout_drive_1   (w_pmpd3_pmpoutd3_drive_1),
        .i_pmp_pmpout_data_51   (w_pmpd3_pmpoutd3_data_51),
        .o_pmpout_pmp_free_1    (w_pmpoutd3_pmpd3_free_1),
        .o_pmpout_lsu_drive_1   (o_mmu_lsu3_drive_1),
        .o_pmpout_lsu_data_38   (w_pmpoutd3_lsu_data_38),
        .i_lsu_pmpout_free_1    (i_lsu3_mmu_free_1),
        .o_pmpout_retire_drive_1(w_pmpoutd3_retire_drive_1),
        .o_pmpout_retire_data_11(w_pmpoutd3_retire_data_11),
        .i_retire_pmpout_free_1 (w_retire_pmpoutd3_free_1),
        .o_pmpout_ifu_drive_1   (),
        .o_pmpout_ifu_data_34   (),
        .i_ifu_pmpout_free_1    (1'b0),
        .o_pmpout_exp_drive_1   (),
        .o_pmpout_exp_data_5    (),
        .i_exp_pmpout_free_1    (1'b0)
    );

    //---------------------- PMP pte ----------------------//
    wire        w_pmppte_pmpoutpte_drive_1;
    wire [50:0] w_pmppte_pmpoutpte_data_51;
    wire        w_pmpoutpte_pmppte_free_1;

    mmu_pmp mmu_pmppte (
        .rstn                   (rstn),
        .i_csr_pmp_data_640     (i_csr_mmu_data_679[678:39]),
        .i_paddr_pmp_drive_1    (w_ptw_pmp0_drive_1),
        .i_paddr_pmp_data_48    (w_ptw_pmp0_data_48),
        .o_pmp_paddr_free_1     (w_pmp0_ptw_free_1),
        .o_pmp_paddr_drivenext_1(w_pmppte_pmpoutpte_drive_1),
        .o_pmp_paddr_data_51    (w_pmppte_pmpoutpte_data_51),
        .i_paddr_pmp_freenext_1 (w_pmpoutpte_pmppte_free_1)
    );

    //---------------------- PMPout pte ----------------------//
    wire        w_pmpoutpte_pte_drive_1;
    wire [37:0] w_pmpoutpte_pte_data_38;
    wire        w_pte_pmpoutpte_free_1;
    wire        w_pmpoutpte_retire_drive_1;
    wire [10:0] w_pmpoutpte_retire_data_11;
    wire        w_retire_pmpoutpte_free_1;
    wire        w_pmpoutpte_ifuexp_drive_1;
    wire [ 4:0] w_pmpoutpte_ifuexp_data_5;
    wire        w_ifuexp_pmpoutpte_free_1;

    mmu_pmpout1 mmu_pmpoutpte (
        .rstn                    (rstn),
        .i_pmp_pmpout1_drive_1   (w_pmppte_pmpoutpte_drive_1),
        .i_pmp_pmpout1_data_51   (w_pmppte_pmpoutpte_data_51),
        .o_pmpout1_pmp_free_1    (w_pmpoutpte_pmppte_free_1),
        .o_pmpout1_dcache_drive_1(w_pmpoutpte_pte_drive_1),
        .o_pmpout1_dcache_data_38(w_pmpoutpte_pte_data_38),
        .i_dcache_pmpout1_free_1 (w_pte_pmpoutpte_free_1),
        .o_pmpout1_retire_drive_1(w_pmpoutpte_retire_drive_1),
        .o_pmpou1t_retire_data_11(w_pmpoutpte_retire_data_11),
        .i_retire_pmpout1_free_1 (w_retire_pmpoutpte_free_1),
        .o_pmpout1_exp_drive_1   (w_pmpoutpte_ifuexp_drive_1),
        .o_pmpout1_exp_data_5    (w_pmpoutpte_ifuexp_data_5),
        .i_exp_pmpout1_free_1    (w_ifuexp_pmpoutpte_free_1)
    );

    //---------------------- cFork6: pte ----------------------//
    wire [3:0] w_cFork6_select_4;
    assign w_cFork6_select_4[0] = (w_pmpoutpte_pte_data_38[6:5] == 2'b00) ? 1'b1 : 1'b0;
    assign w_cFork6_select_4[1] = (w_pmpoutpte_pte_data_38[6:5] == 2'b01) ? 1'b1 : 1'b0;
    assign w_cFork6_select_4[2] = (w_pmpoutpte_pte_data_38[6:5] == 2'b10) ? 1'b1 : 1'b0;
    assign w_cFork6_select_4[3] = (w_pmpoutpte_pte_data_38[6:5] == 2'b11) ? 1'b1 : 1'b0;

    cSelector4_mmu #(4) cFork6 (
        .rstn        (rstn),
        .i_select    (w_cFork6_select_4),
        .i_drive     (w_pmpoutpte_pte_drive_1),
        .o_free      (w_pte_pmpoutpte_free_1),
        .o_driveNext0(o_mmu_dcache0_drive_1),
        .i_freeNext0 (i_dcache0_mmu_free_1),
        .o_driveNext1(o_mmu_dcache1_drive_1),
        .i_freeNext1 (i_dcache1_mmu_free_1),
        .o_driveNext2(o_mmu_dcache2_drive_1),
        .i_freeNext2 (i_dcache2_mmu_free_1),
        .o_driveNext3(o_mmu_dcache3_drive_1),
        .i_freeNext3 (i_dcache3_mmu_free_1)
    );

    assign o_mmu_dcache0_data_34 = w_pmpoutpte_pte_data_38[33:0];
    assign o_mmu_dcache1_data_34 = w_pmpoutpte_pte_data_38[33:0];
    assign o_mmu_dcache2_data_34 = w_pmpoutpte_pte_data_38[33:0];
    assign o_mmu_dcache3_data_34 = w_pmpoutpte_pte_data_38[33:0];

    //---------------------- cMerge7: ifuexp ----------------------//
    cMutexMerge5_mmu #(5, 5) cMerge7 (
        .rstn       (rstn),
        .i_drive0   (w_i0_ifuexp_drive_1),
        .i_data0    (w_i0_ifuexp_data_5),
        .o_free0    (w_ifuexp_i0_free_1),
        .i_drive1   (w_pmpouti0_ifuexp_drive_1),
        .i_data1    (w_pmpouti0_ifuexp_data_5),
        .o_free1    (w_ifuexp_pmpouti0_free_1),
        .i_drive2   (w_l2_ifuexp_drive_1),
        .i_data2    (w_l2_ifuexp_data_5),
        .o_free2    (w_ifuexp_l2_free_1),
        .i_drive3   (w_ptw_ifuexp_drive_1),
        .i_data3    (w_ptw_ifuexp_data_5),
        .o_free3    (w_ifuexp_ptw_free_1),
        .i_drive4   (w_pmpoutpte_ifuexp_drive_1),
        .i_data4    (w_pmpoutpte_ifuexp_data_5),
        .o_free4    (w_ifuexp_pmpoutpte_free_1),
        .o_driveNext(o_mmu_exp_drive_1),
        .o_data     (o_mmu_exp_data_5),
        .i_freeNext (i_exp_mmu_free_1)
    );

    //---------------------- cMerge8: lsuexp ----------------------//
    cArbMerge11_mmu #(11, 11) cMerge8 (
        .rstn       (rstn),
        .i_drive0   (w_d0_lsuexp_drive_1),
        .i_data0    (w_d0_lsuexp_data_11),
        .o_free0    (w_lsuexp_d0_free_1),
        .i_drive1   (w_d1_lsuexp_drive_1),
        .i_data1    (w_d1_lsuexp_data_11),
        .o_free1    (w_lsuexp_d1_free_1),
        .i_drive2   (w_d2_lsuexp_drive_1),
        .i_data2    (w_d2_lsuexp_data_11),
        .o_free2    (w_lsuexp_d2_free_1),
        .i_drive3   (w_d3_lsuexp_drive_1),
        .i_data3    (w_d3_lsuexp_data_11),
        .o_free3    (w_lsuexp_d3_free_1),
        .i_drive4   (w_pmpoutd0_retire_drive_1),
        .i_data4    (w_pmpoutd0_retire_data_11),
        .o_free4    (w_retire_pmpoutd0_free_1),
        .i_drive5   (w_pmpoutd1_retire_drive_1),
        .i_data5    (w_pmpoutd1_retire_data_11),
        .o_free5    (w_retire_pmpoutd1_free_1),
        .i_drive6   (w_pmpoutd2_retire_drive_1),
        .i_data6    (w_pmpoutd2_retire_data_11),
        .o_free6    (w_retire_pmpoutd2_free_1),
        .i_drive7   (w_pmpoutd3_retire_drive_1),
        .i_data7    (w_pmpoutd3_retire_data_11),
        .o_free7    (w_retire_pmpoutd3_free_1),
        .i_drive8   (w_l2_lsuexp_drive_1),
        .i_data8    (w_l2_lsuexp_data_11),
        .o_free8    (w_lsuexp_l2_free_1),
        .i_drive9   (w_ptw_lsuexp_drive_1),
        .i_data9    (w_ptw_lsuexp_data_11),
        .o_free9    (w_lsuexp_ptw_free_1),
        .i_drive10  (w_pmpoutpte_retire_drive_1),
        .i_data10   (w_pmpoutpte_retire_data_11),
        .o_free10   (w_retire_pmpoutpte_free_1),
        .o_driveNext(o_mmu_retire_drive_1),
        .o_data     (o_mmu_retire_data_11),
        .i_freeNext (i_retire_mmu_free_1)
    );

    wire [3:0] w_l2_l1_way_4;
    assign w_l2_l1_way_4 = w_l1_l2_data_79[78:75];

    assign w_l2_l1_free_1    = w_ifuexp_l2_free_1 | w_ifuexp_ptw_free_1 | w_ifuexp_pmpoutpte_free_1 | w_lsuexp_l2_free_1 | w_lsuexp_ptw_free_1 | w_retire_pmpoutpte_free_1 | w_i0_l2_free_1 | w_d0_l2_free_1 | w_d1_l2_free_1 | w_d2_l2_free_1 | w_d3_l2_free_1 | w_i0_ptw_free_1 | w_d0_ptw_free_1 | w_d1_ptw_free_1 | w_d2_ptw_free_1 | w_d3_ptw_free_1;

    assign o_mmu_ifu_free_1 = w_ifuexp_i0_free_1 | w_ifuexp_l2_free_1 | w_ifuexp_ptw_free_1 | w_ifuexp_pmpouti0_free_1 | w_ifuexp_pmpoutpte_free_1 | i_ifu_mmu_free_1;

    assign o_mmu_exe0_free_1 = w_lsuexp_d0_free_1 | w_lsuexp_l2_free_1 & (w_l2_l1_way_4 == 4'b0001) | w_lsuexp_ptw_free_1 & (w_l2_l1_way_4 == 4'b0001) | w_retire_pmpoutd0_free_1 | w_retire_pmpoutpte_free_1 & (w_l2_l1_way_4 == 4'b0001) | i_lsu0_mmu_free_1;

    assign o_mmu_exe1_free_1 = w_lsuexp_d1_free_1 | w_lsuexp_l2_free_1 & (w_l2_l1_way_4 == 4'b0010) | w_lsuexp_ptw_free_1 & (w_l2_l1_way_4 == 4'b0010) | w_retire_pmpoutd1_free_1 | w_retire_pmpoutpte_free_1 & (w_l2_l1_way_4 == 4'b0010) | i_lsu1_mmu_free_1;

    assign o_mmu_exe2_free_1 = w_lsuexp_d2_free_1 | w_lsuexp_l2_free_1 & (w_l2_l1_way_4 == 4'b0100) | w_lsuexp_ptw_free_1 & (w_l2_l1_way_4 == 4'b0100) | w_retire_pmpoutd2_free_1 | w_retire_pmpoutpte_free_1 & (w_l2_l1_way_4 == 4'b0100) | i_lsu2_mmu_free_1;

    assign o_mmu_exe3_free_1 = w_lsuexp_d3_free_1 | w_lsuexp_l2_free_1 & (w_l2_l1_way_4 == 4'b1000) | w_lsuexp_ptw_free_1 & (w_l2_l1_way_4 == 4'b1000) | w_retire_pmpoutd3_free_1 | w_retire_pmpoutpte_free_1 & (w_l2_l1_way_4 == 4'b1000) | i_lsu3_mmu_free_1;

endmodule

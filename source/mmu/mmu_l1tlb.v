`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  mmu_l1tlb
// Author:  Yang Yuyuan
// Date:    2024/10/10
// Description: 32 normal, 4 super
//======================================================

module mmu_l1tlb (
    input rstn,

    // input, ifu/exe -> l1, reqIndex(6b) + reqType(2b) + reqvAddr(32b) + cpuMode(2b) + satpMode(1b) + satpAsid(9b) + satpPpn(22b) + mstatusMxr(1b) + mstatusSum(1b) + mstatusMprv(1b) + mstatusMpp(2b)
    input         i_mmu_l1tlb_drive_1,
    output        o_l1tlb_mmu_free_1,
    input  [78:0] i_mmu_l1tlb_data_79,

    // input, sfence -> l1, rs2(5b) + rs1(5b) + asid(9b) + vpn(20b)
    input         i_sfence_l1tlb_drive_1,
    output        o_l1tlb_sfence_free_1,
    input  [38:0] i_sfence_l1tlb_data_39,

    // input, l2 -> l1, wbEn(2b) + wbPte(32b)
    input         i_l2_l1tlb_drive_1,
    output        o_l1tlb_l2_free_1,
    input  [33:0] i_l2_l1tlb_data_34,

    // input, ptw -> l1, wbEn(2b) + wbPte(32b)
    input         i_ptw_l1tlb_drive_1,
    output        o_l1tlb_ptw_free_1,
    input  [33:0] i_ptw_l1tlb_data_34,

    // output, l1 -> pmp0(direct trans), l1tlbIndex(4b) + instIndex(6b) + pAddr(34b) + cpuMode(2b) + instType(2b)
    output        o_l1tlb_pmp0_drive_1,
    input         i_pmp0_l1tlb_free_1,
    output [47:0] o_l1tlb_pmp0_data_48,

    // output, l1 -> pmp1(l1 find), l1tlbIndex(4b) + instIndex(6b) + pAddr(34b) + cpuMode(2b) + instType(2b)
    output        o_l1tlb_pmp1_drive_1,
    input         i_pmp1_l1tlb_free_1,
    output [47:0] o_l1tlb_pmp1_data_48,

    // output, l1 -> ifuexp, expIndex(5b)
    output       o_l1tlb_ifuexp_drive_1,
    input        i_ifuexp_l1tlb_free_1,
    output [4:0] o_l1tlb_ifuexp_data_5,

    // output, l1 -> lsuexp, instIndex(6b) + expIndex(5b)
    output        o_l1tlb_lsuexp_drive_1,
    input         i_lsuexp_l1tlb_free_1,
    output [10:0] o_l1tlb_lsuexp_data_11,

    // output, l1 -> l2, reqIndex(6b) + reqType(2b) + reqVaddr(32b) + cpuMode(2b) + satpAsid(9b) + satpPpn(22b) + mstatusMxr(1b) + mstatusSum(1b)
    output        o_l1tlb_l2_drive_1,
    input         i_l2_l1tlb_free_1,
    output [74:0] o_l1tlb_l2_data_75
);

    //---------------------- cFifo1: Save ifu/exe input to registers ----------------------//
    wire [ 5:0] w_req_index_6;
    wire [ 1:0] w_req_type_2;
    wire [31:0] w_req_vaddr_32;
    wire [ 1:0] w_cpu_mode_2;
    wire        w_satp_mode_1;
    wire [ 8:0] w_satp_asid_9;
    wire [21:0] w_satp_ppn_22;
    wire        w_mstatus_mxr_1;
    wire        w_mstatus_sum_1;
    wire        w_mstatus_mprv_1;
    wire [ 1:0] w_mstatus_mpp_2;

    assign {w_req_index_6, w_req_type_2, w_req_vaddr_32, w_cpu_mode_2, w_satp_mode_1, w_satp_asid_9, w_satp_ppn_22, w_mstatus_mxr_1, w_mstatus_sum_1, w_mstatus_mprv_1, w_mstatus_mpp_2} = i_mmu_l1tlb_data_79;

    reg  [ 5:0] r_req_index_6;
    reg  [ 1:0] r_req_type_2;
    reg  [31:0] r_req_vaddr_32;
    reg  [ 1:0] r_cpu_mode_2;
    reg         r_satp_mode_1;
    reg  [ 8:0] r_satp_asid_9;
    reg  [21:0] r_satp_ppn_22;
    reg         r_mstatus_mxr_1;
    reg         r_mstatus_sum_1;

    wire        w_cFifo1_fire_1;
    wire        w_cFifo1_cFork1_drive_1;
    wire        w_cFork1_cFifo1_free_1;

    cFifo1_mmu cFifo1 (
        .i_drive    (i_mmu_l1tlb_drive_1),
        .i_freeNext (w_cFork1_cFifo1_free_1),
        .o_free     (o_l1tlb_mmu_free_1),
        .o_driveNext(w_cFifo1_cFork1_drive_1),
        .o_fire_1   (w_cFifo1_fire_1),
        .rstn       (rstn)
    );

    always @(negedge rstn or posedge w_cFifo1_fire_1) begin
        if (!rstn) begin
            r_req_index_6   <= 0;
            r_req_type_2    <= 0;
            r_req_vaddr_32  <= 0;
            r_cpu_mode_2    <= 0;
            r_satp_mode_1   <= 0;
            r_satp_ppn_22   <= 0;
            r_satp_asid_9   <= 0;
            r_mstatus_mxr_1 <= 0;
            r_mstatus_sum_1 <= 0;
        end else begin
            r_req_index_6   <= w_req_index_6;
            r_req_type_2    <= w_req_type_2;
            r_req_vaddr_32  <= w_req_vaddr_32;
            r_satp_mode_1   <= w_satp_mode_1;
            r_satp_ppn_22   <= w_satp_ppn_22;
            r_satp_asid_9   <= w_satp_asid_9;
            r_mstatus_mxr_1 <= w_mstatus_mxr_1;
            r_mstatus_sum_1 <= w_mstatus_sum_1;
            if (w_req_type_2[1] == 1'b1 && w_mstatus_mprv_1 == 1'b1) begin
                r_cpu_mode_2 <= w_mstatus_mpp_2;
            end else begin
                r_cpu_mode_2 <= w_cpu_mode_2;
            end
        end
    end

    //---------------------- cFork1: Check if direct address translation is possible ----------------------//
    wire [1 : 0] w_cFork1_valid_2;
    wire         w_cFork1_cFork2_drive_1;
    wire         w_cFork2_cFork1_free_1;

    assign w_cFork1_valid_2[0] = (r_cpu_mode_2 == 2'b11 || r_satp_mode_1 == 1'b0) ? 1'b1 : 1'b0;
    assign w_cFork1_valid_2[1] = ((r_cpu_mode_2 == 2'b00 || r_cpu_mode_2 == 2'b01) && r_satp_mode_1 == 1'b1) ? 1'b1 : 1'b0;

    cSelector2_mmu #(2) cFork1 (
        .rstn        (rstn),
        .i_select    (w_cFork1_valid_2),
        .i_drive     (w_cFifo1_cFork1_drive_1),
        .o_free      (w_cFork1_cFifo1_free_1),
        .o_driveNext0(o_l1tlb_pmp0_drive_1),
        .i_freeNext0 (i_pmp0_l1tlb_free_1),
        .o_driveNext1(w_cFork1_cFork2_drive_1),
        .i_freeNext1 (w_cFork2_cFork1_free_1)

    );

    //---------------------- cFork2: Check if the corresponding table entry is found and the table entry information flag bit is appropriate. ----------------------//
    wire [31:0] w_hit_pte_32;
    wire [ 1:0] w_hit_2;

    wire        w_pteFault_1;
    assign  w_pteFault_1 = (w_hit_2 != 2'b0) && (
            (w_hit_pte_32[0] == 1'b0) ||
            (w_hit_pte_32[2] == 1'b1 && w_hit_pte_32[1] == 1'b0) || 
            (r_req_type_2 == 2'b00 && w_hit_pte_32[3] == 1'b0) ||
            (r_req_type_2 == 2'b10 && w_hit_pte_32[2] == 1'b0) ||
            (r_mstatus_mxr_1 == 1'b0 && r_req_type_2 == 2'b11 && w_hit_pte_32[1] == 1'b0) ||
            (r_mstatus_mxr_1 == 1'b0 && r_req_type_2 == 2'b11 && w_hit_pte_32[3] == 1'b0 && w_hit_pte_32[1] == 1'b0) ||
            (w_hit_pte_32[4] == 1'b1 && r_cpu_mode_2 == 2'b01 && r_req_type_2[1] == 1'b0) ||
            (r_mstatus_sum_1 == 1'b0 && w_hit_pte_32[4] == 1'b1 && r_cpu_mode_2 == 2'b01 && r_req_type_2[1] == 1'b1)
        );

    wire [3:0] w_cFork2_select_4;

    assign w_cFork2_select_4[0] = (w_hit_2 != 2'b0 && ~w_pteFault_1) ? 1'b1 : 1'b0;
    assign w_cFork2_select_4[1] = (w_hit_2 != 2'b0 && w_pteFault_1 && ~r_req_type_2[1]) ? 1'b1 : 1'b0;
    assign w_cFork2_select_4[2] = (w_hit_2 != 2'b0 && w_pteFault_1 && r_req_type_2[1]) ? 1'b1 : 1'b0;
    assign w_cFork2_select_4[3] = (w_hit_2 == 2'b0) ? 1'b1 : 1'b0;

    wire w_cFork1_cFork2_drive_delay_1;
    (* dont_touch="true" *) delay_mmu #(12) cFork1_cFork2_drive_delay (
        .inR (w_cFork1_cFork2_drive_1),
        .rstn(rstn),
        .outR(w_cFork1_cFork2_drive_delay_1)
    );

    cSelector4_mmu #(4) cFork2 (
        .rstn        (rstn),
        .i_select    (w_cFork2_select_4),
        .i_drive     (w_cFork1_cFork2_drive_delay_1),
        .o_free      (w_cFork2_cFork1_free_1),
        .o_driveNext0(o_l1tlb_pmp1_drive_1),
        .i_freeNext0 (i_pmp1_l1tlb_free_1),
        .o_driveNext1(o_l1tlb_ifuexp_drive_1),
        .i_freeNext1 (i_ifuexp_l1tlb_free_1),
        .o_driveNext2(o_l1tlb_lsuexp_drive_1),
        .i_freeNext2 (i_lsuexp_l1tlb_free_1),
        .o_driveNext3(o_l1tlb_l2_drive_1),
        .i_freeNext3 (i_l2_l1tlb_free_1)
    );
    assign o_l1tlb_ifuexp_data_5  = (w_cFork2_select_4[1] == 1'b1) ? 5'd12 : 5'd0;
    assign o_l1tlb_lsuexp_data_11 = (w_cFork2_select_4[2] == 1'b1 && r_req_type_2 == 2'b10) ? {r_req_index_6, 5'd15} : (w_cFork2_select_4[2] == 1'b1 && r_req_type_2 == 2'b11) ? {r_req_index_6, 5'd13} : 11'b0;
    assign o_l1tlb_l2_data_75     = {r_req_index_6, r_req_type_2, r_req_vaddr_32, r_cpu_mode_2, r_satp_asid_9, r_satp_ppn_22, r_mstatus_mxr_1, r_mstatus_sum_1};

    assign o_l1tlb_pmp0_data_48   = {4'b0, r_req_index_6, {2'b0, r_req_vaddr_32}, r_cpu_mode_2, r_req_type_2};
    assign o_l1tlb_pmp1_data_48   = (w_hit_2[1] == 1'b1) ? {4'b0, r_req_index_6, w_hit_pte_32[31:20], r_req_vaddr_32[21:0], r_cpu_mode_2, r_req_type_2} : (w_hit_2[0] == 1'b1) ? {4'b0, r_req_index_6, w_hit_pte_32[31:10], r_req_vaddr_32[11:0], r_cpu_mode_2, r_req_type_2} : 48'b0;

    //---------------------- cMerge1: Combining write-back signals from secondary tlb and ptw ----------------------//
    wire [33:0] w_wb_data_34;

    wire        w_cMerge1_cFifo2_drive_1;
    wire        w_cFifo2_cMerge1_free_1;

    cMutexMerge2_mmu #(2, 34) cMerge1 (
        .rstn       (rstn),
        .i_drive0   (i_l2_l1tlb_drive_1),
        .i_data0    (i_l2_l1tlb_data_34),
        .o_free0    (o_l1tlb_l2_free_1),
        .i_drive1   (i_ptw_l1tlb_drive_1),
        .i_data1    (i_ptw_l1tlb_data_34),
        .o_free1    (o_l1tlb_ptw_free_1),
        .o_driveNext(w_cMerge1_cFifo2_drive_1),
        .o_data     (w_wb_data_34),
        .i_freeNext (w_cFifo2_cMerge1_free_1)
    );

    wire [ 1:0] w_wb_en_2;
    wire [31:0] w_wb_pte_32;
    assign {w_wb_en_2, w_wb_pte_32} = w_wb_data_34;

    //---------------------- cFifo2: Update tlb replacement location ----------------------//
    wire w_cFifo2_fire_1;
    wire w_cFifo2_cFifo3_drive_1;
    wire w_cFifo3_cFifo2_free_1;

    cFifo1_mmu cFifo2 (
        .rstn       (rstn),
        .i_drive    (w_cMerge1_cFifo2_drive_1),
        .o_free     (w_cFifo2_cMerge1_free_1),
        .o_driveNext(w_cFifo2_cFifo3_drive_1),
        .i_freeNext (w_cFifo3_cFifo2_free_1),
        .o_fire_1   (w_cFifo2_fire_1)
    );

    reg [ 1:0] r_wb_en_2;
    reg [31:0] r_wb_pte_32;

    always @(negedge rstn or posedge w_cFifo2_fire_1) begin
        if (!rstn) begin
            r_wb_en_2   <= 0;
            r_wb_pte_32 <= 0;
        end else begin
            r_wb_en_2   <= w_wb_en_2;
            r_wb_pte_32 <= w_wb_pte_32;
        end
    end

    wire w_cFifo3_fire_1;
    wire w_cFifo3_cMerge2_drive_1;
    wire w_cMerge2_cFifo3_free_1;

    cFifo1_mmu cFifo3 (
        .rstn       (rstn),
        .i_drive    (w_cFifo2_cFifo3_drive_1),
        .o_free     (w_cFifo3_cFifo2_free_1),
        .o_driveNext(w_cFifo3_cMerge2_drive_1),
        .i_freeNext (w_cMerge2_cFifo3_free_1),
        .o_fire_1   (w_cFifo3_fire_1)
    );

    //---------------------- cMerge2: Combining refresh and write-back signals ----------------------//
    wire [8 : 0] w_flush_asid_9;
    wire [ 19:0] w_flush_vpn_20;
    wire [4 : 0] w_flush_rs1_5;
    wire [4 : 0] w_flush_rs2_5;
    assign {w_flush_rs2_5, w_flush_rs1_5, w_flush_asid_9, w_flush_vpn_20} = i_sfence_l1tlb_data_39;

    wire [2:0] w_tlb_flush_write_en_3;

    wire       w_cMerge2_cFifo4_drive_1;
    wire       w_cFifo4_cMerge2_free_1;
    wire       w_cFifo4_cMerge2_free_delay_1;
    (* dont_touch="true" *) delay_mmu #(10) cFifo4_cMerge2_free_delay (
        .inR (w_cFifo4_cMerge2_free_1),
        .rstn(rstn),
        .outR(w_cFifo4_cMerge2_free_delay_1)
    );

    cMutexMerge2_mmu #(2, 3) cMerge2 (
        .rstn       (rstn),
        .i_drive0   (i_sfence_l1tlb_drive_1),
        .i_data0    ({3'b100}),
        .o_free0    (o_l1tlb_sfence_free_1),
        .i_drive1   (w_cFifo3_cMerge2_drive_1),
        .i_data1    ({1'b0, r_wb_en_2}),
        .o_free1    (w_cMerge2_cFifo3_free_1),
        .o_driveNext(w_cMerge2_cFifo4_drive_1),
        .o_data     (w_tlb_flush_write_en_3),
        .i_freeNext (w_cFifo4_cMerge2_free_delay_1)
    );

    //---------------------- cFifo4: Write back to level 1 tlb ----------------------//
    wire w_cMerge2_cFifo4_drive_delay_1;
    (* dont_touch="true" *) delay_mmu #(14) cMerge2_cFifo4_drive_delay (
        .inR (w_cMerge2_cFifo4_drive_1),
        .rstn(rstn),
        .outR(w_cMerge2_cFifo4_drive_delay_1)
    );

    wire w_cFifo4_fire_1;
    cLastFifo1_mmu cFifo4 (
        .i_drive    (w_cMerge2_cFifo4_drive_delay_1),
        .o_free     (w_cFifo4_cMerge2_free_1),
        .o_driveNext(),
        .o_fire_1   (w_cFifo4_fire_1),
        .rstn       (rstn)
    );
    //---------------------- Instantiation of the tlb Table Entry and Replacement Module ----------------------//

    wire [31:0] w_tlb_normal_valid_32;
    wire [ 3:0] w_tlb_super_valid_4;
    wire [ 4:0] w_tlb_write_position_5;

    mmu_l1tlb_replace mmu_l1tlb_replace (
        .rstn              (rstn),
        .clk               (w_cFifo3_fire_1),
        .i_write_en_2      (r_wb_en_2),
        .i_normal_valid_32 (w_tlb_normal_valid_32),
        .i_super_valid_4   (w_tlb_super_valid_4),
        .o_write_position_5(w_tlb_write_position_5)
    );


    mmu_l1tlb_entry mmu_l1tlb_entry (
        .rstn               (rstn),
        .clk                (w_cFifo4_fire_1),
        .o_normal_valid_32  (w_tlb_normal_valid_32),
        .o_super_valid_4    (w_tlb_super_valid_4),
        .i_read_contrast_29 ({r_satp_asid_9, r_req_vaddr_32[31:12]}),                          // asid 9 + vpn 20 || asid 9 + vpn 20
        .o_hit_pte_32       (w_hit_pte_32),                                                    // ppn22 + flag10 || ppn22 + flag10
        .o_hit_2            (w_hit_2),
        .i_write_position_5 (w_tlb_write_position_5),                                          // 6-5:super; 4-0:normal
        .i_write_data_61    ({r_req_vaddr_32[31:12], r_satp_asid_9, r_wb_pte_32}),             // flag + pte
        .i_write_en_2       (w_tlb_flush_write_en_3[1:0]),
        .i_flush_contrast_39({w_flush_rs2_5, w_flush_rs1_5, w_flush_asid_9, w_flush_vpn_20}),  // asid 9 + vpn 20 || asid 9 + vpn 20
        .i_flush_en_1       (w_tlb_flush_write_en_3[2])
    );
endmodule

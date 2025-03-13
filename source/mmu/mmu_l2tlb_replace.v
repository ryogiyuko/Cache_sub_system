`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  mmu_l1tlb_replace
// Author:  Yang Yuyuan
// Date:    2024/10/10
// Description: 
//======================================================

module mmu_l2tlb_replace (
    input            rstn,
    input            clk,
    // plru update signal(10:64, 01:256)
    input      [1:0] i_update_en_2,
    input      [7:0] i_update_position_8,
    input      [3:0] i_update_way_4,
    // plru replacement signal
    input      [3:0] i_l21_valid_4,
    input      [3:0] i_l22_valid_4,
    input      [1:0] i_replace_en_2,
    input      [5:0] i_l21_replace_position_6,
    input      [7:0] i_l22_replace_position_8,
    output reg [3:0] o_replace_way_4
);

    //---------------------- Instantiating plru units ----------------------//
    wire [3:0] w_replace_way_64 [ 63:0];
    wire [3:0] w_replace_way_256[255:0];

    mmu_l2tlb_plru_4way plru_64_inst0 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd0) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[0])
    );

    mmu_l2tlb_plru_4way plru_64_inst1 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd1) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[1])
    );

    mmu_l2tlb_plru_4way plru_64_inst2 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd2) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[2])
    );

    mmu_l2tlb_plru_4way plru_64_inst3 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd3) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[3])
    );

    mmu_l2tlb_plru_4way plru_64_inst4 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd4) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[4])
    );

    mmu_l2tlb_plru_4way plru_64_inst5 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd5) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[5])
    );

    mmu_l2tlb_plru_4way plru_64_inst6 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd6) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[6])
    );

    mmu_l2tlb_plru_4way plru_64_inst7 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd7) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[7])
    );

    mmu_l2tlb_plru_4way plru_64_inst8 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd8) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[8])
    );

    mmu_l2tlb_plru_4way plru_64_inst9 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd9) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[9])
    );

    mmu_l2tlb_plru_4way plru_64_inst10 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd10) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[10])
    );

    mmu_l2tlb_plru_4way plru_64_inst11 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd11) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[11])
    );

    mmu_l2tlb_plru_4way plru_64_inst12 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd12) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[12])
    );

    mmu_l2tlb_plru_4way plru_64_inst13 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd13) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[13])
    );

    mmu_l2tlb_plru_4way plru_64_inst14 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd14) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[14])
    );

    mmu_l2tlb_plru_4way plru_64_inst15 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd15) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[15])
    );

    mmu_l2tlb_plru_4way plru_64_inst16 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd16) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[16])
    );

    mmu_l2tlb_plru_4way plru_64_inst17 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd17) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[17])
    );

    mmu_l2tlb_plru_4way plru_64_inst18 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd18) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[18])
    );

    mmu_l2tlb_plru_4way plru_64_inst19 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd19) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[19])
    );

    mmu_l2tlb_plru_4way plru_64_inst20 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd20) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[20])
    );

    mmu_l2tlb_plru_4way plru_64_inst21 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd21) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[21])
    );

    mmu_l2tlb_plru_4way plru_64_inst22 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd22) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[22])
    );

    mmu_l2tlb_plru_4way plru_64_inst23 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd23) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[23])
    );

    mmu_l2tlb_plru_4way plru_64_inst24 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd24) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[24])
    );

    mmu_l2tlb_plru_4way plru_64_inst25 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd25) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[25])
    );

    mmu_l2tlb_plru_4way plru_64_inst26 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd26) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[26])
    );

    mmu_l2tlb_plru_4way plru_64_inst27 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd27) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[27])
    );

    mmu_l2tlb_plru_4way plru_64_inst28 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd28) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[28])
    );

    mmu_l2tlb_plru_4way plru_64_inst29 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd29) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[29])
    );

    mmu_l2tlb_plru_4way plru_64_inst30 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd30) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[30])
    );

    mmu_l2tlb_plru_4way plru_64_inst31 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd31) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[31])
    );

    mmu_l2tlb_plru_4way plru_64_inst32 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd32) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[32])
    );

    mmu_l2tlb_plru_4way plru_64_inst33 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd33) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[33])
    );

    mmu_l2tlb_plru_4way plru_64_inst34 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd34) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[34])
    );

    mmu_l2tlb_plru_4way plru_64_inst35 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd35) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[35])
    );

    mmu_l2tlb_plru_4way plru_64_inst36 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd36) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[36])
    );

    mmu_l2tlb_plru_4way plru_64_inst37 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd37) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[37])
    );

    mmu_l2tlb_plru_4way plru_64_inst38 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd38) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[38])
    );

    mmu_l2tlb_plru_4way plru_64_inst39 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd39) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[39])
    );

    mmu_l2tlb_plru_4way plru_64_inst40 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd40) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[40])
    );

    mmu_l2tlb_plru_4way plru_64_inst41 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd41) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[41])
    );

    mmu_l2tlb_plru_4way plru_64_inst42 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd42) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[42])
    );

    mmu_l2tlb_plru_4way plru_64_inst43 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd43) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[43])
    );

    mmu_l2tlb_plru_4way plru_64_inst44 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd44) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[44])
    );

    mmu_l2tlb_plru_4way plru_64_inst45 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd45) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[45])
    );

    mmu_l2tlb_plru_4way plru_64_inst46 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd46) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[46])
    );

    mmu_l2tlb_plru_4way plru_64_inst47 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd47) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[47])
    );

    mmu_l2tlb_plru_4way plru_64_inst48 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd48) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[48])
    );

    mmu_l2tlb_plru_4way plru_64_inst49 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd49) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[49])
    );

    mmu_l2tlb_plru_4way plru_64_inst50 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd50) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[50])
    );

    mmu_l2tlb_plru_4way plru_64_inst51 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd51) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[51])
    );

    mmu_l2tlb_plru_4way plru_64_inst52 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd52) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[52])
    );

    mmu_l2tlb_plru_4way plru_64_inst53 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd53) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[53])
    );

    mmu_l2tlb_plru_4way plru_64_inst54 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd54) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[54])
    );

    mmu_l2tlb_plru_4way plru_64_inst55 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd55) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[55])
    );

    mmu_l2tlb_plru_4way plru_64_inst56 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd56) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[56])
    );

    mmu_l2tlb_plru_4way plru_64_inst57 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd57) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[57])
    );

    mmu_l2tlb_plru_4way plru_64_inst58 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd58) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[58])
    );

    mmu_l2tlb_plru_4way plru_64_inst59 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd59) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[59])
    );

    mmu_l2tlb_plru_4way plru_64_inst60 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd60) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[60])
    );

    mmu_l2tlb_plru_4way plru_64_inst61 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd61) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[61])
    );

    mmu_l2tlb_plru_4way plru_64_inst62 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd62) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[62])
    );

    mmu_l2tlb_plru_4way plru_64_inst63 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b10 && i_update_position_8 == 8'd63) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_64[63])
    );

    // ÊµÀý»¯256×éµÄPLRUÄ£¿é
    mmu_l2tlb_plru_4way plru_256_inst0 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd0) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[0])
    );

    mmu_l2tlb_plru_4way plru_256_inst1 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd1) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[1])
    );

    mmu_l2tlb_plru_4way plru_256_inst2 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd2) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[2])
    );

    mmu_l2tlb_plru_4way plru_256_inst3 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd3) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[3])
    );

    mmu_l2tlb_plru_4way plru_256_inst4 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd4) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[4])
    );

    mmu_l2tlb_plru_4way plru_256_inst5 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd5) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[5])
    );

    mmu_l2tlb_plru_4way plru_256_inst6 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd6) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[6])
    );

    mmu_l2tlb_plru_4way plru_256_inst7 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd7) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[7])
    );

    mmu_l2tlb_plru_4way plru_256_inst8 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd8) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[8])
    );

    mmu_l2tlb_plru_4way plru_256_inst9 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd9) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[9])
    );

    mmu_l2tlb_plru_4way plru_256_inst10 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd10) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[10])
    );

    mmu_l2tlb_plru_4way plru_256_inst11 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd11) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[11])
    );

    mmu_l2tlb_plru_4way plru_256_inst12 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd12) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[12])
    );

    mmu_l2tlb_plru_4way plru_256_inst13 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd13) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[13])
    );

    mmu_l2tlb_plru_4way plru_256_inst14 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd14) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[14])
    );

    mmu_l2tlb_plru_4way plru_256_inst15 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd15) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[15])
    );

    mmu_l2tlb_plru_4way plru_256_inst16 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd16) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[16])
    );

    mmu_l2tlb_plru_4way plru_256_inst17 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd17) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[17])
    );

    mmu_l2tlb_plru_4way plru_256_inst18 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd18) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[18])
    );

    mmu_l2tlb_plru_4way plru_256_inst19 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd19) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[19])
    );

    mmu_l2tlb_plru_4way plru_256_inst20 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd20) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[20])
    );

    mmu_l2tlb_plru_4way plru_256_inst21 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd21) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[21])
    );

    mmu_l2tlb_plru_4way plru_256_inst22 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd22) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[22])
    );

    mmu_l2tlb_plru_4way plru_256_inst23 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd23) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[23])
    );

    mmu_l2tlb_plru_4way plru_256_inst24 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd24) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[24])
    );

    mmu_l2tlb_plru_4way plru_256_inst25 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd25) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[25])
    );

    mmu_l2tlb_plru_4way plru_256_inst26 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd26) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[26])
    );

    mmu_l2tlb_plru_4way plru_256_inst27 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd27) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[27])
    );

    mmu_l2tlb_plru_4way plru_256_inst28 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd28) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[28])
    );

    mmu_l2tlb_plru_4way plru_256_inst29 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd29) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[29])
    );

    mmu_l2tlb_plru_4way plru_256_inst30 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd30) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[30])
    );

    mmu_l2tlb_plru_4way plru_256_inst31 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd31) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[31])
    );

    mmu_l2tlb_plru_4way plru_256_inst32 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd32) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[32])
    );

    mmu_l2tlb_plru_4way plru_256_inst33 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd33) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[33])
    );

    mmu_l2tlb_plru_4way plru_256_inst34 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd34) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[34])
    );

    mmu_l2tlb_plru_4way plru_256_inst35 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd35) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[35])
    );

    mmu_l2tlb_plru_4way plru_256_inst36 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd36) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[36])
    );

    mmu_l2tlb_plru_4way plru_256_inst37 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd37) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[37])
    );

    mmu_l2tlb_plru_4way plru_256_inst38 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd38) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[38])
    );

    mmu_l2tlb_plru_4way plru_256_inst39 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd39) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[39])
    );

    mmu_l2tlb_plru_4way plru_256_inst40 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd40) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[40])
    );

    mmu_l2tlb_plru_4way plru_256_inst41 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd41) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[41])
    );

    mmu_l2tlb_plru_4way plru_256_inst42 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd42) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[42])
    );

    mmu_l2tlb_plru_4way plru_256_inst43 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd43) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[43])
    );

    mmu_l2tlb_plru_4way plru_256_inst44 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd44) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[44])
    );

    mmu_l2tlb_plru_4way plru_256_inst45 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd45) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[45])
    );

    mmu_l2tlb_plru_4way plru_256_inst46 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd46) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[46])
    );

    mmu_l2tlb_plru_4way plru_256_inst47 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd47) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[47])
    );

    mmu_l2tlb_plru_4way plru_256_inst48 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd48) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[48])
    );

    mmu_l2tlb_plru_4way plru_256_inst49 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd49) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[49])
    );

    mmu_l2tlb_plru_4way plru_256_inst50 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd50) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[50])
    );

    mmu_l2tlb_plru_4way plru_256_inst51 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd51) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[51])
    );

    mmu_l2tlb_plru_4way plru_256_inst52 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd52) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[52])
    );

    mmu_l2tlb_plru_4way plru_256_inst53 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd53) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[53])
    );

    mmu_l2tlb_plru_4way plru_256_inst54 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd54) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[54])
    );

    mmu_l2tlb_plru_4way plru_256_inst55 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd55) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[55])
    );

    mmu_l2tlb_plru_4way plru_256_inst56 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd56) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[56])
    );

    mmu_l2tlb_plru_4way plru_256_inst57 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd57) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[57])
    );

    mmu_l2tlb_plru_4way plru_256_inst58 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd58) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[58])
    );

    mmu_l2tlb_plru_4way plru_256_inst59 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd59) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[59])
    );

    mmu_l2tlb_plru_4way plru_256_inst60 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd60) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[60])
    );

    mmu_l2tlb_plru_4way plru_256_inst61 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd61) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[61])
    );

    mmu_l2tlb_plru_4way plru_256_inst62 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd62) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[62])
    );

    mmu_l2tlb_plru_4way plru_256_inst63 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd63) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[63])
    );

    mmu_l2tlb_plru_4way plru_256_inst64 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd64) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[64])
    );

    mmu_l2tlb_plru_4way plru_256_inst65 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd65) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[65])
    );

    mmu_l2tlb_plru_4way plru_256_inst66 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd66) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[66])
    );

    mmu_l2tlb_plru_4way plru_256_inst67 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd67) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[67])
    );

    mmu_l2tlb_plru_4way plru_256_inst68 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd68) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[68])
    );

    mmu_l2tlb_plru_4way plru_256_inst69 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd69) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[69])
    );

    mmu_l2tlb_plru_4way plru_256_inst70 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd70) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[70])
    );

    mmu_l2tlb_plru_4way plru_256_inst71 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd71) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[71])
    );

    mmu_l2tlb_plru_4way plru_256_inst72 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd72) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[72])
    );

    mmu_l2tlb_plru_4way plru_256_inst73 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd73) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[73])
    );

    mmu_l2tlb_plru_4way plru_256_inst74 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd74) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[74])
    );

    mmu_l2tlb_plru_4way plru_256_inst75 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd75) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[75])
    );

    mmu_l2tlb_plru_4way plru_256_inst76 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd76) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[76])
    );

    mmu_l2tlb_plru_4way plru_256_inst77 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd77) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[77])
    );

    mmu_l2tlb_plru_4way plru_256_inst78 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd78) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[78])
    );

    mmu_l2tlb_plru_4way plru_256_inst79 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd79) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[79])
    );

    mmu_l2tlb_plru_4way plru_256_inst80 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd80) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[80])
    );

    mmu_l2tlb_plru_4way plru_256_inst81 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd81) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[81])
    );

    mmu_l2tlb_plru_4way plru_256_inst82 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd82) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[82])
    );

    mmu_l2tlb_plru_4way plru_256_inst83 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd83) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[83])
    );

    mmu_l2tlb_plru_4way plru_256_inst84 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd84) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[84])
    );

    mmu_l2tlb_plru_4way plru_256_inst85 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd85) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[85])
    );

    mmu_l2tlb_plru_4way plru_256_inst86 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd86) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[86])
    );

    mmu_l2tlb_plru_4way plru_256_inst87 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd87) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[87])
    );

    mmu_l2tlb_plru_4way plru_256_inst88 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd88) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[88])
    );

    mmu_l2tlb_plru_4way plru_256_inst89 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd89) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[89])
    );

    mmu_l2tlb_plru_4way plru_256_inst90 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd90) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[90])
    );

    mmu_l2tlb_plru_4way plru_256_inst91 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd91) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[91])
    );

    mmu_l2tlb_plru_4way plru_256_inst92 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd92) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[92])
    );

    mmu_l2tlb_plru_4way plru_256_inst93 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd93) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[93])
    );

    mmu_l2tlb_plru_4way plru_256_inst94 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd94) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[94])
    );

    mmu_l2tlb_plru_4way plru_256_inst95 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd95) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[95])
    );

    mmu_l2tlb_plru_4way plru_256_inst96 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd96) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[96])
    );

    mmu_l2tlb_plru_4way plru_256_inst97 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd97) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[97])
    );

    mmu_l2tlb_plru_4way plru_256_inst98 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd98) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[98])
    );

    mmu_l2tlb_plru_4way plru_256_inst99 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd99) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[99])
    );

    mmu_l2tlb_plru_4way plru_256_inst100 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd100) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[100])
    );

    mmu_l2tlb_plru_4way plru_256_inst101 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd101) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[101])
    );

    mmu_l2tlb_plru_4way plru_256_inst102 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd102) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[102])
    );

    mmu_l2tlb_plru_4way plru_256_inst103 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd103) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[103])
    );

    mmu_l2tlb_plru_4way plru_256_inst104 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd104) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[104])
    );

    mmu_l2tlb_plru_4way plru_256_inst105 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd105) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[105])
    );

    mmu_l2tlb_plru_4way plru_256_inst106 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd106) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[106])
    );

    mmu_l2tlb_plru_4way plru_256_inst107 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd107) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[107])
    );

    mmu_l2tlb_plru_4way plru_256_inst108 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd108) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[108])
    );

    mmu_l2tlb_plru_4way plru_256_inst109 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd109) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[109])
    );

    mmu_l2tlb_plru_4way plru_256_inst110 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd110) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[110])
    );

    mmu_l2tlb_plru_4way plru_256_inst111 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd111) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[111])
    );

    mmu_l2tlb_plru_4way plru_256_inst112 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd112) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[112])
    );

    mmu_l2tlb_plru_4way plru_256_inst113 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd113) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[113])
    );

    mmu_l2tlb_plru_4way plru_256_inst114 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd114) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[114])
    );

    mmu_l2tlb_plru_4way plru_256_inst115 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd115) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[115])
    );

    mmu_l2tlb_plru_4way plru_256_inst116 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd116) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[116])
    );

    mmu_l2tlb_plru_4way plru_256_inst117 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd117) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[117])
    );

    mmu_l2tlb_plru_4way plru_256_inst118 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd118) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[118])
    );

    mmu_l2tlb_plru_4way plru_256_inst119 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd119) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[119])
    );

    mmu_l2tlb_plru_4way plru_256_inst120 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd120) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[120])
    );

    mmu_l2tlb_plru_4way plru_256_inst121 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd121) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[121])
    );

    mmu_l2tlb_plru_4way plru_256_inst122 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd122) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[122])
    );

    mmu_l2tlb_plru_4way plru_256_inst123 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd123) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[123])
    );

    mmu_l2tlb_plru_4way plru_256_inst124 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd124) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[124])
    );

    mmu_l2tlb_plru_4way plru_256_inst125 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd125) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[125])
    );

    mmu_l2tlb_plru_4way plru_256_inst126 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd126) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[126])
    );

    mmu_l2tlb_plru_4way plru_256_inst127 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd127) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[127])
    );

    mmu_l2tlb_plru_4way plru_256_inst128 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd128) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[128])
    );

    mmu_l2tlb_plru_4way plru_256_inst129 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd129) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[129])
    );

    mmu_l2tlb_plru_4way plru_256_inst130 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd130) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[130])
    );

    mmu_l2tlb_plru_4way plru_256_inst131 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd131) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[131])
    );

    mmu_l2tlb_plru_4way plru_256_inst132 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd132) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[132])
    );

    mmu_l2tlb_plru_4way plru_256_inst133 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd133) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[133])
    );

    mmu_l2tlb_plru_4way plru_256_inst134 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd134) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[134])
    );

    mmu_l2tlb_plru_4way plru_256_inst135 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd135) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[135])
    );

    mmu_l2tlb_plru_4way plru_256_inst136 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd136) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[136])
    );

    mmu_l2tlb_plru_4way plru_256_inst137 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd137) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[137])
    );

    mmu_l2tlb_plru_4way plru_256_inst138 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd138) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[138])
    );

    mmu_l2tlb_plru_4way plru_256_inst139 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd139) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[139])
    );

    mmu_l2tlb_plru_4way plru_256_inst140 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd140) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[140])
    );

    mmu_l2tlb_plru_4way plru_256_inst141 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd141) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[141])
    );

    mmu_l2tlb_plru_4way plru_256_inst142 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd142) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[142])
    );

    mmu_l2tlb_plru_4way plru_256_inst143 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd143) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[143])
    );

    mmu_l2tlb_plru_4way plru_256_inst144 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd144) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[144])
    );

    mmu_l2tlb_plru_4way plru_256_inst145 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd145) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[145])
    );

    mmu_l2tlb_plru_4way plru_256_inst146 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd146) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[146])
    );

    mmu_l2tlb_plru_4way plru_256_inst147 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd147) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[147])
    );

    mmu_l2tlb_plru_4way plru_256_inst148 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd148) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[148])
    );

    mmu_l2tlb_plru_4way plru_256_inst149 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd149) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[149])
    );

    mmu_l2tlb_plru_4way plru_256_inst150 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd150) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[150])
    );

    mmu_l2tlb_plru_4way plru_256_inst151 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd151) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[151])
    );

    mmu_l2tlb_plru_4way plru_256_inst152 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd152) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[152])
    );

    mmu_l2tlb_plru_4way plru_256_inst153 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd153) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[153])
    );

    mmu_l2tlb_plru_4way plru_256_inst154 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd154) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[154])
    );

    mmu_l2tlb_plru_4way plru_256_inst155 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd155) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[155])
    );

    mmu_l2tlb_plru_4way plru_256_inst156 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd156) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[156])
    );

    mmu_l2tlb_plru_4way plru_256_inst157 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd157) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[157])
    );

    mmu_l2tlb_plru_4way plru_256_inst158 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd158) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[158])
    );

    mmu_l2tlb_plru_4way plru_256_inst159 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd159) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[159])
    );

    mmu_l2tlb_plru_4way plru_256_inst160 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd160) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[160])
    );

    mmu_l2tlb_plru_4way plru_256_inst161 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd161) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[161])
    );

    mmu_l2tlb_plru_4way plru_256_inst162 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd162) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[162])
    );

    mmu_l2tlb_plru_4way plru_256_inst163 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd163) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[163])
    );

    mmu_l2tlb_plru_4way plru_256_inst164 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd164) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[164])
    );

    mmu_l2tlb_plru_4way plru_256_inst165 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd165) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[165])
    );

    mmu_l2tlb_plru_4way plru_256_inst166 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd166) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[166])
    );

    mmu_l2tlb_plru_4way plru_256_inst167 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd167) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[167])
    );

    mmu_l2tlb_plru_4way plru_256_inst168 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd168) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[168])
    );

    mmu_l2tlb_plru_4way plru_256_inst169 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd169) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[169])
    );

    mmu_l2tlb_plru_4way plru_256_inst170 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd170) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[170])
    );

    mmu_l2tlb_plru_4way plru_256_inst171 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd171) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[171])
    );

    mmu_l2tlb_plru_4way plru_256_inst172 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd172) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[172])
    );

    mmu_l2tlb_plru_4way plru_256_inst173 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd173) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[173])
    );

    mmu_l2tlb_plru_4way plru_256_inst174 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd174) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[174])
    );

    mmu_l2tlb_plru_4way plru_256_inst175 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd175) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[175])
    );

    mmu_l2tlb_plru_4way plru_256_inst176 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd176) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[176])
    );

    mmu_l2tlb_plru_4way plru_256_inst177 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd177) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[177])
    );

    mmu_l2tlb_plru_4way plru_256_inst178 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd178) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[178])
    );

    mmu_l2tlb_plru_4way plru_256_inst179 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd179) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[179])
    );

    mmu_l2tlb_plru_4way plru_256_inst180 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd180) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[180])
    );

    mmu_l2tlb_plru_4way plru_256_inst181 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd181) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[181])
    );

    mmu_l2tlb_plru_4way plru_256_inst182 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd182) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[182])
    );

    mmu_l2tlb_plru_4way plru_256_inst183 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd183) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[183])
    );

    mmu_l2tlb_plru_4way plru_256_inst184 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd184) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[184])
    );

    mmu_l2tlb_plru_4way plru_256_inst185 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd185) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[185])
    );

    mmu_l2tlb_plru_4way plru_256_inst186 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd186) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[186])
    );

    mmu_l2tlb_plru_4way plru_256_inst187 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd187) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[187])
    );

    mmu_l2tlb_plru_4way plru_256_inst188 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd188) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[188])
    );

    mmu_l2tlb_plru_4way plru_256_inst189 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd189) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[189])
    );

    mmu_l2tlb_plru_4way plru_256_inst190 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd190) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[190])
    );

    mmu_l2tlb_plru_4way plru_256_inst191 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd191) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[191])
    );

    mmu_l2tlb_plru_4way plru_256_inst192 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd192) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[192])
    );

    mmu_l2tlb_plru_4way plru_256_inst193 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd193) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[193])
    );

    mmu_l2tlb_plru_4way plru_256_inst194 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd194) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[194])
    );

    mmu_l2tlb_plru_4way plru_256_inst195 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd195) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[195])
    );

    mmu_l2tlb_plru_4way plru_256_inst196 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd196) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[196])
    );

    mmu_l2tlb_plru_4way plru_256_inst197 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd197) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[197])
    );

    mmu_l2tlb_plru_4way plru_256_inst198 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd198) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[198])
    );

    mmu_l2tlb_plru_4way plru_256_inst199 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd199) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[199])
    );

    mmu_l2tlb_plru_4way plru_256_inst200 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd200) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[200])
    );

    mmu_l2tlb_plru_4way plru_256_inst201 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd201) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[201])
    );

    mmu_l2tlb_plru_4way plru_256_inst202 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd202) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[202])
    );

    mmu_l2tlb_plru_4way plru_256_inst203 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd203) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[203])
    );

    mmu_l2tlb_plru_4way plru_256_inst204 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd204) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[204])
    );

    mmu_l2tlb_plru_4way plru_256_inst205 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd205) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[205])
    );

    mmu_l2tlb_plru_4way plru_256_inst206 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd206) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[206])
    );

    mmu_l2tlb_plru_4way plru_256_inst207 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd207) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[207])
    );

    mmu_l2tlb_plru_4way plru_256_inst208 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd208) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[208])
    );

    mmu_l2tlb_plru_4way plru_256_inst209 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd209) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[209])
    );

    mmu_l2tlb_plru_4way plru_256_inst210 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd210) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[210])
    );

    mmu_l2tlb_plru_4way plru_256_inst211 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd211) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[211])
    );

    mmu_l2tlb_plru_4way plru_256_inst212 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd212) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[212])
    );

    mmu_l2tlb_plru_4way plru_256_inst213 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd213) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[213])
    );

    mmu_l2tlb_plru_4way plru_256_inst214 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd214) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[214])
    );

    mmu_l2tlb_plru_4way plru_256_inst215 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd215) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[215])
    );

    mmu_l2tlb_plru_4way plru_256_inst216 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd216) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[216])
    );

    mmu_l2tlb_plru_4way plru_256_inst217 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd217) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[217])
    );

    mmu_l2tlb_plru_4way plru_256_inst218 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd218) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[218])
    );

    mmu_l2tlb_plru_4way plru_256_inst219 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd219) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[219])
    );

    mmu_l2tlb_plru_4way plru_256_inst220 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd220) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[220])
    );

    mmu_l2tlb_plru_4way plru_256_inst221 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd221) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[221])
    );

    mmu_l2tlb_plru_4way plru_256_inst222 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd222) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[222])
    );

    mmu_l2tlb_plru_4way plru_256_inst223 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd223) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[223])
    );

    mmu_l2tlb_plru_4way plru_256_inst224 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd224) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[224])
    );

    mmu_l2tlb_plru_4way plru_256_inst225 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd225) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[225])
    );

    mmu_l2tlb_plru_4way plru_256_inst226 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd226) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[226])
    );

    mmu_l2tlb_plru_4way plru_256_inst227 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd227) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[227])
    );

    mmu_l2tlb_plru_4way plru_256_inst228 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd228) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[228])
    );

    mmu_l2tlb_plru_4way plru_256_inst229 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd229) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[229])
    );

    mmu_l2tlb_plru_4way plru_256_inst230 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd230) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[230])
    );

    mmu_l2tlb_plru_4way plru_256_inst231 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd231) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[231])
    );

    mmu_l2tlb_plru_4way plru_256_inst232 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd232) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[232])
    );

    mmu_l2tlb_plru_4way plru_256_inst233 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd233) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[233])
    );

    mmu_l2tlb_plru_4way plru_256_inst234 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd234) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[234])
    );

    mmu_l2tlb_plru_4way plru_256_inst235 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd235) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[235])
    );

    mmu_l2tlb_plru_4way plru_256_inst236 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd236) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[236])
    );

    mmu_l2tlb_plru_4way plru_256_inst237 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd237) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[237])
    );

    mmu_l2tlb_plru_4way plru_256_inst238 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd238) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[238])
    );

    mmu_l2tlb_plru_4way plru_256_inst239 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd239) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[239])
    );

    mmu_l2tlb_plru_4way plru_256_inst240 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd240) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[240])
    );

    mmu_l2tlb_plru_4way plru_256_inst241 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd241) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[241])
    );

    mmu_l2tlb_plru_4way plru_256_inst242 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd242) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[242])
    );

    mmu_l2tlb_plru_4way plru_256_inst243 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd243) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[243])
    );

    mmu_l2tlb_plru_4way plru_256_inst244 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd244) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[244])
    );

    mmu_l2tlb_plru_4way plru_256_inst245 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd245) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[245])
    );

    mmu_l2tlb_plru_4way plru_256_inst246 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd246) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[246])
    );

    mmu_l2tlb_plru_4way plru_256_inst247 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd247) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[247])
    );

    mmu_l2tlb_plru_4way plru_256_inst248 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd248) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[248])
    );

    mmu_l2tlb_plru_4way plru_256_inst249 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd249) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[249])
    );

    mmu_l2tlb_plru_4way plru_256_inst250 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd250) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[250])
    );

    mmu_l2tlb_plru_4way plru_256_inst251 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd251) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[251])
    );

    mmu_l2tlb_plru_4way plru_256_inst252 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd252) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[252])
    );

    mmu_l2tlb_plru_4way plru_256_inst253 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd253) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[253])
    );

    mmu_l2tlb_plru_4way plru_256_inst254 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd254) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[254])
    );

    mmu_l2tlb_plru_4way plru_256_inst255 (
        .clk            (clk),
        .rstn           (rstn),
        .i_update_way_4 ((i_update_en_2 == 2'b01 && i_update_position_8 == 8'd255) ? i_update_way_4 : 4'b0),
        .o_replace_way_4(w_replace_way_256[255])
    );

    //---------------------- The final replacement position is derived from the v-bit and the plru unit together ----------------------//
    always @(*) begin
        o_replace_way_4 = 4'b0000;

        if (i_replace_en_2[1]) begin
            if (i_l21_valid_4[0] == 1'b0) begin
                o_replace_way_4 = 4'b0001;
            end else if (i_l21_valid_4[1] == 1'b0) begin
                o_replace_way_4 = 4'b0010;
            end else if (i_l21_valid_4[2] == 1'b0) begin
                o_replace_way_4 = 4'b0100;
            end else if (i_l21_valid_4[3] == 1'b0) begin
                o_replace_way_4 = 4'b1000;
            end else begin
                o_replace_way_4 = w_replace_way_64[i_l21_replace_position_6];
            end
        end else if (i_replace_en_2[0]) begin
            if (i_l22_valid_4[0] == 1'b0) begin
                o_replace_way_4 = 4'b0001;
            end else if (i_l22_valid_4[1] == 1'b0) begin
                o_replace_way_4 = 4'b0010;
            end else if (i_l22_valid_4[2] == 1'b0) begin
                o_replace_way_4 = 4'b0100;
            end else if (i_l22_valid_4[3] == 1'b0) begin
                o_replace_way_4 = 4'b1000;
            end else begin
                o_replace_way_4 = w_replace_way_256[i_l22_replace_position_8];
            end
        end else begin
            o_replace_way_4 = 4'b0000;  // Ä¬ÈÏÌæ»»Â·
        end
    end

endmodule
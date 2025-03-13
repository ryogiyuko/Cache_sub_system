`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  mmu_l1tlb_entry
// Author:  Yang Yuyuan
// Date:    2024/10/10
// Description: 
//======================================================

module mmu_l1tlb_entry (
    input         rstn,
    input         clk,
    // output, entry -> replace, normalValid(32b), superValid(4b)
    output [31:0] o_normal_valid_32,
    output [ 3:0] o_super_valid_4,
    // read, l1tlb -> entry, satpAsid(9b) + vpn(20b), entry -> l1tlb, ptehit(32b), hit(2b)
    input  [28:0] i_read_contrast_29,
    output [31:0] o_hit_pte_32,
    output [ 1:0] o_hit_2,
    // write, l1tlb -> entry, wPosition(5b), vpn(20b) + asid(9b) + pte(32b), wEn(2b,0:normal,1:super)
    input  [ 4:0] i_write_position_5,
    input  [60:0] i_write_data_61,
    input  [ 1:0] i_write_en_2,
    // flush, l1tlb -> entry
    input  [38:0] i_flush_contrast_39,
    input         i_flush_en_1
);

    reg  [28:0] r_normal_flag_29_32[ 31:0];
    reg  [31:0] r_normal_data_32_32[ 31:0];
    reg  [18:0] r_super_flag_19_4  [3 : 0];
    reg  [31:0] r_super_data_32_4  [3 : 0];

    wire [19:0] w_write_vpn_20;
    wire [ 8:0] w_write_asid_9;
    wire [31:0] w_write_pte_32;
    assign {w_write_vpn_20, w_write_asid_9, w_write_pte_32} = i_write_data_61;

    wire [ 19:0] w_flush_vpn_20;
    wire [  8:0] w_flush_asid_9;
    wire [4 : 0] w_flush_rs1_5;
    wire [4 : 0] w_flush_rs2_5;
    wire         w_flush_vpn_zero_1;
    wire         w_flush_asid_zero_1;
    assign {w_flush_rs2_5, w_flush_rs1_5, w_flush_asid_9, w_flush_vpn_20} = i_flush_contrast_39;
    assign w_flush_asid_zero_1                                            = (w_flush_rs2_5 == 0) ? 1'b1 : 1'b0;
    assign w_flush_vpn_zero_1                                             = (w_flush_rs1_5 == 0) ? 1'b1 : 1'b0;

    //---------------------- Refresh or write table entries ----------------------//
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            r_normal_flag_29_32[0]  <= 0;
            r_normal_flag_29_32[1]  <= 0;
            r_normal_flag_29_32[2]  <= 0;
            r_normal_flag_29_32[3]  <= 0;
            r_normal_flag_29_32[4]  <= 0;
            r_normal_flag_29_32[5]  <= 0;
            r_normal_flag_29_32[6]  <= 0;
            r_normal_flag_29_32[7]  <= 0;
            r_normal_flag_29_32[8]  <= 0;
            r_normal_flag_29_32[9]  <= 0;
            r_normal_flag_29_32[10] <= 0;
            r_normal_flag_29_32[11] <= 0;
            r_normal_flag_29_32[12] <= 0;
            r_normal_flag_29_32[13] <= 0;
            r_normal_flag_29_32[14] <= 0;
            r_normal_flag_29_32[15] <= 0;
            r_normal_flag_29_32[16] <= 0;
            r_normal_flag_29_32[17] <= 0;
            r_normal_flag_29_32[18] <= 0;
            r_normal_flag_29_32[19] <= 0;
            r_normal_flag_29_32[20] <= 0;
            r_normal_flag_29_32[21] <= 0;
            r_normal_flag_29_32[22] <= 0;
            r_normal_flag_29_32[23] <= 0;
            r_normal_flag_29_32[24] <= 0;
            r_normal_flag_29_32[25] <= 0;
            r_normal_flag_29_32[26] <= 0;
            r_normal_flag_29_32[27] <= 0;
            r_normal_flag_29_32[28] <= 0;
            r_normal_flag_29_32[29] <= 0;
            r_normal_flag_29_32[30] <= 0;
            r_normal_flag_29_32[31] <= 0;
            r_normal_data_32_32[0]  <= 0;
            r_normal_data_32_32[1]  <= 0;
            r_normal_data_32_32[2]  <= 0;
            r_normal_data_32_32[3]  <= 0;
            r_normal_data_32_32[4]  <= 0;
            r_normal_data_32_32[5]  <= 0;
            r_normal_data_32_32[6]  <= 0;
            r_normal_data_32_32[7]  <= 0;
            r_normal_data_32_32[8]  <= 0;
            r_normal_data_32_32[9]  <= 0;
            r_normal_data_32_32[10] <= 0;
            r_normal_data_32_32[11] <= 0;
            r_normal_data_32_32[12] <= 0;
            r_normal_data_32_32[13] <= 0;
            r_normal_data_32_32[14] <= 0;
            r_normal_data_32_32[15] <= 0;
            r_normal_data_32_32[16] <= 0;
            r_normal_data_32_32[17] <= 0;
            r_normal_data_32_32[18] <= 0;
            r_normal_data_32_32[19] <= 0;
            r_normal_data_32_32[20] <= 0;
            r_normal_data_32_32[21] <= 0;
            r_normal_data_32_32[22] <= 0;
            r_normal_data_32_32[23] <= 0;
            r_normal_data_32_32[24] <= 0;
            r_normal_data_32_32[25] <= 0;
            r_normal_data_32_32[26] <= 0;
            r_normal_data_32_32[27] <= 0;
            r_normal_data_32_32[28] <= 0;
            r_normal_data_32_32[29] <= 0;
            r_normal_data_32_32[30] <= 0;
            r_normal_data_32_32[31] <= 0;
            r_super_flag_19_4[0]    <= 0;
            r_super_flag_19_4[1]    <= 0;
            r_super_flag_19_4[2]    <= 0;
            r_super_flag_19_4[3]    <= 0;
            r_super_data_32_4[0]    <= 0;
            r_super_data_32_4[1]    <= 0;
            r_super_data_32_4[2]    <= 0;
            r_super_data_32_4[3]    <= 0;
        end else if (i_write_en_2[0]) begin
            r_normal_flag_29_32[i_write_position_5] <= {w_write_asid_9, w_write_vpn_20};
            r_normal_data_32_32[i_write_position_5] <= w_write_pte_32;
        end else if (i_write_en_2[1]) begin
            r_super_flag_19_4[i_write_position_5] <= {w_write_asid_9, w_write_vpn_20[19:10]};
            r_super_data_32_4[i_write_position_5] <= w_write_pte_32;
        end else if (i_flush_en_1) begin
            r_normal_data_32_32[0][0]  <= r_normal_data_32_32[0][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[0][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[0][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[1][0]  <= r_normal_data_32_32[1][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[1][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[1][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[2][0]  <= r_normal_data_32_32[2][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[2][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[2][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[3][0]  <= r_normal_data_32_32[3][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[3][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[3][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[4][0]  <= r_normal_data_32_32[4][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[4][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[4][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[5][0]  <= r_normal_data_32_32[5][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[5][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[5][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[6][0]  <= r_normal_data_32_32[6][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[6][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[6][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[7][0]  <= r_normal_data_32_32[7][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[7][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[7][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[8][0]  <= r_normal_data_32_32[8][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[8][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[8][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[9][0]  <= r_normal_data_32_32[9][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[9][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[9][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[10][0] <= r_normal_data_32_32[10][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[10][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[10][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[11][0] <= r_normal_data_32_32[11][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[11][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[11][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[12][0] <= r_normal_data_32_32[12][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[12][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[12][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[13][0] <= r_normal_data_32_32[13][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[13][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[13][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[14][0] <= r_normal_data_32_32[14][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[14][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[14][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[15][0] <= r_normal_data_32_32[15][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[15][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[15][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[16][0] <= r_normal_data_32_32[16][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[16][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[16][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[17][0] <= r_normal_data_32_32[17][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[17][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[17][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[18][0] <= r_normal_data_32_32[18][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[18][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[18][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[19][0] <= r_normal_data_32_32[19][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[19][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[19][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[20][0] <= r_normal_data_32_32[20][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[20][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[20][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[21][0] <= r_normal_data_32_32[21][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[21][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[21][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[22][0] <= r_normal_data_32_32[22][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[22][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[22][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[23][0] <= r_normal_data_32_32[23][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[23][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[23][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[24][0] <= r_normal_data_32_32[24][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[24][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[24][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[25][0] <= r_normal_data_32_32[25][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[25][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[25][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[26][0] <= r_normal_data_32_32[26][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[26][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[26][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[27][0] <= r_normal_data_32_32[27][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[27][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[27][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[28][0] <= r_normal_data_32_32[28][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[28][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[28][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[29][0] <= r_normal_data_32_32[29][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[29][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[29][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[30][0] <= r_normal_data_32_32[30][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[30][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[30][19:0] == i_flush_contrast_39[19:0])));
            r_normal_data_32_32[31][0] <= r_normal_data_32_32[31][0] && ~((w_flush_asid_zero_1 || (r_normal_flag_29_32[31][28:20] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_normal_flag_29_32[31][19:0] == i_flush_contrast_39[19:0])));
            r_super_data_32_4[0][0]    <= r_super_data_32_4[0][0] && ~((w_flush_asid_zero_1 || (r_super_flag_19_4[0][18:10] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_super_flag_19_4[0][9:0] == i_flush_contrast_39[19:10])));
            r_super_data_32_4[1][0]    <= r_super_data_32_4[1][0] && ~((w_flush_asid_zero_1 || (r_super_flag_19_4[1][18:10] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_super_flag_19_4[1][9:0] == i_flush_contrast_39[19:10])));
            r_super_data_32_4[2][0]    <= r_super_data_32_4[2][0] && ~((w_flush_asid_zero_1 || (r_super_flag_19_4[2][18:10] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_super_flag_19_4[2][9:0] == i_flush_contrast_39[19:10])));
            r_super_data_32_4[3][0]    <= r_super_data_32_4[3][0] && ~((w_flush_asid_zero_1 || (r_super_flag_19_4[3][18:10] == i_flush_contrast_39[28:20])) && (w_flush_vpn_zero_1 || (r_super_flag_19_4[3][9:0] == i_flush_contrast_39[19:10])));
        end
    end

    //---------------------- Read Table Entry Valid Signals ----------------------//
    assign o_normal_valid_32 = {
        r_normal_data_32_32[31][0],
        r_normal_data_32_32[30][0],
        r_normal_data_32_32[29][0],
        r_normal_data_32_32[28][0],
        r_normal_data_32_32[27][0],
        r_normal_data_32_32[26][0],
        r_normal_data_32_32[25][0],
        r_normal_data_32_32[24][0],
        r_normal_data_32_32[23][0],
        r_normal_data_32_32[22][0],
        r_normal_data_32_32[21][0],
        r_normal_data_32_32[20][0],
        r_normal_data_32_32[19][0],
        r_normal_data_32_32[18][0],
        r_normal_data_32_32[17][0],
        r_normal_data_32_32[16][0],
        r_normal_data_32_32[15][0],
        r_normal_data_32_32[14][0],
        r_normal_data_32_32[13][0],
        r_normal_data_32_32[12][0],
        r_normal_data_32_32[11][0],
        r_normal_data_32_32[10][0],
        r_normal_data_32_32[9][0],
        r_normal_data_32_32[8][0],
        r_normal_data_32_32[7][0],
        r_normal_data_32_32[6][0],
        r_normal_data_32_32[5][0],
        r_normal_data_32_32[4][0],
        r_normal_data_32_32[3][0],
        r_normal_data_32_32[2][0],
        r_normal_data_32_32[1][0],
        r_normal_data_32_32[0][0]
    };

    assign o_super_valid_4 = {r_super_data_32_4[3][0], r_super_data_32_4[2][0], r_super_data_32_4[1][0], r_super_data_32_4[0][0]};

    //---------------------- Read table item hits and corresponding table entries ----------------------//
    wire [31:0] w_normal_hit_32;
    wire [ 3:0] w_super_hit_4;

    assign w_normal_hit_32[0]  = (r_normal_flag_29_32[0] == i_read_contrast_29 && r_normal_data_32_32[0][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[1]  = (r_normal_flag_29_32[1] == i_read_contrast_29 && r_normal_data_32_32[1][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[2]  = (r_normal_flag_29_32[2] == i_read_contrast_29 && r_normal_data_32_32[2][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[3]  = (r_normal_flag_29_32[3] == i_read_contrast_29 && r_normal_data_32_32[3][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[4]  = (r_normal_flag_29_32[4] == i_read_contrast_29 && r_normal_data_32_32[4][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[5]  = (r_normal_flag_29_32[5] == i_read_contrast_29 && r_normal_data_32_32[5][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[6]  = (r_normal_flag_29_32[6] == i_read_contrast_29 && r_normal_data_32_32[6][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[7]  = (r_normal_flag_29_32[7] == i_read_contrast_29 && r_normal_data_32_32[7][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[8]  = (r_normal_flag_29_32[8] == i_read_contrast_29 && r_normal_data_32_32[8][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[9]  = (r_normal_flag_29_32[9] == i_read_contrast_29 && r_normal_data_32_32[9][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[10] = (r_normal_flag_29_32[10] == i_read_contrast_29 && r_normal_data_32_32[10][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[11] = (r_normal_flag_29_32[11] == i_read_contrast_29 && r_normal_data_32_32[11][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[12] = (r_normal_flag_29_32[12] == i_read_contrast_29 && r_normal_data_32_32[12][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[13] = (r_normal_flag_29_32[13] == i_read_contrast_29 && r_normal_data_32_32[13][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[14] = (r_normal_flag_29_32[14] == i_read_contrast_29 && r_normal_data_32_32[14][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[15] = (r_normal_flag_29_32[15] == i_read_contrast_29 && r_normal_data_32_32[15][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[16] = (r_normal_flag_29_32[16] == i_read_contrast_29 && r_normal_data_32_32[16][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[17] = (r_normal_flag_29_32[17] == i_read_contrast_29 && r_normal_data_32_32[17][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[18] = (r_normal_flag_29_32[18] == i_read_contrast_29 && r_normal_data_32_32[18][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[19] = (r_normal_flag_29_32[19] == i_read_contrast_29 && r_normal_data_32_32[19][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[20] = (r_normal_flag_29_32[20] == i_read_contrast_29 && r_normal_data_32_32[20][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[21] = (r_normal_flag_29_32[21] == i_read_contrast_29 && r_normal_data_32_32[21][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[22] = (r_normal_flag_29_32[22] == i_read_contrast_29 && r_normal_data_32_32[22][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[23] = (r_normal_flag_29_32[23] == i_read_contrast_29 && r_normal_data_32_32[23][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[24] = (r_normal_flag_29_32[24] == i_read_contrast_29 && r_normal_data_32_32[24][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[25] = (r_normal_flag_29_32[25] == i_read_contrast_29 && r_normal_data_32_32[25][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[26] = (r_normal_flag_29_32[26] == i_read_contrast_29 && r_normal_data_32_32[26][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[27] = (r_normal_flag_29_32[27] == i_read_contrast_29 && r_normal_data_32_32[27][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[28] = (r_normal_flag_29_32[28] == i_read_contrast_29 && r_normal_data_32_32[28][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[29] = (r_normal_flag_29_32[29] == i_read_contrast_29 && r_normal_data_32_32[29][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[30] = (r_normal_flag_29_32[30] == i_read_contrast_29 && r_normal_data_32_32[30][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_normal_hit_32[31] = (r_normal_flag_29_32[31] == i_read_contrast_29 && r_normal_data_32_32[31][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_super_hit_4[0]    = (r_super_flag_19_4[0] == i_read_contrast_29[28:10] && r_super_data_32_4[0][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_super_hit_4[1]    = (r_super_flag_19_4[1] == i_read_contrast_29[28:10] && r_super_data_32_4[1][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_super_hit_4[2]    = (r_super_flag_19_4[2] == i_read_contrast_29[28:10] && r_super_data_32_4[2][0] == 1'b1) ? 1'b1 : 1'b0;
    assign w_super_hit_4[3]    = (r_super_flag_19_4[3] == i_read_contrast_29[28:10] && r_super_data_32_4[3][0] == 1'b1) ? 1'b1 : 1'b0;

    assign o_hit_2 = (w_normal_hit_32 != 32'b0) ? 2'b01 : 
                     (w_super_hit_4 != 4'b0) ? 2'b10 : 2'b0;

    wire [31:0] w_normal_pte_32;
    wire [31:0] w_super_pte_32;

    assign w_normal_pte_32 = (w_normal_hit_32[0]) ? r_normal_data_32_32[0] :
		                  (w_normal_hit_32[1]) ? r_normal_data_32_32[1] :
		                  (w_normal_hit_32[2]) ? r_normal_data_32_32[2] :
		                  (w_normal_hit_32[3]) ? r_normal_data_32_32[3] :
		                  (w_normal_hit_32[4]) ? r_normal_data_32_32[4] :
		                  (w_normal_hit_32[5]) ? r_normal_data_32_32[5] :
		                  (w_normal_hit_32[6]) ? r_normal_data_32_32[6] :
		                  (w_normal_hit_32[7]) ? r_normal_data_32_32[7] :
		                  (w_normal_hit_32[8]) ? r_normal_data_32_32[8] :
		                  (w_normal_hit_32[9]) ? r_normal_data_32_32[9] :
		                  (w_normal_hit_32[10]) ? r_normal_data_32_32[10] :
		                  (w_normal_hit_32[11]) ? r_normal_data_32_32[11] :
		                  (w_normal_hit_32[12]) ? r_normal_data_32_32[12] :
		                  (w_normal_hit_32[13]) ? r_normal_data_32_32[13] :
		                  (w_normal_hit_32[14]) ? r_normal_data_32_32[14] :
		                  (w_normal_hit_32[15]) ? r_normal_data_32_32[15] :
		                  (w_normal_hit_32[16]) ? r_normal_data_32_32[16] :
		                  (w_normal_hit_32[17]) ? r_normal_data_32_32[17] :
		                  (w_normal_hit_32[18]) ? r_normal_data_32_32[18] :
		                  (w_normal_hit_32[19]) ? r_normal_data_32_32[19] :
		                  (w_normal_hit_32[20]) ? r_normal_data_32_32[20] :
		                  (w_normal_hit_32[21]) ? r_normal_data_32_32[21] :
		                  (w_normal_hit_32[22]) ? r_normal_data_32_32[22] :
		                  (w_normal_hit_32[23]) ? r_normal_data_32_32[23] :
		                  (w_normal_hit_32[24]) ? r_normal_data_32_32[24] :
		                  (w_normal_hit_32[25]) ? r_normal_data_32_32[25] :
		                  (w_normal_hit_32[26]) ? r_normal_data_32_32[26] :
		                  (w_normal_hit_32[27]) ? r_normal_data_32_32[27] :
		                  (w_normal_hit_32[28]) ? r_normal_data_32_32[28] :
		                  (w_normal_hit_32[29]) ? r_normal_data_32_32[29] :
		                  (w_normal_hit_32[30]) ? r_normal_data_32_32[30] :
		                  (w_normal_hit_32[31]) ? r_normal_data_32_32[31] : 32'b0;
    assign w_super_pte_32 = (w_super_hit_4[0]) ? r_super_data_32_4[0] : 
                            (w_super_hit_4[1]) ? r_super_data_32_4[1] : 
                            (w_super_hit_4[2]) ? r_super_data_32_4[2] : 
                            (w_super_hit_4[3]) ? r_super_data_32_4[3] : 32'b0;

    assign o_hit_pte_32 = (w_normal_hit_32 != 32'b0) ? w_normal_pte_32 : 
                          (w_super_hit_4 != 4'b0) ? w_super_pte_32 : 32'b0;

endmodule



`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  mmu_l1tlb_replace
// Author:  Yang Yuyuan
// Date:    2024/10/10
// Description: 
//======================================================


module mmu_l1tlb_replace (
    input         rstn,
    input         clk,
    input  [ 1:0] i_write_en_2,
    input  [31:0] i_normal_valid_32,
    input  [ 3:0] i_super_valid_4,
    output [ 4:0] o_write_position_5
);

    reg  [  4:0] r_random_position_5;
    reg  [1 : 0] r_random_position_2;
    wire [  4:0] w_write_position_5;
    wire [  1:0] w_write_position_2;


    // LFSR
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            r_random_position_5 <= 5'b00001;
            r_random_position_2 <= 2'b01;
        end else begin
            r_random_position_5 <= {r_random_position_5[3:0], r_random_position_5[4] ^ r_random_position_5[2]};
            r_random_position_2 <= {r_random_position_2[0], r_random_position_2[1] ^ r_random_position_2[0]};
        end
    end

    assign w_write_position_5 = 
		(i_normal_valid_32[0] == 1'b0) ? 5'd0 :
		(i_normal_valid_32[1] == 1'b0) ? 5'd1 :
		(i_normal_valid_32[2] == 1'b0) ? 5'd2 :
		(i_normal_valid_32[3] == 1'b0) ? 5'd3 :
		(i_normal_valid_32[4] == 1'b0) ? 5'd4 :
		(i_normal_valid_32[5] == 1'b0) ? 5'd5 :
		(i_normal_valid_32[6] == 1'b0) ? 5'd6 :
		(i_normal_valid_32[7] == 1'b0) ? 5'd7 :
		(i_normal_valid_32[8] == 1'b0) ? 5'd8 :
		(i_normal_valid_32[9] == 1'b0) ? 5'd9 :
		(i_normal_valid_32[10] == 1'b0) ? 5'd10 :
		(i_normal_valid_32[11] == 1'b0) ? 5'd11 :
		(i_normal_valid_32[12] == 1'b0) ? 5'd12 :
		(i_normal_valid_32[13] == 1'b0) ? 5'd13 :
		(i_normal_valid_32[14] == 1'b0) ? 5'd14 :
		(i_normal_valid_32[15] == 1'b0) ? 5'd15 :
		(i_normal_valid_32[16] == 1'b0) ? 5'd16 :
		(i_normal_valid_32[17] == 1'b0) ? 5'd17 :
		(i_normal_valid_32[18] == 1'b0) ? 5'd18 :
		(i_normal_valid_32[19] == 1'b0) ? 5'd19 :
		(i_normal_valid_32[20] == 1'b0) ? 5'd20 :
		(i_normal_valid_32[21] == 1'b0) ? 5'd21 :
		(i_normal_valid_32[22] == 1'b0) ? 5'd22 :
		(i_normal_valid_32[23] == 1'b0) ? 5'd23 :
		(i_normal_valid_32[24] == 1'b0) ? 5'd24 :
		(i_normal_valid_32[25] == 1'b0) ? 5'd25 :
		(i_normal_valid_32[26] == 1'b0) ? 5'd26 :
		(i_normal_valid_32[27] == 1'b0) ? 5'd27 :
		(i_normal_valid_32[28] == 1'b0) ? 5'd28 :
		(i_normal_valid_32[29] == 1'b0) ? 5'd29 :
		(i_normal_valid_32[30] == 1'b0) ? 5'd30 :
		(i_normal_valid_32[31] == 1'b0) ? 5'd31 :
		r_random_position_5;

    assign w_write_position_2 = (i_super_valid_4[0] == 1'b0) ? 2'd0 : 
                                (i_super_valid_4[1] == 1'b0) ? 2'd1 : 
                                (i_super_valid_4[2] == 1'b0) ? 2'd2 : 
                                (i_super_valid_4[3] == 1'b0) ? 2'd3 : 
                                r_random_position_2;

    assign o_write_position_5 = (i_write_en_2[0] == 1'b1) ? w_write_position_5 : 
                                (i_write_en_2[1] == 1'b1) ? {3'b0, w_write_position_2} : 
                                5'b0;
endmodule
`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  mmu_l1tlb_replace
// Author:  Yang Yuyuan
// Date:    2024/10/10
// Description: Implementing PLRU replacement algorithm
//======================================================


module mmu_l1tlb_replace (
    input         rstn,
    input         clk,
    input  [ 1:0] i_write_en_2,
    input  [31:0] i_normal_valid_32,
    input  [ 3:0] i_super_valid_4,
    output [ 4:0] o_write_position_5
);

    reg  [30:0] r_plru_tree_31;  // PLRU tree for normal entries (31 bits for 32 entries)
    reg  [ 2:0] r_plru_tree_3;   // PLRU tree for super entries (3 bits for 4 entries)
    wire [ 4:0] w_write_position_5;
    wire [  1:0] w_write_position_2;

    // Reset and update PLRU tree on write
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            r_plru_tree_31 <= 31'b0;
            r_plru_tree_3 <= 3'b0;
        end else begin
            // Update PLRU tree for normal entries
            if (i_write_en_2[0]) begin
                case (w_write_position_5)
                    5'd0:  r_plru_tree_31[30:15] <= {1'b1, r_plru_tree_31[29:15]};
                    5'd1:  r_plru_tree_31[30:15] <= {r_plru_tree_31[30], 1'b1, r_plru_tree_31[28:15]};
                    5'd2:  r_plru_tree_31[30:15] <= {r_plru_tree_31[30:29], 1'b1, r_plru_tree_31[27:15]};
                    5'd3:  r_plru_tree_31[30:15] <= {r_plru_tree_31[30:28], 1'b1, r_plru_tree_31[26:15]};
                    5'd4:  r_plru_tree_31[30:15] <= {r_plru_tree_31[30:27], 1'b1, r_plru_tree_31[25:15]};
                    5'd5:  r_plru_tree_31[30:15] <= {r_plru_tree_31[30:26], 1'b1, r_plru_tree_31[24:15]};
                    5'd6:  r_plru_tree_31[30:15] <= {r_plru_tree_31[30:25], 1'b1, r_plru_tree_31[23:15]};
                    5'd7:  r_plru_tree_31[30:15] <= {r_plru_tree_31[30:24], 1'b1, r_plru_tree_31[22:15]};
                    5'd8:  r_plru_tree_31[30:15] <= {r_plru_tree_31[30:23], 1'b1, r_plru_tree_31[21:15]};
                    5'd9:  r_plru_tree_31[30:15] <= {r_plru_tree_31[30:22], 1'b1, r_plru_tree_31[20:15]};
                    5'd10: r_plru_tree_31[30:15] <= {r_plru_tree_31[30:21], 1'b1, r_plru_tree_31[19:15]};
                    5'd11: r_plru_tree_31[30:15] <= {r_plru_tree_31[30:20], 1'b1, r_plru_tree_31[18:15]};
                    5'd12: r_plru_tree_31[30:15] <= {r_plru_tree_31[30:19], 1'b1, r_plru_tree_31[17:15]};
                    5'd13: r_plru_tree_31[30:15] <= {r_plru_tree_31[30:18], 1'b1, r_plru_tree_31[16:15]};
                    5'd14: r_plru_tree_31[30:15] <= {r_plru_tree_31[30:17], 1'b1, r_plru_tree_31[15]};
                    5'd15: r_plru_tree_31[30:15] <= r_plru_tree_31[30:15] | 16'b1;
                endcase
            end
            // Update PLRU tree for super entries
            if (i_write_en_2[1]) begin
                case (w_write_position_2)
                    2'd0: r_plru_tree_3 <= 3'b001;
                    2'd1: r_plru_tree_3 <= 3'b010;
                    2'd2: r_plru_tree_3 <= 3'b100;
                    2'd3: r_plru_tree_3 <= 3'b011;
                endcase
            end
        end
    end

    // PLRU replacement selection logic for normal entries
    function [4:0] get_plru_position_5(input [30:0] tree);
        integer i;
        begin
            get_plru_position_5 = 5'd0;
            for (i = 30; i >= 0; i = i - 1) begin
                if (tree[i] == 0) begin
                    get_plru_position_5 = i[4:0];
                    disable get_plru_position_5;
                end
            end
        end
    endfunction

    assign w_write_position_5 = get_plru_position_5(r_plru_tree_31);

    // PLRU replacement selection logic for super entries
    function [1:0] get_plru_position_2(input [2:0] tree);
        integer i;
        begin
            get_plru_position_2 = 2'd0;
            for (i = 2; i >= 0; i = i - 1) begin
                if (tree[i] == 0) begin
                    get_plru_position_2 = i[1:0];
                    disable get_plru_position_2;
                end
            end
        end
    endfunction

    assign w_write_position_2 = get_plru_position_2(r_plru_tree_3);

    assign o_write_position_5 = (i_write_en_2[0] == 1'b1) ? w_write_position_5 : 
                                (i_write_en_2[1] == 1'b1) ? {3'b0, w_write_position_2} : 
                                5'b0;
endmodule

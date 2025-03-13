`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  mmu_l2tlb_plru_4way
// Author:  Yang Yuyuan
// Date:    2024/10/10
// Description: 
//======================================================

module mmu_l2tlb_plru_4way (
    input            clk,
    input            rstn,
    input      [3:0] i_update_way_4,
    output reg [3:0] o_replace_way_4
);
    reg [2:0] state;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= 3'b000;
        end else begin
            case (i_update_way_4)
                4'b1000: begin
                    state[2] <= 1'b1;
                    state[0] <= 1'b1;
                end
                4'b0100: begin
                    state[2] <= 1'b1;
                    state[0] <= 1'b0;
                end
                4'b0010: begin
                    state[2] <= 1'b0;
                    state[1] <= 1'b1;
                end
                4'b0001: begin
                    state[2] <= 1'b0;
                    state[1] <= 1'b0;
                end
                default: begin
                    state <= state;
                end
            endcase
        end
    end

    always @(*) begin
        case (state)
            3'b000:  o_replace_way_4 = 4'b0001;
            3'b001:  o_replace_way_4 = 4'b0010;
            3'b010:  o_replace_way_4 = 4'b0100;
            3'b011:  o_replace_way_4 = 4'b1000;
            3'b100:  o_replace_way_4 = 4'b0100;
            3'b101:  o_replace_way_4 = 4'b1000;
            3'b110:  o_replace_way_4 = 4'b0001;
            3'b111:  o_replace_way_4 = 4'b0010;
        endcase
    end

endmodule
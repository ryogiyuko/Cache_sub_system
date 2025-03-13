`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  mmu_l2tlb1
// Author:  Yang Yuyuan
// Date:    2024/10/10
// Description: 
// l2tlb1_tag   : asid(22-14) + vpn1[9:6](13-10) + flag(9-0)
// l2tlb1_data  : ppn(21-0)
//======================================================

module mmu_l2tlb1 (
    input          clk,
    input          rstn,
    // read signals, addr(vpn1[5:0]), contrast(asid+vpn1[9:6])
    input  [5 : 0] i_read_addr_6,
    input  [ 12:0] i_read_contrast_13,
    output [3 : 0] o_hit_4,
    output [3 : 0] o_valid_4,
    output [ 23:0] o_read_data_24,
    output [ 23:0] o_read_tag_24,
    // write signals
    input  [3 : 0] i_write_en_4,
    input  [5 : 0] i_write_addr_6,
    input  [ 23:0] i_write_data_24,
    input  [ 23:0] i_write_tag_24,
    // flush signals, 10:flush all, 01:flush part
    input  [1 : 0] i_flush_en_2
);

    //---------------------- Write signals ----------------------//
    wire [ 95:0] w_read_l21_data_96;
    wire [ 95:0] w_read_l21_tag_96;

    wire [  5:0] w_addr_6;
    wire [ 95:0] w_write_l21_data_96;
    wire [ 95:0] w_write_l21_tag_96;

    wire w_addr_select;
    assign w_addr_select = (i_write_en_4 == 4'b0 || i_flush_en_2 == 2'b00);
    assign w_addr_6 = w_addr_select ? i_read_addr_6 : i_write_addr_6;

    wire [23:0] w_write_data0_24, w_write_data1_24, w_write_data2_24, w_write_data3_24;
    wire [23:0] w_write_tag0_24, w_write_tag1_24, w_write_tag2_24, w_write_tag3_24;
    assign w_write_data0_24 = i_write_en_4[0] ? i_write_data_24 : 24'b0;
    assign w_write_data1_24 = i_write_en_4[1] ? i_write_data_24 : 24'b0;
    assign w_write_data2_24 = i_write_en_4[2] ? i_write_data_24 : 24'b0;
    assign w_write_data3_24 = i_write_en_4[3] ? i_write_data_24 : 24'b0;
    assign w_write_tag0_24 = i_write_en_4[0] ? i_write_tag_24 : 24'b0;
    assign w_write_tag1_24 = i_write_en_4[1] ? i_write_tag_24 : 24'b0;
    assign w_write_tag2_24 = i_write_en_4[2] ? i_write_tag_24 : 24'b0;
    assign w_write_tag3_24 = i_write_en_4[3] ? i_write_tag_24 : 24'b0;


    assign w_write_l21_data_96 = {w_write_data3_24, w_write_data2_24, w_write_data1_24, w_write_data0_24};
    assign w_write_l21_tag_96  = {w_write_tag3_24, w_write_tag2_24, w_write_tag1_24, w_write_tag0_24};

    //---------------------- Register and sram instantiation ----------------------//
    reg [3:0] r_l2tlb1_valid[63:0];

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            // Reset all registers
            r_l2tlb1_valid[0]  <= 4'b0;
            r_l2tlb1_valid[1]  <= 4'b0;
            r_l2tlb1_valid[2]  <= 4'b0;
            r_l2tlb1_valid[3]  <= 4'b0;
            r_l2tlb1_valid[4]  <= 4'b0;
            r_l2tlb1_valid[5]  <= 4'b0;
            r_l2tlb1_valid[6]  <= 4'b0;
            r_l2tlb1_valid[7]  <= 4'b0;
            r_l2tlb1_valid[8]  <= 4'b0;
            r_l2tlb1_valid[9]  <= 4'b0;
            r_l2tlb1_valid[10] <= 4'b0;
            r_l2tlb1_valid[11] <= 4'b0;
            r_l2tlb1_valid[12] <= 4'b0;
            r_l2tlb1_valid[13] <= 4'b0;
            r_l2tlb1_valid[14] <= 4'b0;
            r_l2tlb1_valid[15] <= 4'b0;
            r_l2tlb1_valid[16] <= 4'b0;
            r_l2tlb1_valid[17] <= 4'b0;
            r_l2tlb1_valid[18] <= 4'b0;
            r_l2tlb1_valid[19] <= 4'b0;
            r_l2tlb1_valid[20] <= 4'b0;
            r_l2tlb1_valid[21] <= 4'b0;
            r_l2tlb1_valid[22] <= 4'b0;
            r_l2tlb1_valid[23] <= 4'b0;
            r_l2tlb1_valid[24] <= 4'b0;
            r_l2tlb1_valid[25] <= 4'b0;
            r_l2tlb1_valid[26] <= 4'b0;
            r_l2tlb1_valid[27] <= 4'b0;
            r_l2tlb1_valid[28] <= 4'b0;
            r_l2tlb1_valid[29] <= 4'b0;
            r_l2tlb1_valid[30] <= 4'b0;
            r_l2tlb1_valid[31] <= 4'b0;
            r_l2tlb1_valid[32] <= 4'b0;
            r_l2tlb1_valid[33] <= 4'b0;
            r_l2tlb1_valid[34] <= 4'b0;
            r_l2tlb1_valid[35] <= 4'b0;
            r_l2tlb1_valid[36] <= 4'b0;
            r_l2tlb1_valid[37] <= 4'b0;
            r_l2tlb1_valid[38] <= 4'b0;
            r_l2tlb1_valid[39] <= 4'b0;
            r_l2tlb1_valid[40] <= 4'b0;
            r_l2tlb1_valid[41] <= 4'b0;
            r_l2tlb1_valid[42] <= 4'b0;
            r_l2tlb1_valid[43] <= 4'b0;
            r_l2tlb1_valid[44] <= 4'b0;
            r_l2tlb1_valid[45] <= 4'b0;
            r_l2tlb1_valid[46] <= 4'b0;
            r_l2tlb1_valid[47] <= 4'b0;
            r_l2tlb1_valid[48] <= 4'b0;
            r_l2tlb1_valid[49] <= 4'b0;
            r_l2tlb1_valid[50] <= 4'b0;
            r_l2tlb1_valid[51] <= 4'b0;
            r_l2tlb1_valid[52] <= 4'b0;
            r_l2tlb1_valid[53] <= 4'b0;
            r_l2tlb1_valid[54] <= 4'b0;
            r_l2tlb1_valid[55] <= 4'b0;
            r_l2tlb1_valid[56] <= 4'b0;
            r_l2tlb1_valid[57] <= 4'b0;
            r_l2tlb1_valid[58] <= 4'b0;
            r_l2tlb1_valid[59] <= 4'b0;
            r_l2tlb1_valid[60] <= 4'b0;
            r_l2tlb1_valid[61] <= 4'b0;
            r_l2tlb1_valid[62] <= 4'b0;
            r_l2tlb1_valid[63] <= 4'b0;
        end else begin
            if (i_write_en_4[0] == 1'b1) begin
                r_l2tlb1_valid[w_addr_6][0] <= i_write_tag_24[0];
            end else if (i_write_en_4[1] == 1'b1) begin
                r_l2tlb1_valid[w_addr_6][1] <= i_write_tag_24[0];
            end else if (i_write_en_4[2] == 1'b1) begin
                r_l2tlb1_valid[w_addr_6][2] <= i_write_tag_24[0];
            end else if (i_write_en_4[3] == 1'b1) begin
                r_l2tlb1_valid[w_addr_6][3] <= i_write_tag_24[0];
            end else if (i_flush_en_2[0] == 1'b1) begin
                r_l2tlb1_valid[w_addr_6] <= 4'b0;
            end else if (i_flush_en_2[1] == 1'b1) begin
                r_l2tlb1_valid[0]  <= 4'b0;
                r_l2tlb1_valid[1]  <= 4'b0;
                r_l2tlb1_valid[2]  <= 4'b0;
                r_l2tlb1_valid[3]  <= 4'b0;
                r_l2tlb1_valid[4]  <= 4'b0;
                r_l2tlb1_valid[5]  <= 4'b0;
                r_l2tlb1_valid[6]  <= 4'b0;
                r_l2tlb1_valid[7]  <= 4'b0;
                r_l2tlb1_valid[8]  <= 4'b0;
                r_l2tlb1_valid[9]  <= 4'b0;
                r_l2tlb1_valid[10] <= 4'b0;
                r_l2tlb1_valid[11] <= 4'b0;
                r_l2tlb1_valid[12] <= 4'b0;
                r_l2tlb1_valid[13] <= 4'b0;
                r_l2tlb1_valid[14] <= 4'b0;
                r_l2tlb1_valid[15] <= 4'b0;
                r_l2tlb1_valid[16] <= 4'b0;
                r_l2tlb1_valid[17] <= 4'b0;
                r_l2tlb1_valid[18] <= 4'b0;
                r_l2tlb1_valid[19] <= 4'b0;
                r_l2tlb1_valid[20] <= 4'b0;
                r_l2tlb1_valid[21] <= 4'b0;
                r_l2tlb1_valid[22] <= 4'b0;
                r_l2tlb1_valid[23] <= 4'b0;
                r_l2tlb1_valid[24] <= 4'b0;
                r_l2tlb1_valid[25] <= 4'b0;
                r_l2tlb1_valid[26] <= 4'b0;
                r_l2tlb1_valid[27] <= 4'b0;
                r_l2tlb1_valid[28] <= 4'b0;
                r_l2tlb1_valid[29] <= 4'b0;
                r_l2tlb1_valid[30] <= 4'b0;
                r_l2tlb1_valid[31] <= 4'b0;
                r_l2tlb1_valid[32] <= 4'b0;
                r_l2tlb1_valid[33] <= 4'b0;
                r_l2tlb1_valid[34] <= 4'b0;
                r_l2tlb1_valid[35] <= 4'b0;
                r_l2tlb1_valid[36] <= 4'b0;
                r_l2tlb1_valid[37] <= 4'b0;
                r_l2tlb1_valid[38] <= 4'b0;
                r_l2tlb1_valid[39] <= 4'b0;
                r_l2tlb1_valid[40] <= 4'b0;
                r_l2tlb1_valid[41] <= 4'b0;
                r_l2tlb1_valid[42] <= 4'b0;
                r_l2tlb1_valid[43] <= 4'b0;
                r_l2tlb1_valid[44] <= 4'b0;
                r_l2tlb1_valid[45] <= 4'b0;
                r_l2tlb1_valid[46] <= 4'b0;
                r_l2tlb1_valid[47] <= 4'b0;
                r_l2tlb1_valid[48] <= 4'b0;
                r_l2tlb1_valid[49] <= 4'b0;
                r_l2tlb1_valid[50] <= 4'b0;
                r_l2tlb1_valid[51] <= 4'b0;
                r_l2tlb1_valid[52] <= 4'b0;
                r_l2tlb1_valid[53] <= 4'b0;
                r_l2tlb1_valid[54] <= 4'b0;
                r_l2tlb1_valid[55] <= 4'b0;
                r_l2tlb1_valid[56] <= 4'b0;
                r_l2tlb1_valid[57] <= 4'b0;
                r_l2tlb1_valid[58] <= 4'b0;
                r_l2tlb1_valid[59] <= 4'b0;
                r_l2tlb1_valid[60] <= 4'b0;
                r_l2tlb1_valid[61] <= 4'b0;
                r_l2tlb1_valid[62] <= 4'b0;
                r_l2tlb1_valid[63] <= 4'b0;
            end
        end
    end


    SYKB110_64X12X8CM2 l2tlb1_tag (
        .A0  (w_addr_6[0]),
        .A1  (w_addr_6[1]),
        .A2  (w_addr_6[2]),
        .A3  (w_addr_6[3]),
        .A4  (w_addr_6[4]),
        .A5  (w_addr_6[5]),
        .DO0 (w_read_l21_tag_96[0]),
        .DO1 (w_read_l21_tag_96[1]),
        .DO2 (w_read_l21_tag_96[2]),
        .DO3 (w_read_l21_tag_96[3]),
        .DO4 (w_read_l21_tag_96[4]),
        .DO5 (w_read_l21_tag_96[5]),
        .DO6 (w_read_l21_tag_96[6]),
        .DO7 (w_read_l21_tag_96[7]),
        .DO8 (w_read_l21_tag_96[8]),
        .DO9 (w_read_l21_tag_96[9]),
        .DO10(w_read_l21_tag_96[10]),
        .DO11(w_read_l21_tag_96[11]),
        .DO12(w_read_l21_tag_96[12]),
        .DO13(w_read_l21_tag_96[13]),
        .DO14(w_read_l21_tag_96[14]),
        .DO15(w_read_l21_tag_96[15]),
        .DO16(w_read_l21_tag_96[16]),
        .DO17(w_read_l21_tag_96[17]),
        .DO18(w_read_l21_tag_96[18]),
        .DO19(w_read_l21_tag_96[19]),
        .DO20(w_read_l21_tag_96[20]),
        .DO21(w_read_l21_tag_96[21]),
        .DO22(w_read_l21_tag_96[22]),
        .DO23(w_read_l21_tag_96[23]),
        .DO24(w_read_l21_tag_96[24]),
        .DO25(w_read_l21_tag_96[25]),
        .DO26(w_read_l21_tag_96[26]),
        .DO27(w_read_l21_tag_96[27]),
        .DO28(w_read_l21_tag_96[28]),
        .DO29(w_read_l21_tag_96[29]),
        .DO30(w_read_l21_tag_96[30]),
        .DO31(w_read_l21_tag_96[31]),
        .DO32(w_read_l21_tag_96[32]),
        .DO33(w_read_l21_tag_96[33]),
        .DO34(w_read_l21_tag_96[34]),
        .DO35(w_read_l21_tag_96[35]),
        .DO36(w_read_l21_tag_96[36]),
        .DO37(w_read_l21_tag_96[37]),
        .DO38(w_read_l21_tag_96[38]),
        .DO39(w_read_l21_tag_96[39]),
        .DO40(w_read_l21_tag_96[40]),
        .DO41(w_read_l21_tag_96[41]),
        .DO42(w_read_l21_tag_96[42]),
        .DO43(w_read_l21_tag_96[43]),
        .DO44(w_read_l21_tag_96[44]),
        .DO45(w_read_l21_tag_96[45]),
        .DO46(w_read_l21_tag_96[46]),
        .DO47(w_read_l21_tag_96[47]),
        .DO48(w_read_l21_tag_96[48]),
        .DO49(w_read_l21_tag_96[49]),
        .DO50(w_read_l21_tag_96[50]),
        .DO51(w_read_l21_tag_96[51]),
        .DO52(w_read_l21_tag_96[52]),
        .DO53(w_read_l21_tag_96[53]),
        .DO54(w_read_l21_tag_96[54]),
        .DO55(w_read_l21_tag_96[55]),
        .DO56(w_read_l21_tag_96[56]),
        .DO57(w_read_l21_tag_96[57]),
        .DO58(w_read_l21_tag_96[58]),
        .DO59(w_read_l21_tag_96[59]),
        .DO60(w_read_l21_tag_96[60]),
        .DO61(w_read_l21_tag_96[61]),
        .DO62(w_read_l21_tag_96[62]),
        .DO63(w_read_l21_tag_96[63]),
        .DO64(w_read_l21_tag_96[64]),
        .DO65(w_read_l21_tag_96[65]),
        .DO66(w_read_l21_tag_96[66]),
        .DO67(w_read_l21_tag_96[67]),
        .DO68(w_read_l21_tag_96[68]),
        .DO69(w_read_l21_tag_96[69]),
        .DO70(w_read_l21_tag_96[70]),
        .DO71(w_read_l21_tag_96[71]),
        .DO72(w_read_l21_tag_96[72]),
        .DO73(w_read_l21_tag_96[73]),
        .DO74(w_read_l21_tag_96[74]),
        .DO75(w_read_l21_tag_96[75]),
        .DO76(w_read_l21_tag_96[76]),
        .DO77(w_read_l21_tag_96[77]),
        .DO78(w_read_l21_tag_96[78]),
        .DO79(w_read_l21_tag_96[79]),
        .DO80(w_read_l21_tag_96[80]),
        .DO81(w_read_l21_tag_96[81]),
        .DO82(w_read_l21_tag_96[82]),
        .DO83(w_read_l21_tag_96[83]),
        .DO84(w_read_l21_tag_96[84]),
        .DO85(w_read_l21_tag_96[85]),
        .DO86(w_read_l21_tag_96[86]),
        .DO87(w_read_l21_tag_96[87]),
        .DO88(w_read_l21_tag_96[88]),
        .DO89(w_read_l21_tag_96[89]),
        .DO90(w_read_l21_tag_96[90]),
        .DO91(w_read_l21_tag_96[91]),
        .DO92(w_read_l21_tag_96[92]),
        .DO93(w_read_l21_tag_96[93]),
        .DO94(w_read_l21_tag_96[94]),
        .DO95(w_read_l21_tag_96[95]),
        .DI0 (w_write_l21_tag_96[0]),
        .DI1 (w_write_l21_tag_96[1]),
        .DI2 (w_write_l21_tag_96[2]),
        .DI3 (w_write_l21_tag_96[3]),
        .DI4 (w_write_l21_tag_96[4]),
        .DI5 (w_write_l21_tag_96[5]),
        .DI6 (w_write_l21_tag_96[6]),
        .DI7 (w_write_l21_tag_96[7]),
        .DI8 (w_write_l21_tag_96[8]),
        .DI9 (w_write_l21_tag_96[9]),
        .DI10(w_write_l21_tag_96[10]),
        .DI11(w_write_l21_tag_96[11]),
        .DI12(w_write_l21_tag_96[12]),
        .DI13(w_write_l21_tag_96[13]),
        .DI14(w_write_l21_tag_96[14]),
        .DI15(w_write_l21_tag_96[15]),
        .DI16(w_write_l21_tag_96[16]),
        .DI17(w_write_l21_tag_96[17]),
        .DI18(w_write_l21_tag_96[18]),
        .DI19(w_write_l21_tag_96[19]),
        .DI20(w_write_l21_tag_96[20]),
        .DI21(w_write_l21_tag_96[21]),
        .DI22(w_write_l21_tag_96[22]),
        .DI23(w_write_l21_tag_96[23]),
        .DI24(w_write_l21_tag_96[24]),
        .DI25(w_write_l21_tag_96[25]),
        .DI26(w_write_l21_tag_96[26]),
        .DI27(w_write_l21_tag_96[27]),
        .DI28(w_write_l21_tag_96[28]),
        .DI29(w_write_l21_tag_96[29]),
        .DI30(w_write_l21_tag_96[30]),
        .DI31(w_write_l21_tag_96[31]),
        .DI32(w_write_l21_tag_96[32]),
        .DI33(w_write_l21_tag_96[33]),
        .DI34(w_write_l21_tag_96[34]),
        .DI35(w_write_l21_tag_96[35]),
        .DI36(w_write_l21_tag_96[36]),
        .DI37(w_write_l21_tag_96[37]),
        .DI38(w_write_l21_tag_96[38]),
        .DI39(w_write_l21_tag_96[39]),
        .DI40(w_write_l21_tag_96[40]),
        .DI41(w_write_l21_tag_96[41]),
        .DI42(w_write_l21_tag_96[42]),
        .DI43(w_write_l21_tag_96[43]),
        .DI44(w_write_l21_tag_96[44]),
        .DI45(w_write_l21_tag_96[45]),
        .DI46(w_write_l21_tag_96[46]),
        .DI47(w_write_l21_tag_96[47]),
        .DI48(w_write_l21_tag_96[48]),
        .DI49(w_write_l21_tag_96[49]),
        .DI50(w_write_l21_tag_96[50]),
        .DI51(w_write_l21_tag_96[51]),
        .DI52(w_write_l21_tag_96[52]),
        .DI53(w_write_l21_tag_96[53]),
        .DI54(w_write_l21_tag_96[54]),
        .DI55(w_write_l21_tag_96[55]),
        .DI56(w_write_l21_tag_96[56]),
        .DI57(w_write_l21_tag_96[57]),
        .DI58(w_write_l21_tag_96[58]),
        .DI59(w_write_l21_tag_96[59]),
        .DI60(w_write_l21_tag_96[60]),
        .DI61(w_write_l21_tag_96[61]),
        .DI62(w_write_l21_tag_96[62]),
        .DI63(w_write_l21_tag_96[63]),
        .DI64(w_write_l21_tag_96[64]),
        .DI65(w_write_l21_tag_96[65]),
        .DI66(w_write_l21_tag_96[66]),
        .DI67(w_write_l21_tag_96[67]),
        .DI68(w_write_l21_tag_96[68]),
        .DI69(w_write_l21_tag_96[69]),
        .DI70(w_write_l21_tag_96[70]),
        .DI71(w_write_l21_tag_96[71]),
        .DI72(w_write_l21_tag_96[72]),
        .DI73(w_write_l21_tag_96[73]),
        .DI74(w_write_l21_tag_96[74]),
        .DI75(w_write_l21_tag_96[75]),
        .DI76(w_write_l21_tag_96[76]),
        .DI77(w_write_l21_tag_96[77]),
        .DI78(w_write_l21_tag_96[78]),
        .DI79(w_write_l21_tag_96[79]),
        .DI80(w_write_l21_tag_96[80]),
        .DI81(w_write_l21_tag_96[81]),
        .DI82(w_write_l21_tag_96[82]),
        .DI83(w_write_l21_tag_96[83]),
        .DI84(w_write_l21_tag_96[84]),
        .DI85(w_write_l21_tag_96[85]),
        .DI86(w_write_l21_tag_96[86]),
        .DI87(w_write_l21_tag_96[87]),
        .DI88(w_write_l21_tag_96[88]),
        .DI89(w_write_l21_tag_96[89]),
        .DI90(w_write_l21_tag_96[90]),
        .DI91(w_write_l21_tag_96[91]),
        .DI92(w_write_l21_tag_96[92]),
        .DI93(w_write_l21_tag_96[93]),
        .DI94(w_write_l21_tag_96[94]),
        .DI95(w_write_l21_tag_96[95]),
        .CK  (clk),
        .WEB0(~i_write_en_4[0]),
        .WEB1(~i_write_en_4[0]),
        .WEB2(~i_write_en_4[1]),
        .WEB3(~i_write_en_4[1]),
        .WEB4(~i_write_en_4[2]),
        .WEB5(~i_write_en_4[2]),
        .WEB6(~i_write_en_4[3]),
        .WEB7(~i_write_en_4[3]),
        .DVSE(1'b0),
        .DVS0(1'b0),
        .DVS1(1'b0),
        .DVS2(1'b0),
        .DVS3(1'b0),
        .CSB (1'b0)
    );

    SYKB110_64X12X8CM2 l2tlb1_data (
        .A0  (w_addr_6[0]),
        .A1  (w_addr_6[1]),
        .A2  (w_addr_6[2]),
        .A3  (w_addr_6[3]),
        .A4  (w_addr_6[4]),
        .A5  (w_addr_6[5]),
        .DO0 (w_read_l21_data_96[0]),
        .DO1 (w_read_l21_data_96[1]),
        .DO2 (w_read_l21_data_96[2]),
        .DO3 (w_read_l21_data_96[3]),
        .DO4 (w_read_l21_data_96[4]),
        .DO5 (w_read_l21_data_96[5]),
        .DO6 (w_read_l21_data_96[6]),
        .DO7 (w_read_l21_data_96[7]),
        .DO8 (w_read_l21_data_96[8]),
        .DO9 (w_read_l21_data_96[9]),
        .DO10(w_read_l21_data_96[10]),
        .DO11(w_read_l21_data_96[11]),
        .DO12(w_read_l21_data_96[12]),
        .DO13(w_read_l21_data_96[13]),
        .DO14(w_read_l21_data_96[14]),
        .DO15(w_read_l21_data_96[15]),
        .DO16(w_read_l21_data_96[16]),
        .DO17(w_read_l21_data_96[17]),
        .DO18(w_read_l21_data_96[18]),
        .DO19(w_read_l21_data_96[19]),
        .DO20(w_read_l21_data_96[20]),
        .DO21(w_read_l21_data_96[21]),
        .DO22(w_read_l21_data_96[22]),
        .DO23(w_read_l21_data_96[23]),
        .DO24(w_read_l21_data_96[24]),
        .DO25(w_read_l21_data_96[25]),
        .DO26(w_read_l21_data_96[26]),
        .DO27(w_read_l21_data_96[27]),
        .DO28(w_read_l21_data_96[28]),
        .DO29(w_read_l21_data_96[29]),
        .DO30(w_read_l21_data_96[30]),
        .DO31(w_read_l21_data_96[31]),
        .DO32(w_read_l21_data_96[32]),
        .DO33(w_read_l21_data_96[33]),
        .DO34(w_read_l21_data_96[34]),
        .DO35(w_read_l21_data_96[35]),
        .DO36(w_read_l21_data_96[36]),
        .DO37(w_read_l21_data_96[37]),
        .DO38(w_read_l21_data_96[38]),
        .DO39(w_read_l21_data_96[39]),
        .DO40(w_read_l21_data_96[40]),
        .DO41(w_read_l21_data_96[41]),
        .DO42(w_read_l21_data_96[42]),
        .DO43(w_read_l21_data_96[43]),
        .DO44(w_read_l21_data_96[44]),
        .DO45(w_read_l21_data_96[45]),
        .DO46(w_read_l21_data_96[46]),
        .DO47(w_read_l21_data_96[47]),
        .DO48(w_read_l21_data_96[48]),
        .DO49(w_read_l21_data_96[49]),
        .DO50(w_read_l21_data_96[50]),
        .DO51(w_read_l21_data_96[51]),
        .DO52(w_read_l21_data_96[52]),
        .DO53(w_read_l21_data_96[53]),
        .DO54(w_read_l21_data_96[54]),
        .DO55(w_read_l21_data_96[55]),
        .DO56(w_read_l21_data_96[56]),
        .DO57(w_read_l21_data_96[57]),
        .DO58(w_read_l21_data_96[58]),
        .DO59(w_read_l21_data_96[59]),
        .DO60(w_read_l21_data_96[60]),
        .DO61(w_read_l21_data_96[61]),
        .DO62(w_read_l21_data_96[62]),
        .DO63(w_read_l21_data_96[63]),
        .DO64(w_read_l21_data_96[64]),
        .DO65(w_read_l21_data_96[65]),
        .DO66(w_read_l21_data_96[66]),
        .DO67(w_read_l21_data_96[67]),
        .DO68(w_read_l21_data_96[68]),
        .DO69(w_read_l21_data_96[69]),
        .DO70(w_read_l21_data_96[70]),
        .DO71(w_read_l21_data_96[71]),
        .DO72(w_read_l21_data_96[72]),
        .DO73(w_read_l21_data_96[73]),
        .DO74(w_read_l21_data_96[74]),
        .DO75(w_read_l21_data_96[75]),
        .DO76(w_read_l21_data_96[76]),
        .DO77(w_read_l21_data_96[77]),
        .DO78(w_read_l21_data_96[78]),
        .DO79(w_read_l21_data_96[79]),
        .DO80(w_read_l21_data_96[80]),
        .DO81(w_read_l21_data_96[81]),
        .DO82(w_read_l21_data_96[82]),
        .DO83(w_read_l21_data_96[83]),
        .DO84(w_read_l21_data_96[84]),
        .DO85(w_read_l21_data_96[85]),
        .DO86(w_read_l21_data_96[86]),
        .DO87(w_read_l21_data_96[87]),
        .DO88(w_read_l21_data_96[88]),
        .DO89(w_read_l21_data_96[89]),
        .DO90(w_read_l21_data_96[90]),
        .DO91(w_read_l21_data_96[91]),
        .DO92(w_read_l21_data_96[92]),
        .DO93(w_read_l21_data_96[93]),
        .DO94(w_read_l21_data_96[94]),
        .DO95(w_read_l21_data_96[95]),
        .DI0 (w_write_l21_data_96[0]),
        .DI1 (w_write_l21_data_96[1]),
        .DI2 (w_write_l21_data_96[2]),
        .DI3 (w_write_l21_data_96[3]),
        .DI4 (w_write_l21_data_96[4]),
        .DI5 (w_write_l21_data_96[5]),
        .DI6 (w_write_l21_data_96[6]),
        .DI7 (w_write_l21_data_96[7]),
        .DI8 (w_write_l21_data_96[8]),
        .DI9 (w_write_l21_data_96[9]),
        .DI10(w_write_l21_data_96[10]),
        .DI11(w_write_l21_data_96[11]),
        .DI12(w_write_l21_data_96[12]),
        .DI13(w_write_l21_data_96[13]),
        .DI14(w_write_l21_data_96[14]),
        .DI15(w_write_l21_data_96[15]),
        .DI16(w_write_l21_data_96[16]),
        .DI17(w_write_l21_data_96[17]),
        .DI18(w_write_l21_data_96[18]),
        .DI19(w_write_l21_data_96[19]),
        .DI20(w_write_l21_data_96[20]),
        .DI21(w_write_l21_data_96[21]),
        .DI22(w_write_l21_data_96[22]),
        .DI23(w_write_l21_data_96[23]),
        .DI24(w_write_l21_data_96[24]),
        .DI25(w_write_l21_data_96[25]),
        .DI26(w_write_l21_data_96[26]),
        .DI27(w_write_l21_data_96[27]),
        .DI28(w_write_l21_data_96[28]),
        .DI29(w_write_l21_data_96[29]),
        .DI30(w_write_l21_data_96[30]),
        .DI31(w_write_l21_data_96[31]),
        .DI32(w_write_l21_data_96[32]),
        .DI33(w_write_l21_data_96[33]),
        .DI34(w_write_l21_data_96[34]),
        .DI35(w_write_l21_data_96[35]),
        .DI36(w_write_l21_data_96[36]),
        .DI37(w_write_l21_data_96[37]),
        .DI38(w_write_l21_data_96[38]),
        .DI39(w_write_l21_data_96[39]),
        .DI40(w_write_l21_data_96[40]),
        .DI41(w_write_l21_data_96[41]),
        .DI42(w_write_l21_data_96[42]),
        .DI43(w_write_l21_data_96[43]),
        .DI44(w_write_l21_data_96[44]),
        .DI45(w_write_l21_data_96[45]),
        .DI46(w_write_l21_data_96[46]),
        .DI47(w_write_l21_data_96[47]),
        .DI48(w_write_l21_data_96[48]),
        .DI49(w_write_l21_data_96[49]),
        .DI50(w_write_l21_data_96[50]),
        .DI51(w_write_l21_data_96[51]),
        .DI52(w_write_l21_data_96[52]),
        .DI53(w_write_l21_data_96[53]),
        .DI54(w_write_l21_data_96[54]),
        .DI55(w_write_l21_data_96[55]),
        .DI56(w_write_l21_data_96[56]),
        .DI57(w_write_l21_data_96[57]),
        .DI58(w_write_l21_data_96[58]),
        .DI59(w_write_l21_data_96[59]),
        .DI60(w_write_l21_data_96[60]),
        .DI61(w_write_l21_data_96[61]),
        .DI62(w_write_l21_data_96[62]),
        .DI63(w_write_l21_data_96[63]),
        .DI64(w_write_l21_data_96[64]),
        .DI65(w_write_l21_data_96[65]),
        .DI66(w_write_l21_data_96[66]),
        .DI67(w_write_l21_data_96[67]),
        .DI68(w_write_l21_data_96[68]),
        .DI69(w_write_l21_data_96[69]),
        .DI70(w_write_l21_data_96[70]),
        .DI71(w_write_l21_data_96[71]),
        .DI72(w_write_l21_data_96[72]),
        .DI73(w_write_l21_data_96[73]),
        .DI74(w_write_l21_data_96[74]),
        .DI75(w_write_l21_data_96[75]),
        .DI76(w_write_l21_data_96[76]),
        .DI77(w_write_l21_data_96[77]),
        .DI78(w_write_l21_data_96[78]),
        .DI79(w_write_l21_data_96[79]),
        .DI80(w_write_l21_data_96[80]),
        .DI81(w_write_l21_data_96[81]),
        .DI82(w_write_l21_data_96[82]),
        .DI83(w_write_l21_data_96[83]),
        .DI84(w_write_l21_data_96[84]),
        .DI85(w_write_l21_data_96[85]),
        .DI86(w_write_l21_data_96[86]),
        .DI87(w_write_l21_data_96[87]),
        .DI88(w_write_l21_data_96[88]),
        .DI89(w_write_l21_data_96[89]),
        .DI90(w_write_l21_data_96[90]),
        .DI91(w_write_l21_data_96[91]),
        .DI92(w_write_l21_data_96[92]),
        .DI93(w_write_l21_data_96[93]),
        .DI94(w_write_l21_data_96[94]),
        .DI95(w_write_l21_data_96[95]),
        .CK  (clk),
        .WEB0(~i_write_en_4[0]),
        .WEB1(~i_write_en_4[0]),
        .WEB2(~i_write_en_4[1]),
        .WEB3(~i_write_en_4[1]),
        .WEB4(~i_write_en_4[2]),
        .WEB5(~i_write_en_4[2]),
        .WEB6(~i_write_en_4[3]),
        .WEB7(~i_write_en_4[3]),
        .DVSE(1'b0),
        .DVS0(1'b0),
        .DVS1(1'b0),
        .DVS2(1'b0),
        .DVS3(1'b0),
        .CSB (1'b0)
    );


    //---------------------- Read signals ----------------------//

    wire hit0, hit1, hit2, hit3;
    assign hit0 = (i_read_contrast_13 == w_read_l21_tag_96[22:10]) && (r_l2tlb1_valid[w_addr_6][0] == 1'b1);
    assign hit1 = (i_read_contrast_13 == w_read_l21_tag_96[46:34]) && (r_l2tlb1_valid[w_addr_6][1] == 1'b1);
    assign hit2 = (i_read_contrast_13 == w_read_l21_tag_96[70:58]) && (r_l2tlb1_valid[w_addr_6][2] == 1'b1);
    assign hit3 = (i_read_contrast_13 == w_read_l21_tag_96[94:82]) && (r_l2tlb1_valid[w_addr_6][3] == 1'b1);

    assign o_read_data_24 = hit0 ? w_read_l21_data_96[23:0] : 
	hit1 ? w_read_l21_data_96[47:24] : 
	hit2 ? w_read_l21_data_96[71:48] : 
	hit3 ? w_read_l21_data_96[95:72] : 24'b0;
    assign o_read_tag_24  = hit0 ? {w_read_l21_tag_96[23:1], r_l2tlb1_valid[w_addr_6][0]}  : 
	hit1 ? {w_read_l21_tag_96[47:25], r_l2tlb1_valid[w_addr_6][1]} : 
	hit2 ? {w_read_l21_tag_96[71:49], r_l2tlb1_valid[w_addr_6][2]} : 
	hit3 ? {w_read_l21_tag_96[95:73], r_l2tlb1_valid[w_addr_6][3]}: 24'b0;
    assign o_hit_4        = hit0 ? 4'b0001 : hit1 ? 4'b0010 : hit2 ? 4'b0100 : hit3 ? 4'b1000 : 4'b0;
    assign o_valid_4      = r_l2tlb1_valid[w_addr_6];

endmodule
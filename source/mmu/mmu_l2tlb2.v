`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  mmu_l2tlb2
// Author:  Yang Yuyuan
// Date:    2024/10/10
// Description: 
// l2tlb1_tag   : asid(30-22) + vpn1[9:0]vpn0[9:8](21-10) + flag(9-0)
// l2tlb1_data  : ppn(21-0)
//======================================================

module mmu_l2tlb2 (
    input          clk,
    input          rstn,
    // read signals, addr(vpn1[5:0]), contrast(asid+vpn1[9:0]vpn0[9:8])
    input  [7 : 0] i_read_addr_8,
    input  [ 20:0] i_read_contrast_21,
    output [3 : 0] o_hit_4,
    output [3 : 0] o_valid_4,
    output [ 23:0] o_read_data_24,
    output [ 31:0] o_read_tag_32,
    // write signals
    input  [3 : 0] i_write_en_4,
    input  [7 : 0] i_write_addr_8,
    input  [ 23:0] i_write_data_24,
    input  [ 31:0] i_write_tag_32,
    // flush signals, 10:flush all, 01:flush part
    input  [1 : 0] i_flush_en_2
);

    //---------------------- Write signals ----------------------//
    wire [ 95:0] w_read_l22_data_96;
    wire [127:0] w_read_l22_tag_128;

    wire [7 : 0] w_addr_8;
    wire [ 95:0] w_write_l22_data_96;
    wire [127:0] w_write_l22_tag_128;

    wire w_addr_select;
    assign w_addr_select = (i_write_en_4 == 4'b0 && i_flush_en_2 == 2'b00);
    assign w_addr_8 = w_addr_select ? i_read_addr_8 : i_write_addr_8;

    wire [23:0] w_write_data0_24, w_write_data1_24, w_write_data2_24, w_write_data3_24;
    wire [31:0] w_write_tag0_32, w_write_tag1_32, w_write_tag2_32, w_write_tag3_32;
    assign w_write_data0_24 = i_write_en_4[0] ? i_write_data_24 : 24'b0;
    assign w_write_data1_24 = i_write_en_4[1] ? i_write_data_24 : 24'b0;
    assign w_write_data2_24 = i_write_en_4[2] ? i_write_data_24 : 24'b0;
    assign w_write_data3_24 = i_write_en_4[3] ? i_write_data_24 : 24'b0;
    assign w_write_tag0_32 = i_write_en_4[0] ? i_write_tag_32 : 32'b0;
    assign w_write_tag1_32 = i_write_en_4[1] ? i_write_tag_32 : 32'b0;
    assign w_write_tag2_32 = i_write_en_4[2] ? i_write_tag_32 : 32'b0;
    assign w_write_tag3_32 = i_write_en_4[3] ? i_write_tag_32 : 32'b0;


    assign w_write_l22_data_96 = {w_write_data3_24, w_write_data2_24, w_write_data1_24, w_write_data0_24};
    assign w_write_l22_tag_128 = {w_write_tag3_32, w_write_tag2_32, w_write_tag1_32, w_write_tag0_32};

    //---------------------- Register and sram instantiation ----------------------//
    reg [3:0] r_l2tlb2_valid[255:0];

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            // Reset all registers
            r_l2tlb2_valid[0]   <= 4'b0;
            r_l2tlb2_valid[1]   <= 4'b0;
            r_l2tlb2_valid[2]   <= 4'b0;
            r_l2tlb2_valid[3]   <= 4'b0;
            r_l2tlb2_valid[4]   <= 4'b0;
            r_l2tlb2_valid[5]   <= 4'b0;
            r_l2tlb2_valid[6]   <= 4'b0;
            r_l2tlb2_valid[7]   <= 4'b0;
            r_l2tlb2_valid[8]   <= 4'b0;
            r_l2tlb2_valid[9]   <= 4'b0;
            r_l2tlb2_valid[10]  <= 4'b0;
            r_l2tlb2_valid[11]  <= 4'b0;
            r_l2tlb2_valid[12]  <= 4'b0;
            r_l2tlb2_valid[13]  <= 4'b0;
            r_l2tlb2_valid[14]  <= 4'b0;
            r_l2tlb2_valid[15]  <= 4'b0;
            r_l2tlb2_valid[16]  <= 4'b0;
            r_l2tlb2_valid[17]  <= 4'b0;
            r_l2tlb2_valid[18]  <= 4'b0;
            r_l2tlb2_valid[19]  <= 4'b0;
            r_l2tlb2_valid[20]  <= 4'b0;
            r_l2tlb2_valid[21]  <= 4'b0;
            r_l2tlb2_valid[22]  <= 4'b0;
            r_l2tlb2_valid[23]  <= 4'b0;
            r_l2tlb2_valid[24]  <= 4'b0;
            r_l2tlb2_valid[25]  <= 4'b0;
            r_l2tlb2_valid[26]  <= 4'b0;
            r_l2tlb2_valid[27]  <= 4'b0;
            r_l2tlb2_valid[28]  <= 4'b0;
            r_l2tlb2_valid[29]  <= 4'b0;
            r_l2tlb2_valid[30]  <= 4'b0;
            r_l2tlb2_valid[31]  <= 4'b0;
            r_l2tlb2_valid[32]  <= 4'b0;
            r_l2tlb2_valid[33]  <= 4'b0;
            r_l2tlb2_valid[34]  <= 4'b0;
            r_l2tlb2_valid[35]  <= 4'b0;
            r_l2tlb2_valid[36]  <= 4'b0;
            r_l2tlb2_valid[37]  <= 4'b0;
            r_l2tlb2_valid[38]  <= 4'b0;
            r_l2tlb2_valid[39]  <= 4'b0;
            r_l2tlb2_valid[40]  <= 4'b0;
            r_l2tlb2_valid[41]  <= 4'b0;
            r_l2tlb2_valid[42]  <= 4'b0;
            r_l2tlb2_valid[43]  <= 4'b0;
            r_l2tlb2_valid[44]  <= 4'b0;
            r_l2tlb2_valid[45]  <= 4'b0;
            r_l2tlb2_valid[46]  <= 4'b0;
            r_l2tlb2_valid[47]  <= 4'b0;
            r_l2tlb2_valid[48]  <= 4'b0;
            r_l2tlb2_valid[49]  <= 4'b0;
            r_l2tlb2_valid[50]  <= 4'b0;
            r_l2tlb2_valid[51]  <= 4'b0;
            r_l2tlb2_valid[52]  <= 4'b0;
            r_l2tlb2_valid[53]  <= 4'b0;
            r_l2tlb2_valid[54]  <= 4'b0;
            r_l2tlb2_valid[55]  <= 4'b0;
            r_l2tlb2_valid[56]  <= 4'b0;
            r_l2tlb2_valid[57]  <= 4'b0;
            r_l2tlb2_valid[58]  <= 4'b0;
            r_l2tlb2_valid[59]  <= 4'b0;
            r_l2tlb2_valid[60]  <= 4'b0;
            r_l2tlb2_valid[61]  <= 4'b0;
            r_l2tlb2_valid[62]  <= 4'b0;
            r_l2tlb2_valid[63]  <= 4'b0;
            r_l2tlb2_valid[64]  <= 4'b0;
            r_l2tlb2_valid[65]  <= 4'b0;
            r_l2tlb2_valid[66]  <= 4'b0;
            r_l2tlb2_valid[67]  <= 4'b0;
            r_l2tlb2_valid[68]  <= 4'b0;
            r_l2tlb2_valid[69]  <= 4'b0;
            r_l2tlb2_valid[70]  <= 4'b0;
            r_l2tlb2_valid[71]  <= 4'b0;
            r_l2tlb2_valid[72]  <= 4'b0;
            r_l2tlb2_valid[73]  <= 4'b0;
            r_l2tlb2_valid[74]  <= 4'b0;
            r_l2tlb2_valid[75]  <= 4'b0;
            r_l2tlb2_valid[76]  <= 4'b0;
            r_l2tlb2_valid[77]  <= 4'b0;
            r_l2tlb2_valid[78]  <= 4'b0;
            r_l2tlb2_valid[79]  <= 4'b0;
            r_l2tlb2_valid[80]  <= 4'b0;
            r_l2tlb2_valid[81]  <= 4'b0;
            r_l2tlb2_valid[82]  <= 4'b0;
            r_l2tlb2_valid[83]  <= 4'b0;
            r_l2tlb2_valid[84]  <= 4'b0;
            r_l2tlb2_valid[85]  <= 4'b0;
            r_l2tlb2_valid[86]  <= 4'b0;
            r_l2tlb2_valid[87]  <= 4'b0;
            r_l2tlb2_valid[88]  <= 4'b0;
            r_l2tlb2_valid[89]  <= 4'b0;
            r_l2tlb2_valid[90]  <= 4'b0;
            r_l2tlb2_valid[91]  <= 4'b0;
            r_l2tlb2_valid[92]  <= 4'b0;
            r_l2tlb2_valid[93]  <= 4'b0;
            r_l2tlb2_valid[94]  <= 4'b0;
            r_l2tlb2_valid[95]  <= 4'b0;
            r_l2tlb2_valid[96]  <= 4'b0;
            r_l2tlb2_valid[97]  <= 4'b0;
            r_l2tlb2_valid[98]  <= 4'b0;
            r_l2tlb2_valid[99]  <= 4'b0;
            r_l2tlb2_valid[100] <= 4'b0;
            r_l2tlb2_valid[101] <= 4'b0;
            r_l2tlb2_valid[102] <= 4'b0;
            r_l2tlb2_valid[103] <= 4'b0;
            r_l2tlb2_valid[104] <= 4'b0;
            r_l2tlb2_valid[105] <= 4'b0;
            r_l2tlb2_valid[106] <= 4'b0;
            r_l2tlb2_valid[107] <= 4'b0;
            r_l2tlb2_valid[108] <= 4'b0;
            r_l2tlb2_valid[109] <= 4'b0;
            r_l2tlb2_valid[110] <= 4'b0;
            r_l2tlb2_valid[111] <= 4'b0;
            r_l2tlb2_valid[112] <= 4'b0;
            r_l2tlb2_valid[113] <= 4'b0;
            r_l2tlb2_valid[114] <= 4'b0;
            r_l2tlb2_valid[115] <= 4'b0;
            r_l2tlb2_valid[116] <= 4'b0;
            r_l2tlb2_valid[117] <= 4'b0;
            r_l2tlb2_valid[118] <= 4'b0;
            r_l2tlb2_valid[119] <= 4'b0;
            r_l2tlb2_valid[120] <= 4'b0;
            r_l2tlb2_valid[121] <= 4'b0;
            r_l2tlb2_valid[122] <= 4'b0;
            r_l2tlb2_valid[123] <= 4'b0;
            r_l2tlb2_valid[124] <= 4'b0;
            r_l2tlb2_valid[125] <= 4'b0;
            r_l2tlb2_valid[126] <= 4'b0;
            r_l2tlb2_valid[127] <= 4'b0;
            r_l2tlb2_valid[128] <= 4'b0;
            r_l2tlb2_valid[129] <= 4'b0;
            r_l2tlb2_valid[130] <= 4'b0;
            r_l2tlb2_valid[131] <= 4'b0;
            r_l2tlb2_valid[132] <= 4'b0;
            r_l2tlb2_valid[133] <= 4'b0;
            r_l2tlb2_valid[134] <= 4'b0;
            r_l2tlb2_valid[135] <= 4'b0;
            r_l2tlb2_valid[136] <= 4'b0;
            r_l2tlb2_valid[137] <= 4'b0;
            r_l2tlb2_valid[138] <= 4'b0;
            r_l2tlb2_valid[139] <= 4'b0;
            r_l2tlb2_valid[140] <= 4'b0;
            r_l2tlb2_valid[141] <= 4'b0;
            r_l2tlb2_valid[142] <= 4'b0;
            r_l2tlb2_valid[143] <= 4'b0;
            r_l2tlb2_valid[144] <= 4'b0;
            r_l2tlb2_valid[145] <= 4'b0;
            r_l2tlb2_valid[146] <= 4'b0;
            r_l2tlb2_valid[147] <= 4'b0;
            r_l2tlb2_valid[148] <= 4'b0;
            r_l2tlb2_valid[149] <= 4'b0;
            r_l2tlb2_valid[150] <= 4'b0;
            r_l2tlb2_valid[151] <= 4'b0;
            r_l2tlb2_valid[152] <= 4'b0;
            r_l2tlb2_valid[153] <= 4'b0;
            r_l2tlb2_valid[154] <= 4'b0;
            r_l2tlb2_valid[155] <= 4'b0;
            r_l2tlb2_valid[156] <= 4'b0;
            r_l2tlb2_valid[157] <= 4'b0;
            r_l2tlb2_valid[158] <= 4'b0;
            r_l2tlb2_valid[159] <= 4'b0;
            r_l2tlb2_valid[160] <= 4'b0;
            r_l2tlb2_valid[161] <= 4'b0;
            r_l2tlb2_valid[162] <= 4'b0;
            r_l2tlb2_valid[163] <= 4'b0;
            r_l2tlb2_valid[164] <= 4'b0;
            r_l2tlb2_valid[165] <= 4'b0;
            r_l2tlb2_valid[166] <= 4'b0;
            r_l2tlb2_valid[167] <= 4'b0;
            r_l2tlb2_valid[168] <= 4'b0;
            r_l2tlb2_valid[169] <= 4'b0;
            r_l2tlb2_valid[170] <= 4'b0;
            r_l2tlb2_valid[171] <= 4'b0;
            r_l2tlb2_valid[172] <= 4'b0;
            r_l2tlb2_valid[173] <= 4'b0;
            r_l2tlb2_valid[174] <= 4'b0;
            r_l2tlb2_valid[175] <= 4'b0;
            r_l2tlb2_valid[176] <= 4'b0;
            r_l2tlb2_valid[177] <= 4'b0;
            r_l2tlb2_valid[178] <= 4'b0;
            r_l2tlb2_valid[179] <= 4'b0;
            r_l2tlb2_valid[180] <= 4'b0;
            r_l2tlb2_valid[181] <= 4'b0;
            r_l2tlb2_valid[182] <= 4'b0;
            r_l2tlb2_valid[183] <= 4'b0;
            r_l2tlb2_valid[184] <= 4'b0;
            r_l2tlb2_valid[185] <= 4'b0;
            r_l2tlb2_valid[186] <= 4'b0;
            r_l2tlb2_valid[187] <= 4'b0;
            r_l2tlb2_valid[188] <= 4'b0;
            r_l2tlb2_valid[189] <= 4'b0;
            r_l2tlb2_valid[190] <= 4'b0;
            r_l2tlb2_valid[191] <= 4'b0;
            r_l2tlb2_valid[192] <= 4'b0;
            r_l2tlb2_valid[193] <= 4'b0;
            r_l2tlb2_valid[194] <= 4'b0;
            r_l2tlb2_valid[195] <= 4'b0;
            r_l2tlb2_valid[196] <= 4'b0;
            r_l2tlb2_valid[197] <= 4'b0;
            r_l2tlb2_valid[198] <= 4'b0;
            r_l2tlb2_valid[199] <= 4'b0;
            r_l2tlb2_valid[200] <= 4'b0;
            r_l2tlb2_valid[201] <= 4'b0;
            r_l2tlb2_valid[202] <= 4'b0;
            r_l2tlb2_valid[203] <= 4'b0;
            r_l2tlb2_valid[204] <= 4'b0;
            r_l2tlb2_valid[205] <= 4'b0;
            r_l2tlb2_valid[206] <= 4'b0;
            r_l2tlb2_valid[207] <= 4'b0;
            r_l2tlb2_valid[208] <= 4'b0;
            r_l2tlb2_valid[209] <= 4'b0;
            r_l2tlb2_valid[210] <= 4'b0;
            r_l2tlb2_valid[211] <= 4'b0;
            r_l2tlb2_valid[212] <= 4'b0;
            r_l2tlb2_valid[213] <= 4'b0;
            r_l2tlb2_valid[214] <= 4'b0;
            r_l2tlb2_valid[215] <= 4'b0;
            r_l2tlb2_valid[216] <= 4'b0;
            r_l2tlb2_valid[217] <= 4'b0;
            r_l2tlb2_valid[218] <= 4'b0;
            r_l2tlb2_valid[219] <= 4'b0;
            r_l2tlb2_valid[220] <= 4'b0;
            r_l2tlb2_valid[221] <= 4'b0;
            r_l2tlb2_valid[222] <= 4'b0;
            r_l2tlb2_valid[223] <= 4'b0;
            r_l2tlb2_valid[224] <= 4'b0;
            r_l2tlb2_valid[225] <= 4'b0;
            r_l2tlb2_valid[226] <= 4'b0;
            r_l2tlb2_valid[227] <= 4'b0;
            r_l2tlb2_valid[228] <= 4'b0;
            r_l2tlb2_valid[229] <= 4'b0;
            r_l2tlb2_valid[230] <= 4'b0;
            r_l2tlb2_valid[231] <= 4'b0;
            r_l2tlb2_valid[232] <= 4'b0;
            r_l2tlb2_valid[233] <= 4'b0;
            r_l2tlb2_valid[234] <= 4'b0;
            r_l2tlb2_valid[235] <= 4'b0;
            r_l2tlb2_valid[236] <= 4'b0;
            r_l2tlb2_valid[237] <= 4'b0;
            r_l2tlb2_valid[238] <= 4'b0;
            r_l2tlb2_valid[239] <= 4'b0;
            r_l2tlb2_valid[240] <= 4'b0;
            r_l2tlb2_valid[241] <= 4'b0;
            r_l2tlb2_valid[242] <= 4'b0;
            r_l2tlb2_valid[243] <= 4'b0;
            r_l2tlb2_valid[244] <= 4'b0;
            r_l2tlb2_valid[245] <= 4'b0;
            r_l2tlb2_valid[246] <= 4'b0;
            r_l2tlb2_valid[247] <= 4'b0;
            r_l2tlb2_valid[248] <= 4'b0;
            r_l2tlb2_valid[249] <= 4'b0;
            r_l2tlb2_valid[250] <= 4'b0;
            r_l2tlb2_valid[251] <= 4'b0;
            r_l2tlb2_valid[252] <= 4'b0;
            r_l2tlb2_valid[253] <= 4'b0;
            r_l2tlb2_valid[254] <= 4'b0;
            r_l2tlb2_valid[255] <= 4'b0;
        end else begin
            if (i_write_en_4[0] == 1'b1) begin
                r_l2tlb2_valid[w_addr_8][0] <= i_write_tag_32[0];
            end else if (i_write_en_4[1] == 1'b1) begin
                r_l2tlb2_valid[w_addr_8][1] <= i_write_tag_32[0];
            end else if (i_write_en_4[2] == 1'b1) begin
                r_l2tlb2_valid[w_addr_8][2] <= i_write_tag_32[0];
            end else if (i_write_en_4[3] == 1'b1) begin
                r_l2tlb2_valid[w_addr_8][3] <= i_write_tag_32[0];
            end else if (i_flush_en_2[0] == 1'b1) begin
                r_l2tlb2_valid[w_addr_8] <= 4'b0;
            end else if (i_flush_en_2[1] == 1'b1) begin
                r_l2tlb2_valid[0]   <= 4'b0;
                r_l2tlb2_valid[1]   <= 4'b0;
                r_l2tlb2_valid[2]   <= 4'b0;
                r_l2tlb2_valid[3]   <= 4'b0;
                r_l2tlb2_valid[4]   <= 4'b0;
                r_l2tlb2_valid[5]   <= 4'b0;
                r_l2tlb2_valid[6]   <= 4'b0;
                r_l2tlb2_valid[7]   <= 4'b0;
                r_l2tlb2_valid[8]   <= 4'b0;
                r_l2tlb2_valid[9]   <= 4'b0;
                r_l2tlb2_valid[10]  <= 4'b0;
                r_l2tlb2_valid[11]  <= 4'b0;
                r_l2tlb2_valid[12]  <= 4'b0;
                r_l2tlb2_valid[13]  <= 4'b0;
                r_l2tlb2_valid[14]  <= 4'b0;
                r_l2tlb2_valid[15]  <= 4'b0;
                r_l2tlb2_valid[16]  <= 4'b0;
                r_l2tlb2_valid[17]  <= 4'b0;
                r_l2tlb2_valid[18]  <= 4'b0;
                r_l2tlb2_valid[19]  <= 4'b0;
                r_l2tlb2_valid[20]  <= 4'b0;
                r_l2tlb2_valid[21]  <= 4'b0;
                r_l2tlb2_valid[22]  <= 4'b0;
                r_l2tlb2_valid[23]  <= 4'b0;
                r_l2tlb2_valid[24]  <= 4'b0;
                r_l2tlb2_valid[25]  <= 4'b0;
                r_l2tlb2_valid[26]  <= 4'b0;
                r_l2tlb2_valid[27]  <= 4'b0;
                r_l2tlb2_valid[28]  <= 4'b0;
                r_l2tlb2_valid[29]  <= 4'b0;
                r_l2tlb2_valid[30]  <= 4'b0;
                r_l2tlb2_valid[31]  <= 4'b0;
                r_l2tlb2_valid[32]  <= 4'b0;
                r_l2tlb2_valid[33]  <= 4'b0;
                r_l2tlb2_valid[34]  <= 4'b0;
                r_l2tlb2_valid[35]  <= 4'b0;
                r_l2tlb2_valid[36]  <= 4'b0;
                r_l2tlb2_valid[37]  <= 4'b0;
                r_l2tlb2_valid[38]  <= 4'b0;
                r_l2tlb2_valid[39]  <= 4'b0;
                r_l2tlb2_valid[40]  <= 4'b0;
                r_l2tlb2_valid[41]  <= 4'b0;
                r_l2tlb2_valid[42]  <= 4'b0;
                r_l2tlb2_valid[43]  <= 4'b0;
                r_l2tlb2_valid[44]  <= 4'b0;
                r_l2tlb2_valid[45]  <= 4'b0;
                r_l2tlb2_valid[46]  <= 4'b0;
                r_l2tlb2_valid[47]  <= 4'b0;
                r_l2tlb2_valid[48]  <= 4'b0;
                r_l2tlb2_valid[49]  <= 4'b0;
                r_l2tlb2_valid[50]  <= 4'b0;
                r_l2tlb2_valid[51]  <= 4'b0;
                r_l2tlb2_valid[52]  <= 4'b0;
                r_l2tlb2_valid[53]  <= 4'b0;
                r_l2tlb2_valid[54]  <= 4'b0;
                r_l2tlb2_valid[55]  <= 4'b0;
                r_l2tlb2_valid[56]  <= 4'b0;
                r_l2tlb2_valid[57]  <= 4'b0;
                r_l2tlb2_valid[58]  <= 4'b0;
                r_l2tlb2_valid[59]  <= 4'b0;
                r_l2tlb2_valid[60]  <= 4'b0;
                r_l2tlb2_valid[61]  <= 4'b0;
                r_l2tlb2_valid[62]  <= 4'b0;
                r_l2tlb2_valid[63]  <= 4'b0;
                r_l2tlb2_valid[64]  <= 4'b0;
                r_l2tlb2_valid[65]  <= 4'b0;
                r_l2tlb2_valid[66]  <= 4'b0;
                r_l2tlb2_valid[67]  <= 4'b0;
                r_l2tlb2_valid[68]  <= 4'b0;
                r_l2tlb2_valid[69]  <= 4'b0;
                r_l2tlb2_valid[70]  <= 4'b0;
                r_l2tlb2_valid[71]  <= 4'b0;
                r_l2tlb2_valid[72]  <= 4'b0;
                r_l2tlb2_valid[73]  <= 4'b0;
                r_l2tlb2_valid[74]  <= 4'b0;
                r_l2tlb2_valid[75]  <= 4'b0;
                r_l2tlb2_valid[76]  <= 4'b0;
                r_l2tlb2_valid[77]  <= 4'b0;
                r_l2tlb2_valid[78]  <= 4'b0;
                r_l2tlb2_valid[79]  <= 4'b0;
                r_l2tlb2_valid[80]  <= 4'b0;
                r_l2tlb2_valid[81]  <= 4'b0;
                r_l2tlb2_valid[82]  <= 4'b0;
                r_l2tlb2_valid[83]  <= 4'b0;
                r_l2tlb2_valid[84]  <= 4'b0;
                r_l2tlb2_valid[85]  <= 4'b0;
                r_l2tlb2_valid[86]  <= 4'b0;
                r_l2tlb2_valid[87]  <= 4'b0;
                r_l2tlb2_valid[88]  <= 4'b0;
                r_l2tlb2_valid[89]  <= 4'b0;
                r_l2tlb2_valid[90]  <= 4'b0;
                r_l2tlb2_valid[91]  <= 4'b0;
                r_l2tlb2_valid[92]  <= 4'b0;
                r_l2tlb2_valid[93]  <= 4'b0;
                r_l2tlb2_valid[94]  <= 4'b0;
                r_l2tlb2_valid[95]  <= 4'b0;
                r_l2tlb2_valid[96]  <= 4'b0;
                r_l2tlb2_valid[97]  <= 4'b0;
                r_l2tlb2_valid[98]  <= 4'b0;
                r_l2tlb2_valid[99]  <= 4'b0;
                r_l2tlb2_valid[100] <= 4'b0;
                r_l2tlb2_valid[101] <= 4'b0;
                r_l2tlb2_valid[102] <= 4'b0;
                r_l2tlb2_valid[103] <= 4'b0;
                r_l2tlb2_valid[104] <= 4'b0;
                r_l2tlb2_valid[105] <= 4'b0;
                r_l2tlb2_valid[106] <= 4'b0;
                r_l2tlb2_valid[107] <= 4'b0;
                r_l2tlb2_valid[108] <= 4'b0;
                r_l2tlb2_valid[109] <= 4'b0;
                r_l2tlb2_valid[110] <= 4'b0;
                r_l2tlb2_valid[111] <= 4'b0;
                r_l2tlb2_valid[112] <= 4'b0;
                r_l2tlb2_valid[113] <= 4'b0;
                r_l2tlb2_valid[114] <= 4'b0;
                r_l2tlb2_valid[115] <= 4'b0;
                r_l2tlb2_valid[116] <= 4'b0;
                r_l2tlb2_valid[117] <= 4'b0;
                r_l2tlb2_valid[118] <= 4'b0;
                r_l2tlb2_valid[119] <= 4'b0;
                r_l2tlb2_valid[120] <= 4'b0;
                r_l2tlb2_valid[121] <= 4'b0;
                r_l2tlb2_valid[122] <= 4'b0;
                r_l2tlb2_valid[123] <= 4'b0;
                r_l2tlb2_valid[124] <= 4'b0;
                r_l2tlb2_valid[125] <= 4'b0;
                r_l2tlb2_valid[126] <= 4'b0;
                r_l2tlb2_valid[127] <= 4'b0;
                r_l2tlb2_valid[128] <= 4'b0;
                r_l2tlb2_valid[129] <= 4'b0;
                r_l2tlb2_valid[130] <= 4'b0;
                r_l2tlb2_valid[131] <= 4'b0;
                r_l2tlb2_valid[132] <= 4'b0;
                r_l2tlb2_valid[133] <= 4'b0;
                r_l2tlb2_valid[134] <= 4'b0;
                r_l2tlb2_valid[135] <= 4'b0;
                r_l2tlb2_valid[136] <= 4'b0;
                r_l2tlb2_valid[137] <= 4'b0;
                r_l2tlb2_valid[138] <= 4'b0;
                r_l2tlb2_valid[139] <= 4'b0;
                r_l2tlb2_valid[140] <= 4'b0;
                r_l2tlb2_valid[141] <= 4'b0;
                r_l2tlb2_valid[142] <= 4'b0;
                r_l2tlb2_valid[143] <= 4'b0;
                r_l2tlb2_valid[144] <= 4'b0;
                r_l2tlb2_valid[145] <= 4'b0;
                r_l2tlb2_valid[146] <= 4'b0;
                r_l2tlb2_valid[147] <= 4'b0;
                r_l2tlb2_valid[148] <= 4'b0;
                r_l2tlb2_valid[149] <= 4'b0;
                r_l2tlb2_valid[150] <= 4'b0;
                r_l2tlb2_valid[151] <= 4'b0;
                r_l2tlb2_valid[152] <= 4'b0;
                r_l2tlb2_valid[153] <= 4'b0;
                r_l2tlb2_valid[154] <= 4'b0;
                r_l2tlb2_valid[155] <= 4'b0;
                r_l2tlb2_valid[156] <= 4'b0;
                r_l2tlb2_valid[157] <= 4'b0;
                r_l2tlb2_valid[158] <= 4'b0;
                r_l2tlb2_valid[159] <= 4'b0;
                r_l2tlb2_valid[160] <= 4'b0;
                r_l2tlb2_valid[161] <= 4'b0;
                r_l2tlb2_valid[162] <= 4'b0;
                r_l2tlb2_valid[163] <= 4'b0;
                r_l2tlb2_valid[164] <= 4'b0;
                r_l2tlb2_valid[165] <= 4'b0;
                r_l2tlb2_valid[166] <= 4'b0;
                r_l2tlb2_valid[167] <= 4'b0;
                r_l2tlb2_valid[168] <= 4'b0;
                r_l2tlb2_valid[169] <= 4'b0;
                r_l2tlb2_valid[170] <= 4'b0;
                r_l2tlb2_valid[171] <= 4'b0;
                r_l2tlb2_valid[172] <= 4'b0;
                r_l2tlb2_valid[173] <= 4'b0;
                r_l2tlb2_valid[174] <= 4'b0;
                r_l2tlb2_valid[175] <= 4'b0;
                r_l2tlb2_valid[176] <= 4'b0;
                r_l2tlb2_valid[177] <= 4'b0;
                r_l2tlb2_valid[178] <= 4'b0;
                r_l2tlb2_valid[179] <= 4'b0;
                r_l2tlb2_valid[180] <= 4'b0;
                r_l2tlb2_valid[181] <= 4'b0;
                r_l2tlb2_valid[182] <= 4'b0;
                r_l2tlb2_valid[183] <= 4'b0;
                r_l2tlb2_valid[184] <= 4'b0;
                r_l2tlb2_valid[185] <= 4'b0;
                r_l2tlb2_valid[186] <= 4'b0;
                r_l2tlb2_valid[187] <= 4'b0;
                r_l2tlb2_valid[188] <= 4'b0;
                r_l2tlb2_valid[189] <= 4'b0;
                r_l2tlb2_valid[190] <= 4'b0;
                r_l2tlb2_valid[191] <= 4'b0;
                r_l2tlb2_valid[192] <= 4'b0;
                r_l2tlb2_valid[193] <= 4'b0;
                r_l2tlb2_valid[194] <= 4'b0;
                r_l2tlb2_valid[195] <= 4'b0;
                r_l2tlb2_valid[196] <= 4'b0;
                r_l2tlb2_valid[197] <= 4'b0;
                r_l2tlb2_valid[198] <= 4'b0;
                r_l2tlb2_valid[199] <= 4'b0;
                r_l2tlb2_valid[200] <= 4'b0;
                r_l2tlb2_valid[201] <= 4'b0;
                r_l2tlb2_valid[202] <= 4'b0;
                r_l2tlb2_valid[203] <= 4'b0;
                r_l2tlb2_valid[204] <= 4'b0;
                r_l2tlb2_valid[205] <= 4'b0;
                r_l2tlb2_valid[206] <= 4'b0;
                r_l2tlb2_valid[207] <= 4'b0;
                r_l2tlb2_valid[208] <= 4'b0;
                r_l2tlb2_valid[209] <= 4'b0;
                r_l2tlb2_valid[210] <= 4'b0;
                r_l2tlb2_valid[211] <= 4'b0;
                r_l2tlb2_valid[212] <= 4'b0;
                r_l2tlb2_valid[213] <= 4'b0;
                r_l2tlb2_valid[214] <= 4'b0;
                r_l2tlb2_valid[215] <= 4'b0;
                r_l2tlb2_valid[216] <= 4'b0;
                r_l2tlb2_valid[217] <= 4'b0;
                r_l2tlb2_valid[218] <= 4'b0;
                r_l2tlb2_valid[219] <= 4'b0;
                r_l2tlb2_valid[220] <= 4'b0;
                r_l2tlb2_valid[221] <= 4'b0;
                r_l2tlb2_valid[222] <= 4'b0;
                r_l2tlb2_valid[223] <= 4'b0;
                r_l2tlb2_valid[224] <= 4'b0;
                r_l2tlb2_valid[225] <= 4'b0;
                r_l2tlb2_valid[226] <= 4'b0;
                r_l2tlb2_valid[227] <= 4'b0;
                r_l2tlb2_valid[228] <= 4'b0;
                r_l2tlb2_valid[229] <= 4'b0;
                r_l2tlb2_valid[230] <= 4'b0;
                r_l2tlb2_valid[231] <= 4'b0;
                r_l2tlb2_valid[232] <= 4'b0;
                r_l2tlb2_valid[233] <= 4'b0;
                r_l2tlb2_valid[234] <= 4'b0;
                r_l2tlb2_valid[235] <= 4'b0;
                r_l2tlb2_valid[236] <= 4'b0;
                r_l2tlb2_valid[237] <= 4'b0;
                r_l2tlb2_valid[238] <= 4'b0;
                r_l2tlb2_valid[239] <= 4'b0;
                r_l2tlb2_valid[240] <= 4'b0;
                r_l2tlb2_valid[241] <= 4'b0;
                r_l2tlb2_valid[242] <= 4'b0;
                r_l2tlb2_valid[243] <= 4'b0;
                r_l2tlb2_valid[244] <= 4'b0;
                r_l2tlb2_valid[245] <= 4'b0;
                r_l2tlb2_valid[246] <= 4'b0;
                r_l2tlb2_valid[247] <= 4'b0;
                r_l2tlb2_valid[248] <= 4'b0;
                r_l2tlb2_valid[249] <= 4'b0;
                r_l2tlb2_valid[250] <= 4'b0;
                r_l2tlb2_valid[251] <= 4'b0;
                r_l2tlb2_valid[252] <= 4'b0;
                r_l2tlb2_valid[253] <= 4'b0;
                r_l2tlb2_valid[254] <= 4'b0;
                r_l2tlb2_valid[255] <= 4'b0;
            end
        end
    end

    SYKB110_256X16X8CM2 l2tlb2_tag (
        .A0   (w_addr_8[0]),
        .A1   (w_addr_8[1]),
        .A2   (w_addr_8[2]),
        .A3   (w_addr_8[3]),
        .A4   (w_addr_8[4]),
        .A5   (w_addr_8[5]),
        .A6   (w_addr_8[6]),
        .A7   (w_addr_8[7]),
        .DO0  (w_read_l22_tag_128[0]),
        .DO1  (w_read_l22_tag_128[1]),
        .DO2  (w_read_l22_tag_128[2]),
        .DO3  (w_read_l22_tag_128[3]),
        .DO4  (w_read_l22_tag_128[4]),
        .DO5  (w_read_l22_tag_128[5]),
        .DO6  (w_read_l22_tag_128[6]),
        .DO7  (w_read_l22_tag_128[7]),
        .DO8  (w_read_l22_tag_128[8]),
        .DO9  (w_read_l22_tag_128[9]),
        .DO10 (w_read_l22_tag_128[10]),
        .DO11 (w_read_l22_tag_128[11]),
        .DO12 (w_read_l22_tag_128[12]),
        .DO13 (w_read_l22_tag_128[13]),
        .DO14 (w_read_l22_tag_128[14]),
        .DO15 (w_read_l22_tag_128[15]),
        .DO16 (w_read_l22_tag_128[16]),
        .DO17 (w_read_l22_tag_128[17]),
        .DO18 (w_read_l22_tag_128[18]),
        .DO19 (w_read_l22_tag_128[19]),
        .DO20 (w_read_l22_tag_128[20]),
        .DO21 (w_read_l22_tag_128[21]),
        .DO22 (w_read_l22_tag_128[22]),
        .DO23 (w_read_l22_tag_128[23]),
        .DO24 (w_read_l22_tag_128[24]),
        .DO25 (w_read_l22_tag_128[25]),
        .DO26 (w_read_l22_tag_128[26]),
        .DO27 (w_read_l22_tag_128[27]),
        .DO28 (w_read_l22_tag_128[28]),
        .DO29 (w_read_l22_tag_128[29]),
        .DO30 (w_read_l22_tag_128[30]),
        .DO31 (w_read_l22_tag_128[31]),
        .DO32 (w_read_l22_tag_128[32]),
        .DO33 (w_read_l22_tag_128[33]),
        .DO34 (w_read_l22_tag_128[34]),
        .DO35 (w_read_l22_tag_128[35]),
        .DO36 (w_read_l22_tag_128[36]),
        .DO37 (w_read_l22_tag_128[37]),
        .DO38 (w_read_l22_tag_128[38]),
        .DO39 (w_read_l22_tag_128[39]),
        .DO40 (w_read_l22_tag_128[40]),
        .DO41 (w_read_l22_tag_128[41]),
        .DO42 (w_read_l22_tag_128[42]),
        .DO43 (w_read_l22_tag_128[43]),
        .DO44 (w_read_l22_tag_128[44]),
        .DO45 (w_read_l22_tag_128[45]),
        .DO46 (w_read_l22_tag_128[46]),
        .DO47 (w_read_l22_tag_128[47]),
        .DO48 (w_read_l22_tag_128[48]),
        .DO49 (w_read_l22_tag_128[49]),
        .DO50 (w_read_l22_tag_128[50]),
        .DO51 (w_read_l22_tag_128[51]),
        .DO52 (w_read_l22_tag_128[52]),
        .DO53 (w_read_l22_tag_128[53]),
        .DO54 (w_read_l22_tag_128[54]),
        .DO55 (w_read_l22_tag_128[55]),
        .DO56 (w_read_l22_tag_128[56]),
        .DO57 (w_read_l22_tag_128[57]),
        .DO58 (w_read_l22_tag_128[58]),
        .DO59 (w_read_l22_tag_128[59]),
        .DO60 (w_read_l22_tag_128[60]),
        .DO61 (w_read_l22_tag_128[61]),
        .DO62 (w_read_l22_tag_128[62]),
        .DO63 (w_read_l22_tag_128[63]),
        .DO64 (w_read_l22_tag_128[64]),
        .DO65 (w_read_l22_tag_128[65]),
        .DO66 (w_read_l22_tag_128[66]),
        .DO67 (w_read_l22_tag_128[67]),
        .DO68 (w_read_l22_tag_128[68]),
        .DO69 (w_read_l22_tag_128[69]),
        .DO70 (w_read_l22_tag_128[70]),
        .DO71 (w_read_l22_tag_128[71]),
        .DO72 (w_read_l22_tag_128[72]),
        .DO73 (w_read_l22_tag_128[73]),
        .DO74 (w_read_l22_tag_128[74]),
        .DO75 (w_read_l22_tag_128[75]),
        .DO76 (w_read_l22_tag_128[76]),
        .DO77 (w_read_l22_tag_128[77]),
        .DO78 (w_read_l22_tag_128[78]),
        .DO79 (w_read_l22_tag_128[79]),
        .DO80 (w_read_l22_tag_128[80]),
        .DO81 (w_read_l22_tag_128[81]),
        .DO82 (w_read_l22_tag_128[82]),
        .DO83 (w_read_l22_tag_128[83]),
        .DO84 (w_read_l22_tag_128[84]),
        .DO85 (w_read_l22_tag_128[85]),
        .DO86 (w_read_l22_tag_128[86]),
        .DO87 (w_read_l22_tag_128[87]),
        .DO88 (w_read_l22_tag_128[88]),
        .DO89 (w_read_l22_tag_128[89]),
        .DO90 (w_read_l22_tag_128[90]),
        .DO91 (w_read_l22_tag_128[91]),
        .DO92 (w_read_l22_tag_128[92]),
        .DO93 (w_read_l22_tag_128[93]),
        .DO94 (w_read_l22_tag_128[94]),
        .DO95 (w_read_l22_tag_128[95]),
        .DO96 (w_read_l22_tag_128[96]),
        .DO97 (w_read_l22_tag_128[97]),
        .DO98 (w_read_l22_tag_128[98]),
        .DO99 (w_read_l22_tag_128[99]),
        .DO100(w_read_l22_tag_128[100]),
        .DO101(w_read_l22_tag_128[101]),
        .DO102(w_read_l22_tag_128[102]),
        .DO103(w_read_l22_tag_128[103]),
        .DO104(w_read_l22_tag_128[104]),
        .DO105(w_read_l22_tag_128[105]),
        .DO106(w_read_l22_tag_128[106]),
        .DO107(w_read_l22_tag_128[107]),
        .DO108(w_read_l22_tag_128[108]),
        .DO109(w_read_l22_tag_128[109]),
        .DO110(w_read_l22_tag_128[110]),
        .DO111(w_read_l22_tag_128[111]),
        .DO112(w_read_l22_tag_128[112]),
        .DO113(w_read_l22_tag_128[113]),
        .DO114(w_read_l22_tag_128[114]),
        .DO115(w_read_l22_tag_128[115]),
        .DO116(w_read_l22_tag_128[116]),
        .DO117(w_read_l22_tag_128[117]),
        .DO118(w_read_l22_tag_128[118]),
        .DO119(w_read_l22_tag_128[119]),
        .DO120(w_read_l22_tag_128[120]),
        .DO121(w_read_l22_tag_128[121]),
        .DO122(w_read_l22_tag_128[122]),
        .DO123(w_read_l22_tag_128[123]),
        .DO124(w_read_l22_tag_128[124]),
        .DO125(w_read_l22_tag_128[125]),
        .DO126(w_read_l22_tag_128[126]),
        .DO127(w_read_l22_tag_128[127]),
        .DI0  (w_write_l22_tag_128[0]),
        .DI1  (w_write_l22_tag_128[1]),
        .DI2  (w_write_l22_tag_128[2]),
        .DI3  (w_write_l22_tag_128[3]),
        .DI4  (w_write_l22_tag_128[4]),
        .DI5  (w_write_l22_tag_128[5]),
        .DI6  (w_write_l22_tag_128[6]),
        .DI7  (w_write_l22_tag_128[7]),
        .DI8  (w_write_l22_tag_128[8]),
        .DI9  (w_write_l22_tag_128[9]),
        .DI10 (w_write_l22_tag_128[10]),
        .DI11 (w_write_l22_tag_128[11]),
        .DI12 (w_write_l22_tag_128[12]),
        .DI13 (w_write_l22_tag_128[13]),
        .DI14 (w_write_l22_tag_128[14]),
        .DI15 (w_write_l22_tag_128[15]),
        .DI16 (w_write_l22_tag_128[16]),
        .DI17 (w_write_l22_tag_128[17]),
        .DI18 (w_write_l22_tag_128[18]),
        .DI19 (w_write_l22_tag_128[19]),
        .DI20 (w_write_l22_tag_128[20]),
        .DI21 (w_write_l22_tag_128[21]),
        .DI22 (w_write_l22_tag_128[22]),
        .DI23 (w_write_l22_tag_128[23]),
        .DI24 (w_write_l22_tag_128[24]),
        .DI25 (w_write_l22_tag_128[25]),
        .DI26 (w_write_l22_tag_128[26]),
        .DI27 (w_write_l22_tag_128[27]),
        .DI28 (w_write_l22_tag_128[28]),
        .DI29 (w_write_l22_tag_128[29]),
        .DI30 (w_write_l22_tag_128[30]),
        .DI31 (w_write_l22_tag_128[31]),
        .DI32 (w_write_l22_tag_128[32]),
        .DI33 (w_write_l22_tag_128[33]),
        .DI34 (w_write_l22_tag_128[34]),
        .DI35 (w_write_l22_tag_128[35]),
        .DI36 (w_write_l22_tag_128[36]),
        .DI37 (w_write_l22_tag_128[37]),
        .DI38 (w_write_l22_tag_128[38]),
        .DI39 (w_write_l22_tag_128[39]),
        .DI40 (w_write_l22_tag_128[40]),
        .DI41 (w_write_l22_tag_128[41]),
        .DI42 (w_write_l22_tag_128[42]),
        .DI43 (w_write_l22_tag_128[43]),
        .DI44 (w_write_l22_tag_128[44]),
        .DI45 (w_write_l22_tag_128[45]),
        .DI46 (w_write_l22_tag_128[46]),
        .DI47 (w_write_l22_tag_128[47]),
        .DI48 (w_write_l22_tag_128[48]),
        .DI49 (w_write_l22_tag_128[49]),
        .DI50 (w_write_l22_tag_128[50]),
        .DI51 (w_write_l22_tag_128[51]),
        .DI52 (w_write_l22_tag_128[52]),
        .DI53 (w_write_l22_tag_128[53]),
        .DI54 (w_write_l22_tag_128[54]),
        .DI55 (w_write_l22_tag_128[55]),
        .DI56 (w_write_l22_tag_128[56]),
        .DI57 (w_write_l22_tag_128[57]),
        .DI58 (w_write_l22_tag_128[58]),
        .DI59 (w_write_l22_tag_128[59]),
        .DI60 (w_write_l22_tag_128[60]),
        .DI61 (w_write_l22_tag_128[61]),
        .DI62 (w_write_l22_tag_128[62]),
        .DI63 (w_write_l22_tag_128[63]),
        .DI64 (w_write_l22_tag_128[64]),
        .DI65 (w_write_l22_tag_128[65]),
        .DI66 (w_write_l22_tag_128[66]),
        .DI67 (w_write_l22_tag_128[67]),
        .DI68 (w_write_l22_tag_128[68]),
        .DI69 (w_write_l22_tag_128[69]),
        .DI70 (w_write_l22_tag_128[70]),
        .DI71 (w_write_l22_tag_128[71]),
        .DI72 (w_write_l22_tag_128[72]),
        .DI73 (w_write_l22_tag_128[73]),
        .DI74 (w_write_l22_tag_128[74]),
        .DI75 (w_write_l22_tag_128[75]),
        .DI76 (w_write_l22_tag_128[76]),
        .DI77 (w_write_l22_tag_128[77]),
        .DI78 (w_write_l22_tag_128[78]),
        .DI79 (w_write_l22_tag_128[79]),
        .DI80 (w_write_l22_tag_128[80]),
        .DI81 (w_write_l22_tag_128[81]),
        .DI82 (w_write_l22_tag_128[82]),
        .DI83 (w_write_l22_tag_128[83]),
        .DI84 (w_write_l22_tag_128[84]),
        .DI85 (w_write_l22_tag_128[85]),
        .DI86 (w_write_l22_tag_128[86]),
        .DI87 (w_write_l22_tag_128[87]),
        .DI88 (w_write_l22_tag_128[88]),
        .DI89 (w_write_l22_tag_128[89]),
        .DI90 (w_write_l22_tag_128[90]),
        .DI91 (w_write_l22_tag_128[91]),
        .DI92 (w_write_l22_tag_128[92]),
        .DI93 (w_write_l22_tag_128[93]),
        .DI94 (w_write_l22_tag_128[94]),
        .DI95 (w_write_l22_tag_128[95]),
        .DI96 (w_write_l22_tag_128[96]),
        .DI97 (w_write_l22_tag_128[97]),
        .DI98 (w_write_l22_tag_128[98]),
        .DI99 (w_write_l22_tag_128[99]),
        .DI100(w_write_l22_tag_128[100]),
        .DI101(w_write_l22_tag_128[101]),
        .DI102(w_write_l22_tag_128[102]),
        .DI103(w_write_l22_tag_128[103]),
        .DI104(w_write_l22_tag_128[104]),
        .DI105(w_write_l22_tag_128[105]),
        .DI106(w_write_l22_tag_128[106]),
        .DI107(w_write_l22_tag_128[107]),
        .DI108(w_write_l22_tag_128[108]),
        .DI109(w_write_l22_tag_128[109]),
        .DI110(w_write_l22_tag_128[110]),
        .DI111(w_write_l22_tag_128[111]),
        .DI112(w_write_l22_tag_128[112]),
        .DI113(w_write_l22_tag_128[113]),
        .DI114(w_write_l22_tag_128[114]),
        .DI115(w_write_l22_tag_128[115]),
        .DI116(w_write_l22_tag_128[116]),
        .DI117(w_write_l22_tag_128[117]),
        .DI118(w_write_l22_tag_128[118]),
        .DI119(w_write_l22_tag_128[119]),
        .DI120(w_write_l22_tag_128[120]),
        .DI121(w_write_l22_tag_128[121]),
        .DI122(w_write_l22_tag_128[122]),
        .DI123(w_write_l22_tag_128[123]),
        .DI124(w_write_l22_tag_128[124]),
        .DI125(w_write_l22_tag_128[125]),
        .DI126(w_write_l22_tag_128[126]),
        .DI127(w_write_l22_tag_128[127]),
        .CK   (clk),
        .WEB0(~i_write_en_4[0]),
        .WEB1(~i_write_en_4[0]),
        .WEB2(~i_write_en_4[1]),
        .WEB3(~i_write_en_4[1]),
        .WEB4(~i_write_en_4[2]),
        .WEB5(~i_write_en_4[2]),
        .WEB6(~i_write_en_4[3]),
        .WEB7(~i_write_en_4[3]),
        .DVSE (1'b0),
        .DVS0 (1'b0),
        .DVS1 (1'b0),
        .DVS2 (1'b0),
        .DVS3 (1'b0),
        .CSB  (1'b0)
    );

    SYKB110_256X12X8CM2 l2tlb2_data (
        .A0  (w_addr_8[0]),
        .A1  (w_addr_8[1]),
        .A2  (w_addr_8[2]),
        .A3  (w_addr_8[3]),
        .A4  (w_addr_8[4]),
        .A5  (w_addr_8[5]),
        .A6  (w_addr_8[6]),
        .A7  (w_addr_8[7]),
        .DO0 (w_read_l22_data_96[0]),
        .DO1 (w_read_l22_data_96[1]),
        .DO2 (w_read_l22_data_96[2]),
        .DO3 (w_read_l22_data_96[3]),
        .DO4 (w_read_l22_data_96[4]),
        .DO5 (w_read_l22_data_96[5]),
        .DO6 (w_read_l22_data_96[6]),
        .DO7 (w_read_l22_data_96[7]),
        .DO8 (w_read_l22_data_96[8]),
        .DO9 (w_read_l22_data_96[9]),
        .DO10(w_read_l22_data_96[10]),
        .DO11(w_read_l22_data_96[11]),
        .DO12(w_read_l22_data_96[12]),
        .DO13(w_read_l22_data_96[13]),
        .DO14(w_read_l22_data_96[14]),
        .DO15(w_read_l22_data_96[15]),
        .DO16(w_read_l22_data_96[16]),
        .DO17(w_read_l22_data_96[17]),
        .DO18(w_read_l22_data_96[18]),
        .DO19(w_read_l22_data_96[19]),
        .DO20(w_read_l22_data_96[20]),
        .DO21(w_read_l22_data_96[21]),
        .DO22(w_read_l22_data_96[22]),
        .DO23(w_read_l22_data_96[23]),
        .DO24(w_read_l22_data_96[24]),
        .DO25(w_read_l22_data_96[25]),
        .DO26(w_read_l22_data_96[26]),
        .DO27(w_read_l22_data_96[27]),
        .DO28(w_read_l22_data_96[28]),
        .DO29(w_read_l22_data_96[29]),
        .DO30(w_read_l22_data_96[30]),
        .DO31(w_read_l22_data_96[31]),
        .DO32(w_read_l22_data_96[32]),
        .DO33(w_read_l22_data_96[33]),
        .DO34(w_read_l22_data_96[34]),
        .DO35(w_read_l22_data_96[35]),
        .DO36(w_read_l22_data_96[36]),
        .DO37(w_read_l22_data_96[37]),
        .DO38(w_read_l22_data_96[38]),
        .DO39(w_read_l22_data_96[39]),
        .DO40(w_read_l22_data_96[40]),
        .DO41(w_read_l22_data_96[41]),
        .DO42(w_read_l22_data_96[42]),
        .DO43(w_read_l22_data_96[43]),
        .DO44(w_read_l22_data_96[44]),
        .DO45(w_read_l22_data_96[45]),
        .DO46(w_read_l22_data_96[46]),
        .DO47(w_read_l22_data_96[47]),
        .DO48(w_read_l22_data_96[48]),
        .DO49(w_read_l22_data_96[49]),
        .DO50(w_read_l22_data_96[50]),
        .DO51(w_read_l22_data_96[51]),
        .DO52(w_read_l22_data_96[52]),
        .DO53(w_read_l22_data_96[53]),
        .DO54(w_read_l22_data_96[54]),
        .DO55(w_read_l22_data_96[55]),
        .DO56(w_read_l22_data_96[56]),
        .DO57(w_read_l22_data_96[57]),
        .DO58(w_read_l22_data_96[58]),
        .DO59(w_read_l22_data_96[59]),
        .DO60(w_read_l22_data_96[60]),
        .DO61(w_read_l22_data_96[61]),
        .DO62(w_read_l22_data_96[62]),
        .DO63(w_read_l22_data_96[63]),
        .DO64(w_read_l22_data_96[64]),
        .DO65(w_read_l22_data_96[65]),
        .DO66(w_read_l22_data_96[66]),
        .DO67(w_read_l22_data_96[67]),
        .DO68(w_read_l22_data_96[68]),
        .DO69(w_read_l22_data_96[69]),
        .DO70(w_read_l22_data_96[70]),
        .DO71(w_read_l22_data_96[71]),
        .DO72(w_read_l22_data_96[72]),
        .DO73(w_read_l22_data_96[73]),
        .DO74(w_read_l22_data_96[74]),
        .DO75(w_read_l22_data_96[75]),
        .DO76(w_read_l22_data_96[76]),
        .DO77(w_read_l22_data_96[77]),
        .DO78(w_read_l22_data_96[78]),
        .DO79(w_read_l22_data_96[79]),
        .DO80(w_read_l22_data_96[80]),
        .DO81(w_read_l22_data_96[81]),
        .DO82(w_read_l22_data_96[82]),
        .DO83(w_read_l22_data_96[83]),
        .DO84(w_read_l22_data_96[84]),
        .DO85(w_read_l22_data_96[85]),
        .DO86(w_read_l22_data_96[86]),
        .DO87(w_read_l22_data_96[87]),
        .DO88(w_read_l22_data_96[88]),
        .DO89(w_read_l22_data_96[89]),
        .DO90(w_read_l22_data_96[90]),
        .DO91(w_read_l22_data_96[91]),
        .DO92(w_read_l22_data_96[92]),
        .DO93(w_read_l22_data_96[93]),
        .DO94(w_read_l22_data_96[94]),
        .DO95(w_read_l22_data_96[95]),
        .DI0 (w_write_l22_data_96[0]),
        .DI1 (w_write_l22_data_96[1]),
        .DI2 (w_write_l22_data_96[2]),
        .DI3 (w_write_l22_data_96[3]),
        .DI4 (w_write_l22_data_96[4]),
        .DI5 (w_write_l22_data_96[5]),
        .DI6 (w_write_l22_data_96[6]),
        .DI7 (w_write_l22_data_96[7]),
        .DI8 (w_write_l22_data_96[8]),
        .DI9 (w_write_l22_data_96[9]),
        .DI10(w_write_l22_data_96[10]),
        .DI11(w_write_l22_data_96[11]),
        .DI12(w_write_l22_data_96[12]),
        .DI13(w_write_l22_data_96[13]),
        .DI14(w_write_l22_data_96[14]),
        .DI15(w_write_l22_data_96[15]),
        .DI16(w_write_l22_data_96[16]),
        .DI17(w_write_l22_data_96[17]),
        .DI18(w_write_l22_data_96[18]),
        .DI19(w_write_l22_data_96[19]),
        .DI20(w_write_l22_data_96[20]),
        .DI21(w_write_l22_data_96[21]),
        .DI22(w_write_l22_data_96[22]),
        .DI23(w_write_l22_data_96[23]),
        .DI24(w_write_l22_data_96[24]),
        .DI25(w_write_l22_data_96[25]),
        .DI26(w_write_l22_data_96[26]),
        .DI27(w_write_l22_data_96[27]),
        .DI28(w_write_l22_data_96[28]),
        .DI29(w_write_l22_data_96[29]),
        .DI30(w_write_l22_data_96[30]),
        .DI31(w_write_l22_data_96[31]),
        .DI32(w_write_l22_data_96[32]),
        .DI33(w_write_l22_data_96[33]),
        .DI34(w_write_l22_data_96[34]),
        .DI35(w_write_l22_data_96[35]),
        .DI36(w_write_l22_data_96[36]),
        .DI37(w_write_l22_data_96[37]),
        .DI38(w_write_l22_data_96[38]),
        .DI39(w_write_l22_data_96[39]),
        .DI40(w_write_l22_data_96[40]),
        .DI41(w_write_l22_data_96[41]),
        .DI42(w_write_l22_data_96[42]),
        .DI43(w_write_l22_data_96[43]),
        .DI44(w_write_l22_data_96[44]),
        .DI45(w_write_l22_data_96[45]),
        .DI46(w_write_l22_data_96[46]),
        .DI47(w_write_l22_data_96[47]),
        .DI48(w_write_l22_data_96[48]),
        .DI49(w_write_l22_data_96[49]),
        .DI50(w_write_l22_data_96[50]),
        .DI51(w_write_l22_data_96[51]),
        .DI52(w_write_l22_data_96[52]),
        .DI53(w_write_l22_data_96[53]),
        .DI54(w_write_l22_data_96[54]),
        .DI55(w_write_l22_data_96[55]),
        .DI56(w_write_l22_data_96[56]),
        .DI57(w_write_l22_data_96[57]),
        .DI58(w_write_l22_data_96[58]),
        .DI59(w_write_l22_data_96[59]),
        .DI60(w_write_l22_data_96[60]),
        .DI61(w_write_l22_data_96[61]),
        .DI62(w_write_l22_data_96[62]),
        .DI63(w_write_l22_data_96[63]),
        .DI64(w_write_l22_data_96[64]),
        .DI65(w_write_l22_data_96[65]),
        .DI66(w_write_l22_data_96[66]),
        .DI67(w_write_l22_data_96[67]),
        .DI68(w_write_l22_data_96[68]),
        .DI69(w_write_l22_data_96[69]),
        .DI70(w_write_l22_data_96[70]),
        .DI71(w_write_l22_data_96[71]),
        .DI72(w_write_l22_data_96[72]),
        .DI73(w_write_l22_data_96[73]),
        .DI74(w_write_l22_data_96[74]),
        .DI75(w_write_l22_data_96[75]),
        .DI76(w_write_l22_data_96[76]),
        .DI77(w_write_l22_data_96[77]),
        .DI78(w_write_l22_data_96[78]),
        .DI79(w_write_l22_data_96[79]),
        .DI80(w_write_l22_data_96[80]),
        .DI81(w_write_l22_data_96[81]),
        .DI82(w_write_l22_data_96[82]),
        .DI83(w_write_l22_data_96[83]),
        .DI84(w_write_l22_data_96[84]),
        .DI85(w_write_l22_data_96[85]),
        .DI86(w_write_l22_data_96[86]),
        .DI87(w_write_l22_data_96[87]),
        .DI88(w_write_l22_data_96[88]),
        .DI89(w_write_l22_data_96[89]),
        .DI90(w_write_l22_data_96[90]),
        .DI91(w_write_l22_data_96[91]),
        .DI92(w_write_l22_data_96[92]),
        .DI93(w_write_l22_data_96[93]),
        .DI94(w_write_l22_data_96[94]),
        .DI95(w_write_l22_data_96[95]),
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
    assign hit0 = (i_read_contrast_21 == w_read_l22_tag_128[30:10]) && (r_l2tlb2_valid[w_addr_8][0] == 1'b1);
    assign hit1 = (i_read_contrast_21 == w_read_l22_tag_128[62:42]) && (r_l2tlb2_valid[w_addr_8][1] == 1'b1);
    assign hit2 = (i_read_contrast_21 == w_read_l22_tag_128[94:74]) && (r_l2tlb2_valid[w_addr_8][2] == 1'b1);
    assign hit3 = (i_read_contrast_21 == w_read_l22_tag_128[126:106]) && (r_l2tlb2_valid[w_addr_8][3] == 1'b1);

    assign o_read_data_24 = hit0 ? w_read_l22_data_96[23:0] :
        hit1 ? w_read_l22_data_96[47:24] : 
        hit2 ? w_read_l22_data_96[71:48] : 
        hit3 ? w_read_l22_data_96[95:72] : 24'd0;
    assign o_read_tag_32  = hit0 ? {w_read_l22_tag_128[31:1], r_l2tlb2_valid[w_addr_8][0]} : 
        hit1 ? {w_read_l22_tag_128[63:33], r_l2tlb2_valid[w_addr_8][1]} : 
        hit2 ? {w_read_l22_tag_128[95:65], r_l2tlb2_valid[w_addr_8][2]} : 
        hit3 ? {w_read_l22_tag_128[127:97], r_l2tlb2_valid[w_addr_8][3]} : 32'd0;
    assign o_hit_4        = hit0 ? 4'b0001 : hit1 ? 4'b0010 : hit2 ? 4'b0100 : hit3 ? 4'b1000 : 4'b0;
    assign o_valid_4      = r_l2tlb2_valid[w_addr_8];

endmodule
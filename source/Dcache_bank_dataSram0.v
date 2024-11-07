`timescale 1ns / 1ps

// //low 16B
//     Dcache_bank_dataSram0 u_Dcache_bank_dataSram0 (
//     .clka(w_pmtfifo1_fire_2[1]),    // input wire clka
//     .ena(1'b1),      // input wire ena
//     .wea(w_dataSRAM0_write_enable),      // input wire [0 : 0] wea
//     .addra(w_Data_SRAM_addr_9),  // input wire [8 : 0] addra  //Dcache_ram_addr_9 = i_lsu_addr_offset_12[11:7]+write_enable ? 3'b0 : sel_way_3+i_lsu_addr_offset_12[3]
//     .dina(w_dataSRAM0_datain_64),    // input wire [63 : 0] dina
//     .douta({w_dataSRAM_out_way7_32B[127:0], w_dataSRAM_out_way6_32B[127:0], w_dataSRAM_out_way5_32B[127:0], w_dataSRAM_out_way4_32B[127:0], w_dataSRAM_out_way3_32B[127:0], w_dataSRAM_out_way2_32B[127:0], w_dataSRAM_out_way1_32B[127:0], w_dataSRAM_out_way0_32B[127:0]})  // output wire [1023 : 0] douta
//     );

module Dcache_bank_dataSram0(
    input wire clka,ena,wea,
    input wire  [8 : 0] addra, // [3:0] 位用于写，[8:4]决定读
    input wire [63 : 0] dina,
    input wire [3:0] i_store_Type_4, // onehot 4位使能，对应对齐字内的4个字节
    input wire w_write_or_writeBack,  //1 write
    output wire [1023 : 0] douta
);

    wire [4:0] RAM_addr;
    reg  [7:0] w_sel_SRAM_8 ;
    wire [63:0] w_datain_64;

    wire [127:0] RAM7_data_in, RAM6_data_in, RAM5_data_in, RAM4_data_in;
    wire [127:0] RAM3_data_in, RAM2_data_in, RAM1_data_in, RAM0_data_in;
    
    wire [127:0] RAM7_data_out, RAM6_data_out, RAM5_data_out, RAM4_data_out;
    wire [127:0] RAM3_data_out, RAM2_data_out, RAM1_data_out, RAM0_data_out;

    assign RAM_addr = addra[8:4];

    assign w_datain_64 = dina;
    assign RAM7_data_in = {w_datain_64, w_datain_64};
    assign RAM6_data_in = {w_datain_64, w_datain_64};
    assign RAM5_data_in = {w_datain_64, w_datain_64};
    assign RAM4_data_in = {w_datain_64, w_datain_64};
    assign RAM3_data_in = {w_datain_64, w_datain_64};
    assign RAM2_data_in = {w_datain_64, w_datain_64};
    assign RAM1_data_in = {w_datain_64, w_datain_64};
    assign RAM0_data_in = {w_datain_64, w_datain_64};

    assign douta = { RAM7_data_out, RAM6_data_out, RAM5_data_out, RAM4_data_out, RAM3_data_out, RAM2_data_out, RAM1_data_out, RAM0_data_out};

    wire [15:0]  w_WEB0, w_WEB1, w_WEB2, w_WEB3, w_WEB4, w_WEB5, w_WEB6, w_WEB7;

    always @( *) begin
        case (addra[3:1])
            3'b000:begin
              w_sel_SRAM_8 = 8'b00000001;
            end
            3'b001:begin
              w_sel_SRAM_8 = 8'b00000010;
            end 
            3'b010:begin
              w_sel_SRAM_8 = 8'b00000100;
            end 
            3'b011:begin
              w_sel_SRAM_8 = 8'b00001000;
            end 
            3'b100:begin
              w_sel_SRAM_8 = 8'b00010000;
            end 
            3'b101:begin
              w_sel_SRAM_8 = 8'b00100000;
            end 
            3'b110:begin
              w_sel_SRAM_8 = 8'b01000000;
            end
            default:begin
              w_sel_SRAM_8 = 8'b10000000;
            end  
            // default:begin
            //   w_sel_SRAM_8 = 8'b00000000;
            // end
        endcase
    end

    wire  [3:0] w_store_enable;
    assign w_store_enable = w_write_or_writeBack ? i_store_Type_4 : 4'b1111;
    // always @( *) begin
    //   if ((i_store_Type_2 == 2'b00) && (w_write_or_writeBack == 1)) begin
    //      case (i_word_addr)
    //       2'b00:w_store_enable = 4'b0011;
    //       2'b01:w_store_enable = 4'b0110;
    //       2'b01:w_store_enable = 4'b1100; 
    //       default: w_store_enable = 4'b1000;
    //      endcase
    //   end
    //   else if ((i_store_Type_2 == 2'b01) && (w_write_or_writeBack == 1)) begin
    //     w_store_enable = 4'b1111;
    //   end
    //   else if ((i_store_Type_2 == 2'b10) && (w_write_or_writeBack == 1)) begin
    //     case (i_word_addr)
    //       2'b00:w_store_enable = 4'b0001;
    //       2'b01:w_store_enable = 4'b0010;
    //       2'b01:w_store_enable = 4'b0100; 
    //       default: w_store_enable = 4'b1000;
    //      endcase
    //   end
    //   else begin
    //      w_store_enable = 4'b1111;
    //   end
    // end
    
    assign w_WEB0[7 :0] = { 8{ wea & w_sel_SRAM_8[0] & {~addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB0[15:8] = { 8{ wea & w_sel_SRAM_8[0] & { addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB1[7 :0] = { 8{ wea & w_sel_SRAM_8[1] & {~addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB1[15:8] = { 8{ wea & w_sel_SRAM_8[1] & { addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB2[7 :0] = { 8{ wea & w_sel_SRAM_8[2] & {~addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB2[15:8] = { 8{ wea & w_sel_SRAM_8[2] & { addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB3[7 :0] = { 8{ wea & w_sel_SRAM_8[3] & {~addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB3[15:8] = { 8{ wea & w_sel_SRAM_8[3] & { addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB4[7 :0] = { 8{ wea & w_sel_SRAM_8[4] & {~addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB4[15:8] = { 8{ wea & w_sel_SRAM_8[4] & { addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB5[7 :0] = { 8{ wea & w_sel_SRAM_8[5] & {~addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB5[15:8] = { 8{ wea & w_sel_SRAM_8[5] & { addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB6[7 :0] = { 8{ wea & w_sel_SRAM_8[6] & {~addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB6[15:8] = { 8{ wea & w_sel_SRAM_8[6] & { addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB7[7 :0] = { 8{ wea & w_sel_SRAM_8[7] & {~addra[0]} }} & {w_store_enable, w_store_enable}  ;
    assign w_WEB7[15:8] = { 8{ wea & w_sel_SRAM_8[7] & { addra[0]} }} & {w_store_enable, w_store_enable}  ;

SYKB110_32X8X16CM2 u_Ddata0_SYKB110_32X8X16CM2(
    .DO0   (RAM0_data_out[0  ] ),    .DO1   (RAM0_data_out[1  ] ),    .DO2   (RAM0_data_out[2  ] ),    .DO3   (RAM0_data_out[3  ] ),
    .DO4   (RAM0_data_out[4  ] ),    .DO5   (RAM0_data_out[5  ] ),    .DO6   (RAM0_data_out[6  ] ),    .DO7   (RAM0_data_out[7  ] ),
    .DO8   (RAM0_data_out[8  ] ),    .DO9   (RAM0_data_out[9  ] ),    .DO10  (RAM0_data_out[10 ] ),    .DO11  (RAM0_data_out[11 ] ),
    .DO12  (RAM0_data_out[12 ] ),    .DO13  (RAM0_data_out[13 ] ),    .DO14  (RAM0_data_out[14 ] ),    .DO15  (RAM0_data_out[15 ] ),
    .DO16  (RAM0_data_out[16 ] ),    .DO17  (RAM0_data_out[17 ] ),    .DO18  (RAM0_data_out[18 ] ),    .DO19  (RAM0_data_out[19 ] ),
    .DO20  (RAM0_data_out[20 ] ),    .DO21  (RAM0_data_out[21 ] ),    .DO22  (RAM0_data_out[22 ] ),    .DO23  (RAM0_data_out[23 ] ),
    .DO24  (RAM0_data_out[24 ] ),    .DO25  (RAM0_data_out[25 ] ),    .DO26  (RAM0_data_out[26 ] ),    .DO27  (RAM0_data_out[27 ] ),
    .DO28  (RAM0_data_out[28 ] ),    .DO29  (RAM0_data_out[29 ] ),    .DO30  (RAM0_data_out[30 ] ),    .DO31  (RAM0_data_out[31 ] ),
    .DO32  (RAM0_data_out[32 ] ),    .DO33  (RAM0_data_out[33 ] ),    .DO34  (RAM0_data_out[34 ] ),    .DO35  (RAM0_data_out[35 ] ),
    .DO36  (RAM0_data_out[36 ] ),    .DO37  (RAM0_data_out[37 ] ),    .DO38  (RAM0_data_out[38 ] ),    .DO39  (RAM0_data_out[39 ] ),
    .DO40  (RAM0_data_out[40 ] ),    .DO41  (RAM0_data_out[41 ] ),    .DO42  (RAM0_data_out[42 ] ),    .DO43  (RAM0_data_out[43 ] ),
    .DO44  (RAM0_data_out[44 ] ),    .DO45  (RAM0_data_out[45 ] ),    .DO46  (RAM0_data_out[46 ] ),    .DO47  (RAM0_data_out[47 ] ),
    .DO48  (RAM0_data_out[48 ] ),    .DO49  (RAM0_data_out[49 ] ),    .DO50  (RAM0_data_out[50 ] ),    .DO51  (RAM0_data_out[51 ] ),
    .DO52  (RAM0_data_out[52 ] ),    .DO53  (RAM0_data_out[53 ] ),    .DO54  (RAM0_data_out[54 ] ),    .DO55  (RAM0_data_out[55 ] ),
    .DO56  (RAM0_data_out[56 ] ),    .DO57  (RAM0_data_out[57 ] ),    .DO58  (RAM0_data_out[58 ] ),    .DO59  (RAM0_data_out[59 ] ),
    .DO60  (RAM0_data_out[60 ] ),    .DO61  (RAM0_data_out[61 ] ),    .DO62  (RAM0_data_out[62 ] ),    .DO63  (RAM0_data_out[63 ] ),
    .DO64  (RAM0_data_out[64 ] ),    .DO65  (RAM0_data_out[65 ] ),    .DO66  (RAM0_data_out[66 ] ),    .DO67  (RAM0_data_out[67 ] ),
    .DO68  (RAM0_data_out[68 ] ),    .DO69  (RAM0_data_out[69 ] ),    .DO70  (RAM0_data_out[70 ] ),    .DO71  (RAM0_data_out[71 ] ),
    .DO72  (RAM0_data_out[72 ] ),    .DO73  (RAM0_data_out[73 ] ),    .DO74  (RAM0_data_out[74 ] ),    .DO75  (RAM0_data_out[75 ] ),
    .DO76  (RAM0_data_out[76 ] ),    .DO77  (RAM0_data_out[77 ] ),    .DO78  (RAM0_data_out[78 ] ),    .DO79  (RAM0_data_out[79 ] ),
    .DO80  (RAM0_data_out[80 ] ),    .DO81  (RAM0_data_out[81 ] ),    .DO82  (RAM0_data_out[82 ] ),    .DO83  (RAM0_data_out[83 ] ),
    .DO84  (RAM0_data_out[84 ] ),    .DO85  (RAM0_data_out[85 ] ),    .DO86  (RAM0_data_out[86 ] ),    .DO87  (RAM0_data_out[87 ]),
    .DO88  (RAM0_data_out[88 ] ),    .DO89  (RAM0_data_out[89 ] ),    .DO90  (RAM0_data_out[90 ] ),    .DO91  (RAM0_data_out[91 ] ),
    .DO92  (RAM0_data_out[92 ] ),    .DO93  (RAM0_data_out[93 ] ),    .DO94  (RAM0_data_out[94 ] ),    .DO95  (RAM0_data_out[95 ] ),
    .DO96  (RAM0_data_out[96 ] ),    .DO97  (RAM0_data_out[97 ] ),    .DO98  (RAM0_data_out[98 ] ),    .DO99  (RAM0_data_out[99 ] ),
    .DO100 (RAM0_data_out[100] ),    .DO101 (RAM0_data_out[101] ),    .DO102 (RAM0_data_out[102] ),    .DO103 (RAM0_data_out[103] ),
    .DO104 (RAM0_data_out[104] ),    .DO105 (RAM0_data_out[105] ),    .DO106 (RAM0_data_out[106] ),    .DO107 (RAM0_data_out[107] ),
    .DO108 (RAM0_data_out[108] ),    .DO109 (RAM0_data_out[109] ),    .DO110 (RAM0_data_out[110] ),    .DO111 (RAM0_data_out[111] ),
    .DO112 (RAM0_data_out[112] ),    .DO113 (RAM0_data_out[113] ),    .DO114 (RAM0_data_out[114] ),    .DO115 (RAM0_data_out[115] ),
    .DO116 (RAM0_data_out[116] ),    .DO117 (RAM0_data_out[117] ),    .DO118 (RAM0_data_out[118] ),    .DO119 (RAM0_data_out[119] ),
    .DO120 (RAM0_data_out[120] ),    .DO121 (RAM0_data_out[121] ),    .DO122 (RAM0_data_out[122] ),    .DO123 (RAM0_data_out[123] ),
    .DO124 (RAM0_data_out[124] ),    .DO125 (RAM0_data_out[125] ),    .DO126 (RAM0_data_out[126] ),    .DO127 (RAM0_data_out[127] ),

    .DI0   (RAM0_data_in[0  ] ),    .DI1   (RAM0_data_in[1  ] ),    .DI2   (RAM0_data_in[2  ] ),    .DI3   (RAM0_data_in[3  ] ),
    .DI4   (RAM0_data_in[4  ] ),    .DI5   (RAM0_data_in[5  ] ),    .DI6   (RAM0_data_in[6  ] ),    .DI7   (RAM0_data_in[7  ] ),
    .DI8   (RAM0_data_in[8  ] ),    .DI9   (RAM0_data_in[9  ] ),    .DI10  (RAM0_data_in[10 ] ),    .DI11  (RAM0_data_in[11 ] ),
    .DI12  (RAM0_data_in[12 ] ),    .DI13  (RAM0_data_in[13 ] ),    .DI14  (RAM0_data_in[14 ] ),    .DI15  (RAM0_data_in[15 ] ),
    .DI16  (RAM0_data_in[16 ] ),    .DI17  (RAM0_data_in[17 ] ),    .DI18  (RAM0_data_in[18 ] ),    .DI19  (RAM0_data_in[19 ] ),
    .DI20  (RAM0_data_in[20 ] ),    .DI21  (RAM0_data_in[21 ] ),    .DI22  (RAM0_data_in[22 ] ),    .DI23  (RAM0_data_in[23 ] ),
    .DI24  (RAM0_data_in[24 ] ),    .DI25  (RAM0_data_in[25 ] ),    .DI26  (RAM0_data_in[26 ] ),    .DI27  (RAM0_data_in[27 ] ),
    .DI28  (RAM0_data_in[28 ] ),    .DI29  (RAM0_data_in[29 ] ),    .DI30  (RAM0_data_in[30 ] ),    .DI31  (RAM0_data_in[31 ] ),
    .DI32  (RAM0_data_in[32 ] ),    .DI33  (RAM0_data_in[33 ] ),    .DI34  (RAM0_data_in[34 ] ),    .DI35  (RAM0_data_in[35 ] ),
    .DI36  (RAM0_data_in[36 ] ),    .DI37  (RAM0_data_in[37 ] ),    .DI38  (RAM0_data_in[38 ] ),    .DI39  (RAM0_data_in[39 ] ),
    .DI40  (RAM0_data_in[40 ] ),    .DI41  (RAM0_data_in[41 ] ),    .DI42  (RAM0_data_in[42 ] ),    .DI43  (RAM0_data_in[43 ] ),
    .DI44  (RAM0_data_in[44 ] ),    .DI45  (RAM0_data_in[45 ] ),    .DI46  (RAM0_data_in[46 ] ),    .DI47  (RAM0_data_in[47 ] ),
    .DI48  (RAM0_data_in[48 ] ),    .DI49  (RAM0_data_in[49 ] ),    .DI50  (RAM0_data_in[50 ] ),    .DI51  (RAM0_data_in[51 ] ),
    .DI52  (RAM0_data_in[52 ] ),    .DI53  (RAM0_data_in[53 ] ),    .DI54  (RAM0_data_in[54 ] ),    .DI55  (RAM0_data_in[55 ] ),
    .DI56  (RAM0_data_in[56 ] ),    .DI57  (RAM0_data_in[57 ] ),    .DI58  (RAM0_data_in[58 ] ),    .DI59  (RAM0_data_in[59 ] ),
    .DI60  (RAM0_data_in[60 ] ),    .DI61  (RAM0_data_in[61 ] ),    .DI62  (RAM0_data_in[62 ] ),    .DI63  (RAM0_data_in[63 ] ),
    .DI64  (RAM0_data_in[64 ] ),    .DI65  (RAM0_data_in[65 ] ),    .DI66  (RAM0_data_in[66 ] ),    .DI67  (RAM0_data_in[67 ] ),
    .DI68  (RAM0_data_in[68 ] ),    .DI69  (RAM0_data_in[69 ] ),    .DI70  (RAM0_data_in[70 ] ),    .DI71  (RAM0_data_in[71 ] ),
    .DI72  (RAM0_data_in[72 ] ),    .DI73  (RAM0_data_in[73 ] ),    .DI74  (RAM0_data_in[74 ] ),    .DI75  (RAM0_data_in[75 ] ),
    .DI76  (RAM0_data_in[76 ] ),    .DI77  (RAM0_data_in[77 ] ),    .DI78  (RAM0_data_in[78 ] ),    .DI79  (RAM0_data_in[79 ] ),
    .DI80  (RAM0_data_in[80 ] ),    .DI81  (RAM0_data_in[81 ] ),    .DI82  (RAM0_data_in[82 ] ),    .DI83  (RAM0_data_in[83 ] ),
    .DI84  (RAM0_data_in[84 ] ),    .DI85  (RAM0_data_in[85 ] ),    .DI86  (RAM0_data_in[86 ] ),    .DI87  (RAM0_data_in[87 ]),
    .DI88  (RAM0_data_in[88 ] ),    .DI89  (RAM0_data_in[89 ] ),    .DI90  (RAM0_data_in[90 ] ),    .DI91  (RAM0_data_in[91 ] ),
    .DI92  (RAM0_data_in[92 ] ),    .DI93  (RAM0_data_in[93 ] ),    .DI94  (RAM0_data_in[94 ] ),    .DI95  (RAM0_data_in[95 ] ),
    .DI96  (RAM0_data_in[96 ] ),    .DI97  (RAM0_data_in[97 ] ),    .DI98  (RAM0_data_in[98 ] ),    .DI99  (RAM0_data_in[99 ] ),
    .DI100 (RAM0_data_in[100] ),    .DI101 (RAM0_data_in[101] ),    .DI102 (RAM0_data_in[102] ),    .DI103 (RAM0_data_in[103] ),
    .DI104 (RAM0_data_in[104] ),    .DI105 (RAM0_data_in[105] ),    .DI106 (RAM0_data_in[106] ),    .DI107 (RAM0_data_in[107] ),
    .DI108 (RAM0_data_in[108] ),    .DI109 (RAM0_data_in[109] ),    .DI110 (RAM0_data_in[110] ),    .DI111 (RAM0_data_in[111] ),
    .DI112 (RAM0_data_in[112] ),    .DI113 (RAM0_data_in[113] ),    .DI114 (RAM0_data_in[114] ),    .DI115 (RAM0_data_in[115] ),
    .DI116 (RAM0_data_in[116] ),    .DI117 (RAM0_data_in[117] ),    .DI118 (RAM0_data_in[118] ),    .DI119 (RAM0_data_in[119] ),
    .DI120 (RAM0_data_in[120] ),    .DI121 (RAM0_data_in[121] ),    .DI122 (RAM0_data_in[122] ),    .DI123 (RAM0_data_in[123] ),
    .DI124 (RAM0_data_in[124] ),    .DI125 (RAM0_data_in[125] ),    .DI126 (RAM0_data_in[126] ),    .DI127 (RAM0_data_in[127] ),

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),.A4   (RAM_addr[4]   ),
    .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    .WEB0 (~w_WEB0[0] ),.WEB1 (~w_WEB0[1] ),.WEB2 (~w_WEB0[2] ),.WEB3 (~w_WEB0[3] ),
    .WEB4 (~w_WEB0[4] ),.WEB5 (~w_WEB0[5] ),.WEB6 (~w_WEB0[6] ),.WEB7 (~w_WEB0[7] ),
    .WEB8 (~w_WEB0[8]  ),.WEB9  (~w_WEB0[9]  ),.WEB10 (~w_WEB0[10]  ),.WEB11 (~w_WEB0[11]  ),
    .WEB12(~w_WEB0[12]  ),.WEB13 (~w_WEB0[13]  ),.WEB14 (~w_WEB0[14]  ),.WEB15 (~w_WEB0[15]  ),
    .CK    (clka   ),
    .CSB   (1'b0   )
);
    
SYKB110_32X8X16CM2 u_Ddata1_SYKB110_32X8X16CM2(
    .DO0   (RAM1_data_out[0  ] ),    .DO1   (RAM1_data_out[1  ] ),    .DO2   (RAM1_data_out[2  ] ),    .DO3   (RAM1_data_out[3  ] ),
    .DO4   (RAM1_data_out[4  ] ),    .DO5   (RAM1_data_out[5  ] ),    .DO6   (RAM1_data_out[6  ] ),    .DO7   (RAM1_data_out[7  ] ),
    .DO8   (RAM1_data_out[8  ] ),    .DO9   (RAM1_data_out[9  ] ),    .DO10  (RAM1_data_out[10 ] ),    .DO11  (RAM1_data_out[11 ] ),
    .DO12  (RAM1_data_out[12 ] ),    .DO13  (RAM1_data_out[13 ] ),    .DO14  (RAM1_data_out[14 ] ),    .DO15  (RAM1_data_out[15 ] ),
    .DO16  (RAM1_data_out[16 ] ),    .DO17  (RAM1_data_out[17 ] ),    .DO18  (RAM1_data_out[18 ] ),    .DO19  (RAM1_data_out[19 ] ),
    .DO20  (RAM1_data_out[20 ] ),    .DO21  (RAM1_data_out[21 ] ),    .DO22  (RAM1_data_out[22 ] ),    .DO23  (RAM1_data_out[23 ] ),
    .DO24  (RAM1_data_out[24 ] ),    .DO25  (RAM1_data_out[25 ] ),    .DO26  (RAM1_data_out[26 ] ),    .DO27  (RAM1_data_out[27 ] ),
    .DO28  (RAM1_data_out[28 ] ),    .DO29  (RAM1_data_out[29 ] ),    .DO30  (RAM1_data_out[30 ] ),    .DO31  (RAM1_data_out[31 ] ),
    .DO32  (RAM1_data_out[32 ] ),    .DO33  (RAM1_data_out[33 ] ),    .DO34  (RAM1_data_out[34 ] ),    .DO35  (RAM1_data_out[35 ] ),
    .DO36  (RAM1_data_out[36 ] ),    .DO37  (RAM1_data_out[37 ] ),    .DO38  (RAM1_data_out[38 ] ),    .DO39  (RAM1_data_out[39 ] ),
    .DO40  (RAM1_data_out[40 ] ),    .DO41  (RAM1_data_out[41 ] ),    .DO42  (RAM1_data_out[42 ] ),    .DO43  (RAM1_data_out[43 ] ),
    .DO44  (RAM1_data_out[44 ] ),    .DO45  (RAM1_data_out[45 ] ),    .DO46  (RAM1_data_out[46 ] ),    .DO47  (RAM1_data_out[47 ] ),
    .DO48  (RAM1_data_out[48 ] ),    .DO49  (RAM1_data_out[49 ] ),    .DO50  (RAM1_data_out[50 ] ),    .DO51  (RAM1_data_out[51 ] ),
    .DO52  (RAM1_data_out[52 ] ),    .DO53  (RAM1_data_out[53 ] ),    .DO54  (RAM1_data_out[54 ] ),    .DO55  (RAM1_data_out[55 ] ),
    .DO56  (RAM1_data_out[56 ] ),    .DO57  (RAM1_data_out[57 ] ),    .DO58  (RAM1_data_out[58 ] ),    .DO59  (RAM1_data_out[59 ] ),
    .DO60  (RAM1_data_out[60 ] ),    .DO61  (RAM1_data_out[61 ] ),    .DO62  (RAM1_data_out[62 ] ),    .DO63  (RAM1_data_out[63 ] ),
    .DO64  (RAM1_data_out[64 ] ),    .DO65  (RAM1_data_out[65 ] ),    .DO66  (RAM1_data_out[66 ] ),    .DO67  (RAM1_data_out[67 ] ),
    .DO68  (RAM1_data_out[68 ] ),    .DO69  (RAM1_data_out[69 ] ),    .DO70  (RAM1_data_out[70 ] ),    .DO71  (RAM1_data_out[71 ] ),
    .DO72  (RAM1_data_out[72 ] ),    .DO73  (RAM1_data_out[73 ] ),    .DO74  (RAM1_data_out[74 ] ),    .DO75  (RAM1_data_out[75 ] ),
    .DO76  (RAM1_data_out[76 ] ),    .DO77  (RAM1_data_out[77 ] ),    .DO78  (RAM1_data_out[78 ] ),    .DO79  (RAM1_data_out[79 ] ),
    .DO80  (RAM1_data_out[80 ] ),    .DO81  (RAM1_data_out[81 ] ),    .DO82  (RAM1_data_out[82 ] ),    .DO83  (RAM1_data_out[83 ] ),
    .DO84  (RAM1_data_out[84 ] ),    .DO85  (RAM1_data_out[85 ] ),    .DO86  (RAM1_data_out[86 ] ),    .DO87  (RAM1_data_out[87 ]),
    .DO88  (RAM1_data_out[88 ] ),    .DO89  (RAM1_data_out[89 ] ),    .DO90  (RAM1_data_out[90 ] ),    .DO91  (RAM1_data_out[91 ] ),
    .DO92  (RAM1_data_out[92 ] ),    .DO93  (RAM1_data_out[93 ] ),    .DO94  (RAM1_data_out[94 ] ),    .DO95  (RAM1_data_out[95 ] ),
    .DO96  (RAM1_data_out[96 ] ),    .DO97  (RAM1_data_out[97 ] ),    .DO98  (RAM1_data_out[98 ] ),    .DO99  (RAM1_data_out[99 ] ),
    .DO100 (RAM1_data_out[100] ),    .DO101 (RAM1_data_out[101] ),    .DO102 (RAM1_data_out[102] ),    .DO103 (RAM1_data_out[103] ),
    .DO104 (RAM1_data_out[104] ),    .DO105 (RAM1_data_out[105] ),    .DO106 (RAM1_data_out[106] ),    .DO107 (RAM1_data_out[107] ),
    .DO108 (RAM1_data_out[108] ),    .DO109 (RAM1_data_out[109] ),    .DO110 (RAM1_data_out[110] ),    .DO111 (RAM1_data_out[111] ),
    .DO112 (RAM1_data_out[112] ),    .DO113 (RAM1_data_out[113] ),    .DO114 (RAM1_data_out[114] ),    .DO115 (RAM1_data_out[115] ),
    .DO116 (RAM1_data_out[116] ),    .DO117 (RAM1_data_out[117] ),    .DO118 (RAM1_data_out[118] ),    .DO119 (RAM1_data_out[119] ),
    .DO120 (RAM1_data_out[120] ),    .DO121 (RAM1_data_out[121] ),    .DO122 (RAM1_data_out[122] ),    .DO123 (RAM1_data_out[123] ),
    .DO124 (RAM1_data_out[124] ),    .DO125 (RAM1_data_out[125] ),    .DO126 (RAM1_data_out[126] ),    .DO127 (RAM1_data_out[127] ),

    .DI0   (RAM1_data_in[0  ] ),    .DI1   (RAM1_data_in[1  ] ),    .DI2   (RAM1_data_in[2  ] ),    .DI3   (RAM1_data_in[3  ] ),
    .DI4   (RAM1_data_in[4  ] ),    .DI5   (RAM1_data_in[5  ] ),    .DI6   (RAM1_data_in[6  ] ),    .DI7   (RAM1_data_in[7  ] ),
    .DI8   (RAM1_data_in[8  ] ),    .DI9   (RAM1_data_in[9  ] ),    .DI10  (RAM1_data_in[10 ] ),    .DI11  (RAM1_data_in[11 ] ),
    .DI12  (RAM1_data_in[12 ] ),    .DI13  (RAM1_data_in[13 ] ),    .DI14  (RAM1_data_in[14 ] ),    .DI15  (RAM1_data_in[15 ] ),
    .DI16  (RAM1_data_in[16 ] ),    .DI17  (RAM1_data_in[17 ] ),    .DI18  (RAM1_data_in[18 ] ),    .DI19  (RAM1_data_in[19 ] ),
    .DI20  (RAM1_data_in[20 ] ),    .DI21  (RAM1_data_in[21 ] ),    .DI22  (RAM1_data_in[22 ] ),    .DI23  (RAM1_data_in[23 ] ),
    .DI24  (RAM1_data_in[24 ] ),    .DI25  (RAM1_data_in[25 ] ),    .DI26  (RAM1_data_in[26 ] ),    .DI27  (RAM1_data_in[27 ] ),
    .DI28  (RAM1_data_in[28 ] ),    .DI29  (RAM1_data_in[29 ] ),    .DI30  (RAM1_data_in[30 ] ),    .DI31  (RAM1_data_in[31 ] ),
    .DI32  (RAM1_data_in[32 ] ),    .DI33  (RAM1_data_in[33 ] ),    .DI34  (RAM1_data_in[34 ] ),    .DI35  (RAM1_data_in[35 ] ),
    .DI36  (RAM1_data_in[36 ] ),    .DI37  (RAM1_data_in[37 ] ),    .DI38  (RAM1_data_in[38 ] ),    .DI39  (RAM1_data_in[39 ] ),
    .DI40  (RAM1_data_in[40 ] ),    .DI41  (RAM1_data_in[41 ] ),    .DI42  (RAM1_data_in[42 ] ),    .DI43  (RAM1_data_in[43 ] ),
    .DI44  (RAM1_data_in[44 ] ),    .DI45  (RAM1_data_in[45 ] ),    .DI46  (RAM1_data_in[46 ] ),    .DI47  (RAM1_data_in[47 ] ),
    .DI48  (RAM1_data_in[48 ] ),    .DI49  (RAM1_data_in[49 ] ),    .DI50  (RAM1_data_in[50 ] ),    .DI51  (RAM1_data_in[51 ] ),
    .DI52  (RAM1_data_in[52 ] ),    .DI53  (RAM1_data_in[53 ] ),    .DI54  (RAM1_data_in[54 ] ),    .DI55  (RAM1_data_in[55 ] ),
    .DI56  (RAM1_data_in[56 ] ),    .DI57  (RAM1_data_in[57 ] ),    .DI58  (RAM1_data_in[58 ] ),    .DI59  (RAM1_data_in[59 ] ),
    .DI60  (RAM1_data_in[60 ] ),    .DI61  (RAM1_data_in[61 ] ),    .DI62  (RAM1_data_in[62 ] ),    .DI63  (RAM1_data_in[63 ] ),
    .DI64  (RAM1_data_in[64 ] ),    .DI65  (RAM1_data_in[65 ] ),    .DI66  (RAM1_data_in[66 ] ),    .DI67  (RAM1_data_in[67 ] ),
    .DI68  (RAM1_data_in[68 ] ),    .DI69  (RAM1_data_in[69 ] ),    .DI70  (RAM1_data_in[70 ] ),    .DI71  (RAM1_data_in[71 ] ),
    .DI72  (RAM1_data_in[72 ] ),    .DI73  (RAM1_data_in[73 ] ),    .DI74  (RAM1_data_in[74 ] ),    .DI75  (RAM1_data_in[75 ] ),
    .DI76  (RAM1_data_in[76 ] ),    .DI77  (RAM1_data_in[77 ] ),    .DI78  (RAM1_data_in[78 ] ),    .DI79  (RAM1_data_in[79 ] ),
    .DI80  (RAM1_data_in[80 ] ),    .DI81  (RAM1_data_in[81 ] ),    .DI82  (RAM1_data_in[82 ] ),    .DI83  (RAM1_data_in[83 ] ),
    .DI84  (RAM1_data_in[84 ] ),    .DI85  (RAM1_data_in[85 ] ),    .DI86  (RAM1_data_in[86 ] ),    .DI87  (RAM1_data_in[87 ]),
    .DI88  (RAM1_data_in[88 ] ),    .DI89  (RAM1_data_in[89 ] ),    .DI90  (RAM1_data_in[90 ] ),    .DI91  (RAM1_data_in[91 ] ),
    .DI92  (RAM1_data_in[92 ] ),    .DI93  (RAM1_data_in[93 ] ),    .DI94  (RAM1_data_in[94 ] ),    .DI95  (RAM1_data_in[95 ] ),
    .DI96  (RAM1_data_in[96 ] ),    .DI97  (RAM1_data_in[97 ] ),    .DI98  (RAM1_data_in[98 ] ),    .DI99  (RAM1_data_in[99 ] ),
    .DI100 (RAM1_data_in[100] ),    .DI101 (RAM1_data_in[101] ),    .DI102 (RAM1_data_in[102] ),    .DI103 (RAM1_data_in[103] ),
    .DI104 (RAM1_data_in[104] ),    .DI105 (RAM1_data_in[105] ),    .DI106 (RAM1_data_in[106] ),    .DI107 (RAM1_data_in[107] ),
    .DI108 (RAM1_data_in[108] ),    .DI109 (RAM1_data_in[109] ),    .DI110 (RAM1_data_in[110] ),    .DI111 (RAM1_data_in[111] ),
    .DI112 (RAM1_data_in[112] ),    .DI113 (RAM1_data_in[113] ),    .DI114 (RAM1_data_in[114] ),    .DI115 (RAM1_data_in[115] ),
    .DI116 (RAM1_data_in[116] ),    .DI117 (RAM1_data_in[117] ),    .DI118 (RAM1_data_in[118] ),    .DI119 (RAM1_data_in[119] ),
    .DI120 (RAM1_data_in[120] ),    .DI121 (RAM1_data_in[121] ),    .DI122 (RAM1_data_in[122] ),    .DI123 (RAM1_data_in[123] ),
    .DI124 (RAM1_data_in[124] ),    .DI125 (RAM1_data_in[125] ),    .DI126 (RAM1_data_in[126] ),    .DI127 (RAM1_data_in[127] ),

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),.A4   (RAM_addr[4]   ),
    .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    .WEB0 (~w_WEB1[0] ),.WEB1 (~w_WEB1[1] ),.WEB2 (~w_WEB1[2] ),.WEB3 (~w_WEB1[3] ),
    .WEB4 (~w_WEB1[4] ),.WEB5 (~w_WEB1[5] ),.WEB6 (~w_WEB1[6] ),.WEB7 (~w_WEB1[7] ),
    .WEB8 (~w_WEB1[8]  ),.WEB9  (~w_WEB1[9]  ),.WEB10 (~w_WEB1[10]  ),.WEB11 (~w_WEB1[11]  ),
    .WEB12(~w_WEB1[12]  ),.WEB13 (~w_WEB1[13]  ),.WEB14 (~w_WEB1[14]  ),.WEB15 (~w_WEB1[15]  ),

    .CK    (clka   ),
    .CSB   (1'b0   )
);

SYKB110_32X8X16CM2 u_Ddata2_SYKB110_32X8X16CM2(
    .DO0   (RAM2_data_out[0  ] ),    .DO1   (RAM2_data_out[1  ] ),    .DO2   (RAM2_data_out[2  ] ),    .DO3   (RAM2_data_out[3  ] ),
    .DO4   (RAM2_data_out[4  ] ),    .DO5   (RAM2_data_out[5  ] ),    .DO6   (RAM2_data_out[6  ] ),    .DO7   (RAM2_data_out[7  ] ),
    .DO8   (RAM2_data_out[8  ] ),    .DO9   (RAM2_data_out[9  ] ),    .DO10  (RAM2_data_out[10 ] ),    .DO11  (RAM2_data_out[11 ] ),
    .DO12  (RAM2_data_out[12 ] ),    .DO13  (RAM2_data_out[13 ] ),    .DO14  (RAM2_data_out[14 ] ),    .DO15  (RAM2_data_out[15 ] ),
    .DO16  (RAM2_data_out[16 ] ),    .DO17  (RAM2_data_out[17 ] ),    .DO18  (RAM2_data_out[18 ] ),    .DO19  (RAM2_data_out[19 ] ),
    .DO20  (RAM2_data_out[20 ] ),    .DO21  (RAM2_data_out[21 ] ),    .DO22  (RAM2_data_out[22 ] ),    .DO23  (RAM2_data_out[23 ] ),
    .DO24  (RAM2_data_out[24 ] ),    .DO25  (RAM2_data_out[25 ] ),    .DO26  (RAM2_data_out[26 ] ),    .DO27  (RAM2_data_out[27 ] ),
    .DO28  (RAM2_data_out[28 ] ),    .DO29  (RAM2_data_out[29 ] ),    .DO30  (RAM2_data_out[30 ] ),    .DO31  (RAM2_data_out[31 ] ),
    .DO32  (RAM2_data_out[32 ] ),    .DO33  (RAM2_data_out[33 ] ),    .DO34  (RAM2_data_out[34 ] ),    .DO35  (RAM2_data_out[35 ] ),
    .DO36  (RAM2_data_out[36 ] ),    .DO37  (RAM2_data_out[37 ] ),    .DO38  (RAM2_data_out[38 ] ),    .DO39  (RAM2_data_out[39 ] ),
    .DO40  (RAM2_data_out[40 ] ),    .DO41  (RAM2_data_out[41 ] ),    .DO42  (RAM2_data_out[42 ] ),    .DO43  (RAM2_data_out[43 ] ),
    .DO44  (RAM2_data_out[44 ] ),    .DO45  (RAM2_data_out[45 ] ),    .DO46  (RAM2_data_out[46 ] ),    .DO47  (RAM2_data_out[47 ] ),
    .DO48  (RAM2_data_out[48 ] ),    .DO49  (RAM2_data_out[49 ] ),    .DO50  (RAM2_data_out[50 ] ),    .DO51  (RAM2_data_out[51 ] ),
    .DO52  (RAM2_data_out[52 ] ),    .DO53  (RAM2_data_out[53 ] ),    .DO54  (RAM2_data_out[54 ] ),    .DO55  (RAM2_data_out[55 ] ),
    .DO56  (RAM2_data_out[56 ] ),    .DO57  (RAM2_data_out[57 ] ),    .DO58  (RAM2_data_out[58 ] ),    .DO59  (RAM2_data_out[59 ] ),
    .DO60  (RAM2_data_out[60 ] ),    .DO61  (RAM2_data_out[61 ] ),    .DO62  (RAM2_data_out[62 ] ),    .DO63  (RAM2_data_out[63 ] ),
    .DO64  (RAM2_data_out[64 ] ),    .DO65  (RAM2_data_out[65 ] ),    .DO66  (RAM2_data_out[66 ] ),    .DO67  (RAM2_data_out[67 ] ),
    .DO68  (RAM2_data_out[68 ] ),    .DO69  (RAM2_data_out[69 ] ),    .DO70  (RAM2_data_out[70 ] ),    .DO71  (RAM2_data_out[71 ] ),
    .DO72  (RAM2_data_out[72 ] ),    .DO73  (RAM2_data_out[73 ] ),    .DO74  (RAM2_data_out[74 ] ),    .DO75  (RAM2_data_out[75 ] ),
    .DO76  (RAM2_data_out[76 ] ),    .DO77  (RAM2_data_out[77 ] ),    .DO78  (RAM2_data_out[78 ] ),    .DO79  (RAM2_data_out[79 ] ),
    .DO80  (RAM2_data_out[80 ] ),    .DO81  (RAM2_data_out[81 ] ),    .DO82  (RAM2_data_out[82 ] ),    .DO83  (RAM2_data_out[83 ] ),
    .DO84  (RAM2_data_out[84 ] ),    .DO85  (RAM2_data_out[85 ] ),    .DO86  (RAM2_data_out[86 ] ),    .DO87  (RAM2_data_out[87 ]),
    .DO88  (RAM2_data_out[88 ] ),    .DO89  (RAM2_data_out[89 ] ),    .DO90  (RAM2_data_out[90 ] ),    .DO91  (RAM2_data_out[91 ] ),
    .DO92  (RAM2_data_out[92 ] ),    .DO93  (RAM2_data_out[93 ] ),    .DO94  (RAM2_data_out[94 ] ),    .DO95  (RAM2_data_out[95 ] ),
    .DO96  (RAM2_data_out[96 ] ),    .DO97  (RAM2_data_out[97 ] ),    .DO98  (RAM2_data_out[98 ] ),    .DO99  (RAM2_data_out[99 ] ),
    .DO100 (RAM2_data_out[100] ),    .DO101 (RAM2_data_out[101] ),    .DO102 (RAM2_data_out[102] ),    .DO103 (RAM2_data_out[103] ),
    .DO104 (RAM2_data_out[104] ),    .DO105 (RAM2_data_out[105] ),    .DO106 (RAM2_data_out[106] ),    .DO107 (RAM2_data_out[107] ),
    .DO108 (RAM2_data_out[108] ),    .DO109 (RAM2_data_out[109] ),    .DO110 (RAM2_data_out[110] ),    .DO111 (RAM2_data_out[111] ),
    .DO112 (RAM2_data_out[112] ),    .DO113 (RAM2_data_out[113] ),    .DO114 (RAM2_data_out[114] ),    .DO115 (RAM2_data_out[115] ),
    .DO116 (RAM2_data_out[116] ),    .DO117 (RAM2_data_out[117] ),    .DO118 (RAM2_data_out[118] ),    .DO119 (RAM2_data_out[119] ),
    .DO120 (RAM2_data_out[120] ),    .DO121 (RAM2_data_out[121] ),    .DO122 (RAM2_data_out[122] ),    .DO123 (RAM2_data_out[123] ),
    .DO124 (RAM2_data_out[124] ),    .DO125 (RAM2_data_out[125] ),    .DO126 (RAM2_data_out[126] ),    .DO127 (RAM2_data_out[127] ),

    .DI0   (RAM2_data_in[0  ] ),    .DI1   (RAM2_data_in[1  ] ),    .DI2   (RAM2_data_in[2  ] ),    .DI3   (RAM2_data_in[3  ] ),
    .DI4   (RAM2_data_in[4  ] ),    .DI5   (RAM2_data_in[5  ] ),    .DI6   (RAM2_data_in[6  ] ),    .DI7   (RAM2_data_in[7  ] ),
    .DI8   (RAM2_data_in[8  ] ),    .DI9   (RAM2_data_in[9  ] ),    .DI10  (RAM2_data_in[10 ] ),    .DI11  (RAM2_data_in[11 ] ),
    .DI12  (RAM2_data_in[12 ] ),    .DI13  (RAM2_data_in[13 ] ),    .DI14  (RAM2_data_in[14 ] ),    .DI15  (RAM2_data_in[15 ] ),
    .DI16  (RAM2_data_in[16 ] ),    .DI17  (RAM2_data_in[17 ] ),    .DI18  (RAM2_data_in[18 ] ),    .DI19  (RAM2_data_in[19 ] ),
    .DI20  (RAM2_data_in[20 ] ),    .DI21  (RAM2_data_in[21 ] ),    .DI22  (RAM2_data_in[22 ] ),    .DI23  (RAM2_data_in[23 ] ),
    .DI24  (RAM2_data_in[24 ] ),    .DI25  (RAM2_data_in[25 ] ),    .DI26  (RAM2_data_in[26 ] ),    .DI27  (RAM2_data_in[27 ] ),
    .DI28  (RAM2_data_in[28 ] ),    .DI29  (RAM2_data_in[29 ] ),    .DI30  (RAM2_data_in[30 ] ),    .DI31  (RAM2_data_in[31 ] ),
    .DI32  (RAM2_data_in[32 ] ),    .DI33  (RAM2_data_in[33 ] ),    .DI34  (RAM2_data_in[34 ] ),    .DI35  (RAM2_data_in[35 ] ),
    .DI36  (RAM2_data_in[36 ] ),    .DI37  (RAM2_data_in[37 ] ),    .DI38  (RAM2_data_in[38 ] ),    .DI39  (RAM2_data_in[39 ] ),
    .DI40  (RAM2_data_in[40 ] ),    .DI41  (RAM2_data_in[41 ] ),    .DI42  (RAM2_data_in[42 ] ),    .DI43  (RAM2_data_in[43 ] ),
    .DI44  (RAM2_data_in[44 ] ),    .DI45  (RAM2_data_in[45 ] ),    .DI46  (RAM2_data_in[46 ] ),    .DI47  (RAM2_data_in[47 ] ),
    .DI48  (RAM2_data_in[48 ] ),    .DI49  (RAM2_data_in[49 ] ),    .DI50  (RAM2_data_in[50 ] ),    .DI51  (RAM2_data_in[51 ] ),
    .DI52  (RAM2_data_in[52 ] ),    .DI53  (RAM2_data_in[53 ] ),    .DI54  (RAM2_data_in[54 ] ),    .DI55  (RAM2_data_in[55 ] ),
    .DI56  (RAM2_data_in[56 ] ),    .DI57  (RAM2_data_in[57 ] ),    .DI58  (RAM2_data_in[58 ] ),    .DI59  (RAM2_data_in[59 ] ),
    .DI60  (RAM2_data_in[60 ] ),    .DI61  (RAM2_data_in[61 ] ),    .DI62  (RAM2_data_in[62 ] ),    .DI63  (RAM2_data_in[63 ] ),
    .DI64  (RAM2_data_in[64 ] ),    .DI65  (RAM2_data_in[65 ] ),    .DI66  (RAM2_data_in[66 ] ),    .DI67  (RAM2_data_in[67 ] ),
    .DI68  (RAM2_data_in[68 ] ),    .DI69  (RAM2_data_in[69 ] ),    .DI70  (RAM2_data_in[70 ] ),    .DI71  (RAM2_data_in[71 ] ),
    .DI72  (RAM2_data_in[72 ] ),    .DI73  (RAM2_data_in[73 ] ),    .DI74  (RAM2_data_in[74 ] ),    .DI75  (RAM2_data_in[75 ] ),
    .DI76  (RAM2_data_in[76 ] ),    .DI77  (RAM2_data_in[77 ] ),    .DI78  (RAM2_data_in[78 ] ),    .DI79  (RAM2_data_in[79 ] ),
    .DI80  (RAM2_data_in[80 ] ),    .DI81  (RAM2_data_in[81 ] ),    .DI82  (RAM2_data_in[82 ] ),    .DI83  (RAM2_data_in[83 ] ),
    .DI84  (RAM2_data_in[84 ] ),    .DI85  (RAM2_data_in[85 ] ),    .DI86  (RAM2_data_in[86 ] ),    .DI87  (RAM2_data_in[87 ]),
    .DI88  (RAM2_data_in[88 ] ),    .DI89  (RAM2_data_in[89 ] ),    .DI90  (RAM2_data_in[90 ] ),    .DI91  (RAM2_data_in[91 ] ),
    .DI92  (RAM2_data_in[92 ] ),    .DI93  (RAM2_data_in[93 ] ),    .DI94  (RAM2_data_in[94 ] ),    .DI95  (RAM2_data_in[95 ] ),
    .DI96  (RAM2_data_in[96 ] ),    .DI97  (RAM2_data_in[97 ] ),    .DI98  (RAM2_data_in[98 ] ),    .DI99  (RAM2_data_in[99 ] ),
    .DI100 (RAM2_data_in[100] ),    .DI101 (RAM2_data_in[101] ),    .DI102 (RAM2_data_in[102] ),    .DI103 (RAM2_data_in[103] ),
    .DI104 (RAM2_data_in[104] ),    .DI105 (RAM2_data_in[105] ),    .DI106 (RAM2_data_in[106] ),    .DI107 (RAM2_data_in[107] ),
    .DI108 (RAM2_data_in[108] ),    .DI109 (RAM2_data_in[109] ),    .DI110 (RAM2_data_in[110] ),    .DI111 (RAM2_data_in[111] ),
    .DI112 (RAM2_data_in[112] ),    .DI113 (RAM2_data_in[113] ),    .DI114 (RAM2_data_in[114] ),    .DI115 (RAM2_data_in[115] ),
    .DI116 (RAM2_data_in[116] ),    .DI117 (RAM2_data_in[117] ),    .DI118 (RAM2_data_in[118] ),    .DI119 (RAM2_data_in[119] ),
    .DI120 (RAM2_data_in[120] ),    .DI121 (RAM2_data_in[121] ),    .DI122 (RAM2_data_in[122] ),    .DI123 (RAM2_data_in[123] ),
    .DI124 (RAM2_data_in[124] ),    .DI125 (RAM2_data_in[125] ),    .DI126 (RAM2_data_in[126] ),    .DI127 (RAM2_data_in[127] ),

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),.A4   (RAM_addr[4]   ),
    .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    .WEB0 (~w_WEB2[0] ),.WEB1 (~w_WEB2[1] ),.WEB2 (~w_WEB2[2] ),.WEB3 (~w_WEB2[3] ),
    .WEB4 (~w_WEB2[4] ),.WEB5 (~w_WEB2[5] ),.WEB6 (~w_WEB2[6] ),.WEB7 (~w_WEB2[7] ),
    .WEB8 (~w_WEB2[8]  ),.WEB9  (~w_WEB2[9]  ),.WEB10 (~w_WEB2[10]  ),.WEB11 (~w_WEB2[11]  ),
    .WEB12(~w_WEB2[12]  ),.WEB13 (~w_WEB2[13]  ),.WEB14 (~w_WEB2[14]  ),.WEB15 (~w_WEB2[15]  ),

    .CK    (clka   ),
    .CSB   (1'b0   )
);

SYKB110_32X8X16CM2 u_Ddata3_SYKB110_32X8X16CM2(
    .DO0   (RAM3_data_out[0  ] ),    .DO1   (RAM3_data_out[1  ] ),    .DO2   (RAM3_data_out[2  ] ),    .DO3   (RAM3_data_out[3  ] ),
    .DO4   (RAM3_data_out[4  ] ),    .DO5   (RAM3_data_out[5  ] ),    .DO6   (RAM3_data_out[6  ] ),    .DO7   (RAM3_data_out[7  ] ),
    .DO8   (RAM3_data_out[8  ] ),    .DO9   (RAM3_data_out[9  ] ),    .DO10  (RAM3_data_out[10 ] ),    .DO11  (RAM3_data_out[11 ] ),
    .DO12  (RAM3_data_out[12 ] ),    .DO13  (RAM3_data_out[13 ] ),    .DO14  (RAM3_data_out[14 ] ),    .DO15  (RAM3_data_out[15 ] ),
    .DO16  (RAM3_data_out[16 ] ),    .DO17  (RAM3_data_out[17 ] ),    .DO18  (RAM3_data_out[18 ] ),    .DO19  (RAM3_data_out[19 ] ),
    .DO20  (RAM3_data_out[20 ] ),    .DO21  (RAM3_data_out[21 ] ),    .DO22  (RAM3_data_out[22 ] ),    .DO23  (RAM3_data_out[23 ] ),
    .DO24  (RAM3_data_out[24 ] ),    .DO25  (RAM3_data_out[25 ] ),    .DO26  (RAM3_data_out[26 ] ),    .DO27  (RAM3_data_out[27 ] ),
    .DO28  (RAM3_data_out[28 ] ),    .DO29  (RAM3_data_out[29 ] ),    .DO30  (RAM3_data_out[30 ] ),    .DO31  (RAM3_data_out[31 ] ),
    .DO32  (RAM3_data_out[32 ] ),    .DO33  (RAM3_data_out[33 ] ),    .DO34  (RAM3_data_out[34 ] ),    .DO35  (RAM3_data_out[35 ] ),
    .DO36  (RAM3_data_out[36 ] ),    .DO37  (RAM3_data_out[37 ] ),    .DO38  (RAM3_data_out[38 ] ),    .DO39  (RAM3_data_out[39 ] ),
    .DO40  (RAM3_data_out[40 ] ),    .DO41  (RAM3_data_out[41 ] ),    .DO42  (RAM3_data_out[42 ] ),    .DO43  (RAM3_data_out[43 ] ),
    .DO44  (RAM3_data_out[44 ] ),    .DO45  (RAM3_data_out[45 ] ),    .DO46  (RAM3_data_out[46 ] ),    .DO47  (RAM3_data_out[47 ] ),
    .DO48  (RAM3_data_out[48 ] ),    .DO49  (RAM3_data_out[49 ] ),    .DO50  (RAM3_data_out[50 ] ),    .DO51  (RAM3_data_out[51 ] ),
    .DO52  (RAM3_data_out[52 ] ),    .DO53  (RAM3_data_out[53 ] ),    .DO54  (RAM3_data_out[54 ] ),    .DO55  (RAM3_data_out[55 ] ),
    .DO56  (RAM3_data_out[56 ] ),    .DO57  (RAM3_data_out[57 ] ),    .DO58  (RAM3_data_out[58 ] ),    .DO59  (RAM3_data_out[59 ] ),
    .DO60  (RAM3_data_out[60 ] ),    .DO61  (RAM3_data_out[61 ] ),    .DO62  (RAM3_data_out[62 ] ),    .DO63  (RAM3_data_out[63 ] ),
    .DO64  (RAM3_data_out[64 ] ),    .DO65  (RAM3_data_out[65 ] ),    .DO66  (RAM3_data_out[66 ] ),    .DO67  (RAM3_data_out[67 ] ),
    .DO68  (RAM3_data_out[68 ] ),    .DO69  (RAM3_data_out[69 ] ),    .DO70  (RAM3_data_out[70 ] ),    .DO71  (RAM3_data_out[71 ] ),
    .DO72  (RAM3_data_out[72 ] ),    .DO73  (RAM3_data_out[73 ] ),    .DO74  (RAM3_data_out[74 ] ),    .DO75  (RAM3_data_out[75 ] ),
    .DO76  (RAM3_data_out[76 ] ),    .DO77  (RAM3_data_out[77 ] ),    .DO78  (RAM3_data_out[78 ] ),    .DO79  (RAM3_data_out[79 ] ),
    .DO80  (RAM3_data_out[80 ] ),    .DO81  (RAM3_data_out[81 ] ),    .DO82  (RAM3_data_out[82 ] ),    .DO83  (RAM3_data_out[83 ] ),
    .DO84  (RAM3_data_out[84 ] ),    .DO85  (RAM3_data_out[85 ] ),    .DO86  (RAM3_data_out[86 ] ),    .DO87  (RAM3_data_out[87 ]),
    .DO88  (RAM3_data_out[88 ] ),    .DO89  (RAM3_data_out[89 ] ),    .DO90  (RAM3_data_out[90 ] ),    .DO91  (RAM3_data_out[91 ] ),
    .DO92  (RAM3_data_out[92 ] ),    .DO93  (RAM3_data_out[93 ] ),    .DO94  (RAM3_data_out[94 ] ),    .DO95  (RAM3_data_out[95 ] ),
    .DO96  (RAM3_data_out[96 ] ),    .DO97  (RAM3_data_out[97 ] ),    .DO98  (RAM3_data_out[98 ] ),    .DO99  (RAM3_data_out[99 ] ),
    .DO100 (RAM3_data_out[100] ),    .DO101 (RAM3_data_out[101] ),    .DO102 (RAM3_data_out[102] ),    .DO103 (RAM3_data_out[103] ),
    .DO104 (RAM3_data_out[104] ),    .DO105 (RAM3_data_out[105] ),    .DO106 (RAM3_data_out[106] ),    .DO107 (RAM3_data_out[107] ),
    .DO108 (RAM3_data_out[108] ),    .DO109 (RAM3_data_out[109] ),    .DO110 (RAM3_data_out[110] ),    .DO111 (RAM3_data_out[111] ),
    .DO112 (RAM3_data_out[112] ),    .DO113 (RAM3_data_out[113] ),    .DO114 (RAM3_data_out[114] ),    .DO115 (RAM3_data_out[115] ),
    .DO116 (RAM3_data_out[116] ),    .DO117 (RAM3_data_out[117] ),    .DO118 (RAM3_data_out[118] ),    .DO119 (RAM3_data_out[119] ),
    .DO120 (RAM3_data_out[120] ),    .DO121 (RAM3_data_out[121] ),    .DO122 (RAM3_data_out[122] ),    .DO123 (RAM3_data_out[123] ),
    .DO124 (RAM3_data_out[124] ),    .DO125 (RAM3_data_out[125] ),    .DO126 (RAM3_data_out[126] ),    .DO127 (RAM3_data_out[127] ),

    .DI0   (RAM3_data_in[0  ] ),    .DI1   (RAM3_data_in[1  ] ),    .DI2   (RAM3_data_in[2  ] ),    .DI3   (RAM3_data_in[3  ] ),
    .DI4   (RAM3_data_in[4  ] ),    .DI5   (RAM3_data_in[5  ] ),    .DI6   (RAM3_data_in[6  ] ),    .DI7   (RAM3_data_in[7  ] ),
    .DI8   (RAM3_data_in[8  ] ),    .DI9   (RAM3_data_in[9  ] ),    .DI10  (RAM3_data_in[10 ] ),    .DI11  (RAM3_data_in[11 ] ),
    .DI12  (RAM3_data_in[12 ] ),    .DI13  (RAM3_data_in[13 ] ),    .DI14  (RAM3_data_in[14 ] ),    .DI15  (RAM3_data_in[15 ] ),
    .DI16  (RAM3_data_in[16 ] ),    .DI17  (RAM3_data_in[17 ] ),    .DI18  (RAM3_data_in[18 ] ),    .DI19  (RAM3_data_in[19 ] ),
    .DI20  (RAM3_data_in[20 ] ),    .DI21  (RAM3_data_in[21 ] ),    .DI22  (RAM3_data_in[22 ] ),    .DI23  (RAM3_data_in[23 ] ),
    .DI24  (RAM3_data_in[24 ] ),    .DI25  (RAM3_data_in[25 ] ),    .DI26  (RAM3_data_in[26 ] ),    .DI27  (RAM3_data_in[27 ] ),
    .DI28  (RAM3_data_in[28 ] ),    .DI29  (RAM3_data_in[29 ] ),    .DI30  (RAM3_data_in[30 ] ),    .DI31  (RAM3_data_in[31 ] ),
    .DI32  (RAM3_data_in[32 ] ),    .DI33  (RAM3_data_in[33 ] ),    .DI34  (RAM3_data_in[34 ] ),    .DI35  (RAM3_data_in[35 ] ),
    .DI36  (RAM3_data_in[36 ] ),    .DI37  (RAM3_data_in[37 ] ),    .DI38  (RAM3_data_in[38 ] ),    .DI39  (RAM3_data_in[39 ] ),
    .DI40  (RAM3_data_in[40 ] ),    .DI41  (RAM3_data_in[41 ] ),    .DI42  (RAM3_data_in[42 ] ),    .DI43  (RAM3_data_in[43 ] ),
    .DI44  (RAM3_data_in[44 ] ),    .DI45  (RAM3_data_in[45 ] ),    .DI46  (RAM3_data_in[46 ] ),    .DI47  (RAM3_data_in[47 ] ),
    .DI48  (RAM3_data_in[48 ] ),    .DI49  (RAM3_data_in[49 ] ),    .DI50  (RAM3_data_in[50 ] ),    .DI51  (RAM3_data_in[51 ] ),
    .DI52  (RAM3_data_in[52 ] ),    .DI53  (RAM3_data_in[53 ] ),    .DI54  (RAM3_data_in[54 ] ),    .DI55  (RAM3_data_in[55 ] ),
    .DI56  (RAM3_data_in[56 ] ),    .DI57  (RAM3_data_in[57 ] ),    .DI58  (RAM3_data_in[58 ] ),    .DI59  (RAM3_data_in[59 ] ),
    .DI60  (RAM3_data_in[60 ] ),    .DI61  (RAM3_data_in[61 ] ),    .DI62  (RAM3_data_in[62 ] ),    .DI63  (RAM3_data_in[63 ] ),
    .DI64  (RAM3_data_in[64 ] ),    .DI65  (RAM3_data_in[65 ] ),    .DI66  (RAM3_data_in[66 ] ),    .DI67  (RAM3_data_in[67 ] ),
    .DI68  (RAM3_data_in[68 ] ),    .DI69  (RAM3_data_in[69 ] ),    .DI70  (RAM3_data_in[70 ] ),    .DI71  (RAM3_data_in[71 ] ),
    .DI72  (RAM3_data_in[72 ] ),    .DI73  (RAM3_data_in[73 ] ),    .DI74  (RAM3_data_in[74 ] ),    .DI75  (RAM3_data_in[75 ] ),
    .DI76  (RAM3_data_in[76 ] ),    .DI77  (RAM3_data_in[77 ] ),    .DI78  (RAM3_data_in[78 ] ),    .DI79  (RAM3_data_in[79 ] ),
    .DI80  (RAM3_data_in[80 ] ),    .DI81  (RAM3_data_in[81 ] ),    .DI82  (RAM3_data_in[82 ] ),    .DI83  (RAM3_data_in[83 ] ),
    .DI84  (RAM3_data_in[84 ] ),    .DI85  (RAM3_data_in[85 ] ),    .DI86  (RAM3_data_in[86 ] ),    .DI87  (RAM3_data_in[87 ]),
    .DI88  (RAM3_data_in[88 ] ),    .DI89  (RAM3_data_in[89 ] ),    .DI90  (RAM3_data_in[90 ] ),    .DI91  (RAM3_data_in[91 ] ),
    .DI92  (RAM3_data_in[92 ] ),    .DI93  (RAM3_data_in[93 ] ),    .DI94  (RAM3_data_in[94 ] ),    .DI95  (RAM3_data_in[95 ] ),
    .DI96  (RAM3_data_in[96 ] ),    .DI97  (RAM3_data_in[97 ] ),    .DI98  (RAM3_data_in[98 ] ),    .DI99  (RAM3_data_in[99 ] ),
    .DI100 (RAM3_data_in[100] ),    .DI101 (RAM3_data_in[101] ),    .DI102 (RAM3_data_in[102] ),    .DI103 (RAM3_data_in[103] ),
    .DI104 (RAM3_data_in[104] ),    .DI105 (RAM3_data_in[105] ),    .DI106 (RAM3_data_in[106] ),    .DI107 (RAM3_data_in[107] ),
    .DI108 (RAM3_data_in[108] ),    .DI109 (RAM3_data_in[109] ),    .DI110 (RAM3_data_in[110] ),    .DI111 (RAM3_data_in[111] ),
    .DI112 (RAM3_data_in[112] ),    .DI113 (RAM3_data_in[113] ),    .DI114 (RAM3_data_in[114] ),    .DI115 (RAM3_data_in[115] ),
    .DI116 (RAM3_data_in[116] ),    .DI117 (RAM3_data_in[117] ),    .DI118 (RAM3_data_in[118] ),    .DI119 (RAM3_data_in[119] ),
    .DI120 (RAM3_data_in[120] ),    .DI121 (RAM3_data_in[121] ),    .DI122 (RAM3_data_in[122] ),    .DI123 (RAM3_data_in[123] ),
    .DI124 (RAM3_data_in[124] ),    .DI125 (RAM3_data_in[125] ),    .DI126 (RAM3_data_in[126] ),    .DI127 (RAM3_data_in[127] ),

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),.A4   (RAM_addr[4]   ),
    .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    .WEB0 (~w_WEB3[0] ),.WEB1 (~w_WEB3[1] ),.WEB2 (~w_WEB3[2] ),.WEB3 (~w_WEB3[3] ),
    .WEB4 (~w_WEB3[4] ),.WEB5 (~w_WEB3[5] ),.WEB6 (~w_WEB3[6] ),.WEB7 (~w_WEB3[7] ),
    .WEB8 (~w_WEB3[8]  ),.WEB9  (~w_WEB3[9]  ),.WEB10 (~w_WEB3[10]  ),.WEB11 (~w_WEB3[11]  ),
    .WEB12(~w_WEB3[12]  ),.WEB13 (~w_WEB3[13]  ),.WEB14 (~w_WEB3[14]  ),.WEB15 (~w_WEB3[15]  ),

    .CK    (clka   ),
    .CSB   (1'b0   )
);

SYKB110_32X8X16CM2 u_Ddata4_SYKB110_32X8X16CM2(
    .DO0   (RAM4_data_out[0  ] ),    .DO1   (RAM4_data_out[1  ] ),    .DO2   (RAM4_data_out[2  ] ),    .DO3   (RAM4_data_out[3  ] ),
    .DO4   (RAM4_data_out[4  ] ),    .DO5   (RAM4_data_out[5  ] ),    .DO6   (RAM4_data_out[6  ] ),    .DO7   (RAM4_data_out[7  ] ),
    .DO8   (RAM4_data_out[8  ] ),    .DO9   (RAM4_data_out[9  ] ),    .DO10  (RAM4_data_out[10 ] ),    .DO11  (RAM4_data_out[11 ] ),
    .DO12  (RAM4_data_out[12 ] ),    .DO13  (RAM4_data_out[13 ] ),    .DO14  (RAM4_data_out[14 ] ),    .DO15  (RAM4_data_out[15 ] ),
    .DO16  (RAM4_data_out[16 ] ),    .DO17  (RAM4_data_out[17 ] ),    .DO18  (RAM4_data_out[18 ] ),    .DO19  (RAM4_data_out[19 ] ),
    .DO20  (RAM4_data_out[20 ] ),    .DO21  (RAM4_data_out[21 ] ),    .DO22  (RAM4_data_out[22 ] ),    .DO23  (RAM4_data_out[23 ] ),
    .DO24  (RAM4_data_out[24 ] ),    .DO25  (RAM4_data_out[25 ] ),    .DO26  (RAM4_data_out[26 ] ),    .DO27  (RAM4_data_out[27 ] ),
    .DO28  (RAM4_data_out[28 ] ),    .DO29  (RAM4_data_out[29 ] ),    .DO30  (RAM4_data_out[30 ] ),    .DO31  (RAM4_data_out[31 ] ),
    .DO32  (RAM4_data_out[32 ] ),    .DO33  (RAM4_data_out[33 ] ),    .DO34  (RAM4_data_out[34 ] ),    .DO35  (RAM4_data_out[35 ] ),
    .DO36  (RAM4_data_out[36 ] ),    .DO37  (RAM4_data_out[37 ] ),    .DO38  (RAM4_data_out[38 ] ),    .DO39  (RAM4_data_out[39 ] ),
    .DO40  (RAM4_data_out[40 ] ),    .DO41  (RAM4_data_out[41 ] ),    .DO42  (RAM4_data_out[42 ] ),    .DO43  (RAM4_data_out[43 ] ),
    .DO44  (RAM4_data_out[44 ] ),    .DO45  (RAM4_data_out[45 ] ),    .DO46  (RAM4_data_out[46 ] ),    .DO47  (RAM4_data_out[47 ] ),
    .DO48  (RAM4_data_out[48 ] ),    .DO49  (RAM4_data_out[49 ] ),    .DO50  (RAM4_data_out[50 ] ),    .DO51  (RAM4_data_out[51 ] ),
    .DO52  (RAM4_data_out[52 ] ),    .DO53  (RAM4_data_out[53 ] ),    .DO54  (RAM4_data_out[54 ] ),    .DO55  (RAM4_data_out[55 ] ),
    .DO56  (RAM4_data_out[56 ] ),    .DO57  (RAM4_data_out[57 ] ),    .DO58  (RAM4_data_out[58 ] ),    .DO59  (RAM4_data_out[59 ] ),
    .DO60  (RAM4_data_out[60 ] ),    .DO61  (RAM4_data_out[61 ] ),    .DO62  (RAM4_data_out[62 ] ),    .DO63  (RAM4_data_out[63 ] ),
    .DO64  (RAM4_data_out[64 ] ),    .DO65  (RAM4_data_out[65 ] ),    .DO66  (RAM4_data_out[66 ] ),    .DO67  (RAM4_data_out[67 ] ),
    .DO68  (RAM4_data_out[68 ] ),    .DO69  (RAM4_data_out[69 ] ),    .DO70  (RAM4_data_out[70 ] ),    .DO71  (RAM4_data_out[71 ] ),
    .DO72  (RAM4_data_out[72 ] ),    .DO73  (RAM4_data_out[73 ] ),    .DO74  (RAM4_data_out[74 ] ),    .DO75  (RAM4_data_out[75 ] ),
    .DO76  (RAM4_data_out[76 ] ),    .DO77  (RAM4_data_out[77 ] ),    .DO78  (RAM4_data_out[78 ] ),    .DO79  (RAM4_data_out[79 ] ),
    .DO80  (RAM4_data_out[80 ] ),    .DO81  (RAM4_data_out[81 ] ),    .DO82  (RAM4_data_out[82 ] ),    .DO83  (RAM4_data_out[83 ] ),
    .DO84  (RAM4_data_out[84 ] ),    .DO85  (RAM4_data_out[85 ] ),    .DO86  (RAM4_data_out[86 ] ),    .DO87  (RAM4_data_out[87 ]),
    .DO88  (RAM4_data_out[88 ] ),    .DO89  (RAM4_data_out[89 ] ),    .DO90  (RAM4_data_out[90 ] ),    .DO91  (RAM4_data_out[91 ] ),
    .DO92  (RAM4_data_out[92 ] ),    .DO93  (RAM4_data_out[93 ] ),    .DO94  (RAM4_data_out[94 ] ),    .DO95  (RAM4_data_out[95 ] ),
    .DO96  (RAM4_data_out[96 ] ),    .DO97  (RAM4_data_out[97 ] ),    .DO98  (RAM4_data_out[98 ] ),    .DO99  (RAM4_data_out[99 ] ),
    .DO100 (RAM4_data_out[100] ),    .DO101 (RAM4_data_out[101] ),    .DO102 (RAM4_data_out[102] ),    .DO103 (RAM4_data_out[103] ),
    .DO104 (RAM4_data_out[104] ),    .DO105 (RAM4_data_out[105] ),    .DO106 (RAM4_data_out[106] ),    .DO107 (RAM4_data_out[107] ),
    .DO108 (RAM4_data_out[108] ),    .DO109 (RAM4_data_out[109] ),    .DO110 (RAM4_data_out[110] ),    .DO111 (RAM4_data_out[111] ),
    .DO112 (RAM4_data_out[112] ),    .DO113 (RAM4_data_out[113] ),    .DO114 (RAM4_data_out[114] ),    .DO115 (RAM4_data_out[115] ),
    .DO116 (RAM4_data_out[116] ),    .DO117 (RAM4_data_out[117] ),    .DO118 (RAM4_data_out[118] ),    .DO119 (RAM4_data_out[119] ),
    .DO120 (RAM4_data_out[120] ),    .DO121 (RAM4_data_out[121] ),    .DO122 (RAM4_data_out[122] ),    .DO123 (RAM4_data_out[123] ),
    .DO124 (RAM4_data_out[124] ),    .DO125 (RAM4_data_out[125] ),    .DO126 (RAM4_data_out[126] ),    .DO127 (RAM4_data_out[127] ),

    .DI0   (RAM4_data_in[0  ] ),    .DI1   (RAM4_data_in[1  ] ),    .DI2   (RAM4_data_in[2  ] ),    .DI3   (RAM4_data_in[3  ] ),
    .DI4   (RAM4_data_in[4  ] ),    .DI5   (RAM4_data_in[5  ] ),    .DI6   (RAM4_data_in[6  ] ),    .DI7   (RAM4_data_in[7  ] ),
    .DI8   (RAM4_data_in[8  ] ),    .DI9   (RAM4_data_in[9  ] ),    .DI10  (RAM4_data_in[10 ] ),    .DI11  (RAM4_data_in[11 ] ),
    .DI12  (RAM4_data_in[12 ] ),    .DI13  (RAM4_data_in[13 ] ),    .DI14  (RAM4_data_in[14 ] ),    .DI15  (RAM4_data_in[15 ] ),
    .DI16  (RAM4_data_in[16 ] ),    .DI17  (RAM4_data_in[17 ] ),    .DI18  (RAM4_data_in[18 ] ),    .DI19  (RAM4_data_in[19 ] ),
    .DI20  (RAM4_data_in[20 ] ),    .DI21  (RAM4_data_in[21 ] ),    .DI22  (RAM4_data_in[22 ] ),    .DI23  (RAM4_data_in[23 ] ),
    .DI24  (RAM4_data_in[24 ] ),    .DI25  (RAM4_data_in[25 ] ),    .DI26  (RAM4_data_in[26 ] ),    .DI27  (RAM4_data_in[27 ] ),
    .DI28  (RAM4_data_in[28 ] ),    .DI29  (RAM4_data_in[29 ] ),    .DI30  (RAM4_data_in[30 ] ),    .DI31  (RAM4_data_in[31 ] ),
    .DI32  (RAM4_data_in[32 ] ),    .DI33  (RAM4_data_in[33 ] ),    .DI34  (RAM4_data_in[34 ] ),    .DI35  (RAM4_data_in[35 ] ),
    .DI36  (RAM4_data_in[36 ] ),    .DI37  (RAM4_data_in[37 ] ),    .DI38  (RAM4_data_in[38 ] ),    .DI39  (RAM4_data_in[39 ] ),
    .DI40  (RAM4_data_in[40 ] ),    .DI41  (RAM4_data_in[41 ] ),    .DI42  (RAM4_data_in[42 ] ),    .DI43  (RAM4_data_in[43 ] ),
    .DI44  (RAM4_data_in[44 ] ),    .DI45  (RAM4_data_in[45 ] ),    .DI46  (RAM4_data_in[46 ] ),    .DI47  (RAM4_data_in[47 ] ),
    .DI48  (RAM4_data_in[48 ] ),    .DI49  (RAM4_data_in[49 ] ),    .DI50  (RAM4_data_in[50 ] ),    .DI51  (RAM4_data_in[51 ] ),
    .DI52  (RAM4_data_in[52 ] ),    .DI53  (RAM4_data_in[53 ] ),    .DI54  (RAM4_data_in[54 ] ),    .DI55  (RAM4_data_in[55 ] ),
    .DI56  (RAM4_data_in[56 ] ),    .DI57  (RAM4_data_in[57 ] ),    .DI58  (RAM4_data_in[58 ] ),    .DI59  (RAM4_data_in[59 ] ),
    .DI60  (RAM4_data_in[60 ] ),    .DI61  (RAM4_data_in[61 ] ),    .DI62  (RAM4_data_in[62 ] ),    .DI63  (RAM4_data_in[63 ] ),
    .DI64  (RAM4_data_in[64 ] ),    .DI65  (RAM4_data_in[65 ] ),    .DI66  (RAM4_data_in[66 ] ),    .DI67  (RAM4_data_in[67 ] ),
    .DI68  (RAM4_data_in[68 ] ),    .DI69  (RAM4_data_in[69 ] ),    .DI70  (RAM4_data_in[70 ] ),    .DI71  (RAM4_data_in[71 ] ),
    .DI72  (RAM4_data_in[72 ] ),    .DI73  (RAM4_data_in[73 ] ),    .DI74  (RAM4_data_in[74 ] ),    .DI75  (RAM4_data_in[75 ] ),
    .DI76  (RAM4_data_in[76 ] ),    .DI77  (RAM4_data_in[77 ] ),    .DI78  (RAM4_data_in[78 ] ),    .DI79  (RAM4_data_in[79 ] ),
    .DI80  (RAM4_data_in[80 ] ),    .DI81  (RAM4_data_in[81 ] ),    .DI82  (RAM4_data_in[82 ] ),    .DI83  (RAM4_data_in[83 ] ),
    .DI84  (RAM4_data_in[84 ] ),    .DI85  (RAM4_data_in[85 ] ),    .DI86  (RAM4_data_in[86 ] ),    .DI87  (RAM4_data_in[87 ]),
    .DI88  (RAM4_data_in[88 ] ),    .DI89  (RAM4_data_in[89 ] ),    .DI90  (RAM4_data_in[90 ] ),    .DI91  (RAM4_data_in[91 ] ),
    .DI92  (RAM4_data_in[92 ] ),    .DI93  (RAM4_data_in[93 ] ),    .DI94  (RAM4_data_in[94 ] ),    .DI95  (RAM4_data_in[95 ] ),
    .DI96  (RAM4_data_in[96 ] ),    .DI97  (RAM4_data_in[97 ] ),    .DI98  (RAM4_data_in[98 ] ),    .DI99  (RAM4_data_in[99 ] ),
    .DI100 (RAM4_data_in[100] ),    .DI101 (RAM4_data_in[101] ),    .DI102 (RAM4_data_in[102] ),    .DI103 (RAM4_data_in[103] ),
    .DI104 (RAM4_data_in[104] ),    .DI105 (RAM4_data_in[105] ),    .DI106 (RAM4_data_in[106] ),    .DI107 (RAM4_data_in[107] ),
    .DI108 (RAM4_data_in[108] ),    .DI109 (RAM4_data_in[109] ),    .DI110 (RAM4_data_in[110] ),    .DI111 (RAM4_data_in[111] ),
    .DI112 (RAM4_data_in[112] ),    .DI113 (RAM4_data_in[113] ),    .DI114 (RAM4_data_in[114] ),    .DI115 (RAM4_data_in[115] ),
    .DI116 (RAM4_data_in[116] ),    .DI117 (RAM4_data_in[117] ),    .DI118 (RAM4_data_in[118] ),    .DI119 (RAM4_data_in[119] ),
    .DI120 (RAM4_data_in[120] ),    .DI121 (RAM4_data_in[121] ),    .DI122 (RAM4_data_in[122] ),    .DI123 (RAM4_data_in[123] ),
    .DI124 (RAM4_data_in[124] ),    .DI125 (RAM4_data_in[125] ),    .DI126 (RAM4_data_in[126] ),    .DI127 (RAM4_data_in[127] ),

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),.A4   (RAM_addr[4]   ),
    .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    .WEB0 (~w_WEB4[0] ),.WEB1 (~w_WEB4[1] ),.WEB2 (~w_WEB4[2] ),.WEB3 (~w_WEB4[3] ),
    .WEB4 (~w_WEB4[4] ),.WEB5 (~w_WEB4[5] ),.WEB6 (~w_WEB4[6] ),.WEB7 (~w_WEB4[7] ),
    .WEB8 (~w_WEB4[8]  ),.WEB9  (~w_WEB4[9]  ),.WEB10 (~w_WEB4[10]  ),.WEB11 (~w_WEB4[11]  ),
    .WEB12(~w_WEB4[12]  ),.WEB13 (~w_WEB4[13]  ),.WEB14 (~w_WEB4[14]  ),.WEB15 (~w_WEB4[15]  ),

    .CK    (clka   ),
    .CSB   (1'b0   )
);

SYKB110_32X8X16CM2 u_Ddata5_SYKB110_32X8X16CM2(
    .DO0   (RAM5_data_out[0  ] ),    .DO1   (RAM5_data_out[1  ] ),    .DO2   (RAM5_data_out[2  ] ),    .DO3   (RAM5_data_out[3  ] ),
    .DO4   (RAM5_data_out[4  ] ),    .DO5   (RAM5_data_out[5  ] ),    .DO6   (RAM5_data_out[6  ] ),    .DO7   (RAM5_data_out[7  ] ),
    .DO8   (RAM5_data_out[8  ] ),    .DO9   (RAM5_data_out[9  ] ),    .DO10  (RAM5_data_out[10 ] ),    .DO11  (RAM5_data_out[11 ] ),
    .DO12  (RAM5_data_out[12 ] ),    .DO13  (RAM5_data_out[13 ] ),    .DO14  (RAM5_data_out[14 ] ),    .DO15  (RAM5_data_out[15 ] ),
    .DO16  (RAM5_data_out[16 ] ),    .DO17  (RAM5_data_out[17 ] ),    .DO18  (RAM5_data_out[18 ] ),    .DO19  (RAM5_data_out[19 ] ),
    .DO20  (RAM5_data_out[20 ] ),    .DO21  (RAM5_data_out[21 ] ),    .DO22  (RAM5_data_out[22 ] ),    .DO23  (RAM5_data_out[23 ] ),
    .DO24  (RAM5_data_out[24 ] ),    .DO25  (RAM5_data_out[25 ] ),    .DO26  (RAM5_data_out[26 ] ),    .DO27  (RAM5_data_out[27 ] ),
    .DO28  (RAM5_data_out[28 ] ),    .DO29  (RAM5_data_out[29 ] ),    .DO30  (RAM5_data_out[30 ] ),    .DO31  (RAM5_data_out[31 ] ),
    .DO32  (RAM5_data_out[32 ] ),    .DO33  (RAM5_data_out[33 ] ),    .DO34  (RAM5_data_out[34 ] ),    .DO35  (RAM5_data_out[35 ] ),
    .DO36  (RAM5_data_out[36 ] ),    .DO37  (RAM5_data_out[37 ] ),    .DO38  (RAM5_data_out[38 ] ),    .DO39  (RAM5_data_out[39 ] ),
    .DO40  (RAM5_data_out[40 ] ),    .DO41  (RAM5_data_out[41 ] ),    .DO42  (RAM5_data_out[42 ] ),    .DO43  (RAM5_data_out[43 ] ),
    .DO44  (RAM5_data_out[44 ] ),    .DO45  (RAM5_data_out[45 ] ),    .DO46  (RAM5_data_out[46 ] ),    .DO47  (RAM5_data_out[47 ] ),
    .DO48  (RAM5_data_out[48 ] ),    .DO49  (RAM5_data_out[49 ] ),    .DO50  (RAM5_data_out[50 ] ),    .DO51  (RAM5_data_out[51 ] ),
    .DO52  (RAM5_data_out[52 ] ),    .DO53  (RAM5_data_out[53 ] ),    .DO54  (RAM5_data_out[54 ] ),    .DO55  (RAM5_data_out[55 ] ),
    .DO56  (RAM5_data_out[56 ] ),    .DO57  (RAM5_data_out[57 ] ),    .DO58  (RAM5_data_out[58 ] ),    .DO59  (RAM5_data_out[59 ] ),
    .DO60  (RAM5_data_out[60 ] ),    .DO61  (RAM5_data_out[61 ] ),    .DO62  (RAM5_data_out[62 ] ),    .DO63  (RAM5_data_out[63 ] ),
    .DO64  (RAM5_data_out[64 ] ),    .DO65  (RAM5_data_out[65 ] ),    .DO66  (RAM5_data_out[66 ] ),    .DO67  (RAM5_data_out[67 ] ),
    .DO68  (RAM5_data_out[68 ] ),    .DO69  (RAM5_data_out[69 ] ),    .DO70  (RAM5_data_out[70 ] ),    .DO71  (RAM5_data_out[71 ] ),
    .DO72  (RAM5_data_out[72 ] ),    .DO73  (RAM5_data_out[73 ] ),    .DO74  (RAM5_data_out[74 ] ),    .DO75  (RAM5_data_out[75 ] ),
    .DO76  (RAM5_data_out[76 ] ),    .DO77  (RAM5_data_out[77 ] ),    .DO78  (RAM5_data_out[78 ] ),    .DO79  (RAM5_data_out[79 ] ),
    .DO80  (RAM5_data_out[80 ] ),    .DO81  (RAM5_data_out[81 ] ),    .DO82  (RAM5_data_out[82 ] ),    .DO83  (RAM5_data_out[83 ] ),
    .DO84  (RAM5_data_out[84 ] ),    .DO85  (RAM5_data_out[85 ] ),    .DO86  (RAM5_data_out[86 ] ),    .DO87  (RAM5_data_out[87 ]),
    .DO88  (RAM5_data_out[88 ] ),    .DO89  (RAM5_data_out[89 ] ),    .DO90  (RAM5_data_out[90 ] ),    .DO91  (RAM5_data_out[91 ] ),
    .DO92  (RAM5_data_out[92 ] ),    .DO93  (RAM5_data_out[93 ] ),    .DO94  (RAM5_data_out[94 ] ),    .DO95  (RAM5_data_out[95 ] ),
    .DO96  (RAM5_data_out[96 ] ),    .DO97  (RAM5_data_out[97 ] ),    .DO98  (RAM5_data_out[98 ] ),    .DO99  (RAM5_data_out[99 ] ),
    .DO100 (RAM5_data_out[100] ),    .DO101 (RAM5_data_out[101] ),    .DO102 (RAM5_data_out[102] ),    .DO103 (RAM5_data_out[103] ),
    .DO104 (RAM5_data_out[104] ),    .DO105 (RAM5_data_out[105] ),    .DO106 (RAM5_data_out[106] ),    .DO107 (RAM5_data_out[107] ),
    .DO108 (RAM5_data_out[108] ),    .DO109 (RAM5_data_out[109] ),    .DO110 (RAM5_data_out[110] ),    .DO111 (RAM5_data_out[111] ),
    .DO112 (RAM5_data_out[112] ),    .DO113 (RAM5_data_out[113] ),    .DO114 (RAM5_data_out[114] ),    .DO115 (RAM5_data_out[115] ),
    .DO116 (RAM5_data_out[116] ),    .DO117 (RAM5_data_out[117] ),    .DO118 (RAM5_data_out[118] ),    .DO119 (RAM5_data_out[119] ),
    .DO120 (RAM5_data_out[120] ),    .DO121 (RAM5_data_out[121] ),    .DO122 (RAM5_data_out[122] ),    .DO123 (RAM5_data_out[123] ),
    .DO124 (RAM5_data_out[124] ),    .DO125 (RAM5_data_out[125] ),    .DO126 (RAM5_data_out[126] ),    .DO127 (RAM5_data_out[127] ),

    .DI0   (RAM5_data_in[0  ] ),    .DI1   (RAM5_data_in[1  ] ),    .DI2   (RAM5_data_in[2  ] ),    .DI3   (RAM5_data_in[3  ] ),
    .DI4   (RAM5_data_in[4  ] ),    .DI5   (RAM5_data_in[5  ] ),    .DI6   (RAM5_data_in[6  ] ),    .DI7   (RAM5_data_in[7  ] ),
    .DI8   (RAM5_data_in[8  ] ),    .DI9   (RAM5_data_in[9  ] ),    .DI10  (RAM5_data_in[10 ] ),    .DI11  (RAM5_data_in[11 ] ),
    .DI12  (RAM5_data_in[12 ] ),    .DI13  (RAM5_data_in[13 ] ),    .DI14  (RAM5_data_in[14 ] ),    .DI15  (RAM5_data_in[15 ] ),
    .DI16  (RAM5_data_in[16 ] ),    .DI17  (RAM5_data_in[17 ] ),    .DI18  (RAM5_data_in[18 ] ),    .DI19  (RAM5_data_in[19 ] ),
    .DI20  (RAM5_data_in[20 ] ),    .DI21  (RAM5_data_in[21 ] ),    .DI22  (RAM5_data_in[22 ] ),    .DI23  (RAM5_data_in[23 ] ),
    .DI24  (RAM5_data_in[24 ] ),    .DI25  (RAM5_data_in[25 ] ),    .DI26  (RAM5_data_in[26 ] ),    .DI27  (RAM5_data_in[27 ] ),
    .DI28  (RAM5_data_in[28 ] ),    .DI29  (RAM5_data_in[29 ] ),    .DI30  (RAM5_data_in[30 ] ),    .DI31  (RAM5_data_in[31 ] ),
    .DI32  (RAM5_data_in[32 ] ),    .DI33  (RAM5_data_in[33 ] ),    .DI34  (RAM5_data_in[34 ] ),    .DI35  (RAM5_data_in[35 ] ),
    .DI36  (RAM5_data_in[36 ] ),    .DI37  (RAM5_data_in[37 ] ),    .DI38  (RAM5_data_in[38 ] ),    .DI39  (RAM5_data_in[39 ] ),
    .DI40  (RAM5_data_in[40 ] ),    .DI41  (RAM5_data_in[41 ] ),    .DI42  (RAM5_data_in[42 ] ),    .DI43  (RAM5_data_in[43 ] ),
    .DI44  (RAM5_data_in[44 ] ),    .DI45  (RAM5_data_in[45 ] ),    .DI46  (RAM5_data_in[46 ] ),    .DI47  (RAM5_data_in[47 ] ),
    .DI48  (RAM5_data_in[48 ] ),    .DI49  (RAM5_data_in[49 ] ),    .DI50  (RAM5_data_in[50 ] ),    .DI51  (RAM5_data_in[51 ] ),
    .DI52  (RAM5_data_in[52 ] ),    .DI53  (RAM5_data_in[53 ] ),    .DI54  (RAM5_data_in[54 ] ),    .DI55  (RAM5_data_in[55 ] ),
    .DI56  (RAM5_data_in[56 ] ),    .DI57  (RAM5_data_in[57 ] ),    .DI58  (RAM5_data_in[58 ] ),    .DI59  (RAM5_data_in[59 ] ),
    .DI60  (RAM5_data_in[60 ] ),    .DI61  (RAM5_data_in[61 ] ),    .DI62  (RAM5_data_in[62 ] ),    .DI63  (RAM5_data_in[63 ] ),
    .DI64  (RAM5_data_in[64 ] ),    .DI65  (RAM5_data_in[65 ] ),    .DI66  (RAM5_data_in[66 ] ),    .DI67  (RAM5_data_in[67 ] ),
    .DI68  (RAM5_data_in[68 ] ),    .DI69  (RAM5_data_in[69 ] ),    .DI70  (RAM5_data_in[70 ] ),    .DI71  (RAM5_data_in[71 ] ),
    .DI72  (RAM5_data_in[72 ] ),    .DI73  (RAM5_data_in[73 ] ),    .DI74  (RAM5_data_in[74 ] ),    .DI75  (RAM5_data_in[75 ] ),
    .DI76  (RAM5_data_in[76 ] ),    .DI77  (RAM5_data_in[77 ] ),    .DI78  (RAM5_data_in[78 ] ),    .DI79  (RAM5_data_in[79 ] ),
    .DI80  (RAM5_data_in[80 ] ),    .DI81  (RAM5_data_in[81 ] ),    .DI82  (RAM5_data_in[82 ] ),    .DI83  (RAM5_data_in[83 ] ),
    .DI84  (RAM5_data_in[84 ] ),    .DI85  (RAM5_data_in[85 ] ),    .DI86  (RAM5_data_in[86 ] ),    .DI87  (RAM5_data_in[87 ]),
    .DI88  (RAM5_data_in[88 ] ),    .DI89  (RAM5_data_in[89 ] ),    .DI90  (RAM5_data_in[90 ] ),    .DI91  (RAM5_data_in[91 ] ),
    .DI92  (RAM5_data_in[92 ] ),    .DI93  (RAM5_data_in[93 ] ),    .DI94  (RAM5_data_in[94 ] ),    .DI95  (RAM5_data_in[95 ] ),
    .DI96  (RAM5_data_in[96 ] ),    .DI97  (RAM5_data_in[97 ] ),    .DI98  (RAM5_data_in[98 ] ),    .DI99  (RAM5_data_in[99 ] ),
    .DI100 (RAM5_data_in[100] ),    .DI101 (RAM5_data_in[101] ),    .DI102 (RAM5_data_in[102] ),    .DI103 (RAM5_data_in[103] ),
    .DI104 (RAM5_data_in[104] ),    .DI105 (RAM5_data_in[105] ),    .DI106 (RAM5_data_in[106] ),    .DI107 (RAM5_data_in[107] ),
    .DI108 (RAM5_data_in[108] ),    .DI109 (RAM5_data_in[109] ),    .DI110 (RAM5_data_in[110] ),    .DI111 (RAM5_data_in[111] ),
    .DI112 (RAM5_data_in[112] ),    .DI113 (RAM5_data_in[113] ),    .DI114 (RAM5_data_in[114] ),    .DI115 (RAM5_data_in[115] ),
    .DI116 (RAM5_data_in[116] ),    .DI117 (RAM5_data_in[117] ),    .DI118 (RAM5_data_in[118] ),    .DI119 (RAM5_data_in[119] ),
    .DI120 (RAM5_data_in[120] ),    .DI121 (RAM5_data_in[121] ),    .DI122 (RAM5_data_in[122] ),    .DI123 (RAM5_data_in[123] ),
    .DI124 (RAM5_data_in[124] ),    .DI125 (RAM5_data_in[125] ),    .DI126 (RAM5_data_in[126] ),    .DI127 (RAM5_data_in[127] ),

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),.A4   (RAM_addr[4]   ),
    .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    .WEB0 (~w_WEB5[0] ),.WEB1 (~w_WEB5[1] ),.WEB2 (~w_WEB5[2] ),.WEB3 (~w_WEB5[3] ),
    .WEB4 (~w_WEB5[4] ),.WEB5 (~w_WEB5[5] ),.WEB6 (~w_WEB5[6] ),.WEB7 (~w_WEB5[7] ),
    .WEB8 (~w_WEB5[8]  ),.WEB9  (~w_WEB5[9]  ),.WEB10 (~w_WEB5[10]  ),.WEB11 (~w_WEB5[11]  ),
    .WEB12(~w_WEB5[12]  ),.WEB13 (~w_WEB5[13]  ),.WEB14 (~w_WEB5[14]  ),.WEB15 (~w_WEB5[15]  ),

    .CK    (clka   ),
    .CSB   (1'b0   )
);

SYKB110_32X8X16CM2 u_Ddata6_SYKB110_32X8X16CM2(
    .DO0   (RAM6_data_out[0  ] ),    .DO1   (RAM6_data_out[1  ] ),    .DO2   (RAM6_data_out[2  ] ),    .DO3   (RAM6_data_out[3  ] ),
    .DO4   (RAM6_data_out[4  ] ),    .DO5   (RAM6_data_out[5  ] ),    .DO6   (RAM6_data_out[6  ] ),    .DO7   (RAM6_data_out[7  ] ),
    .DO8   (RAM6_data_out[8  ] ),    .DO9   (RAM6_data_out[9  ] ),    .DO10  (RAM6_data_out[10 ] ),    .DO11  (RAM6_data_out[11 ] ),
    .DO12  (RAM6_data_out[12 ] ),    .DO13  (RAM6_data_out[13 ] ),    .DO14  (RAM6_data_out[14 ] ),    .DO15  (RAM6_data_out[15 ] ),
    .DO16  (RAM6_data_out[16 ] ),    .DO17  (RAM6_data_out[17 ] ),    .DO18  (RAM6_data_out[18 ] ),    .DO19  (RAM6_data_out[19 ] ),
    .DO20  (RAM6_data_out[20 ] ),    .DO21  (RAM6_data_out[21 ] ),    .DO22  (RAM6_data_out[22 ] ),    .DO23  (RAM6_data_out[23 ] ),
    .DO24  (RAM6_data_out[24 ] ),    .DO25  (RAM6_data_out[25 ] ),    .DO26  (RAM6_data_out[26 ] ),    .DO27  (RAM6_data_out[27 ] ),
    .DO28  (RAM6_data_out[28 ] ),    .DO29  (RAM6_data_out[29 ] ),    .DO30  (RAM6_data_out[30 ] ),    .DO31  (RAM6_data_out[31 ] ),
    .DO32  (RAM6_data_out[32 ] ),    .DO33  (RAM6_data_out[33 ] ),    .DO34  (RAM6_data_out[34 ] ),    .DO35  (RAM6_data_out[35 ] ),
    .DO36  (RAM6_data_out[36 ] ),    .DO37  (RAM6_data_out[37 ] ),    .DO38  (RAM6_data_out[38 ] ),    .DO39  (RAM6_data_out[39 ] ),
    .DO40  (RAM6_data_out[40 ] ),    .DO41  (RAM6_data_out[41 ] ),    .DO42  (RAM6_data_out[42 ] ),    .DO43  (RAM6_data_out[43 ] ),
    .DO44  (RAM6_data_out[44 ] ),    .DO45  (RAM6_data_out[45 ] ),    .DO46  (RAM6_data_out[46 ] ),    .DO47  (RAM6_data_out[47 ] ),
    .DO48  (RAM6_data_out[48 ] ),    .DO49  (RAM6_data_out[49 ] ),    .DO50  (RAM6_data_out[50 ] ),    .DO51  (RAM6_data_out[51 ] ),
    .DO52  (RAM6_data_out[52 ] ),    .DO53  (RAM6_data_out[53 ] ),    .DO54  (RAM6_data_out[54 ] ),    .DO55  (RAM6_data_out[55 ] ),
    .DO56  (RAM6_data_out[56 ] ),    .DO57  (RAM6_data_out[57 ] ),    .DO58  (RAM6_data_out[58 ] ),    .DO59  (RAM6_data_out[59 ] ),
    .DO60  (RAM6_data_out[60 ] ),    .DO61  (RAM6_data_out[61 ] ),    .DO62  (RAM6_data_out[62 ] ),    .DO63  (RAM6_data_out[63 ] ),
    .DO64  (RAM6_data_out[64 ] ),    .DO65  (RAM6_data_out[65 ] ),    .DO66  (RAM6_data_out[66 ] ),    .DO67  (RAM6_data_out[67 ] ),
    .DO68  (RAM6_data_out[68 ] ),    .DO69  (RAM6_data_out[69 ] ),    .DO70  (RAM6_data_out[70 ] ),    .DO71  (RAM6_data_out[71 ] ),
    .DO72  (RAM6_data_out[72 ] ),    .DO73  (RAM6_data_out[73 ] ),    .DO74  (RAM6_data_out[74 ] ),    .DO75  (RAM6_data_out[75 ] ),
    .DO76  (RAM6_data_out[76 ] ),    .DO77  (RAM6_data_out[77 ] ),    .DO78  (RAM6_data_out[78 ] ),    .DO79  (RAM6_data_out[79 ] ),
    .DO80  (RAM6_data_out[80 ] ),    .DO81  (RAM6_data_out[81 ] ),    .DO82  (RAM6_data_out[82 ] ),    .DO83  (RAM6_data_out[83 ] ),
    .DO84  (RAM6_data_out[84 ] ),    .DO85  (RAM6_data_out[85 ] ),    .DO86  (RAM6_data_out[86 ] ),    .DO87  (RAM6_data_out[87 ]),
    .DO88  (RAM6_data_out[88 ] ),    .DO89  (RAM6_data_out[89 ] ),    .DO90  (RAM6_data_out[90 ] ),    .DO91  (RAM6_data_out[91 ] ),
    .DO92  (RAM6_data_out[92 ] ),    .DO93  (RAM6_data_out[93 ] ),    .DO94  (RAM6_data_out[94 ] ),    .DO95  (RAM6_data_out[95 ] ),
    .DO96  (RAM6_data_out[96 ] ),    .DO97  (RAM6_data_out[97 ] ),    .DO98  (RAM6_data_out[98 ] ),    .DO99  (RAM6_data_out[99 ] ),
    .DO100 (RAM6_data_out[100] ),    .DO101 (RAM6_data_out[101] ),    .DO102 (RAM6_data_out[102] ),    .DO103 (RAM6_data_out[103] ),
    .DO104 (RAM6_data_out[104] ),    .DO105 (RAM6_data_out[105] ),    .DO106 (RAM6_data_out[106] ),    .DO107 (RAM6_data_out[107] ),
    .DO108 (RAM6_data_out[108] ),    .DO109 (RAM6_data_out[109] ),    .DO110 (RAM6_data_out[110] ),    .DO111 (RAM6_data_out[111] ),
    .DO112 (RAM6_data_out[112] ),    .DO113 (RAM6_data_out[113] ),    .DO114 (RAM6_data_out[114] ),    .DO115 (RAM6_data_out[115] ),
    .DO116 (RAM6_data_out[116] ),    .DO117 (RAM6_data_out[117] ),    .DO118 (RAM6_data_out[118] ),    .DO119 (RAM6_data_out[119] ),
    .DO120 (RAM6_data_out[120] ),    .DO121 (RAM6_data_out[121] ),    .DO122 (RAM6_data_out[122] ),    .DO123 (RAM6_data_out[123] ),
    .DO124 (RAM6_data_out[124] ),    .DO125 (RAM6_data_out[125] ),    .DO126 (RAM6_data_out[126] ),    .DO127 (RAM6_data_out[127] ),

    .DI0   (RAM6_data_in[0  ] ),    .DI1   (RAM6_data_in[1  ] ),    .DI2   (RAM6_data_in[2  ] ),    .DI3   (RAM6_data_in[3  ] ),
    .DI4   (RAM6_data_in[4  ] ),    .DI5   (RAM6_data_in[5  ] ),    .DI6   (RAM6_data_in[6  ] ),    .DI7   (RAM6_data_in[7  ] ),
    .DI8   (RAM6_data_in[8  ] ),    .DI9   (RAM6_data_in[9  ] ),    .DI10  (RAM6_data_in[10 ] ),    .DI11  (RAM6_data_in[11 ] ),
    .DI12  (RAM6_data_in[12 ] ),    .DI13  (RAM6_data_in[13 ] ),    .DI14  (RAM6_data_in[14 ] ),    .DI15  (RAM6_data_in[15 ] ),
    .DI16  (RAM6_data_in[16 ] ),    .DI17  (RAM6_data_in[17 ] ),    .DI18  (RAM6_data_in[18 ] ),    .DI19  (RAM6_data_in[19 ] ),
    .DI20  (RAM6_data_in[20 ] ),    .DI21  (RAM6_data_in[21 ] ),    .DI22  (RAM6_data_in[22 ] ),    .DI23  (RAM6_data_in[23 ] ),
    .DI24  (RAM6_data_in[24 ] ),    .DI25  (RAM6_data_in[25 ] ),    .DI26  (RAM6_data_in[26 ] ),    .DI27  (RAM6_data_in[27 ] ),
    .DI28  (RAM6_data_in[28 ] ),    .DI29  (RAM6_data_in[29 ] ),    .DI30  (RAM6_data_in[30 ] ),    .DI31  (RAM6_data_in[31 ] ),
    .DI32  (RAM6_data_in[32 ] ),    .DI33  (RAM6_data_in[33 ] ),    .DI34  (RAM6_data_in[34 ] ),    .DI35  (RAM6_data_in[35 ] ),
    .DI36  (RAM6_data_in[36 ] ),    .DI37  (RAM6_data_in[37 ] ),    .DI38  (RAM6_data_in[38 ] ),    .DI39  (RAM6_data_in[39 ] ),
    .DI40  (RAM6_data_in[40 ] ),    .DI41  (RAM6_data_in[41 ] ),    .DI42  (RAM6_data_in[42 ] ),    .DI43  (RAM6_data_in[43 ] ),
    .DI44  (RAM6_data_in[44 ] ),    .DI45  (RAM6_data_in[45 ] ),    .DI46  (RAM6_data_in[46 ] ),    .DI47  (RAM6_data_in[47 ] ),
    .DI48  (RAM6_data_in[48 ] ),    .DI49  (RAM6_data_in[49 ] ),    .DI50  (RAM6_data_in[50 ] ),    .DI51  (RAM6_data_in[51 ] ),
    .DI52  (RAM6_data_in[52 ] ),    .DI53  (RAM6_data_in[53 ] ),    .DI54  (RAM6_data_in[54 ] ),    .DI55  (RAM6_data_in[55 ] ),
    .DI56  (RAM6_data_in[56 ] ),    .DI57  (RAM6_data_in[57 ] ),    .DI58  (RAM6_data_in[58 ] ),    .DI59  (RAM6_data_in[59 ] ),
    .DI60  (RAM6_data_in[60 ] ),    .DI61  (RAM6_data_in[61 ] ),    .DI62  (RAM6_data_in[62 ] ),    .DI63  (RAM6_data_in[63 ] ),
    .DI64  (RAM6_data_in[64 ] ),    .DI65  (RAM6_data_in[65 ] ),    .DI66  (RAM6_data_in[66 ] ),    .DI67  (RAM6_data_in[67 ] ),
    .DI68  (RAM6_data_in[68 ] ),    .DI69  (RAM6_data_in[69 ] ),    .DI70  (RAM6_data_in[70 ] ),    .DI71  (RAM6_data_in[71 ] ),
    .DI72  (RAM6_data_in[72 ] ),    .DI73  (RAM6_data_in[73 ] ),    .DI74  (RAM6_data_in[74 ] ),    .DI75  (RAM6_data_in[75 ] ),
    .DI76  (RAM6_data_in[76 ] ),    .DI77  (RAM6_data_in[77 ] ),    .DI78  (RAM6_data_in[78 ] ),    .DI79  (RAM6_data_in[79 ] ),
    .DI80  (RAM6_data_in[80 ] ),    .DI81  (RAM6_data_in[81 ] ),    .DI82  (RAM6_data_in[82 ] ),    .DI83  (RAM6_data_in[83 ] ),
    .DI84  (RAM6_data_in[84 ] ),    .DI85  (RAM6_data_in[85 ] ),    .DI86  (RAM6_data_in[86 ] ),    .DI87  (RAM6_data_in[87 ]),
    .DI88  (RAM6_data_in[88 ] ),    .DI89  (RAM6_data_in[89 ] ),    .DI90  (RAM6_data_in[90 ] ),    .DI91  (RAM6_data_in[91 ] ),
    .DI92  (RAM6_data_in[92 ] ),    .DI93  (RAM6_data_in[93 ] ),    .DI94  (RAM6_data_in[94 ] ),    .DI95  (RAM6_data_in[95 ] ),
    .DI96  (RAM6_data_in[96 ] ),    .DI97  (RAM6_data_in[97 ] ),    .DI98  (RAM6_data_in[98 ] ),    .DI99  (RAM6_data_in[99 ] ),
    .DI100 (RAM6_data_in[100] ),    .DI101 (RAM6_data_in[101] ),    .DI102 (RAM6_data_in[102] ),    .DI103 (RAM6_data_in[103] ),
    .DI104 (RAM6_data_in[104] ),    .DI105 (RAM6_data_in[105] ),    .DI106 (RAM6_data_in[106] ),    .DI107 (RAM6_data_in[107] ),
    .DI108 (RAM6_data_in[108] ),    .DI109 (RAM6_data_in[109] ),    .DI110 (RAM6_data_in[110] ),    .DI111 (RAM6_data_in[111] ),
    .DI112 (RAM6_data_in[112] ),    .DI113 (RAM6_data_in[113] ),    .DI114 (RAM6_data_in[114] ),    .DI115 (RAM6_data_in[115] ),
    .DI116 (RAM6_data_in[116] ),    .DI117 (RAM6_data_in[117] ),    .DI118 (RAM6_data_in[118] ),    .DI119 (RAM6_data_in[119] ),
    .DI120 (RAM6_data_in[120] ),    .DI121 (RAM6_data_in[121] ),    .DI122 (RAM6_data_in[122] ),    .DI123 (RAM6_data_in[123] ),
    .DI124 (RAM6_data_in[124] ),    .DI125 (RAM6_data_in[125] ),    .DI126 (RAM6_data_in[126] ),    .DI127 (RAM6_data_in[127] ),

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),.A4   (RAM_addr[4]   ),
    .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    .WEB0 (~w_WEB6[0] ),.WEB1 (~w_WEB6[1] ),.WEB2 (~w_WEB6[2] ),.WEB3 (~w_WEB6[3] ),
    .WEB4 (~w_WEB6[4] ),.WEB5 (~w_WEB6[5] ),.WEB6 (~w_WEB6[6] ),.WEB7 (~w_WEB6[7] ),
    .WEB8 (~w_WEB6[8]  ),.WEB9  (~w_WEB6[9]  ),.WEB10 (~w_WEB6[10]  ),.WEB11 (~w_WEB6[11]  ),
    .WEB12(~w_WEB6[12]  ),.WEB13 (~w_WEB6[13]  ),.WEB14 (~w_WEB6[14]  ),.WEB15 (~w_WEB6[15]  ),

    .CK    (clka   ),
    .CSB   (1'b0   )
);

SYKB110_32X8X16CM2 u_Ddata7_SYKB110_32X8X16CM2(
    .DO0   (RAM7_data_out[0  ] ),    .DO1   (RAM7_data_out[1  ] ),    .DO2   (RAM7_data_out[2  ] ),    .DO3   (RAM7_data_out[3  ] ),
    .DO4   (RAM7_data_out[4  ] ),    .DO5   (RAM7_data_out[5  ] ),    .DO6   (RAM7_data_out[6  ] ),    .DO7   (RAM7_data_out[7  ] ),
    .DO8   (RAM7_data_out[8  ] ),    .DO9   (RAM7_data_out[9  ] ),    .DO10  (RAM7_data_out[10 ] ),    .DO11  (RAM7_data_out[11 ] ),
    .DO12  (RAM7_data_out[12 ] ),    .DO13  (RAM7_data_out[13 ] ),    .DO14  (RAM7_data_out[14 ] ),    .DO15  (RAM7_data_out[15 ] ),
    .DO16  (RAM7_data_out[16 ] ),    .DO17  (RAM7_data_out[17 ] ),    .DO18  (RAM7_data_out[18 ] ),    .DO19  (RAM7_data_out[19 ] ),
    .DO20  (RAM7_data_out[20 ] ),    .DO21  (RAM7_data_out[21 ] ),    .DO22  (RAM7_data_out[22 ] ),    .DO23  (RAM7_data_out[23 ] ),
    .DO24  (RAM7_data_out[24 ] ),    .DO25  (RAM7_data_out[25 ] ),    .DO26  (RAM7_data_out[26 ] ),    .DO27  (RAM7_data_out[27 ] ),
    .DO28  (RAM7_data_out[28 ] ),    .DO29  (RAM7_data_out[29 ] ),    .DO30  (RAM7_data_out[30 ] ),    .DO31  (RAM7_data_out[31 ] ),
    .DO32  (RAM7_data_out[32 ] ),    .DO33  (RAM7_data_out[33 ] ),    .DO34  (RAM7_data_out[34 ] ),    .DO35  (RAM7_data_out[35 ] ),
    .DO36  (RAM7_data_out[36 ] ),    .DO37  (RAM7_data_out[37 ] ),    .DO38  (RAM7_data_out[38 ] ),    .DO39  (RAM7_data_out[39 ] ),
    .DO40  (RAM7_data_out[40 ] ),    .DO41  (RAM7_data_out[41 ] ),    .DO42  (RAM7_data_out[42 ] ),    .DO43  (RAM7_data_out[43 ] ),
    .DO44  (RAM7_data_out[44 ] ),    .DO45  (RAM7_data_out[45 ] ),    .DO46  (RAM7_data_out[46 ] ),    .DO47  (RAM7_data_out[47 ] ),
    .DO48  (RAM7_data_out[48 ] ),    .DO49  (RAM7_data_out[49 ] ),    .DO50  (RAM7_data_out[50 ] ),    .DO51  (RAM7_data_out[51 ] ),
    .DO52  (RAM7_data_out[52 ] ),    .DO53  (RAM7_data_out[53 ] ),    .DO54  (RAM7_data_out[54 ] ),    .DO55  (RAM7_data_out[55 ] ),
    .DO56  (RAM7_data_out[56 ] ),    .DO57  (RAM7_data_out[57 ] ),    .DO58  (RAM7_data_out[58 ] ),    .DO59  (RAM7_data_out[59 ] ),
    .DO60  (RAM7_data_out[60 ] ),    .DO61  (RAM7_data_out[61 ] ),    .DO62  (RAM7_data_out[62 ] ),    .DO63  (RAM7_data_out[63 ] ),
    .DO64  (RAM7_data_out[64 ] ),    .DO65  (RAM7_data_out[65 ] ),    .DO66  (RAM7_data_out[66 ] ),    .DO67  (RAM7_data_out[67 ] ),
    .DO68  (RAM7_data_out[68 ] ),    .DO69  (RAM7_data_out[69 ] ),    .DO70  (RAM7_data_out[70 ] ),    .DO71  (RAM7_data_out[71 ] ),
    .DO72  (RAM7_data_out[72 ] ),    .DO73  (RAM7_data_out[73 ] ),    .DO74  (RAM7_data_out[74 ] ),    .DO75  (RAM7_data_out[75 ] ),
    .DO76  (RAM7_data_out[76 ] ),    .DO77  (RAM7_data_out[77 ] ),    .DO78  (RAM7_data_out[78 ] ),    .DO79  (RAM7_data_out[79 ] ),
    .DO80  (RAM7_data_out[80 ] ),    .DO81  (RAM7_data_out[81 ] ),    .DO82  (RAM7_data_out[82 ] ),    .DO83  (RAM7_data_out[83 ] ),
    .DO84  (RAM7_data_out[84 ] ),    .DO85  (RAM7_data_out[85 ] ),    .DO86  (RAM7_data_out[86 ] ),    .DO87  (RAM7_data_out[87 ]),
    .DO88  (RAM7_data_out[88 ] ),    .DO89  (RAM7_data_out[89 ] ),    .DO90  (RAM7_data_out[90 ] ),    .DO91  (RAM7_data_out[91 ] ),
    .DO92  (RAM7_data_out[92 ] ),    .DO93  (RAM7_data_out[93 ] ),    .DO94  (RAM7_data_out[94 ] ),    .DO95  (RAM7_data_out[95 ] ),
    .DO96  (RAM7_data_out[96 ] ),    .DO97  (RAM7_data_out[97 ] ),    .DO98  (RAM7_data_out[98 ] ),    .DO99  (RAM7_data_out[99 ] ),
    .DO100 (RAM7_data_out[100] ),    .DO101 (RAM7_data_out[101] ),    .DO102 (RAM7_data_out[102] ),    .DO103 (RAM7_data_out[103] ),
    .DO104 (RAM7_data_out[104] ),    .DO105 (RAM7_data_out[105] ),    .DO106 (RAM7_data_out[106] ),    .DO107 (RAM7_data_out[107] ),
    .DO108 (RAM7_data_out[108] ),    .DO109 (RAM7_data_out[109] ),    .DO110 (RAM7_data_out[110] ),    .DO111 (RAM7_data_out[111] ),
    .DO112 (RAM7_data_out[112] ),    .DO113 (RAM7_data_out[113] ),    .DO114 (RAM7_data_out[114] ),    .DO115 (RAM7_data_out[115] ),
    .DO116 (RAM7_data_out[116] ),    .DO117 (RAM7_data_out[117] ),    .DO118 (RAM7_data_out[118] ),    .DO119 (RAM7_data_out[119] ),
    .DO120 (RAM7_data_out[120] ),    .DO121 (RAM7_data_out[121] ),    .DO122 (RAM7_data_out[122] ),    .DO123 (RAM7_data_out[123] ),
    .DO124 (RAM7_data_out[124] ),    .DO125 (RAM7_data_out[125] ),    .DO126 (RAM7_data_out[126] ),    .DO127 (RAM7_data_out[127] ),

    .DI0   (RAM7_data_in[0  ] ),    .DI1   (RAM7_data_in[1  ] ),    .DI2   (RAM7_data_in[2  ] ),    .DI3   (RAM7_data_in[3  ] ),
    .DI4   (RAM7_data_in[4  ] ),    .DI5   (RAM7_data_in[5  ] ),    .DI6   (RAM7_data_in[6  ] ),    .DI7   (RAM7_data_in[7  ] ),
    .DI8   (RAM7_data_in[8  ] ),    .DI9   (RAM7_data_in[9  ] ),    .DI10  (RAM7_data_in[10 ] ),    .DI11  (RAM7_data_in[11 ] ),
    .DI12  (RAM7_data_in[12 ] ),    .DI13  (RAM7_data_in[13 ] ),    .DI14  (RAM7_data_in[14 ] ),    .DI15  (RAM7_data_in[15 ] ),
    .DI16  (RAM7_data_in[16 ] ),    .DI17  (RAM7_data_in[17 ] ),    .DI18  (RAM7_data_in[18 ] ),    .DI19  (RAM7_data_in[19 ] ),
    .DI20  (RAM7_data_in[20 ] ),    .DI21  (RAM7_data_in[21 ] ),    .DI22  (RAM7_data_in[22 ] ),    .DI23  (RAM7_data_in[23 ] ),
    .DI24  (RAM7_data_in[24 ] ),    .DI25  (RAM7_data_in[25 ] ),    .DI26  (RAM7_data_in[26 ] ),    .DI27  (RAM7_data_in[27 ] ),
    .DI28  (RAM7_data_in[28 ] ),    .DI29  (RAM7_data_in[29 ] ),    .DI30  (RAM7_data_in[30 ] ),    .DI31  (RAM7_data_in[31 ] ),
    .DI32  (RAM7_data_in[32 ] ),    .DI33  (RAM7_data_in[33 ] ),    .DI34  (RAM7_data_in[34 ] ),    .DI35  (RAM7_data_in[35 ] ),
    .DI36  (RAM7_data_in[36 ] ),    .DI37  (RAM7_data_in[37 ] ),    .DI38  (RAM7_data_in[38 ] ),    .DI39  (RAM7_data_in[39 ] ),
    .DI40  (RAM7_data_in[40 ] ),    .DI41  (RAM7_data_in[41 ] ),    .DI42  (RAM7_data_in[42 ] ),    .DI43  (RAM7_data_in[43 ] ),
    .DI44  (RAM7_data_in[44 ] ),    .DI45  (RAM7_data_in[45 ] ),    .DI46  (RAM7_data_in[46 ] ),    .DI47  (RAM7_data_in[47 ] ),
    .DI48  (RAM7_data_in[48 ] ),    .DI49  (RAM7_data_in[49 ] ),    .DI50  (RAM7_data_in[50 ] ),    .DI51  (RAM7_data_in[51 ] ),
    .DI52  (RAM7_data_in[52 ] ),    .DI53  (RAM7_data_in[53 ] ),    .DI54  (RAM7_data_in[54 ] ),    .DI55  (RAM7_data_in[55 ] ),
    .DI56  (RAM7_data_in[56 ] ),    .DI57  (RAM7_data_in[57 ] ),    .DI58  (RAM7_data_in[58 ] ),    .DI59  (RAM7_data_in[59 ] ),
    .DI60  (RAM7_data_in[60 ] ),    .DI61  (RAM7_data_in[61 ] ),    .DI62  (RAM7_data_in[62 ] ),    .DI63  (RAM7_data_in[63 ] ),
    .DI64  (RAM7_data_in[64 ] ),    .DI65  (RAM7_data_in[65 ] ),    .DI66  (RAM7_data_in[66 ] ),    .DI67  (RAM7_data_in[67 ] ),
    .DI68  (RAM7_data_in[68 ] ),    .DI69  (RAM7_data_in[69 ] ),    .DI70  (RAM7_data_in[70 ] ),    .DI71  (RAM7_data_in[71 ] ),
    .DI72  (RAM7_data_in[72 ] ),    .DI73  (RAM7_data_in[73 ] ),    .DI74  (RAM7_data_in[74 ] ),    .DI75  (RAM7_data_in[75 ] ),
    .DI76  (RAM7_data_in[76 ] ),    .DI77  (RAM7_data_in[77 ] ),    .DI78  (RAM7_data_in[78 ] ),    .DI79  (RAM7_data_in[79 ] ),
    .DI80  (RAM7_data_in[80 ] ),    .DI81  (RAM7_data_in[81 ] ),    .DI82  (RAM7_data_in[82 ] ),    .DI83  (RAM7_data_in[83 ] ),
    .DI84  (RAM7_data_in[84 ] ),    .DI85  (RAM7_data_in[85 ] ),    .DI86  (RAM7_data_in[86 ] ),    .DI87  (RAM7_data_in[87 ]),
    .DI88  (RAM7_data_in[88 ] ),    .DI89  (RAM7_data_in[89 ] ),    .DI90  (RAM7_data_in[90 ] ),    .DI91  (RAM7_data_in[91 ] ),
    .DI92  (RAM7_data_in[92 ] ),    .DI93  (RAM7_data_in[93 ] ),    .DI94  (RAM7_data_in[94 ] ),    .DI95  (RAM7_data_in[95 ] ),
    .DI96  (RAM7_data_in[96 ] ),    .DI97  (RAM7_data_in[97 ] ),    .DI98  (RAM7_data_in[98 ] ),    .DI99  (RAM7_data_in[99 ] ),
    .DI100 (RAM7_data_in[100] ),    .DI101 (RAM7_data_in[101] ),    .DI102 (RAM7_data_in[102] ),    .DI103 (RAM7_data_in[103] ),
    .DI104 (RAM7_data_in[104] ),    .DI105 (RAM7_data_in[105] ),    .DI106 (RAM7_data_in[106] ),    .DI107 (RAM7_data_in[107] ),
    .DI108 (RAM7_data_in[108] ),    .DI109 (RAM7_data_in[109] ),    .DI110 (RAM7_data_in[110] ),    .DI111 (RAM7_data_in[111] ),
    .DI112 (RAM7_data_in[112] ),    .DI113 (RAM7_data_in[113] ),    .DI114 (RAM7_data_in[114] ),    .DI115 (RAM7_data_in[115] ),
    .DI116 (RAM7_data_in[116] ),    .DI117 (RAM7_data_in[117] ),    .DI118 (RAM7_data_in[118] ),    .DI119 (RAM7_data_in[119] ),
    .DI120 (RAM7_data_in[120] ),    .DI121 (RAM7_data_in[121] ),    .DI122 (RAM7_data_in[122] ),    .DI123 (RAM7_data_in[123] ),
    .DI124 (RAM7_data_in[124] ),    .DI125 (RAM7_data_in[125] ),    .DI126 (RAM7_data_in[126] ),    .DI127 (RAM7_data_in[127] ),

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),.A4   (RAM_addr[4]   ),
    .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    .WEB0 (~w_WEB7[0] ),.WEB1 (~w_WEB7[1] ),.WEB2 (~w_WEB7[2] ),.WEB3 (~w_WEB7[3] ),
    .WEB4 (~w_WEB7[4] ),.WEB5 (~w_WEB7[5] ),.WEB6 (~w_WEB7[6] ),.WEB7 (~w_WEB7[7] ),
    .WEB8 (~w_WEB7[8]  ),.WEB9  (~w_WEB7[9]  ),.WEB10 (~w_WEB7[10]  ),.WEB11 (~w_WEB7[11]  ),
    .WEB12(~w_WEB7[12]  ),.WEB13 (~w_WEB7[13]  ),.WEB14 (~w_WEB7[14]  ),.WEB15 (~w_WEB7[15]  ),

    .CK    (clka   ),
    .CSB   (1'b0   )
);

endmodule
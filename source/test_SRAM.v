`timescale 1ns / 1ps

module test_SRAM(
    input rstn,

    input i_write_driveNext_DDR,//写DDR
    output o_write_freeNext_DDR,
    input [33:0] i_write_addr_to_DDR_34,
    input [255:0] i_write_data_to_DDR_256,

    input i_read_driveNext_DDR,//读DDR
    output o_read_freeNext_DDR,
    input [33:0] i_read_addr_to_DDR_34,

    input  i_DDR_free_cache,   //free回来后才能下次取
    output o_DDR_drive_cache, //读DDR后给cache数据
    output [255:0] o_DDR_refill_data_256
    
    //测试用
    ,output o_r_write_enable
);
    wire w_mutex_drive_fifo, w_mutex_free_fifo;
    wire [4:0] w_mutex_data;

    cArbMerge2_5b_cache u_cArbMerge2_5b_cache(
        .i_drive0    ( i_write_driveNext_DDR   ),
        .i_drive1    ( i_read_driveNext_DDR   ),
        .i_data0     (5'b00001     ),
        .i_data1     (5'b00000     ),
        .i_freeNext  (w_mutex_free_fifo  ),
        .rstn         (rstn         ),
        .o_free1     (     ),//o_write_freeNext_DDR
        .o_free0     (     ),//o_read_freeNext_DDR
        .o_driveNext (w_mutex_drive_fifo ),
        .o_data      (w_mutex_data      )
    );
    
    wire [1:0] w_fifo_fire_2;
    wire w_fifo_drive_selector, w_fifo_free_selector;
    wire w_fifo_delay_selector;

    cFifo2_cache u_cFifo2_cache(
        .rstn         (rstn         ),
        .i_drive     ( w_mutex_drive_fifo    ),
        .o_free      ( w_mutex_free_fifo     ),
        .o_driveNext ( w_fifo_delay_selector   ),
        .i_freeNext  ( w_fifo_free_selector  ),
        .o_fire_2    ( w_fifo_fire_2   )
    );
    
    delay12U u_delay12U(
        .inR  (w_fifo_delay_selector  ),
        .rstn  (rstn  ),
        .outR (w_fifo_drive_selector )
    );
    

    reg r_write_enable;//区别读写
    assign o_r_write_enable = r_write_enable;

    always @(posedge w_fifo_fire_2[0] or negedge rstn) begin
        if (rstn==0) begin
            r_write_enable <= 1'b0;
        end
        else begin
            r_write_enable <= w_mutex_data[0];
        end
    end

    wire [127:0] RAM1_data_out,RAM0_data_out;
    wire [127:0] RAM1_data_in,RAM0_data_in;
    wire [10:0] RAM_addr;
    wire [7:0] w_WEB1_8;

    assign { RAM1_data_in,RAM0_data_in } =  i_write_data_to_DDR_256;
    assign o_DDR_refill_data_256 = { RAM1_data_out, RAM0_data_out };
    assign RAM_addr = r_write_enable? i_write_addr_to_DDR_34[15:5] : i_read_addr_to_DDR_34[15:5];
    assign w_WEB1_8 = { 8{r_write_enable} };


// SYKB110_512X16X8CM2 u_ddr0_SYKB110_512X16X8CM2(
//     .DO0   (RAM0_data_out[0  ] ),    .DO1   (RAM0_data_out[1  ] ),    .DO2   (RAM0_data_out[2  ] ),    .DO3   (RAM0_data_out[3  ] ),
//     .DO4   (RAM0_data_out[4  ] ),    .DO5   (RAM0_data_out[5  ] ),    .DO6   (RAM0_data_out[6  ] ),    .DO7   (RAM0_data_out[7  ] ),
//     .DO8   (RAM0_data_out[8  ] ),    .DO9   (RAM0_data_out[9  ] ),    .DO10  (RAM0_data_out[10 ] ),    .DO11  (RAM0_data_out[11 ] ),
//     .DO12  (RAM0_data_out[12 ] ),    .DO13  (RAM0_data_out[13 ] ),    .DO14  (RAM0_data_out[14 ] ),    .DO15  (RAM0_data_out[15 ] ),
//     .DO16  (RAM0_data_out[16 ] ),    .DO17  (RAM0_data_out[17 ] ),    .DO18  (RAM0_data_out[18 ] ),    .DO19  (RAM0_data_out[19 ] ),
//     .DO20  (RAM0_data_out[20 ] ),    .DO21  (RAM0_data_out[21 ] ),    .DO22  (RAM0_data_out[22 ] ),    .DO23  (RAM0_data_out[23 ] ),
//     .DO24  (RAM0_data_out[24 ] ),    .DO25  (RAM0_data_out[25 ] ),    .DO26  (RAM0_data_out[26 ] ),    .DO27  (RAM0_data_out[27 ] ),
//     .DO28  (RAM0_data_out[28 ] ),    .DO29  (RAM0_data_out[29 ] ),    .DO30  (RAM0_data_out[30 ] ),    .DO31  (RAM0_data_out[31 ] ),
//     .DO32  (RAM0_data_out[32 ] ),    .DO33  (RAM0_data_out[33 ] ),    .DO34  (RAM0_data_out[34 ] ),    .DO35  (RAM0_data_out[35 ] ),
//     .DO36  (RAM0_data_out[36 ] ),    .DO37  (RAM0_data_out[37 ] ),    .DO38  (RAM0_data_out[38 ] ),    .DO39  (RAM0_data_out[39 ] ),
//     .DO40  (RAM0_data_out[40 ] ),    .DO41  (RAM0_data_out[41 ] ),    .DO42  (RAM0_data_out[42 ] ),    .DO43  (RAM0_data_out[43 ] ),
//     .DO44  (RAM0_data_out[44 ] ),    .DO45  (RAM0_data_out[45 ] ),    .DO46  (RAM0_data_out[46 ] ),    .DO47  (RAM0_data_out[47 ] ),
//     .DO48  (RAM0_data_out[48 ] ),    .DO49  (RAM0_data_out[49 ] ),    .DO50  (RAM0_data_out[50 ] ),    .DO51  (RAM0_data_out[51 ] ),
//     .DO52  (RAM0_data_out[52 ] ),    .DO53  (RAM0_data_out[53 ] ),    .DO54  (RAM0_data_out[54 ] ),    .DO55  (RAM0_data_out[55 ] ),
//     .DO56  (RAM0_data_out[56 ] ),    .DO57  (RAM0_data_out[57 ] ),    .DO58  (RAM0_data_out[58 ] ),    .DO59  (RAM0_data_out[59 ] ),
//     .DO60  (RAM0_data_out[60 ] ),    .DO61  (RAM0_data_out[61 ] ),    .DO62  (RAM0_data_out[62 ] ),    .DO63  (RAM0_data_out[63 ] ),
//     .DO64  (RAM0_data_out[64 ] ),    .DO65  (RAM0_data_out[65 ] ),    .DO66  (RAM0_data_out[66 ] ),    .DO67  (RAM0_data_out[67 ] ),
//     .DO68  (RAM0_data_out[68 ] ),    .DO69  (RAM0_data_out[69 ] ),    .DO70  (RAM0_data_out[70 ] ),    .DO71  (RAM0_data_out[71 ] ),
//     .DO72  (RAM0_data_out[72 ] ),    .DO73  (RAM0_data_out[73 ] ),    .DO74  (RAM0_data_out[74 ] ),    .DO75  (RAM0_data_out[75 ] ),
//     .DO76  (RAM0_data_out[76 ] ),    .DO77  (RAM0_data_out[77 ] ),    .DO78  (RAM0_data_out[78 ] ),    .DO79  (RAM0_data_out[79 ] ),
//     .DO80  (RAM0_data_out[80 ] ),    .DO81  (RAM0_data_out[81 ] ),    .DO82  (RAM0_data_out[82 ] ),    .DO83  (RAM0_data_out[83 ] ),
//     .DO84  (RAM0_data_out[84 ] ),    .DO85  (RAM0_data_out[85 ] ),    .DO86  (RAM0_data_out[86 ] ),    .DO87  (RAM0_data_out[87 ]),
//     .DO88  (RAM0_data_out[88 ] ),    .DO89  (RAM0_data_out[89 ] ),    .DO90  (RAM0_data_out[90 ] ),    .DO91  (RAM0_data_out[91 ] ),
//     .DO92  (RAM0_data_out[92 ] ),    .DO93  (RAM0_data_out[93 ] ),    .DO94  (RAM0_data_out[94 ] ),    .DO95  (RAM0_data_out[95 ] ),
//     .DO96  (RAM0_data_out[96 ] ),    .DO97  (RAM0_data_out[97 ] ),    .DO98  (RAM0_data_out[98 ] ),    .DO99  (RAM0_data_out[99 ] ),
//     .DO100 (RAM0_data_out[100] ),    .DO101 (RAM0_data_out[101] ),    .DO102 (RAM0_data_out[102] ),    .DO103 (RAM0_data_out[103] ),
//     .DO104 (RAM0_data_out[104] ),    .DO105 (RAM0_data_out[105] ),    .DO106 (RAM0_data_out[106] ),    .DO107 (RAM0_data_out[107] ),
//     .DO108 (RAM0_data_out[108] ),    .DO109 (RAM0_data_out[109] ),    .DO110 (RAM0_data_out[110] ),    .DO111 (RAM0_data_out[111] ),
//     .DO112 (RAM0_data_out[112] ),    .DO113 (RAM0_data_out[113] ),    .DO114 (RAM0_data_out[114] ),    .DO115 (RAM0_data_out[115] ),
//     .DO116 (RAM0_data_out[116] ),    .DO117 (RAM0_data_out[117] ),    .DO118 (RAM0_data_out[118] ),    .DO119 (RAM0_data_out[119] ),
//     .DO120 (RAM0_data_out[120] ),    .DO121 (RAM0_data_out[121] ),    .DO122 (RAM0_data_out[122] ),    .DO123 (RAM0_data_out[123] ),
//     .DO124 (RAM0_data_out[124] ),    .DO125 (RAM0_data_out[125] ),    .DO126 (RAM0_data_out[126] ),    .DO127 (RAM0_data_out[127] ),

//     .DI0   (RAM0_data_in[0  ] ),    .DI1   (RAM0_data_in[1  ] ),    .DI2   (RAM0_data_in[2  ] ),    .DI3   (RAM0_data_in[3  ] ),
//     .DI4   (RAM0_data_in[4  ] ),    .DI5   (RAM0_data_in[5  ] ),    .DI6   (RAM0_data_in[6  ] ),    .DI7   (RAM0_data_in[7  ] ),
//     .DI8   (RAM0_data_in[8  ] ),    .DI9   (RAM0_data_in[9  ] ),    .DI10  (RAM0_data_in[10 ] ),    .DI11  (RAM0_data_in[11 ] ),
//     .DI12  (RAM0_data_in[12 ] ),    .DI13  (RAM0_data_in[13 ] ),    .DI14  (RAM0_data_in[14 ] ),    .DI15  (RAM0_data_in[15 ] ),
//     .DI16  (RAM0_data_in[16 ] ),    .DI17  (RAM0_data_in[17 ] ),    .DI18  (RAM0_data_in[18 ] ),    .DI19  (RAM0_data_in[19 ] ),
//     .DI20  (RAM0_data_in[20 ] ),    .DI21  (RAM0_data_in[21 ] ),    .DI22  (RAM0_data_in[22 ] ),    .DI23  (RAM0_data_in[23 ] ),
//     .DI24  (RAM0_data_in[24 ] ),    .DI25  (RAM0_data_in[25 ] ),    .DI26  (RAM0_data_in[26 ] ),    .DI27  (RAM0_data_in[27 ] ),
//     .DI28  (RAM0_data_in[28 ] ),    .DI29  (RAM0_data_in[29 ] ),    .DI30  (RAM0_data_in[30 ] ),    .DI31  (RAM0_data_in[31 ] ),
//     .DI32  (RAM0_data_in[32 ] ),    .DI33  (RAM0_data_in[33 ] ),    .DI34  (RAM0_data_in[34 ] ),    .DI35  (RAM0_data_in[35 ] ),
//     .DI36  (RAM0_data_in[36 ] ),    .DI37  (RAM0_data_in[37 ] ),    .DI38  (RAM0_data_in[38 ] ),    .DI39  (RAM0_data_in[39 ] ),
//     .DI40  (RAM0_data_in[40 ] ),    .DI41  (RAM0_data_in[41 ] ),    .DI42  (RAM0_data_in[42 ] ),    .DI43  (RAM0_data_in[43 ] ),
//     .DI44  (RAM0_data_in[44 ] ),    .DI45  (RAM0_data_in[45 ] ),    .DI46  (RAM0_data_in[46 ] ),    .DI47  (RAM0_data_in[47 ] ),
//     .DI48  (RAM0_data_in[48 ] ),    .DI49  (RAM0_data_in[49 ] ),    .DI50  (RAM0_data_in[50 ] ),    .DI51  (RAM0_data_in[51 ] ),
//     .DI52  (RAM0_data_in[52 ] ),    .DI53  (RAM0_data_in[53 ] ),    .DI54  (RAM0_data_in[54 ] ),    .DI55  (RAM0_data_in[55 ] ),
//     .DI56  (RAM0_data_in[56 ] ),    .DI57  (RAM0_data_in[57 ] ),    .DI58  (RAM0_data_in[58 ] ),    .DI59  (RAM0_data_in[59 ] ),
//     .DI60  (RAM0_data_in[60 ] ),    .DI61  (RAM0_data_in[61 ] ),    .DI62  (RAM0_data_in[62 ] ),    .DI63  (RAM0_data_in[63 ] ),
//     .DI64  (RAM0_data_in[64 ] ),    .DI65  (RAM0_data_in[65 ] ),    .DI66  (RAM0_data_in[66 ] ),    .DI67  (RAM0_data_in[67 ] ),
//     .DI68  (RAM0_data_in[68 ] ),    .DI69  (RAM0_data_in[69 ] ),    .DI70  (RAM0_data_in[70 ] ),    .DI71  (RAM0_data_in[71 ] ),
//     .DI72  (RAM0_data_in[72 ] ),    .DI73  (RAM0_data_in[73 ] ),    .DI74  (RAM0_data_in[74 ] ),    .DI75  (RAM0_data_in[75 ] ),
//     .DI76  (RAM0_data_in[76 ] ),    .DI77  (RAM0_data_in[77 ] ),    .DI78  (RAM0_data_in[78 ] ),    .DI79  (RAM0_data_in[79 ] ),
//     .DI80  (RAM0_data_in[80 ] ),    .DI81  (RAM0_data_in[81 ] ),    .DI82  (RAM0_data_in[82 ] ),    .DI83  (RAM0_data_in[83 ] ),
//     .DI84  (RAM0_data_in[84 ] ),    .DI85  (RAM0_data_in[85 ] ),    .DI86  (RAM0_data_in[86 ] ),    .DI87  (RAM0_data_in[87 ]),
//     .DI88  (RAM0_data_in[88 ] ),    .DI89  (RAM0_data_in[89 ] ),    .DI90  (RAM0_data_in[90 ] ),    .DI91  (RAM0_data_in[91 ] ),
//     .DI92  (RAM0_data_in[92 ] ),    .DI93  (RAM0_data_in[93 ] ),    .DI94  (RAM0_data_in[94 ] ),    .DI95  (RAM0_data_in[95 ] ),
//     .DI96  (RAM0_data_in[96 ] ),    .DI97  (RAM0_data_in[97 ] ),    .DI98  (RAM0_data_in[98 ] ),    .DI99  (RAM0_data_in[99 ] ),
//     .DI100 (RAM0_data_in[100] ),    .DI101 (RAM0_data_in[101] ),    .DI102 (RAM0_data_in[102] ),    .DI103 (RAM0_data_in[103] ),
//     .DI104 (RAM0_data_in[104] ),    .DI105 (RAM0_data_in[105] ),    .DI106 (RAM0_data_in[106] ),    .DI107 (RAM0_data_in[107] ),
//     .DI108 (RAM0_data_in[108] ),    .DI109 (RAM0_data_in[109] ),    .DI110 (RAM0_data_in[110] ),    .DI111 (RAM0_data_in[111] ),
//     .DI112 (RAM0_data_in[112] ),    .DI113 (RAM0_data_in[113] ),    .DI114 (RAM0_data_in[114] ),    .DI115 (RAM0_data_in[115] ),
//     .DI116 (RAM0_data_in[116] ),    .DI117 (RAM0_data_in[117] ),    .DI118 (RAM0_data_in[118] ),    .DI119 (RAM0_data_in[119] ),
//     .DI120 (RAM0_data_in[120] ),    .DI121 (RAM0_data_in[121] ),    .DI122 (RAM0_data_in[122] ),    .DI123 (RAM0_data_in[123] ),
//     .DI124 (RAM0_data_in[124] ),    .DI125 (RAM0_data_in[125] ),    .DI126 (RAM0_data_in[126] ),    .DI127 (RAM0_data_in[127] ),

//     .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),
//     .A4   (RAM_addr[4]   ),.A5   (RAM_addr[5]   ),.A6   (RAM_addr[6]   ),.A7    (RAM_addr[7]    ),
//     .A8    (RAM_addr[8]    ),
//     .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),

//     .WEB0 (~w_WEB1_8[0] ),.WEB1 (~w_WEB1_8[1] ),.WEB2 (~w_WEB1_8[2] ),.WEB3 (~w_WEB1_8[3] ),
//     .WEB4 (~w_WEB1_8[4] ),.WEB5 (~w_WEB1_8[5] ),.WEB6 (~w_WEB1_8[6] ),.WEB7 (~w_WEB1_8[7] ),
//     .CK    (w_fifo_fire_2[1]   ),
//     .CSB   (1'b0   )
// );
    
// SYKB110_512X16X8CM2 u_ddr1_SYKB110_512X16X8CM2(
    //     .DO0   (RAM1_data_out[0  ] ),    .DO1   (RAM1_data_out[1  ] ),    .DO2   (RAM1_data_out[2  ] ),    .DO3   (RAM1_data_out[3  ] ),
    //     .DO4   (RAM1_data_out[4  ] ),    .DO5   (RAM1_data_out[5  ] ),    .DO6   (RAM1_data_out[6  ] ),    .DO7   (RAM1_data_out[7  ] ),
    //     .DO8   (RAM1_data_out[8  ] ),    .DO9   (RAM1_data_out[9  ] ),    .DO10  (RAM1_data_out[10 ] ),    .DO11  (RAM1_data_out[11 ] ),
    //     .DO12  (RAM1_data_out[12 ] ),    .DO13  (RAM1_data_out[13 ] ),    .DO14  (RAM1_data_out[14 ] ),    .DO15  (RAM1_data_out[15 ] ),
    //     .DO16  (RAM1_data_out[16 ] ),    .DO17  (RAM1_data_out[17 ] ),    .DO18  (RAM1_data_out[18 ] ),    .DO19  (RAM1_data_out[19 ] ),
    //     .DO20  (RAM1_data_out[20 ] ),    .DO21  (RAM1_data_out[21 ] ),    .DO22  (RAM1_data_out[22 ] ),    .DO23  (RAM1_data_out[23 ] ),
    //     .DO24  (RAM1_data_out[24 ] ),    .DO25  (RAM1_data_out[25 ] ),    .DO26  (RAM1_data_out[26 ] ),    .DO27  (RAM1_data_out[27 ] ),
    //     .DO28  (RAM1_data_out[28 ] ),    .DO29  (RAM1_data_out[29 ] ),    .DO30  (RAM1_data_out[30 ] ),    .DO31  (RAM1_data_out[31 ] ),
    //     .DO32  (RAM1_data_out[32 ] ),    .DO33  (RAM1_data_out[33 ] ),    .DO34  (RAM1_data_out[34 ] ),    .DO35  (RAM1_data_out[35 ] ),
    //     .DO36  (RAM1_data_out[36 ] ),    .DO37  (RAM1_data_out[37 ] ),    .DO38  (RAM1_data_out[38 ] ),    .DO39  (RAM1_data_out[39 ] ),
    //     .DO40  (RAM1_data_out[40 ] ),    .DO41  (RAM1_data_out[41 ] ),    .DO42  (RAM1_data_out[42 ] ),    .DO43  (RAM1_data_out[43 ] ),
    //     .DO44  (RAM1_data_out[44 ] ),    .DO45  (RAM1_data_out[45 ] ),    .DO46  (RAM1_data_out[46 ] ),    .DO47  (RAM1_data_out[47 ] ),
    //     .DO48  (RAM1_data_out[48 ] ),    .DO49  (RAM1_data_out[49 ] ),    .DO50  (RAM1_data_out[50 ] ),    .DO51  (RAM1_data_out[51 ] ),
    //     .DO52  (RAM1_data_out[52 ] ),    .DO53  (RAM1_data_out[53 ] ),    .DO54  (RAM1_data_out[54 ] ),    .DO55  (RAM1_data_out[55 ] ),
    //     .DO56  (RAM1_data_out[56 ] ),    .DO57  (RAM1_data_out[57 ] ),    .DO58  (RAM1_data_out[58 ] ),    .DO59  (RAM1_data_out[59 ] ),
    //     .DO60  (RAM1_data_out[60 ] ),    .DO61  (RAM1_data_out[61 ] ),    .DO62  (RAM1_data_out[62 ] ),    .DO63  (RAM1_data_out[63 ] ),
    //     .DO64  (RAM1_data_out[64 ] ),    .DO65  (RAM1_data_out[65 ] ),    .DO66  (RAM1_data_out[66 ] ),    .DO67  (RAM1_data_out[67 ] ),
    //     .DO68  (RAM1_data_out[68 ] ),    .DO69  (RAM1_data_out[69 ] ),    .DO70  (RAM1_data_out[70 ] ),    .DO71  (RAM1_data_out[71 ] ),
    //     .DO72  (RAM1_data_out[72 ] ),    .DO73  (RAM1_data_out[73 ] ),    .DO74  (RAM1_data_out[74 ] ),    .DO75  (RAM1_data_out[75 ] ),
    //     .DO76  (RAM1_data_out[76 ] ),    .DO77  (RAM1_data_out[77 ] ),    .DO78  (RAM1_data_out[78 ] ),    .DO79  (RAM1_data_out[79 ] ),
    //     .DO80  (RAM1_data_out[80 ] ),    .DO81  (RAM1_data_out[81 ] ),    .DO82  (RAM1_data_out[82 ] ),    .DO83  (RAM1_data_out[83 ] ),
    //     .DO84  (RAM1_data_out[84 ] ),    .DO85  (RAM1_data_out[85 ] ),    .DO86  (RAM1_data_out[86 ] ),    .DO87  (RAM1_data_out[87 ]),
    //     .DO88  (RAM1_data_out[88 ] ),    .DO89  (RAM1_data_out[89 ] ),    .DO90  (RAM1_data_out[90 ] ),    .DO91  (RAM1_data_out[91 ] ),
    //     .DO92  (RAM1_data_out[92 ] ),    .DO93  (RAM1_data_out[93 ] ),    .DO94  (RAM1_data_out[94 ] ),    .DO95  (RAM1_data_out[95 ] ),
    //     .DO96  (RAM1_data_out[96 ] ),    .DO97  (RAM1_data_out[97 ] ),    .DO98  (RAM1_data_out[98 ] ),    .DO99  (RAM1_data_out[99 ] ),
    //     .DO100 (RAM1_data_out[100] ),    .DO101 (RAM1_data_out[101] ),    .DO102 (RAM1_data_out[102] ),    .DO103 (RAM1_data_out[103] ),
    //     .DO104 (RAM1_data_out[104] ),    .DO105 (RAM1_data_out[105] ),    .DO106 (RAM1_data_out[106] ),    .DO107 (RAM1_data_out[107] ),
    //     .DO108 (RAM1_data_out[108] ),    .DO109 (RAM1_data_out[109] ),    .DO110 (RAM1_data_out[110] ),    .DO111 (RAM1_data_out[111] ),
    //     .DO112 (RAM1_data_out[112] ),    .DO113 (RAM1_data_out[113] ),    .DO114 (RAM1_data_out[114] ),    .DO115 (RAM1_data_out[115] ),
    //     .DO116 (RAM1_data_out[116] ),    .DO117 (RAM1_data_out[117] ),    .DO118 (RAM1_data_out[118] ),    .DO119 (RAM1_data_out[119] ),
    //     .DO120 (RAM1_data_out[120] ),    .DO121 (RAM1_data_out[121] ),    .DO122 (RAM1_data_out[122] ),    .DO123 (RAM1_data_out[123] ),
    //     .DO124 (RAM1_data_out[124] ),    .DO125 (RAM1_data_out[125] ),    .DO126 (RAM1_data_out[126] ),    .DO127 (RAM1_data_out[127] ),

    //     .DI0   (RAM1_data_in[0  ] ),    .DI1   (RAM1_data_in[1  ] ),    .DI2   (RAM1_data_in[2  ] ),    .DI3   (RAM1_data_in[3  ] ),
    //     .DI4   (RAM1_data_in[4  ] ),    .DI5   (RAM1_data_in[5  ] ),    .DI6   (RAM1_data_in[6  ] ),    .DI7   (RAM1_data_in[7  ] ),
    //     .DI8   (RAM1_data_in[8  ] ),    .DI9   (RAM1_data_in[9  ] ),    .DI10  (RAM1_data_in[10 ] ),    .DI11  (RAM1_data_in[11 ] ),
    //     .DI12  (RAM1_data_in[12 ] ),    .DI13  (RAM1_data_in[13 ] ),    .DI14  (RAM1_data_in[14 ] ),    .DI15  (RAM1_data_in[15 ] ),
    //     .DI16  (RAM1_data_in[16 ] ),    .DI17  (RAM1_data_in[17 ] ),    .DI18  (RAM1_data_in[18 ] ),    .DI19  (RAM1_data_in[19 ] ),
    //     .DI20  (RAM1_data_in[20 ] ),    .DI21  (RAM1_data_in[21 ] ),    .DI22  (RAM1_data_in[22 ] ),    .DI23  (RAM1_data_in[23 ] ),
    //     .DI24  (RAM1_data_in[24 ] ),    .DI25  (RAM1_data_in[25 ] ),    .DI26  (RAM1_data_in[26 ] ),    .DI27  (RAM1_data_in[27 ] ),
    //     .DI28  (RAM1_data_in[28 ] ),    .DI29  (RAM1_data_in[29 ] ),    .DI30  (RAM1_data_in[30 ] ),    .DI31  (RAM1_data_in[31 ] ),
    //     .DI32  (RAM1_data_in[32 ] ),    .DI33  (RAM1_data_in[33 ] ),    .DI34  (RAM1_data_in[34 ] ),    .DI35  (RAM1_data_in[35 ] ),
    //     .DI36  (RAM1_data_in[36 ] ),    .DI37  (RAM1_data_in[37 ] ),    .DI38  (RAM1_data_in[38 ] ),    .DI39  (RAM1_data_in[39 ] ),
    //     .DI40  (RAM1_data_in[40 ] ),    .DI41  (RAM1_data_in[41 ] ),    .DI42  (RAM1_data_in[42 ] ),    .DI43  (RAM1_data_in[43 ] ),
    //     .DI44  (RAM1_data_in[44 ] ),    .DI45  (RAM1_data_in[45 ] ),    .DI46  (RAM1_data_in[46 ] ),    .DI47  (RAM1_data_in[47 ] ),
    //     .DI48  (RAM1_data_in[48 ] ),    .DI49  (RAM1_data_in[49 ] ),    .DI50  (RAM1_data_in[50 ] ),    .DI51  (RAM1_data_in[51 ] ),
    //     .DI52  (RAM1_data_in[52 ] ),    .DI53  (RAM1_data_in[53 ] ),    .DI54  (RAM1_data_in[54 ] ),    .DI55  (RAM1_data_in[55 ] ),
    //     .DI56  (RAM1_data_in[56 ] ),    .DI57  (RAM1_data_in[57 ] ),    .DI58  (RAM1_data_in[58 ] ),    .DI59  (RAM1_data_in[59 ] ),
    //     .DI60  (RAM1_data_in[60 ] ),    .DI61  (RAM1_data_in[61 ] ),    .DI62  (RAM1_data_in[62 ] ),    .DI63  (RAM1_data_in[63 ] ),
    //     .DI64  (RAM1_data_in[64 ] ),    .DI65  (RAM1_data_in[65 ] ),    .DI66  (RAM1_data_in[66 ] ),    .DI67  (RAM1_data_in[67 ] ),
    //     .DI68  (RAM1_data_in[68 ] ),    .DI69  (RAM1_data_in[69 ] ),    .DI70  (RAM1_data_in[70 ] ),    .DI71  (RAM1_data_in[71 ] ),
    //     .DI72  (RAM1_data_in[72 ] ),    .DI73  (RAM1_data_in[73 ] ),    .DI74  (RAM1_data_in[74 ] ),    .DI75  (RAM1_data_in[75 ] ),
    //     .DI76  (RAM1_data_in[76 ] ),    .DI77  (RAM1_data_in[77 ] ),    .DI78  (RAM1_data_in[78 ] ),    .DI79  (RAM1_data_in[79 ] ),
    //     .DI80  (RAM1_data_in[80 ] ),    .DI81  (RAM1_data_in[81 ] ),    .DI82  (RAM1_data_in[82 ] ),    .DI83  (RAM1_data_in[83 ] ),
    //     .DI84  (RAM1_data_in[84 ] ),    .DI85  (RAM1_data_in[85 ] ),    .DI86  (RAM1_data_in[86 ] ),    .DI87  (RAM1_data_in[87 ]),
    //     .DI88  (RAM1_data_in[88 ] ),    .DI89  (RAM1_data_in[89 ] ),    .DI90  (RAM1_data_in[90 ] ),    .DI91  (RAM1_data_in[91 ] ),
    //     .DI92  (RAM1_data_in[92 ] ),    .DI93  (RAM1_data_in[93 ] ),    .DI94  (RAM1_data_in[94 ] ),    .DI95  (RAM1_data_in[95 ] ),
    //     .DI96  (RAM1_data_in[96 ] ),    .DI97  (RAM1_data_in[97 ] ),    .DI98  (RAM1_data_in[98 ] ),    .DI99  (RAM1_data_in[99 ] ),
    //     .DI100 (RAM1_data_in[100] ),    .DI101 (RAM1_data_in[101] ),    .DI102 (RAM1_data_in[102] ),    .DI103 (RAM1_data_in[103] ),
    //     .DI104 (RAM1_data_in[104] ),    .DI105 (RAM1_data_in[105] ),    .DI106 (RAM1_data_in[106] ),    .DI107 (RAM1_data_in[107] ),
    //     .DI108 (RAM1_data_in[108] ),    .DI109 (RAM1_data_in[109] ),    .DI110 (RAM1_data_in[110] ),    .DI111 (RAM1_data_in[111] ),
    //     .DI112 (RAM1_data_in[112] ),    .DI113 (RAM1_data_in[113] ),    .DI114 (RAM1_data_in[114] ),    .DI115 (RAM1_data_in[115] ),
    //     .DI116 (RAM1_data_in[116] ),    .DI117 (RAM1_data_in[117] ),    .DI118 (RAM1_data_in[118] ),    .DI119 (RAM1_data_in[119] ),
    //     .DI120 (RAM1_data_in[120] ),    .DI121 (RAM1_data_in[121] ),    .DI122 (RAM1_data_in[122] ),    .DI123 (RAM1_data_in[123] ),
    //     .DI124 (RAM1_data_in[124] ),    .DI125 (RAM1_data_in[125] ),    .DI126 (RAM1_data_in[126] ),    .DI127 (RAM1_data_in[127] ),

    //     .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),
    //     .A4   (RAM_addr[4]   ),.A5   (RAM_addr[5]   ),.A6   (RAM_addr[6]   ),.A7    (RAM_addr[7]    ),
    //     .A8    (RAM_addr[8]    ),
    //     .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
        
    //     .WEB0 (~w_WEB1_8[0] ),.WEB1 (~w_WEB1_8[1] ),.WEB2 (~w_WEB1_8[2] ),.WEB3 (~w_WEB1_8[3] ),
    //     .WEB4 (~w_WEB1_8[4] ),.WEB5 (~w_WEB1_8[5] ),.WEB6 (~w_WEB1_8[6] ),.WEB7 (~w_WEB1_8[7] ),
    //     .CK    (w_fifo_fire_2[1]    ),
    //     .CSB   (1'b0   )
// );


SHKD110_2048X16X8BM1 u_ddr0_SHKD110_2048X16X8BM1(
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

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),
    .A4   (RAM_addr[4]   ),.A5   (RAM_addr[5]   ),.A6   (RAM_addr[6]   ),.A7    (RAM_addr[7]    ),
    .A8    (RAM_addr[8]    ),.A9    (RAM_addr[9]    ),.A10   (RAM_addr[10]   ),
    //.DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),

    .WEB0 (~w_WEB1_8[0] ),.WEB1 (~w_WEB1_8[1] ),.WEB2 (~w_WEB1_8[2] ),.WEB3 (~w_WEB1_8[3] ),
    .WEB4 (~w_WEB1_8[4] ),.WEB5 (~w_WEB1_8[5] ),.WEB6 (~w_WEB1_8[6] ),.WEB7 (~w_WEB1_8[7] ),
    .CK    (w_fifo_fire_2[1]   ),
    .CS    (1'b1    ),
    .OE    (1'b0   )
    //.CSB   (1'b0   )
);
    
SHKD110_2048X16X8BM1 u_ddr1_SHKD110_2048X16X8BM1(
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

    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),
    .A4   (RAM_addr[4]   ),.A5   (RAM_addr[5]   ),.A6   (RAM_addr[6]   ),.A7    (RAM_addr[7]    ),
    .A8    (RAM_addr[8]    ),.A9    (RAM_addr[9]    ),.A10   (RAM_addr[10]   ),
    //.DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    
    .WEB0 (~w_WEB1_8[0] ),.WEB1 (~w_WEB1_8[1] ),.WEB2 (~w_WEB1_8[2] ),.WEB3 (~w_WEB1_8[3] ),
    .WEB4 (~w_WEB1_8[4] ),.WEB5 (~w_WEB1_8[5] ),.WEB6 (~w_WEB1_8[6] ),.WEB7 (~w_WEB1_8[7] ),
    .CK    (w_fifo_fire_2[1]    ),
    .CS    (1'b1    ),
    .OE    (1'b0    )
);
    

    wire w_write_freeNext_DDR, w_selector_driveNext0_to_freeNext0;

    cSelector2_cache u_cSelector2_cache(
        .rstn          (rstn          ),
        .i_drive      (w_fifo_drive_selector      ),
        .o_free       (w_fifo_free_selector       ),
        .o_fire       (       ),
        .valid0       ( r_write_enable      ), //写完成
        .valid1       ( ~r_write_enable      ),//读完成
        .o_driveNext0 ( w_write_freeNext_DDR ),//释放cache写DDR
        .o_driveNext1 ( o_DDR_drive_cache ),
        .i_freeNext0  ( w_selector_driveNext0_to_freeNext0 ),//阱
        .i_freeNext1  ( i_DDR_free_cache  )
    );
    
    delay3U u_delay3U(
        .inR  (w_write_freeNext_DDR  ),
        .rstn  (rstn  ),
        .outR (w_selector_driveNext0_to_freeNext0 )
    );

    assign o_write_freeNext_DDR = w_write_freeNext_DDR;//释放cache写DDR
    assign o_read_freeNext_DDR = i_DDR_free_cache;

endmodule
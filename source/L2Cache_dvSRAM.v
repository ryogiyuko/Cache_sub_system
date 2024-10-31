`timescale 1ns / 1ps

    // // dvSRAM 模块
    // L2Cache_dvSRAM u_L2Cache_dvSRAM (
    //     //.clka   (w_cfifo1_fire_2[1] | w_selector2_fire), 
    //     .clka   (w_cfifo1_fire_2[1] | w_selector2_fire),
    //     .ena    (1'b1),      
    //     .wea    (w_read_or_write_dvSRAM),    
    //     .addra  (w_dvSRAM_addr_10),  
    //     .dina   (w_dvSRAM_in_2),   
    //     .douta  ({w_dvSRAM_out_way7_2, w_dvSRAM_out_way6_2, w_dvSRAM_out_way5_2, w_dvSRAM_out_way4_2, w_dvSRAM_out_way3_2, w_dvSRAM_out_way2_2, w_dvSRAM_out_way1_2, w_dvSRAM_out_way0_2})
    // );

module L2Cache_dvSRAM(
    input wire clka,ena,wea,
    input wire [9:0] addra,  // [9:3]:片内  [2:0]:片选
    input wire [1:0] dina,
    output wire [15:0] douta
);
    wire [6:0] RAM_addr;  // 片内
    reg  [7:0] w_sel_SRAM_8 ;
    
    wire [1:0] w_datain_2;

    wire [15:0] RAM_data_in;
    wire [15:0] RAM_data_out;

    assign w_datain_2 = dina;

    assign RAM_addr = addra[9:3];

    assign RAM_data_in = {w_datain_2, w_datain_2, w_datain_2, w_datain_2, w_datain_2, w_datain_2, w_datain_2, w_datain_2};

    assign douta = RAM_data_out;

    wire [7:0]  w_WEB_8;

    always @( *) begin
        case (addra[2:0])
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
            3'b111:begin
              w_sel_SRAM_8 = 8'b10000000;
            end  
            default:begin
              w_sel_SRAM_8 = 8'b00000000;
            end
        endcase
    end

    assign w_WEB_8[0] = {wea & w_sel_SRAM_8[0]};
    assign w_WEB_8[1] = {wea & w_sel_SRAM_8[1]};
    assign w_WEB_8[2] = {wea & w_sel_SRAM_8[2]};
    assign w_WEB_8[3] = {wea & w_sel_SRAM_8[3]};
    assign w_WEB_8[4] = {wea & w_sel_SRAM_8[4]};
    assign w_WEB_8[5] = {wea & w_sel_SRAM_8[5]};
    assign w_WEB_8[6] = {wea & w_sel_SRAM_8[6]};
    assign w_WEB_8[7] = {wea & w_sel_SRAM_8[7]};

SYKB110_128X2X8CM4 u_L2dv_SYKB110_128X2X8CM4(
    .DO0   (RAM_data_out[0  ] ),    .DO1   (RAM_data_out[1  ] ),    .DO2   (RAM_data_out[2  ] ),    .DO3   (RAM_data_out[3  ] ),
    .DO4   (RAM_data_out[4  ] ),    .DO5   (RAM_data_out[5  ] ),    .DO6   (RAM_data_out[6  ] ),    .DO7   (RAM_data_out[7  ] ),
    .DO8   (RAM_data_out[8  ] ),    .DO9   (RAM_data_out[9  ] ),    .DO10  (RAM_data_out[10 ] ),    .DO11  (RAM_data_out[11 ] ),
    .DO12  (RAM_data_out[12 ] ),    .DO13  (RAM_data_out[13 ] ),    .DO14  (RAM_data_out[14 ] ),    .DO15  (RAM_data_out[15 ] ),


    .DI0   (RAM_data_in[0  ] ),    .DI1   (RAM_data_in[1  ] ),    .DI2   (RAM_data_in[2  ] ),    .DI3   (RAM_data_in[3  ] ),
    .DI4   (RAM_data_in[4  ] ),    .DI5   (RAM_data_in[5  ] ),    .DI6   (RAM_data_in[6  ] ),    .DI7   (RAM_data_in[7  ] ),
    .DI8   (RAM_data_in[8  ] ),    .DI9   (RAM_data_in[9  ] ),    .DI10  (RAM_data_in[10 ] ),    .DI11  (RAM_data_in[11 ] ),
    .DI12  (RAM_data_in[12 ] ),    .DI13  (RAM_data_in[13 ] ),    .DI14  (RAM_data_in[14 ] ),    .DI15  (RAM_data_in[15 ] ),


    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),.A4   (RAM_addr[4]   ),.A5   (RAM_addr[5]   ),.A6   (RAM_addr[6]   ),
    .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    .WEB0 (~w_WEB_8[0] ),.WEB1 (~w_WEB_8[1] ),.WEB2 (~w_WEB_8[2] ),.WEB3 (~w_WEB_8[3] ),.WEB4 (~w_WEB_8[4] ),.WEB5 (~w_WEB_8[5] ),.WEB6 (~w_WEB_8[6] ),.WEB7 (~w_WEB_8[7] ),

    .CK    (clka   ),
    .CSB   (1'b0   )
);

endmodule

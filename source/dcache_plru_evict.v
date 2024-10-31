`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/16 16:14:58
// Design Name: 
// Module Name: dcache_plru_evict
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dcache_plru_evict( //找最不经常访问的进行替换，有v=0的优先v=0
    input [6:0] w_plru_buffer_out_7,
    input [15:0] w_D_V_buffer_dataOut_16, //高位D,低位V
    output [2:0]  w_dcache_plru_evict_out_evictWay_3
    );
    reg [2:0] w_dcache_plru_evict_out_evictWay;
    assign w_dcache_plru_evict_out_evictWay_3 = w_dcache_plru_evict_out_evictWay;
//                             [0]  0 way0-way3 最近没被使用
//                             /\
//                            /  \
//                           /    \
//                         0/      \1
//                         /        \
//                      [1]          [2]       [1]为0 way0-way1 最近没被使用
//                      /\           /\
//                    0/  \1       0/  \1
//                    /    \       /    \
//                  [3]   [4]    [5]    [6]    [3]为0 way0  最近没被使用
//                  /\     /\     /\     /\
//                0/  \1 0/  \1 0/  \1 0/  \1
//                
//                
    wire [7:0] w_Valid_8;
    wire w_Valid;   //是否有valid为0, 有则为0，无则为1
    assign w_Valid_8 = { w_D_V_buffer_dataOut_16[14], w_D_V_buffer_dataOut_16[12], w_D_V_buffer_dataOut_16[10], w_D_V_buffer_dataOut_16[8], w_D_V_buffer_dataOut_16[6], w_D_V_buffer_dataOut_16[4], w_D_V_buffer_dataOut_16[2], w_D_V_buffer_dataOut_16[0]};
    assign w_Valid = w_Valid_8[7] & w_Valid_8[6] & w_Valid_8[5] & w_Valid_8[4] & w_Valid_8[3] & w_Valid_8[2] & w_Valid_8[1] & w_Valid_8[0];

    always @( *) begin
        if (w_Valid == 0) begin
            casez (w_Valid_8[7:0])
            8'b???????0: w_dcache_plru_evict_out_evictWay = 3'b000 ;
            8'b??????01: w_dcache_plru_evict_out_evictWay = 3'b001 ;
            8'b?????011: w_dcache_plru_evict_out_evictWay = 3'b010 ;
            8'b????0111: w_dcache_plru_evict_out_evictWay = 3'b011 ;
            8'b???01111: w_dcache_plru_evict_out_evictWay = 3'b100 ;
            8'b??011111: w_dcache_plru_evict_out_evictWay = 3'b101 ;
            8'b?0111111: w_dcache_plru_evict_out_evictWay = 3'b110 ;
            //8'b01111111: w_dcache_plru_evict_out_evictWay = 3'b111 ;
            default: w_dcache_plru_evict_out_evictWay = 3'b111 ;  //否则DEFAULT branch of CASE statement cannot be reached.
        endcase
        end
        else if (w_Valid == 1) begin
            casez (w_plru_buffer_out_7[6:0] )
            7'b???0?00: w_dcache_plru_evict_out_evictWay = 3'b000 ;
            7'b???1?00: w_dcache_plru_evict_out_evictWay = 3'b001 ;
            7'b??0??10: w_dcache_plru_evict_out_evictWay = 3'b010 ;
            7'b??1??10: w_dcache_plru_evict_out_evictWay = 3'b011 ;
            7'b?0??0?1: w_dcache_plru_evict_out_evictWay = 3'b100 ;
            7'b?1??0?1: w_dcache_plru_evict_out_evictWay = 3'b101 ;
            7'b0???1?1: w_dcache_plru_evict_out_evictWay = 3'b110 ;
            //7'b1???1?1: w_dcache_plru_evict_out_evictWay = 3'b111 ;
            default: w_dcache_plru_evict_out_evictWay = 3'b111 ;   //否则DEFAULT branch of CASE statement cannot be reached.
        endcase
        end
        else begin
          w_dcache_plru_evict_out_evictWay = 3'b000 ;
        end
    end


endmodule

`timescale 1ns / 1ps

    // // plruSRAM 模块
    // L2Cache_plruSRAM u_L2Cache_plruSRAM (
    //     .clka   (w_cfifo1_fire_2[1] | w_selector2_fire), 
    //     .ena    (1'b1),      
    //     .wea    (w_read_or_write_plruSRAM),     
    //     .addra  (w_plruSRAM_addr_7),  
    //     .dina   (w_plruSRAM_in_7),   
    //     .douta  (w_plruSRAM_out_7)
    // );

module L2Cache_plruSRAM(
    input wire clka,ena,wea,
    input wire [6:0] addra,  // 都是片内
    input wire [6:0] dina,
    output wire [6:0] douta
);
    wire [6:0] RAM_addr;  // 片内
    
    wire [6:0] RAM_data_in;
    wire [6:0] RAM_data_out;

    assign RAM_addr = addra;

    assign RAM_data_in = dina;

    assign douta = RAM_data_out;

    wire w_WEB;

    assign w_WEB = wea;



SYKB110_128X7X1CM4 u_L2plru_SYKB110_128X7X1CM4(
    .DO0   (RAM_data_out[0  ] ),    .DO1   (RAM_data_out[1  ] ),    .DO2   (RAM_data_out[2  ] ),    .DO3   (RAM_data_out[3  ] ),
    .DO4   (RAM_data_out[4  ] ),    .DO5   (RAM_data_out[5  ] ),    .DO6   (RAM_data_out[6  ] ),    //.DO7   (RAM_data_out[7  ] ),


    .DI0   (RAM_data_in[0  ] ),    .DI1   (RAM_data_in[1  ] ),    .DI2   (RAM_data_in[2  ] ),    .DI3   (RAM_data_in[3  ] ),
    .DI4   (RAM_data_in[4  ] ),    .DI5   (RAM_data_in[5  ] ),    .DI6   (RAM_data_in[6  ] ),    //.DI7   (RAM_data_in[7  ] ),


    .A0   (RAM_addr[0]   ),.A1   (RAM_addr[1]   ),.A2   (RAM_addr[2]   ),.A3   (RAM_addr[3]   ),.A4   (RAM_addr[4]   ),.A5   (RAM_addr[5]   ),.A6   (RAM_addr[6]   ),
    .DVSE (1'b0  ),.DVS0 (1'b0  ),.DVS1 (1'b0  ),.DVS2 (1'b0  ),.DVS3 (1'b0  ),
    .WEB  (~w_WEB ),

    .CK    (clka   ),
    .CSB   (1'b0   )
);
    
endmodule

`timescale  1ns / 1ps

module tb_Icache_SRAM_bank;   

// Icache_SRAM_bank Parameters
parameter PERIOD  = 20;       
parameter rstn_cycle  = 5;

reg [6:0] count = 0;

// Icache_SRAM_bank Inputs   
reg   rstn=1;   
reg   clka                                 = 0 ;
reg   ena                                  = 0 ;
reg   wea                                  = 0 ;
reg   [7 : 0]  addra                       = 0 ;
reg   [276 : 0]  dina                      = 0 ;

// Icache_SRAM_bank Outputs
wire  [553 : 0]  douta                     ;

initial
begin
    forever #(PERIOD/2)  clka=~clka;
end

initial 
begin
    $sdf_annotate("/team/users/zhao.kangli/2024-superscalarProcessor/DC/DC_zjy/DC_Icache_SRAM/output",u_Icache_SRAM_bank); 
end

integer i;

initial
begin
    for(i = 0;i < 1024;i=i+1)begin
        u_Icache_SRAM_bank.u7_SHTB110_1024X8X8CM8.Memory_byte0[i][7:0] = 1;
        u_Icache_SRAM_bank.u7_SHTB110_1024X8X8CM8.Memory_byte1[i][7:0] = 1;
        u_Icache_SRAM_bank.u7_SHTB110_1024X8X8CM8.Memory_byte2[i][7:0] = 1;
        u_Icache_SRAM_bank.u7_SHTB110_1024X8X8CM8.Memory_byte3[i][7:0] = 1;
        u_Icache_SRAM_bank.u7_SHTB110_1024X8X8CM8.Memory_byte4[i][7:0] = 1;
        u_Icache_SRAM_bank.u7_SHTB110_1024X8X8CM8.Memory_byte5[i][7:0] = 1;
        u_Icache_SRAM_bank.u7_SHTB110_1024X8X8CM8.Memory_byte6[i][7:0] = 1;
        u_Icache_SRAM_bank.u7_SHTB110_1024X8X8CM8.Memory_byte7[i][7:0] = 1;
        
        u_Icache_SRAM_bank.u6_SHTB110_1024X8X8CM8.Memory_byte0[i][7:0] = 1;
        u_Icache_SRAM_bank.u6_SHTB110_1024X8X8CM8.Memory_byte1[i][7:0] = 1;
        u_Icache_SRAM_bank.u6_SHTB110_1024X8X8CM8.Memory_byte2[i][7:0] = 1;
        u_Icache_SRAM_bank.u6_SHTB110_1024X8X8CM8.Memory_byte3[i][7:0] = 1;
        u_Icache_SRAM_bank.u6_SHTB110_1024X8X8CM8.Memory_byte4[i][7:0] = 1;
        u_Icache_SRAM_bank.u6_SHTB110_1024X8X8CM8.Memory_byte5[i][7:0] = 1;
        u_Icache_SRAM_bank.u6_SHTB110_1024X8X8CM8.Memory_byte6[i][7:0] = 1;
        u_Icache_SRAM_bank.u6_SHTB110_1024X8X8CM8.Memory_byte7[i][7:0] = 1;

        u_Icache_SRAM_bank.u5_SHTB110_1024X8X8CM8.Memory_byte0[i][7:0] = 1;
        u_Icache_SRAM_bank.u5_SHTB110_1024X8X8CM8.Memory_byte1[i][7:0] = 1;
        u_Icache_SRAM_bank.u5_SHTB110_1024X8X8CM8.Memory_byte2[i][7:0] = 1;
        u_Icache_SRAM_bank.u5_SHTB110_1024X8X8CM8.Memory_byte3[i][7:0] = 1;
        u_Icache_SRAM_bank.u5_SHTB110_1024X8X8CM8.Memory_byte4[i][7:0] = 1;
        u_Icache_SRAM_bank.u5_SHTB110_1024X8X8CM8.Memory_byte5[i][7:0] = 1;
        u_Icache_SRAM_bank.u5_SHTB110_1024X8X8CM8.Memory_byte6[i][7:0] = 1;
        u_Icache_SRAM_bank.u5_SHTB110_1024X8X8CM8.Memory_byte7[i][7:0] = 1;
        
        u_Icache_SRAM_bank.u4_SHTB110_1024X8X8CM8.Memory_byte0[i][7:0] = 1;
        u_Icache_SRAM_bank.u4_SHTB110_1024X8X8CM8.Memory_byte1[i][7:0] = 1;
        u_Icache_SRAM_bank.u4_SHTB110_1024X8X8CM8.Memory_byte2[i][7:0] = 1;
        u_Icache_SRAM_bank.u4_SHTB110_1024X8X8CM8.Memory_byte3[i][7:0] = 1;
        u_Icache_SRAM_bank.u4_SHTB110_1024X8X8CM8.Memory_byte4[i][7:0] = 1;
        u_Icache_SRAM_bank.u4_SHTB110_1024X8X8CM8.Memory_byte5[i][7:0] = 1;
        u_Icache_SRAM_bank.u4_SHTB110_1024X8X8CM8.Memory_byte6[i][7:0] = 1;
        u_Icache_SRAM_bank.u4_SHTB110_1024X8X8CM8.Memory_byte7[i][7:0] = 1;
        
        u_Icache_SRAM_bank.u3_SHTB110_1024X8X8CM8.Memory_byte0[i][7:0] = 1;
        u_Icache_SRAM_bank.u3_SHTB110_1024X8X8CM8.Memory_byte1[i][7:0] = 1;
        u_Icache_SRAM_bank.u3_SHTB110_1024X8X8CM8.Memory_byte2[i][7:0] = 1;
        u_Icache_SRAM_bank.u3_SHTB110_1024X8X8CM8.Memory_byte3[i][7:0] = 1;
        u_Icache_SRAM_bank.u3_SHTB110_1024X8X8CM8.Memory_byte4[i][7:0] = 1;
        u_Icache_SRAM_bank.u3_SHTB110_1024X8X8CM8.Memory_byte5[i][7:0] = 1;
        u_Icache_SRAM_bank.u3_SHTB110_1024X8X8CM8.Memory_byte6[i][7:0] = 1;
        u_Icache_SRAM_bank.u3_SHTB110_1024X8X8CM8.Memory_byte7[i][7:0] = 1;
        
        u_Icache_SRAM_bank.u2_SHTB110_1024X8X8CM8.Memory_byte0[i][7:0] = 1;
        u_Icache_SRAM_bank.u2_SHTB110_1024X8X8CM8.Memory_byte1[i][7:0] = 1;
        u_Icache_SRAM_bank.u2_SHTB110_1024X8X8CM8.Memory_byte2[i][7:0] = 1;
        u_Icache_SRAM_bank.u2_SHTB110_1024X8X8CM8.Memory_byte3[i][7:0] = 1;
        u_Icache_SRAM_bank.u2_SHTB110_1024X8X8CM8.Memory_byte4[i][7:0] = 1;
        u_Icache_SRAM_bank.u2_SHTB110_1024X8X8CM8.Memory_byte5[i][7:0] = 1;
        u_Icache_SRAM_bank.u2_SHTB110_1024X8X8CM8.Memory_byte6[i][7:0] = 1;
        u_Icache_SRAM_bank.u2_SHTB110_1024X8X8CM8.Memory_byte7[i][7:0] = 1;
        
        u_Icache_SRAM_bank.u1_SHTB110_1024X8X8CM8.Memory_byte0[i][7:0] = 1;
        u_Icache_SRAM_bank.u1_SHTB110_1024X8X8CM8.Memory_byte1[i][7:0] = 1;
        u_Icache_SRAM_bank.u1_SHTB110_1024X8X8CM8.Memory_byte2[i][7:0] = 1;
        u_Icache_SRAM_bank.u1_SHTB110_1024X8X8CM8.Memory_byte3[i][7:0] = 1;
        u_Icache_SRAM_bank.u1_SHTB110_1024X8X8CM8.Memory_byte4[i][7:0] = 1;
        u_Icache_SRAM_bank.u1_SHTB110_1024X8X8CM8.Memory_byte5[i][7:0] = 1;
        u_Icache_SRAM_bank.u1_SHTB110_1024X8X8CM8.Memory_byte6[i][7:0] = 1;
        u_Icache_SRAM_bank.u1_SHTB110_1024X8X8CM8.Memory_byte7[i][7:0] = 1;
        
        u_Icache_SRAM_bank.u0_SHTB110_1024X8X8CM8.Memory_byte0[i][7:0] = 1;
        u_Icache_SRAM_bank.u0_SHTB110_1024X8X8CM8.Memory_byte1[i][7:0] = 1;
        u_Icache_SRAM_bank.u0_SHTB110_1024X8X8CM8.Memory_byte2[i][7:0] = 1;
        u_Icache_SRAM_bank.u0_SHTB110_1024X8X8CM8.Memory_byte3[i][7:0] = 1;
        u_Icache_SRAM_bank.u0_SHTB110_1024X8X8CM8.Memory_byte4[i][7:0] = 1;
        u_Icache_SRAM_bank.u0_SHTB110_1024X8X8CM8.Memory_byte5[i][7:0] = 1;
        u_Icache_SRAM_bank.u0_SHTB110_1024X8X8CM8.Memory_byte6[i][7:0] = 1;
        u_Icache_SRAM_bank.u0_SHTB110_1024X8X8CM8.Memory_byte7[i][7:0] = 1;

        u_Icache_SRAM_bank.u_tag_SHTB110_1024X8X8CM8.Memory_byte0[i][7:0] = 1;
        u_Icache_SRAM_bank.u_tag_SHTB110_1024X8X8CM8.Memory_byte1[i][7:0] = 1;
        u_Icache_SRAM_bank.u_tag_SHTB110_1024X8X8CM8.Memory_byte2[i][7:0] = 1;
        u_Icache_SRAM_bank.u_tag_SHTB110_1024X8X8CM8.Memory_byte3[i][7:0] = 1;
        u_Icache_SRAM_bank.u_tag_SHTB110_1024X8X8CM8.Memory_byte4[i][7:0] = 1;
        u_Icache_SRAM_bank.u_tag_SHTB110_1024X8X8CM8.Memory_byte5[i][7:0] = 1;
        u_Icache_SRAM_bank.u_tag_SHTB110_1024X8X8CM8.Memory_byte6[i][7:0] = 1;
        u_Icache_SRAM_bank.u_tag_SHTB110_1024X8X8CM8.Memory_byte7[i][7:0] = 1;

    end
end

Icache_SRAM_bank  u_Icache_SRAM_bank (
    .clka                    ( clka             ),
    .ena                     ( ena              ),
    .wea                     ( wea              ),
    .addra                   ( addra  [7 : 0]   ),
    .dina                    ( dina   [276 : 0] ),

    .douta                   ( douta  [553 : 0] )
);

initial
begin

    #5; 
    rstn = 0; 

    #(PERIOD*rstn_cycle-5) rstn  =  1;
    
//case1 读
    ena = 1'b1;
    wea = 1'b0;
    addra = 8'hae;

    #PERIOD;
    
//case2 写
    ena = 1'b1;
    wea = 1'b1;
    addra = 8'hae;

    dina = { 256'hfea5bf5c4ee8c293_ead6fe726109b4f8_6d1c1c1b60d277f3_8f227c1d5e91b527, 20'h86789, 1'b1}; 
    //h86789 = 1000_0110_0111_1000_1001

    #PERIOD;

//case2 读
    ena = 1'b1;
    wea = 1'b0;
    addra = 8'hae;

    dina = { 256'hfea5bf5c4ee8c293_ead6fe726109b4f8_6d1c1c1b60d277f3_8f227c1d5e91b527, 20'h86789, 1'b1}; 
    //h86789 = 1000_0110_0111_1000_1001

    #PERIOD;


    $stop;
end

endmodule
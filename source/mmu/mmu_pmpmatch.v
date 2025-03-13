`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: mmu_pmpmatch
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


module mmu_pmpmatch(
    input i_pmp_pmpmatch_drive_1,
    input i_pmpmatch_pmp_freenext_1,
    input rstn,
    input [31:0] i_paddrProduct_pmp_addr_32,
    input [1:0] i_paddrProduct_pmp_mode_2,
    input [31:0] i_csrFetch_pmpmatch_pmpaddrbottom_32,
    input [31:0] i_csrFetch_pmpmatch_pmpaddrtop_32,
    output o_pmpmatch_pmp_hit_1,
    output o_pmpmatch_pmp_drivenext_1,
    output o_pmpmatch_pmp_free_1
    );
//    wire i_pmp_pmpmatch_req_1;
//    wire i_pmpmatch_pmp_req_1;
//    wire i_paddrProduct_pmp_mode_2;
//    wire i_paddrProduct_pmp_addr_32;
//    wire i_csrFetch_pmpmatch_pmpaddrbottom_32;
//    wire i_csrFetch_pmpmatch_pmpaddrtop_32;
//    wire i_pmpmatch_pmp_req;

    wire tor_match;
    //wire [32:0]tor_difference_grater;
    //wire [32:0]tor_difference_less;
    
    wire natop_match;
    reg [31:0] addr_mask;
    
    wire na4_match;
    wire fire;
    reg result_hit;
    //TOR mode: pmpaddr[i-1]<= addr < pmpaddr[i]
    //assign tor_difference_grater={1'b0,i_csrFetch_pmpmatch_pmpaddrbottom_32}-{1'b0,i_paddrProduct_pmp_addr_32};
    //assign tor_difference_less={1'b0, i_paddrProduct_pmp_addr_32}-{1'b0,i_csrFetch_pmpmatch_pmpaddrtop_32}; 
    assign tor_match =( (i_csrFetch_pmpmatch_pmpaddrbottom_32<=i_paddrProduct_pmp_addr_32) && (i_paddrProduct_pmp_addr_32<i_csrFetch_pmpmatch_pmpaddrtop_32)) ? 1'b1 : 1'b0;
    
    //napot
    assign natop_match=(i_paddrProduct_pmp_addr_32& addr_mask) ==(i_csrFetch_pmpmatch_pmpaddrtop_32 & addr_mask );

  always @( i_csrFetch_pmpmatch_pmpaddrtop_32[31:0])
begin
  casez(i_csrFetch_pmpmatch_pmpaddrtop_32[31:0])
    32'b???_????_????_????_????_????_????_????_0 : addr_mask[31:0] = 32'hfffffffe; //8B
    32'b???_????_????_????_????_????_????_???0_1 : addr_mask[31:0] = 32'hfffffffc; //16B
    32'b???_????_????_????_????_????_????_??01_1 : addr_mask[31:0] = 32'hfffffff8; //32B
    32'b???_????_????_????_????_????_????_?011_1 : addr_mask[31:0] = 32'hfffffff0; //64B
    32'b???_????_????_????_????_????_????_0111_1 : addr_mask[31:0] = 32'hffffffe0; //128B
    32'b???_????_????_????_????_????_???0_1111_1 : addr_mask[31:0] = 32'hffffffc0; //256B
    32'b???_????_????_????_????_????_??01_1111_1 : addr_mask[31:0] = 32'hffffff80; //512B
    32'b???_????_????_????_????_????_?011_1111_1 : addr_mask[31:0] = 32'hffffff00; //1KB

    32'b???_????_????_????_????_????_0111_1111_1 : addr_mask[31:0] = 32'hfffffe00; //2KB
    32'b???_????_????_????_????_???0_1111_1111_1 : addr_mask[31:0] = 32'hfffffc00; //4KB

    32'b???_????_????_????_????_??01_1111_1111_1 : addr_mask[31:0] = 32'hfffff800; //8KB
    32'b???_????_????_????_????_?011_1111_1111_1 : addr_mask[31:0] = 32'hfffff000; //16KB
    32'b???_????_????_????_????_0111_1111_1111_1 : addr_mask[31:0] = 32'hffffe000; //32KB
    32'b???_????_????_????_???0_1111_1111_1111_1 : addr_mask[31:0] = 32'hffffc000; //64KB
    32'b???_????_????_????_??01_1111_1111_1111_1 : addr_mask[31:0] = 32'hffff8000; //128KB
    32'b???_????_????_????_?011_1111_1111_1111_1 : addr_mask[31:0] = 32'hffff0000; //256KB

    32'b???_????_????_????_0111_1111_1111_1111_1 : addr_mask[31:0] = 32'hfffe0000; //512KB
    32'b???_????_????_???0_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hfffc0000; //1M
    32'b???_????_????_??01_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hfff80000; //2M
    32'b???_????_????_?011_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hfff00000; //4M

    32'b???_????_????_0111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hffe00000; //8M
    32'b???_????_???0_1111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hffc00000; //16M
    32'b???_????_??01_1111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hff800000; //32M
    32'b???_????_?011_1111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hff000000; //64M
    32'b???_????_0111_1111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hfe000000; //128M
    32'b???_???0_1111_1111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hfc000000; //256M
    32'b???_??01_1111_1111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hf8000000; //512M 
    32'b???_?011_1111_1111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hf0000000; //1G
    32'b???_0111_1111_1111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'he0000000; //2G
    32'b??0_1111_1111_1111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'hc0000000; //4G

    32'b?01_1111_1111_1111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'h80000000; //8G
    32'b011_1111_1111_1111_1111_1111_1111_1111_1 : addr_mask[31:0] = 32'h00000000; //16G

    default                                  : addr_mask[31:0] = 32'b0;
  endcase
  end
  
  //NA4
 assign na4_match=(i_csrFetch_pmpmatch_pmpaddrtop_32[31:0]==i_paddrProduct_pmp_addr_32[31:0])?1:0;
 
 //µ÷ÓÃFIFIO
cFifo1_pmpmatch cFifo(
.i_drive(i_pmp_pmpmatch_drive_1),
.i_freeNext(i_pmpmatch_pmp_freenext_1),
.o_free(o_pmpmatch_pmp_free_1),
.o_driveNext(o_pmpmatch_pmp_drivenext_1),
.o_fire_1(fire),
.rstn(rstn)
);  

 always @(fire)
 begin
 case(i_paddrProduct_pmp_mode_2)
    2'b00:
    result_hit=1'b0;
    2'b01:
    result_hit=tor_match;
    2'b10:
    result_hit=na4_match;
    2'b11:
    result_hit=natop_match;
    
 endcase
 end
 
 assign o_pmpmatch_pmp_hit_1=result_hit;
endmodule


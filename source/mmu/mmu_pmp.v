`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: mmu_pmp
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


module mmu_pmp(
    input i_paddr_pmp_drive_1,
    input i_paddr_pmp_freenext_1,
    input rstn,
    output o_pmp_paddr_drivenext_1,
    output o_pmp_paddr_free_1,
    input [47:0] i_paddr_pmp_data_48,
    input [639:0] i_csr_pmp_data_640,
    output [50:0] o_pmp_paddr_data_51

    );
    //ÃüÖÐÐÅºÅ
    wire w_hit0_1,w_hit1_1,w_hit2_1,w_hit3_1,w_hit4_1,w_hit5_1,w_hit6_1,w_hit7_1;
    wire w_hit8_1,w_hit9_1,w_hit10_1,w_hit11_1,w_hit12_1,w_hit13_1,w_hit14_1,w_hit15_1;
    wire [5:0] w_index_6;
    wire [15:0] w_hit_16;
  
    assign w_hit_16={w_hit15_1,w_hit14_1,w_hit13_1,w_hit12_1,w_hit11_1,w_hit10_1,w_hit9_1,w_hit8_1,w_hit7_1,w_hit6_1,w_hit5_1,w_hit4_1,w_hit3_1,w_hit2_1,w_hit1_1,w_hit0_1};
    //ÊäÈëÐÅºÅ·Ö½â
     wire  [33:0] w_paddr_pmp_addr_34;
    wire  [1:0] w_paddr_pmp_mode_2;
    wire [1:0] w_paddr_pmp_itype_2;
    reg [4:0] w_pmp_paddr_mcause_5; 
    wire [3:0]  w_l1_way_4;
    assign {w_l1_way_4,w_index_6,w_paddr_pmp_addr_34,w_paddr_pmp_mode_2,w_paddr_pmp_itype_2}=i_paddr_pmp_data_48;
    wire [31:0] i_csr_pmp_pmpcfg0,i_csr_pmp_pmpcfg1,i_csr_pmp_pmpcfg2,i_csr_pmp_pmpcfg3,i_csr_pmp_pmpaddr0,i_csr_pmp_pmpaddr1,i_csr_pmp_pmpaddr2,i_csr_pmp_pmpaddr3,i_csr_pmp_pmpaddr4,i_csr_pmp_pmpaddr5,i_csr_pmp_pmpaddr6,i_csr_pmp_pmpaddr7,i_csr_pmp_pmpaddr8,i_csr_pmp_pmpaddr9,i_csr_pmp_pmpaddr10,i_csr_pmp_pmpaddr11,i_csr_pmp_pmpaddr12,i_csr_pmp_pmpaddr13,i_csr_pmp_pmpaddr14,i_csr_pmp_pmpaddr15;
    assign { i_csr_pmp_pmpcfg0,i_csr_pmp_pmpcfg1,i_csr_pmp_pmpcfg2,i_csr_pmp_pmpcfg3,i_csr_pmp_pmpaddr0,i_csr_pmp_pmpaddr1,i_csr_pmp_pmpaddr2,i_csr_pmp_pmpaddr3,i_csr_pmp_pmpaddr4,i_csr_pmp_pmpaddr5,i_csr_pmp_pmpaddr6,i_csr_pmp_pmpaddr7,i_csr_pmp_pmpaddr8,i_csr_pmp_pmpaddr9,i_csr_pmp_pmpaddr10,i_csr_pmp_pmpaddr11,i_csr_pmp_pmpaddr12,i_csr_pmp_pmpaddr13,i_csr_pmp_pmpaddr14,i_csr_pmp_pmpaddr15}=i_csr_pmp_data_640;

    wire w_drive0_1,w_drive1_1,w_drive2_1,w_drive3_1,w_drive4_1,w_drive5_1,w_drive6_1,w_drive7_1;
    wire w_drive8_1,w_drive9_1,w_drive10_1,w_drive11_1,w_drive12_1,w_drive13_1,w_drive14_1,w_drive15_1;
    wire w_free0_1,w_free1_1,w_free2_1,w_free3_1,w_free4_1,w_free5_1,w_free6_1,w_free7_1;
    wire w_free8_1,w_free9_1,w_free10_1,w_free11_1,w_free12_1,w_free13_1,w_free14_1,w_free15_1;
    wire w_driveNext0_1,w_driveNext1_1,w_driveNext2_1,w_driveNext3_1,w_driveNext4_1,w_driveNext5_1,w_driveNext6_1,w_driveNext7_1;
    wire w_driveNext8_1,w_driveNext9_1,w_driveNext10_1,w_driveNext11_1,w_driveNext12_1,w_driveNext13_1,w_driveNext14_1,w_driveNext15_1;
    
    wire w_fork_pmpmatch_driveNext0_1,w_fork_pmpmatch_driveNext1_1,w_fork_pmpmatch_driveNext2_1,w_fork_pmpmatch_driveNext3_1,w_fork_pmpmatch_driveNext4_1,w_fork_pmpmatch_driveNext5_1,w_fork_pmpmatch_driveNext6_1,w_fork_pmpmatch_driveNext7_1,w_fork_pmpmatch_driveNext8_1,w_fork_pmpmatch_driveNext9_1,w_fork_pmpmatch_driveNext10_1,w_fork_pmpmatch_driveNext11_1,w_fork_pmpmatch_driveNext12_1,w_fork_pmpmatch_driveNext13_1,w_fork_pmpmatch_driveNext14_1,w_fork_pmpmatch_driveNext15_1;
    wire w_pmpmatch_fork_free0_1,w_pmpmatch_fork_free1_1,w_pmpmatch_fork_free2_1,w_pmpmatch_fork_free3_1,w_pmpmatch_fork_free4_1,w_pmpmatch_fork_free5_1,w_pmpmatch_fork_free6_1,w_pmpmatch_fork_free7_1,w_pmpmatch_fork_free8_1,w_pmpmatch_fork_free9_1,w_pmpmatch_fork_free10_1,w_pmpmatch_fork_free11_1,w_pmpmatch_fork_free12_1,w_pmpmatch_fork_free13_1,w_pmpmatch_fork_free14_1,w_pmpmatch_fork_free15_1;
    wire w_merge_pmpmatch_free0_1,w_merge_pmpmatch_free1_1,w_merge_pmpmatch_free2_1,w_merge_pmpmatch_free3_1,w_merge_pmpmatch_free4_1,w_merge_pmpmatch_free5_1,w_merge_pmpmatch_free6_1,w_merge_pmpmatch_free7_1,w_merge_pmpmatch_free8_1,w_merge_pmpmatch_free9_1,w_merge_pmpmatch_free10_1,w_merge_pmpmatch_free11_1,w_merge_pmpmatch_free12_1,w_merge_pmpmatch_free13_1,w_merge_pmpmatch_free14_1,w_merge_pmpmatch_free15_1;
    wire w_pmpmatch_merge_driveNext0_1,w_pmpmatch_merge_driveNext1_1,w_pmpmatch_merge_driveNext2_1,w_pmpmatch_merge_driveNext3_1,w_pmpmatch_merge_driveNext4_1,w_pmpmatch_merge_driveNext5_1,w_pmpmatch_merge_driveNext6_1,w_pmpmatch_merge_driveNext7_1,w_pmpmatch_merge_driveNext8_1,w_pmpmatch_merge_driveNext9_1,w_pmpmatch_merge_driveNext10_1,w_pmpmatch_merge_driveNext11_1,w_pmpmatch_merge_driveNext12_1,w_pmpmatch_merge_driveNext13_1,w_pmpmatch_merge_driveNext14_1,w_pmpmatch_merge_driveNext15_1;



    
    wire w_pmp_paddr_free0_1,w_pmp_paddr_free1_1,w_pmp_paddr_free2_1,w_pmp_paddr_free3_1;
    wire w_fifo0_fork0_drive_1,w_fork0_fifo0_free_1,w_fifo0_fire_1;
	reg [3:0] r_l1_way_4;
 	reg [5:0] r_index_6;
	reg [33:0] r_paddr_pmp_addr_34;
	reg [1:0] r_paddr_pmp_mode_2;
	reg [1:0] r_paddr_pmp_itype_2;
    cFifo1_pmp cFifo1_test0(
		.i_drive(i_paddr_pmp_drive_1),
		.i_freeNext(w_fork0_fifo0_free_1),
		.o_free(o_pmp_paddr_free_1),
		.o_driveNext(w_fifo0_fork0_drive_1),
		.o_fire_1(w_fifo0_fire_1),
		.rstn(rstn)
	);
     always @(negedge rstn or posedge w_fifo0_fire_1)begin 
	if (!rstn ) begin
	r_l1_way_4<=4'b0;
	r_index_6<=6'b0;
	r_paddr_pmp_addr_34<=34'b0;
	r_paddr_pmp_mode_2<=2'b0;
	r_paddr_pmp_itype_2<=2'b0;
	end
	else begin
	r_l1_way_4<=w_l1_way_4;
	r_index_6<=w_index_6;
	r_paddr_pmp_addr_34<=w_paddr_pmp_addr_34;
	r_paddr_pmp_mode_2<=w_paddr_pmp_mode_2;
	r_paddr_pmp_itype_2<=w_paddr_pmp_itype_2;
	end
	end
     wire w_pmpmatch_fork_freedelay0_1,w_pmpmatch_fork_freedelay1_1,w_pmpmatch_fork_freedelay2_1,w_pmpmatch_fork_freedelay3_1,w_pmpmatch_fork_freedelay4_1,w_pmpmatch_fork_freedelay5_1,w_pmpmatch_fork_freedelay6_1,w_pmpmatch_fork_freedelay7_1,w_pmpmatch_fork_freedelay8_1,w_pmpmatch_fork_freedelay9_1,w_pmpmatch_fork_freedelay10_1,w_pmpmatch_fork_freedelay11_1,w_pmpmatch_fork_freedelay12_1,w_pmpmatch_fork_freedelay13_1,w_pmpmatch_fork_freedelay14_1,w_pmpmatch_fork_freedelay15_1;
    
delay8U fork0_delay(
		.inR  (w_pmpmatch_fork_free0_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay0_1)
	);

delay8U fork1_delay(
		.inR  (w_pmpmatch_fork_free1_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay1_1)
	);

delay8U fork2_delay(
		.inR  (w_pmpmatch_fork_free2_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay2_1)
	);

delay8U fork3_delay(
		.inR  (w_pmpmatch_fork_free3_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay3_1)
	);

delay8U fork4_delay(
		.inR  (w_pmpmatch_fork_free4_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay4_1)
	);

delay8U fork5_delay(
		.inR  (w_pmpmatch_fork_free5_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay5_1)
	);

delay8U fork6_delay(
		.inR  (w_pmpmatch_fork_free6_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay6_1)
	);
delay8U fork7_delay(
		.inR  (w_pmpmatch_fork_free7_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay7_1)
	);

delay8U fork8_delay(
		.inR  (w_pmpmatch_fork_free8_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay8_1)
	);

delay8U fork9_delay(
		.inR  (w_pmpmatch_fork_free9_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay9_1)
	);

delay8U fork10_delay(
		.inR  (w_pmpmatch_fork_free10_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay10_1)
	);
delay8U fork11_delay(
		.inR  (w_pmpmatch_fork_free11_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay11_1)
	);

delay8U fork12_delay(
		.inR  (w_pmpmatch_fork_free12_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay12_1)
	);

delay8U fork13_delay(
		.inR  (w_pmpmatch_fork_free13_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay13_1)
	);


delay8U fork14_delay(
		.inR  (w_pmpmatch_fork_free14_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay14_1)
	);

delay8U fork15_delay(
		.inR  (w_pmpmatch_fork_free15_1),
		.rstn  (rstn),
		.outR (w_pmpmatch_fork_freedelay15_1)
	);



 cSplitter16_pmp cCopyFork16_test(
    // global reset signal
    .rstn(rstn),
    // left
    .i_drive(w_fifo0_fork0_drive_1),
    .o_free(w_fork0_fifo0_free_1),
    // right0
    
    .o_driveNext0(w_fork_pmpmatch_driveNext0_1),
    .i_freeNext0(w_pmpmatch_fork_freedelay0_1),
    // right1
    .o_driveNext1(w_fork_pmpmatch_driveNext1_1),
    .i_freeNext1(w_pmpmatch_fork_freedelay1_1),
    // right2
    .o_driveNext2(w_fork_pmpmatch_driveNext2_1),
    .i_freeNext2(w_pmpmatch_fork_freedelay2_1),
    // right3
    .o_driveNext3(w_fork_pmpmatch_driveNext3_1),
    .i_freeNext3(w_pmpmatch_fork_freedelay3_1),
   
    .o_driveNext4(w_fork_pmpmatch_driveNext4_1),
    .i_freeNext4(w_pmpmatch_fork_freedelay4_1),
    
    .o_driveNext5(w_fork_pmpmatch_driveNext5_1),
    .i_freeNext5(w_pmpmatch_fork_freedelay5_1),
    
    .o_driveNext6(w_fork_pmpmatch_driveNext6_1),
    .i_freeNext6(w_pmpmatch_fork_freedelay6_1),
    
    .o_driveNext7(w_fork_pmpmatch_driveNext7_1),
    .i_freeNext7(w_pmpmatch_fork_freedelay7_1),
    
    .o_driveNext8(w_fork_pmpmatch_driveNext8_1),
    .i_freeNext8(w_pmpmatch_fork_freedelay8_1),
    
    .o_driveNext9(w_fork_pmpmatch_driveNext9_1),
    .i_freeNext9(w_pmpmatch_fork_freedelay9_1),
    
    .o_driveNext10(w_fork_pmpmatch_driveNext10_1),
    .i_freeNext10(w_pmpmatch_fork_freedelay10_1),
    
    .o_driveNext11(w_fork_pmpmatch_driveNext11_1),
    .i_freeNext11(w_pmpmatch_fork_freedelay11_1),
    
    .o_driveNext12(w_fork_pmpmatch_driveNext12_1),
    .i_freeNext12(w_pmpmatch_fork_freedelay12_1),
    
    .o_driveNext13(w_fork_pmpmatch_driveNext13_1),
    .i_freeNext13(w_pmpmatch_fork_freedelay13_1),
    
    .o_driveNext14(w_fork_pmpmatch_driveNext14_1),
    .i_freeNext14(w_pmpmatch_fork_freedelay14_1),
    
    .o_driveNext15(w_fork_pmpmatch_driveNext15_1),
    .i_freeNext15(w_pmpmatch_fork_freedelay15_1),

    .o_fire()
);
     
     
   wire w_mergefifo0_1,w_mergefifo1_1,w_mergefifo2_1,w_mergefifo3_1,w_mergefifo4_1,w_mergefifo5_1,w_mergefifo6_1,w_mergefifo7_1,w_mergefifo8_1,w_mergefifo_9,w_mergefifo10_1,w_mergefifo11_1,w_mergefifo12_1,w_mergefifo13_1,w_mergefifo14_1,w_mergefifo15_1;
   


wire w_fifo_pmpmatch0_free_1,w_fifo_pmpmatch1_free_1,w_fifo_pmpmatch2_free_1,w_fifo_pmpmatch3_free_1,w_fifo_pmpmatch4_free_1,w_fifo_pmpmatch5_free_1,w_fifo_pmpmatch6_free_1,w_fifo_pmpmatch7_free_1,w_fifo_pmpmatch8_free_1,w_fifo_pmpmatch9_free_1,w_fifo_pmpmatch10_free_1,w_fifo_pmpmatch11_free_1,w_fifo_pmpmatch12_free_1,w_fifo_pmpmatch13_free_1,w_fifo_pmpmatch14_free_1,w_fifo_pmpmatch15_free_1; 


wire w_pmpmatch0_fifo0_1,w_pmpmatch1_fifo1_1,w_pmpmatch2_fifo2_1,w_pmpmatch3_fifo3_1,w_pmpmatch4_fifo4_1,w_pmpmatch5_fifo5_1,w_pmpmatch6_fifo6_1,w_pmpmatch7_fifo7_1,w_pmpmatch8_fifo8_1,w_pmpmatch9_fifo9_1,w_pmpmatch10_fifo10_1,w_pmpmatch11_fifo11_1,w_pmpmatch12_fifo12_1,w_pmpmatch13_fifo13_1,w_pmpmatch14_fifo14_1,w_pmpmatch15_fifo15_1;
 
wire w_merge_fifo0_free_1,w_merge_fifo1_free_1,w_merge_fifo2_free_1,w_merge_fifo3_free_1,w_merge_fifo4_free_1,w_merge_fifo5_free_1,w_merge_fifo6_free_1,w_merge_fifo7_free_1,w_merge_fifo8_free_1,w_merge_fifo9_free_1,w_merge_fifo10_free_1,w_merge_fifo11_free_1,w_merge_fifo12_free_1,w_merge_fifo13_free_1,w_merge_fifo14_free_1,w_merge_fifo15_free_1;
 
wire w_fifo0_merge_drive_1,w_fifo1_merge_drive_1,w_fifo2_merge_drive_1,w_fifo3_merge_drive_1,w_fifo4_merge_drive_1,w_fifo5_merge_drive_1,w_fifo6_merge_drive_1,w_fifo7_merge_drive_1,w_fifo8_merge_drive_1,w_fifo9_merge_drive_1,w_fifo10_merge_drive_1,w_fifo11_merge_drive_1,w_fifo12_merge_drive_1,w_fifo13_merge_drive_1,w_fifo14_merge_drive_1,w_fifo15_merge_drive_1;
mmu_pmpmatch pmpmatch0( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext0_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch0_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg0[4:3]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(0),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr0),
     .o_pmpmatch_pmp_hit_1(w_hit0_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch0_fifo0_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free0_1)
     );


	cFifo1_pmp cFifo1_pmpmatch0(
.i_drive(w_pmpmatch0_fifo0_1),
.i_freeNext(w_merge_fifo0_free_1),
.o_free(w_fifo_pmpmatch0_free_1),
.o_driveNext(w_fifo0_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);
     
     mmu_pmpmatch pmpmatch1( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext1_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch1_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg0[12:11]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr0),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr1),
     .o_pmpmatch_pmp_hit_1(w_hit1_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch1_fifo1_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free1_1)
     );
     
cFifo1_pmp cFifo1_pmpmatch1(
.i_drive(w_pmpmatch1_fifo1_1),
.i_freeNext(w_merge_fifo1_free_1),
.o_free(w_fifo_pmpmatch1_free_1),
.o_driveNext(w_fifo1_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);

      mmu_pmpmatch pmpmatch2( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext2_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch2_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg0[20:19]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr1),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr2),
     .o_pmpmatch_pmp_hit_1(w_hit2_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch2_fifo2_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free2_1)
     );

     cFifo1_pmp cFifo1_pmpmatch2(
.i_drive(w_pmpmatch2_fifo2_1),
.i_freeNext(w_merge_fifo2_free_1),
.o_free(w_fifo_pmpmatch2_free_1),
.o_driveNext(w_fifo2_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);

      mmu_pmpmatch pmpmatch3( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext3_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch3_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg0[28:27]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr2),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr3),
     .o_pmpmatch_pmp_hit_1(w_hit3_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch3_fifo3_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free3_1)
     );

     cFifo1_pmp cFifo1_pmpmatch3(
.i_drive(w_pmpmatch3_fifo3_1),
.i_freeNext(w_merge_fifo3_free_1),
.o_free(w_fifo_pmpmatch3_free_1),
.o_driveNext(w_fifo3_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);

      mmu_pmpmatch pmpmatch4( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext4_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch4_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg1[4:3]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr3),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr4),
     .o_pmpmatch_pmp_hit_1(w_hit4_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch4_fifo4_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free4_1)
     );
    cFifo1_pmp cFifo1_pmpmatch4(
.i_drive(w_pmpmatch4_fifo4_1),
.i_freeNext(w_merge_fifo4_free_1),
.o_free(w_fifo_pmpmatch4_free_1),
.o_driveNext(w_fifo4_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);
     mmu_pmpmatch pmpmatch5( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext5_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch5_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg1[12:11]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr4),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr5),
     .o_pmpmatch_pmp_hit_1(w_hit5_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch5_fifo5_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free5_1)
     );
     
cFifo1_pmp cFifo1_pmpmatch5(
.i_drive(w_pmpmatch5_fifo5_1),
.i_freeNext(w_merge_fifo5_free_1),
.o_free(w_fifo_pmpmatch5_free_1),
.o_driveNext(w_fifo5_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);



      mmu_pmpmatch pmpmatch6( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext6_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch6_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg1[20:19]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr5),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr6),
     .o_pmpmatch_pmp_hit_1(w_hit6_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch6_fifo6_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free6_1)
     );
     
cFifo1_pmp cFifo1_pmpmatch6(
.i_drive(w_pmpmatch6_fifo6_1),
.i_freeNext(w_merge_fifo6_free_1),
.o_free(w_fifo_pmpmatch6_free_1),
.o_driveNext(w_fifo6_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);


      mmu_pmpmatch pmpmatch7( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext7_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch7_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg1[28:27]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr6),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr7),
     .o_pmpmatch_pmp_hit_1(w_hit7_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch7_fifo7_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free7_1)
     );
     

cFifo1_pmp cFifo1_pmpmatch7(
.i_drive(w_pmpmatch7_fifo7_1),
.i_freeNext(w_merge_fifo7_free_1),
.o_free(w_fifo_pmpmatch7_free_1),
.o_driveNext(w_fifo7_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);

      mmu_pmpmatch pmpmatch8( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext8_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch8_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg2[4:3]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr7),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr8),
     .o_pmpmatch_pmp_hit_1(w_hit8_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch8_fifo8_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free8_1)
     );
cFifo1_pmp cFifo1_pmpmatch8(
.i_drive(w_pmpmatch8_fifo8_1),
.i_freeNext(w_merge_fifo8_free_1),
.o_free(w_fifo_pmpmatch8_free_1),
.o_driveNext(w_fifo8_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);     


      mmu_pmpmatch pmpmatch9( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext9_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch9_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg2[12:11]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr8),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr9),
     .o_pmpmatch_pmp_hit_1(w_hit9_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch9_fifo9_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free9_1)
     );

cFifo1_pmp cFifo1_pmpmatch9(
.i_drive(w_pmpmatch9_fifo9_1),
.i_freeNext(w_merge_fifo9_free_1),
.o_free(w_fifo_pmpmatch9_free_1),
.o_driveNext(w_fifo9_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);
     
      mmu_pmpmatch pmpmatch10( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext10_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch10_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg2[20:19]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr9),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr10),
     .o_pmpmatch_pmp_hit_1(w_hit10_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch10_fifo10_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free10_1)
     );
     
cFifo1_pmp cFifo1_pmpmatch10(
.i_drive(w_pmpmatch10_fifo10_1),
.i_freeNext(w_merge_fifo10_free_1),
.o_free(w_fifo_pmpmatch10_free_1),
.o_driveNext(w_fifo10_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);

     mmu_pmpmatch pmpmatch11( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext11_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch11_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg2[28:27]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr10),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr11),
     .o_pmpmatch_pmp_hit_1(w_hit11_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch11_fifo11_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free11_1)
     );
     
cFifo1_pmp cFifo1_pmpmatch11(
.i_drive(w_pmpmatch11_fifo11_1),
.i_freeNext(w_merge_fifo11_free_1),
.o_free(w_fifo_pmpmatch11_free_1),
.o_driveNext(w_fifo11_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);

      mmu_pmpmatch pmpmatch12( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext12_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch12_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg3[4:3]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr11),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr12),
     .o_pmpmatch_pmp_hit_1(w_hit12_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch12_fifo12_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free12_1)
     );
     
cFifo1_pmp cFifo1_pmpmatch12(
.i_drive(w_pmpmatch12_fifo12_1),
.i_freeNext(w_merge_fifo12_free_1),
.o_free(w_fifo_pmpmatch12_free_1),
.o_driveNext(w_fifo12_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);

      mmu_pmpmatch pmpmatch13( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext13_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch13_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg3[12:11]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr12),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr13),
     .o_pmpmatch_pmp_hit_1(w_hit13_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch13_fifo13_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free13_1)
     );
     
     cFifo1_pmp cFifo1_pmpmatch13(
.i_drive(w_pmpmatch13_fifo13_1),
.i_freeNext(w_merge_fifo13_free_1),
.o_free(w_fifo_pmpmatch13_free_1),
.o_driveNext(w_fifo13_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);
      mmu_pmpmatch pmpmatch14( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext14_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch14_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg3[20:19]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr13),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr14),
     .o_pmpmatch_pmp_hit_1(w_hit14_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch14_fifo14_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free14_1)
     );
     
cFifo1_pmp cFifo1_pmpmatch14(
.i_drive(w_pmpmatch14_fifo14_1),
.i_freeNext(w_merge_fifo14_free_1),
.o_free(w_fifo_pmpmatch14_free_1),
.o_driveNext(w_fifo14_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);

      mmu_pmpmatch pmpmatch15( 
     .i_pmp_pmpmatch_drive_1(w_fork_pmpmatch_driveNext15_1),
     .i_pmpmatch_pmp_freenext_1(w_fifo_pmpmatch15_free_1),
     .rstn(rstn),
     .i_paddrProduct_pmp_addr_32(r_paddr_pmp_addr_34[33:2]),
     .i_paddrProduct_pmp_mode_2(i_csr_pmp_pmpcfg3[28:27]),
     .i_csrFetch_pmpmatch_pmpaddrbottom_32(i_csr_pmp_pmpaddr14),
     .i_csrFetch_pmpmatch_pmpaddrtop_32(i_csr_pmp_pmpaddr15),
     .o_pmpmatch_pmp_hit_1(w_hit15_1),
     .o_pmpmatch_pmp_drivenext_1(w_pmpmatch15_fifo15_1),
     .o_pmpmatch_pmp_free_1(w_pmpmatch_fork_free15_1)
     );

     cFifo1_pmp cFifo1_pmpmatch15(
.i_drive(w_pmpmatch15_fifo15_1),
.i_freeNext(w_merge_fifo15_free_1),
.o_free(w_fifo_pmpmatch15_free_1),
.o_driveNext(w_fifo15_merge_drive_1),
.o_fire_1(),
.rstn(rstn)
);
   
wire w_merge2_merge1_free0_1,w_merge2_merge1_free1_1;
wire w_merge1_merge2_drive0_1,w_merge1_merge2_drive1_1;
   
    cWaitMerge8_pmp WaitMerge8_test0(
.i_drive0(w_fifo0_merge_drive_1),
.i_drive1(w_fifo1_merge_drive_1),
.i_drive2(w_fifo2_merge_drive_1),
.i_drive3(w_fifo3_merge_drive_1),
.i_drive4(w_fifo4_merge_drive_1),
.i_drive5(w_fifo5_merge_drive_1),
.i_drive6(w_fifo6_merge_drive_1),
.i_drive7(w_fifo7_merge_drive_1),
.i_freeNext(w_merge2_merge1_free0_1),
.rstn(rstn),
.o_free0(w_merge_fifo0_free_1),
.o_free1(w_merge_fifo1_free_1),
.o_free2(w_merge_fifo2_free_1),
.o_free3(w_merge_fifo3_free_1),
.o_free4(w_merge_fifo4_free_1),
.o_free5(w_merge_fifo5_free_1),
.o_free6(w_merge_fifo6_free_1),
.o_free7(w_merge_fifo7_free_1),
.o_driveNext(w_merge1_merge2_drive0_1)
);

  cWaitMerge8_pmp WaitMerge8_test1(
.i_drive0(w_fifo8_merge_drive_1),
.i_drive1(w_fifo9_merge_drive_1),
.i_drive2(w_fifo10_merge_drive_1),
.i_drive3(w_fifo11_merge_drive_1),
.i_drive4(w_fifo12_merge_drive_1),
.i_drive5(w_fifo13_merge_drive_1),
.i_drive6(w_fifo14_merge_drive_1),
.i_drive7(w_fifo15_merge_drive_1),
.i_freeNext(w_merge2_merge1_free1_1),
.rstn(rstn),
.o_free0(w_merge_fifo8_free_1),
.o_free1(w_merge_fifo9_free_1),
.o_free2(w_merge_fifo10_free_1),
.o_free3(w_merge_fifo11_free_1),
.o_free4(w_merge_fifo12_free_1),
.o_free5(w_merge_fifo13_free_1),
.o_free6(w_merge_fifo14_free_1),
.o_free7(w_merge_fifo15_free_1),
.o_driveNext(w_merge1_merge2_drive1_1)
);

wire w_merge2_fifo_drive_1;
wire w_fifo_merge2_free_1;
cWaitMerge2_32b_pmp cWaitMerge2_32b_test(
.i_drive0(w_merge1_merge2_drive0_1),
.i_drive1(w_merge1_merge2_drive1_1),
.i_data0_32(),
.i_data1_32(),
.i_freeNext(w_fifo_merge2_free_1),
.rstn(rstn),
.o_free0(w_merge2_merge1_free0_1),
.o_free1(w_merge2_merge1_free1_1),
.o_driveNext(w_merge2_fifo_drive_1),
.o_data_64()
);
     
     wire fire,w_pmp_paddr_drivenext0_1,w_pmp_paddr_drivenext1_1;
    cFifo1_pmp cFifo1_test1(
.i_drive(w_merge2_fifo_drive_1),
.i_freeNext(i_paddr_pmp_freenext_1),
.o_free(w_fifo_merge2_free_1),
.o_driveNext(o_pmp_paddr_drivenext_1),
.o_fire_1(fire),
.rstn(rstn)
);



/*delay16U cFifo1_delay0(
		.inR  (w_pmp_paddr_drivenext0_1),
		.rstn  (rstn),
		.outR (o_pmp_paddr_drivenext_1)
	);*/


/*delay16U cFifo1_delay1(
		.inR  (w_pmp_paddr_drivenext1_1),
		.rstn  (rstn),
		.outR (o_pmp_paddr_drivenext_1)
	);*/

 reg [3:0]w_authority_4;
 always @(fire)
begin
  casez(w_hit_16[15:0])
    16'b????_???_????_????_1 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg0[7],i_csr_pmp_pmpcfg0[2:0]} ; //4B
    16'b????_???_????_???1_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg0[15],i_csr_pmp_pmpcfg0[10:8]} ; //4B
    16'b????_???_????_??10_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg0[23],i_csr_pmp_pmpcfg0[18:16]} ; //4B 
    16'b????_???_????_?100_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg0[31],i_csr_pmp_pmpcfg0[26:24]} ;
    
    16'b????_???_????_1000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg1[7],i_csr_pmp_pmpcfg1[2:0]} ; //4B
    16'b????_???_???1_0000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg1[15],i_csr_pmp_pmpcfg1[10:8]} ; //4B
    16'b????_???_??10_0000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg1[23],i_csr_pmp_pmpcfg1[18:16]} ; //4B 
    16'b????_???_?100_0000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg1[31],i_csr_pmp_pmpcfg1[26:24]} ;
    
    16'b????_???_1000_0000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg2[7],i_csr_pmp_pmpcfg2[2:0]} ; //4B
    16'b????_??1_0000_0000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg2[15],i_csr_pmp_pmpcfg2[10:8]} ; //4B
    16'b????_?10_0000_0000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg2[23],i_csr_pmp_pmpcfg2[18:16]} ; //4B 
    16'b????_100_0000_0000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg2[31],i_csr_pmp_pmpcfg2[26:24]} ;
    
    16'b???1_000_0000_0000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg3[7],i_csr_pmp_pmpcfg3[2:0]} ; //4B
    16'b??10_000_0000_0000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg3[15],i_csr_pmp_pmpcfg3[10:8]} ; //4B
    16'b?100_000_0000_0000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg3[23],i_csr_pmp_pmpcfg3[18:16]} ; //4B 
    16'b1000_000_0000_0000_0 : w_authority_4[3:0] ={i_csr_pmp_pmpcfg3[31],i_csr_pmp_pmpcfg3[26:24]} ;
    default:w_authority_4=4'b0000;
    endcase
    end
  always @(*) begin
  //Èç¹û
    if ( w_authority_4[3] == 1'b1) begin
       //¿ÉÖ´ÐÐÒì³£
        if (w_authority_4[2]==1'b0 && r_paddr_pmp_itype_2==2'b00)begin
            w_pmp_paddr_mcause_5=5'h1;
        end
        //Ð´È¨ÏÞÒì³£
        else if (w_authority_4[1]==1'b0 && r_paddr_pmp_itype_2==2'b10)begin
            w_pmp_paddr_mcause_5=5'h7;
        end
        //¶ÁÈ¨ÏÞÒì³£
        else  if (w_authority_4[0]==1'b0 && r_paddr_pmp_itype_2==2'b11)begin
            w_pmp_paddr_mcause_5=5'h5;
        end
        else
        //ÎÞÒì³£
        w_pmp_paddr_mcause_5=5'h0;
    end
    else if (r_paddr_pmp_mode_2 != 2'b11 )begin
    if (w_authority_4[2]==1'b0 && r_paddr_pmp_itype_2==2'b00)begin
            w_pmp_paddr_mcause_5=5'h1;
        end
        else if (w_authority_4[1]==1'b0 && r_paddr_pmp_itype_2==2'b10)begin
            w_pmp_paddr_mcause_5=5'h7;
        end
        else  if (w_authority_4[0]==1'b0 && r_paddr_pmp_itype_2==2'b11)begin
            w_pmp_paddr_mcause_5=5'h5;
        end
         else
        //ÎÞÒì³£
        w_pmp_paddr_mcause_5=5'h0;
    end
    else  w_pmp_paddr_mcause_5=5'h0;
end

    assign o_pmp_paddr_data_51={r_l1_way_4,r_index_6,w_pmp_paddr_mcause_5,r_paddr_pmp_itype_2,r_paddr_pmp_addr_34};
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: mmu_pmpout
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


module mmu_pmpout(
	input 			rstn,
	input 	[50:0] 		i_pmp_pmpout_data_51,
	input 			i_pmp_pmpout_drive_1,
	output 			o_pmpout_pmp_free_1,

	input 			i_lsu_pmpout_free_1,
	output 			o_pmpout_lsu_drive_1,
	output 	[37:0] 		o_pmpout_lsu_data_38,

	input 			i_retire_pmpout_free_1,
	output 			o_pmpout_retire_drive_1,
	output 	[10:0] 		o_pmpout_retire_data_11,

	input 			i_ifu_pmpout_free_1,
	output 			o_pmpout_ifu_drive_1,
	output 	[33:0]		o_pmpout_ifu_data_34,

	input 			i_exp_pmpout_free_1,
	output 			o_pmpout_exp_drive_1,
	output 	[4:0] 		o_pmpout_exp_data_5
    );
    
    wire [5:0]			w_index_6;
    wire [4:0] 			w_mcause_5;
    wire [1:0]			w_itype_2;
    wire [33:0] 		w_paddr_34;
    wire [1:0]			w_error_2;
    wire [3:0] 			w_l1_way_4;

    reg [5:0]			r_index_6;
    reg [4:0] 			r_mcause_5;
    reg [1:0]			r_itype_2;
    reg [33:0] 			r_paddr_34;
    reg [3:0] 			r_l1_way_4;

	
    assign{w_l1_way_4,w_index_6,w_mcause_5,w_itype_2,w_paddr_34}=i_pmp_pmpout_data_51;

wire w_fork1_fifo0_free_1,w_fifo0_fork1_drive_1,w_fifo0_fire_1;
 cFifo1_pmp cFifo1_test0(
		.i_drive(i_pmp_pmpout_drive_1),
		.i_freeNext(w_fork1_fifo0_free_1),
		.o_free(o_pmpout_pmp_free_1),
		.o_driveNext(w_fifo0_fork1_drive_1),
		.o_fire_1(w_fifo0_fire_1),
		.rstn(rstn)
	);
     always @(negedge rstn or posedge w_fifo0_fire_1)begin 
	if (!rstn ) begin

	r_index_6<=6'b0;
	r_mcause_5<=5'b0;
	r_itype_2<=2'b0;
	r_paddr_34<=34'b0;
	r_l1_way_4<=4'b0;

	end
	else begin
	r_index_6<=w_index_6;
	r_mcause_5<=w_mcause_5;
	r_itype_2<=w_itype_2;
	r_paddr_34<=w_paddr_34;
	r_l1_way_4<=w_l1_way_4;
	end
	end
    
	assign o_pmpout_lsu_data_38={r_l1_way_4,r_paddr_34};
	assign o_pmpout_retire_data_11={r_index_6,r_mcause_5};
	assign o_pmpout_ifu_data_34=r_paddr_34;
	assign o_pmpout_exp_data_5=r_mcause_5;
	assign w_error_2=(r_mcause_5==5'b0)?2'b10:2'b01;
 
    //wire w_pmp_paddr_drive_1;
    wire [2:0] w_select1_3;
    wire w_paddr_pmp_free_1;
    wire w_fork1_fork2_drive_1,w_fork1_fork3_drive_1,w_fork1_fork4_drive_1;
    wire w_fork2_fork1_free_1,w_fork3_fork1_free_1,w_fork4_fork1_free_1;
    
    assign w_select1_3 = (r_itype_2 == 2'b11) ? 3'b010 : (r_itype_2 == 2'b10) ? 3'b001 : 3'b100;  
    
    cSelector3_pmp fork1(
		.i_drive(w_fifo0_fork1_drive_1), 
		.i_data_3(w_select1_3), 
		.o_free(w_fork1_fifo0_free_1),

		.o_driveNext0(w_fork1_fork2_drive_1), 
		.i_freeNext0(w_fork2_fork1_free_1), 

		.o_driveNext1(w_fork1_fork3_drive_1), 
		.i_freeNext1(w_fork3_fork1_free_1),

		.o_driveNext2(w_fork1_fork4_drive_1), 
		.i_freeNext2(w_fork4_fork1_free_1),
		.rstn(rstn)
    );

    wire w_fork2_fork5_drive_1,w_fork2_merge1_drive_1;
    wire w_merge1_fork2_free_1,w_fork5_fork2_free_1;
    
    cSelector2_pmp fork2(
		.i_drive(w_fork1_fork2_drive_1), 
		.o_free(w_fork2_fork1_free_1),
		.i_data_2(w_error_2),

		.o_driveNext0(w_fork2_merge1_drive_1),
		.i_freeNext0(w_merge1_fork2_free_1),

		.o_driveNext1(w_fork2_fork5_drive_1),
		.i_freeNext1(w_fork5_fork2_free_1),

		.rstn(rstn)
	);

	wire w_fork3_merge1_drive_1,w_fork3_merge2_drive_1;
	wire w_merge1_fork3_free_1,w_merge2_fork3_free_1;

	cSelector2_pmp fork3(
		.i_drive(w_fork1_fork3_drive_1), 
		.o_free(w_fork3_fork1_free_1),
		.i_data_2(w_error_2),

		.o_driveNext0(w_fork3_merge1_drive_1),
		.i_freeNext0(w_merge1_fork3_free_1),

		.o_driveNext1(w_fork3_merge2_drive_1),
		.i_freeNext1(w_merge2_fork3_free_1),

		.rstn(rstn)
	);

	wire [1:0] w_select4_2;
	wire w_fork4_error_drive_1,w_fork4_if_drive_1;
	wire w_error_fork4_free_1,w_if_fork4_free_1;

	cSelector2_pmp fork4(
		.i_drive(w_fork1_fork4_drive_1), 
		.o_free(w_fork4_fork1_free_1),

		.i_data_2(w_error_2),

		.o_driveNext0(o_pmpout_exp_drive_1),
		.i_freeNext0(i_exp_pmpout_free_1),

		.o_driveNext1(o_pmpout_ifu_drive_1),
		.i_freeNext1(i_ifu_pmpout_free_1),

		.rstn(rstn)
	);

wire [1:0] w_select5_2;
	wire w_fork5_merge1_drive_1,w_fork5_merge2_drive_1;
	wire w_merge1_fork5_free_1,w_merge2_fork5_free_1;

/*	cSplitter2_pmp fork5(
		.i_drive(w_fork2_fork5_drive_1), 
		.o_free(w_fork5_fork2_free_1),

		.o_driveNext0(w_fork5_merge1_drive_1),
		.i_freeNext0(w_merge1_fork5_free_1),

		.o_driveNext1(w_fork5_merge2_drive_1),
		.i_freeNext1(w_merge2_fork5_free_1),

		.rstn(rstn)
	);
	*/
	
	
	

	wire w_retire_merge1_free_1,w_merge1_retire_drive_1;
cMutexMerge2_pmp merge1(
.i_drive0(w_fork2_merge1_drive_1), 
.o_free0(w_merge1_fork2_free_1),
.i_drive1(w_fork3_merge1_drive_1), 
.o_free1(w_merge1_fork3_free_1),
.i_freeNext(i_retire_pmpout_free_1), 
.o_driveNext(o_pmpout_retire_drive_1),
.rstn(rstn)
);
	
	wire w_lsu_merge2_free_1,w_merge2_lsu_drive_1;
	cMutexMerge2_pmp merge2(
		.i_drive0(w_fork2_fork5_drive_1),
		.o_free0(w_fork5_fork2_free_1),

		.i_drive1(w_fork3_merge2_drive_1), 
		.o_free1(w_merge2_fork3_free_1),

		.i_freeNext(i_lsu_pmpout_free_1), 
		.o_driveNext(o_pmpout_lsu_drive_1), 
		.rstn(rstn)
	);   
endmodule


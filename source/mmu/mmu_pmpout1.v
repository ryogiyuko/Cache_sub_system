`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/10 11:40:43
// Design Name: 
// Module Name: pmp_out1
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


module mmu_pmpout1(
    input               rstn,
    input 	[50:0] 		i_pmp_pmpout1_data_51,
	input 				i_pmp_pmpout1_drive_1,
	output 				o_pmpout1_pmp_free_1,

	input 				i_dcache_pmpout1_free_1,
	output 				o_pmpout1_dcache_drive_1,
	output 	[37:0] 		o_pmpout1_dcache_data_38,

	input 				i_retire_pmpout1_free_1,
	output 				o_pmpout1_retire_drive_1,
	output 	[10:0] 		o_pmpou1t_retire_data_11,

	input 				i_exp_pmpout1_free_1,
	output 				o_pmpout1_exp_drive_1,
	output 	[4:0] 		o_pmpout1_exp_data_5
    );
    wire [5:0]			w_index_6;
    wire [4:0] 			w_mcause_5;
    wire [1:0]			w_itype_2;
    wire [33:0] 		w_paddr_34;
    wire [1:0]			w_error_2;
    wire [3:0]          	w_l1_way_4;

    reg [5:0]			r_index_6;
    reg [4:0] 			r_mcause_5;
    reg 			r_itype_1;
    reg [33:0] 			r_paddr_34;
    reg [3:0] 			r_l1_way_4;






wire w_fork0_fifo0_free_1,w_fifo0_fork0_drive_1,w_fifo0_fire_1;
 cFifo1_pmp cFifo1_test0(
		.i_drive(i_pmp_pmpout1_drive_1),
		.i_freeNext(w_fork0_fifo0_free_1),
		.o_free(o_pmpout1_pmp_free_1),
		.o_driveNext(w_fifo0_fork0_drive_1),
		.o_fire_1(w_fifo0_fire_1),
		.rstn(rstn)
	);
     always @(negedge rstn or posedge w_fifo0_fire_1)begin 
	if (!rstn ) begin

	r_index_6<=6'b0;
	r_mcause_5<=5'b0;
	r_itype_1<=1'b0;
	r_paddr_34<=34'b0;
	r_l1_way_4<=4'b0;

	end
	else begin
	r_index_6<=w_index_6;
	r_mcause_5<=w_mcause_5;
	r_itype_1<=w_itype_2[1];
	r_paddr_34<=w_paddr_34;
	r_l1_way_4<=w_l1_way_4;
	end
	end




    assign{w_l1_way_4,w_index_6,w_mcause_5,w_itype_2,w_paddr_34}=i_pmp_pmpout1_data_51;
    assign o_pmpout1_dcache_data_38={r_l1_way_4,r_paddr_34};
    assign o_pmpou1t_retire_data_11={r_index_6,r_mcause_5};
    assign o_pmpout1_exp_data_5=r_mcause_5;
    wire [1:0] w_fork0_data_2;
    assign w_fork0_data_2=(r_mcause_5==5'b0)?2'b01:2'b10;
    
    wire w_fork0_fork1_drive_1,w_fork1_fork0_free_1;
    
    cSelector2_pmp fork0(
     .i_drive(w_fifo0_fork0_drive_1),
     .i_freeNext0(i_dcache_pmpout1_free_1),
     .i_freeNext1(w_fork1_fork0_free_1),
     .i_data_2(w_fork0_data_2),//!¸ß4Î»ÎªvalidÎ»
    .o_free(w_fork0_fifo0_free_1),
    .o_driveNext0(o_pmpout1_dcache_drive_1),
    .o_driveNext1(w_fork0_fork1_drive_1),
    .rstn(rstn)
    );
 wire [1:0] w_fork1_data_2;
 
 assign w_fork1_data_2=(r_itype_1==1'b1) ? 2'b01:2'b10;

// assign w_fork1_data_2=(r_itype_2==2'b11 )?2'b01:
//			(r_itype_2==2'b10)?2'b01:2'b10;
 
 cSelector2_pmp fork1(
     .i_drive(w_fork0_fork1_drive_1),
     .i_freeNext0(i_retire_pmpout1_free_1),
     .i_freeNext1(i_exp_pmpout1_free_1),
     .i_data_2(w_fork1_data_2),//!¸ß4Î»ÎªvalidÎ»
     .o_free(w_fork1_fork0_free_1),
     .o_driveNext0(o_pmpout1_retire_drive_1),
     .o_driveNext1(o_pmpout1_exp_drive_1),
     .rstn(rstn)
    );

endmodule


//-----------------------------------------------
//	module name: cSelector8
//	author: 
//  modified by: 
//	version: 1st version (2024-07-11)
//-----------------------------------------------

`timescale 1ns / 1ps

module cSelector8_cache(//condfork,注意valid用o_fire结合触发器稳定住再输入
    input       rstn,         
    input       i_drive,
    output      o_free,
    output      o_fire,
    input       valid0,valid1,valid2,valid3,valid4,valid5,valid6,valid7,
    output      o_driveNext0,o_driveNext1,o_driveNext2,o_driveNext3,o_driveNext4,o_driveNext5,o_driveNext6,o_driveNext7,
    input       i_freeNext0, i_freeNext1, i_freeNext2, i_freeNext3, i_freeNext4, i_freeNext5, i_freeNext6, i_freeNext7
);



wire [1:0] w_outRRelay_2,w_outARelay_2;
wire w_fire;
wire w_freeNext;
wire w_driveNext0,w_driveNext1;

//pipeline
(* dont_touch="true" *)sender sender(
	.i_drive    (i_drive),
	.o_free     (o_free),
	.outR       (w_outRRelay_2[0]),
	.i_free     (w_fire),
	.rstn        (rstn)
);

(* dont_touch="true" *)relay relay0(
	.inR        (w_outRRelay_2[0]),
	.inA        (w_outARelay_2[0]),
	.outR       (w_outRRelay_2[1]),
	.outA       (w_outARelay_2[1]),
	.fire       (w_fire), .rstn(rstn)
);

(* dont_touch="true" *)receiver receiver(
	.inR        (w_outRRelay_2[1]),
	.inA        (w_outARelay_2[1]),
	.i_freeNext (w_freeNext), .rstn(rstn)
);

//delay here must match the time of counter to change.
(* dont_touch="true" *)delay8U outdelay0(.inR(w_fire), .outR(w_driveNext0), .rstn(rstn));

//control signal
assign o_driveNext0 = w_driveNext0 & valid0;
assign o_driveNext1 = w_driveNext0 & valid1;
assign o_driveNext2 = w_driveNext0 & valid2;
assign o_driveNext3 = w_driveNext0 & valid3;
assign o_driveNext4 = w_driveNext0 & valid4;
assign o_driveNext5 = w_driveNext0 & valid5;
assign o_driveNext6 = w_driveNext0 & valid6;
assign o_driveNext7 = w_driveNext0 & valid7;

assign o_fire = w_fire;
assign w_freeNext = i_freeNext0 | i_freeNext1 | i_freeNext2 | i_freeNext3 | i_freeNext4 | i_freeNext5 | i_freeNext6 | i_freeNext7 ;

endmodule

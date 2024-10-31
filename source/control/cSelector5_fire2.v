//-----------------------------------------------
//	module name: cSelector5_fire2
//	author: 
//  modified by: 
//	version: 1st version (2024-07-16)
//-----------------------------------------------

`timescale 1ns / 1ps

module cSelector5_fire2(//condfork,ע��valid��o_fire��ϴ������ȶ�ס������
    input       rstn,         
    input       i_drive,
    output      o_free,
    output   [1:0]   o_fire_2,
    input       valid0,valid1,valid2,valid3,valid4,//valid5,valid6,
    output      o_driveNext0,o_driveNext1,o_driveNext2,o_driveNext3,o_driveNext4,//o_driveNext5,o_driveNext6,
    input       i_freeNext0, i_freeNext1, i_freeNext2, i_freeNext3, i_freeNext4  //,i_freeNext5, i_freeNext6
);



wire [3:0] w_outRRelay_4,w_outARelay_4;
// wire w_fire;
wire w_freeNext;
wire w_driveNext0,w_driveNext1;

//pipeline
(* dont_touch="true" *)sender sender(
	.i_drive    (i_drive),
	.o_free     (o_free),
	.outR       (w_outRRelay_4[0]),
	.i_free     (w_driveNext1),
	.rstn        (rstn)
);

(* dont_touch="true" *)relay relay0(
	.inR        (w_outRRelay_4[0]),
	.inA        (w_outARelay_4[0]),
	.outR       (w_outRRelay_4[1]),
	.outA       (w_outARelay_4[1]),
	.fire       (o_fire_2[0]), .rstn(rstn)
);

wire outR_delay0,outR_delay1;
delay8U u_delay8U(
	.inR  (w_outRRelay_4[1]  ),
	.rstn  (rstn  ),
	.outR (outR_delay0 )
);
// delay4U u_delay4U(
// 	.inR  (outR_delay0  ),
// 	.rstn  (rstn  ),
// 	.outR (outR_delay1 )
// );

(* dont_touch="true" *)relay relay1(
	.inR        (outR_delay0),
	.inA        (w_outARelay_4[1]),
	.outR       (w_outRRelay_4[2]),
	.outA       (w_outARelay_4[3]),
	.fire       (), .rstn(rstn)
);

(* dont_touch="true" *)relay relay2(
	.inR(w_outRRelay_4[2]),
	.inA(w_outARelay_4[2]),
	.outR(w_outRRelay_4[3]),
	.outA(w_outARelay_4[3]),
	.fire(o_fire_2[1]), .rstn(rstn)
);

(* dont_touch="true" *)receiver receiver(
	.inR        (w_outRRelay_4[3]),
	.inA        (w_outARelay_4[3]),
	.i_freeNext (w_freeNext), .rstn(rstn)
);

//delay here must match the time of counter to change.
(* dont_touch="true" *)delay2U outdelay0(.inR(o_fire_2[1]), .outR(w_driveNext1) ,.rstn(rstn));
(* dont_touch="true" *)delay4U outdelay1 (.inR(w_driveNext1), .outR(w_driveNext0), .rstn(rstn));

//control signal
assign o_driveNext0 = w_driveNext0 & valid0;
assign o_driveNext1 = w_driveNext0 & valid1;
assign o_driveNext2 = w_driveNext0 & valid2;
assign o_driveNext3 = w_driveNext0 & valid3;
assign o_driveNext4 = w_driveNext0 & valid4;
// assign o_driveNext5 = w_driveNext0 & valid5;
// assign o_driveNext6 = w_driveNext0 & valid6;

assign w_freeNext = i_freeNext0 | i_freeNext1 | i_freeNext2 | i_freeNext3 | i_freeNext4  ;

endmodule

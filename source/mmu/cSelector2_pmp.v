/*
 * @Description: 
 * @Author: liaozz
 * @Date: 2024-07-10 18:16:22
 * @LastEditors: liaozz
 * @LastEditTime: 2024-09-02 15:15:21
 */

`timescale 1ns / 1ps

module cSelector2_pmp (
    input  wire i_drive,
    input  wire i_freeNext0,i_freeNext1,
    input  wire [1:0] i_data_2,//!¸ß4Î»ÎªvalidÎ»

    output wire o_free,
    output wire o_driveNext0,o_driveNext1,
    input wire rstn
);

wire [1:0] w_outRRelay_2,w_outARelay_2;
wire w_fire;
wire w_free_1;
wire w_freeNext;
wire w_driveNext0;

wire [2-1:0] w_valid_2;

//pipeline
(* dont_touch="true" *) sender sender(
	.i_drive(i_drive),
	.o_free(w_free_1),
	.outR(w_outRRelay_2[0]),
	.i_free(w_fire),
	.rstn(rstn)
);

(* dont_touch="true" *) relay relay0(
	.inR(w_outRRelay_2[0]),
	.inA(w_outARelay_2[0]),
	.outR(w_outRRelay_2[1]),
	.outA(w_outARelay_2[1]),
	.fire(w_fire),
	.rstn(rstn)
);

(* dont_touch="true" *) receiver receiver(
	.inR(w_outRRelay_2[1]),
	.inA(w_outARelay_2[1]),
	.i_freeNext(w_freeNext),
	.rstn(rstn)
);

assign w_valid_2 = i_data_2[1:0];


//control signal
(* dont_touch="true" *)delay1U outdelay2 (.inR(w_free_1), .outR(o_free), .rstn(rstn));
(* dont_touch="true" *) delay1U outdelay0(.inR(w_fire), .outR(w_driveNext0),.rstn(rstn));
assign o_driveNext0 = w_driveNext0 & w_valid_2[0];
assign o_driveNext1 = w_driveNext0 & w_valid_2[1];

assign w_freeNext = i_freeNext0 | i_freeNext1;
endmodule



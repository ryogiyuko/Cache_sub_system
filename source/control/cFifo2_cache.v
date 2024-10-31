//-----------------------------------------------
//	module name: cfifo2
//	author: Tong Fu, Lingzhuang Zhang
//	version: 2st version (2023-03-09)
//-----------------------------------------------
`timescale 1ns / 1ps

module cFifo2_cache( //先fire[0] 后fire[1]
    // rstn
    input           rstn,
    // From Last
    input           i_drive, 
    output          o_free, 
    // To Next
    output          o_driveNext,
    input           i_freeNext,
    // fire signal
    output  [1:0]   o_fire_2
);

wire [3:0]  w_outRRelay_4,  w_outARelay_4;
wire        w_driveNext;

//pipeline
sender sender(
	.i_drive(i_drive),
	.o_free(o_free),
	.outR(w_outRRelay_4[0]),
	.i_free(w_driveNext),
	.rstn(rstn)
);

relay relay0(
	.inR(w_outRRelay_4[0]),
	.inA(w_outARelay_4[0]),
	.outR(w_outRRelay_4[1]),
	.outA(w_outARelay_4[1]),
	.fire(o_fire_2[0]), .rstn(rstn)
);

wire outR_delay;
delay16U u_delay16U(
	.inR  (w_outRRelay_4[1]  ),
	.rstn  (rstn  ),
	.outR (outR_delay )
);


relay relay1(
	.inR(outR_delay),
	.inA(w_outARelay_4[1]),
	.outR(w_outRRelay_4[2]),
	.outA(w_outARelay_4[2]),
	.fire(o_fire_2[1]), .rstn(rstn)
);

relay relay2(
	.inR(w_outRRelay_4[2]),
	.inA(w_outARelay_4[2]),
	.outR(w_outRRelay_4[3]),
	.outA(w_outARelay_4[3]),
	.fire(), .rstn(rstn)
);

receiver receiver(
	.inR(w_outRRelay_4[3]),
	.inA(w_outARelay_4[3]),
	.i_freeNext(i_freeNext), .rstn(rstn)
);

delay1U outdelay0 (.inR(o_fire_2[1]), .outR(w_driveNext), .rstn(rstn));
delay1U outdelay1 (.inR(w_driveNext), .outR(o_driveNext), .rstn(rstn));
endmodule

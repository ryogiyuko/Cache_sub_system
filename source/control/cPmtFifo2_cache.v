//-----------------------------------------------
//	module name: cfifo2
//	author: Tong Fu, Lingzhuang Zhang
//	version: 2st version (2023-03-09)
//-----------------------------------------------
`timescale 1ns / 1ps

module cPmtFifo2_cache( //先fire[0] 后fire[1]
    // rstn
    input           rstn,
    // From Last
    input           i_drive, 
    output          o_free, 
    // To Next
    output          o_driveNext,
    input           i_freeNext,
	input 			pmt,
    // fire signal
    output  [1:0]   o_fire_2
);

wire [2:0]  w_outRRelay_3,  w_outARelay_3;
wire        w_driveNext;

//pipeline
sender sender(
	.i_drive(i_drive),
	.o_free(o_free),
	.outR(w_outRRelay_3[0]),
	.i_free(w_driveNext),
	.rstn(rstn)
);

pmtRelay relay0(
	.inR(w_outRRelay_3[0]),
	.inA(w_outARelay_3[0]),
	.outR(w_outRRelay_3[1]),
	.outA(w_outARelay_3[1]),
	.fire(o_fire_2[0]),
	.pmt(pmt), .rstn(rstn)
);

wire outR_delay0,outR_delay1;
delay8U u_delay8U(
	.inR  (w_outRRelay_3[1]  ),
	.rstn  (rstn  ),
	.outR (outR_delay0 )
);
delay4U u_delay4U(
	.inR  (outR_delay0  ),
	.rstn  (rstn  ),
	.outR (outR_delay1 )
);

relay relay1(
	// .inR(w_outRRelay_3[1]),
	.inR(outR_delay1),
	.inA(w_outARelay_3[1]),
	.outR(w_outRRelay_3[2]),
	.outA(w_outARelay_3[2]),
	.fire(o_fire_2[1]), .rstn(rstn)
);

receiver receiver(
	.inR(w_outRRelay_3[2]),
	.inA(w_outARelay_3[2]),
	.i_freeNext(i_freeNext), .rstn(rstn)
);

delay1U outdelay0 (.inR(o_fire_2[1]), .outR(w_driveNext), .rstn(rstn));
delay1U outdelay1 (.inR(w_driveNext), .outR(o_driveNext), .rstn(rstn));
endmodule

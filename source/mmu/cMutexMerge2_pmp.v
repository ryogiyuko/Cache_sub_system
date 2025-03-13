`timescale 1ns / 1ps
module cMutexMerge2_pmp(
i_drive0, o_free0,
i_drive1, o_free1,
i_freeNext, o_driveNext,
rstn
);

//input & output port
input i_drive0, i_drive1;
input i_freeNext;
input rstn;

output o_free0, o_free1;
output o_driveNext;



//wire & reg
wire w_firstFire_1,w_secondFire_1,w_sendFire_1;
wire w_firstTrig,w_secondTrig;
wire w_firstReq,w_secondReq;
wire w_driveNext0,w_driveNext1,w_driveNext;
wire w_free0,w_free1,w_free;


//firstFifo
// cFifo1 firstFifo
// (
// .i_drive(i_drive0),
// .i_freeNext(w_free0),
// .o_free(o_free0),
// .o_driveNext(w_driveNext0),
// .o_fire_1(w_firstFire_1),
// .rstn(rstn)
// );


assign w_firstTrig = i_drive0 | o_free0;

(* dont_touch="true" *) contTap firstTap(
.trig(w_firstTrig),
.req(w_firstReq),
.rstn(rstn)
);

//secondFifo
// cFifo1 secondFifo(
// .i_drive(i_drive1),
// .i_freeNext(w_free1),
// .o_free(o_free1),
// .o_driveNext(w_driveNext1),
// .o_fire_1(w_secondFire_1),
// .rstn(rstn)
// );

assign w_secondTrig = i_drive1 | o_free1;

(* dont_touch="true" *) contTap secondTap(
.trig(w_secondTrig),
.req(w_secondReq),
.rstn(rstn)
);


//sendFifo
// cFifo1 sendFifo(
// .i_drive(w_driveNext),
// .i_freeNext(i_freeNext),
// .o_free(w_free),
// .o_driveNext(o_driveNext),
// .o_fire_1(w_sendFire_1),
// .rstn(rstn)
// );

// always@(posedge w_sendFire_1 or negedge rstn)
// begin
//     if(!rstn) begin
// 		r_data_32 <= 32'b0;
// 		end
// 	else begin
// 		r_data_32 <= w_data_32;
// 		end
// end
(* dont_touch="true" *) delay4U delay0(.inR(w_driveNext), .outR(w_driveNext0), .rstn(rstn));

(* dont_touch="true" *) delay2U delay1(.inR(w_driveNext0), .outR(o_driveNext), .rstn(rstn));

assign w_driveNext = i_drive0 | i_drive1;

assign o_free0 = i_freeNext & w_firstReq;
assign o_free1 = i_freeNext & w_secondReq;


endmodule




module cMutexMerge3_pmp(
i_drive0, o_free0,
i_drive1, o_free1,
i_drive2, o_free2,
i_freeNext, o_driveNext,
rstn
);

//input & output port
input i_drive0, i_drive1, i_drive2;

input i_freeNext;
input rstn;

output o_free0, o_free1, o_free2;
output o_driveNext;



//wire & reg
wire w_firstFire_1,w_secondFire_1,w_thirdFire2_1,w_sendFire_1;
wire w_firstTrig,w_secondTrig, w_thirdTrig;
wire w_firstReq,w_secondReq, w_thirdReq;
wire w_driveNext0,w_driveNext1,w_driveNext, w_driveNext2;
wire w_free0,w_free1,w_free, w_free2;


//firstFifo
//cFifo1 firstFifo
//(
//.i_drive(i_drive0),
//.i_freeNext(w_free0),
//.o_free(o_free0),
//.o_driveNext(w_driveNext0),
//.o_fire_1(w_firstFire_1),
//.rstn(rstn)
//);


assign w_firstTrig = i_drive0 | o_free0;

(* dont_touch="true" *) contTap firstTap(
.trig(w_firstTrig),
.req(w_firstReq),
.rstn(rstn)
);

//secondFifo
//cFifo1 secondFifo(
//.i_drive(i_drive1),
//.i_freeNext(w_free1),
//.o_free(o_free1),
//.o_driveNext(w_driveNext1),
//.o_fire_1(w_secondFire_1),
//.rstn(rstn)
//);


assign w_secondTrig = i_drive1 | o_free1;

(* dont_touch="true" *) contTap secondTap(
.trig(w_secondTrig),
.req(w_secondReq),
.rstn(rstn)
);

//thirdFifo
//cFifo1 thirdFifo
//(
//.i_drive(i_drive2),
//.i_freeNext(w_free2),
//.o_free(o_free2),
//.o_driveNext(w_driveNext2),
//.o_fire_1(w_thirdFire2_1),
//.rstn(rstn)
//);


assign w_thirdTrig = i_drive2 | o_free2;

(* dont_touch="true" *) contTap thirdTap(
.trig(w_thirdTrig),
.req(w_thirdReq),
.rstn(rstn)
);

//sendFifo
(* dont_touch="true" *) cFifo1 sendFifo(
.i_drive(w_driveNext),
.i_freeNext(i_freeNext),
.o_free(w_free),
.o_driveNext(o_driveNext),
.o_fire_1(w_sendFire_1),
.rstn(rstn)
);



assign w_driveNext = i_drive0 | i_drive1 | i_drive2;

assign o_free0 = w_free & w_firstReq;
assign o_free1 = w_free & w_secondReq;
assign o_free2 = w_free & w_thirdReq;


endmodule


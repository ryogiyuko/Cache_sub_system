

module cWaitMerge8_pmp(
i_drive0,i_drive1,i_drive2,i_drive3,i_drive4,i_drive5,i_drive6,i_drive7,
//i_drive8,i_drive9,i_drive10,i_drive11,i_drive12,i_drive13,i_drive14,i_drive15,
o_free0,o_free1,o_free2,o_free3,o_free4,o_free5,o_free6,o_free7,
//o_free8,o_free9,o_free10,o_free11,o_free12,o_free13,o_free14,o_free15,
rstn,
o_driveNext,
i_freeNext
);

//input & output port
input i_drive0,i_drive1,i_drive2,i_drive3,i_drive4,i_drive5,i_drive6,i_drive7;
//i_drive8,i_drive9,i_drive10,i_drive11,i_drive12,i_drive13,i_drive14,i_drive15;
input i_freeNext;
input rstn;

output o_free0,o_free1,o_free2,o_free3,o_free4,o_free5,o_free6,o_free7;
//o_free8,o_free9,o_free10,o_free11,o_free12,o_free13,o_free14,o_free15;
output o_driveNext;


//wire & reg
wire w_drive0Next,w_drive1Next,w_drive2Next,w_drive3Next,w_drive4Next,w_drive5Next,w_drive6Next,w_drive7Next,w_drive8Next,w_drive9Next,w_drive10Next,w_drive11Next,w_drive12Next,w_drive13Next,w_drive14Next,w_drive15Next;

wire w_firstFire_1,w_secondFire_1,w_Fire2_1,w_Fire3_1,w_Fire4_1,w_Fire5_1,w_Fire6_1,w_Fire7_1,w_Fire8_1,w_Fire9_1,w_Fire10_1,w_Fire11_1,w_Fire12_1,w_Fire13_1,w_Fire14_1,w_Fire15_1;
wire w_sendFire_1;

wire w_firstTrig,w_secondTrig;
wire w_firstReq,w_secondReq;
wire w_Req2,w_Req3,w_Req4,w_Req5,w_Req6,w_Req7,w_Req8,w_Req9,w_Req10,w_Req11,w_Req12,w_Req13,w_Req14,w_Req15;
wire w_Trig2,w_Trig3,w_Trig4,w_Trig5,w_Trig6,w_Trig7,w_Trig8,w_Trig9,w_Trig10,w_Trig11,w_Trig12,w_Trig13,w_Trig14,w_Trig15;
wire w_driveNext;
wire w_sendDrive,w_sendFree;



assign w_firstTrig = i_drive0 | w_sendFree;
(* dont_touch="true" *)delay2U outdelay0 (.inR(i_drive0), .outR(w_drive0Next), .rstn(rstn));
(* dont_touch="true" *)contTap firstTap(
.trig(w_firstTrig),
.req(w_firstReq),
.rstn(rstn)
);



assign w_secondTrig = i_drive1 | w_sendFree;
(* dont_touch="true" *)delay2U outdelay1 (.inR(i_drive1), .outR(w_drive1Next), .rstn(rstn));
(* dont_touch="true" *)contTap secondTap(
.trig(w_secondTrig),
.req(w_secondReq),
.rstn(rstn)
);

assign w_Trig2 = i_drive2 | w_sendFree;
(* dont_touch="true" *)delay2U outdelay2 (.inR(i_drive2), .outR(w_drive2Next), .rstn(rstn));
(* dont_touch="true" *)contTap Tap2(
.trig(w_Trig2),
.req(w_Req2),
.rstn(rstn)
);

assign w_Trig3 = i_drive3 | w_sendFree;
(* dont_touch="true" *)delay2U outdelay3 (.inR(i_drive3), .outR(w_drive3Next), .rstn(rstn));
(* dont_touch="true" *)contTap Tap3(
.trig(w_Trig3),
.req(w_Req3),
.rstn(rstn)
);

assign w_Trig4 = i_drive4 | w_sendFree;
(* dont_touch="true" *)delay2U outdelay4 (.inR(i_drive4), .outR(w_drive4Next), .rstn(rstn));
(* dont_touch="true" *)contTap Tap4(
.trig(w_Trig4),
.req(w_Req4),
.rstn(rstn)
);

assign w_Trig5 = i_drive5 | w_sendFree;
(* dont_touch="true" *)delay2U outdelay5 (.inR(i_drive5), .outR(w_drive5Next), .rstn(rstn));
(* dont_touch="true" *)contTap Tap5(
.trig(w_Trig5),
.req(w_Req5),
.rstn(rstn)
);
assign w_Trig6 = i_drive6 | w_sendFree;
(* dont_touch="true" *)delay2U outdelay6 (.inR(i_drive6), .outR(w_drive6Next), .rstn(rstn));
(* dont_touch="true" *)contTap Tap6(
.trig(w_Trig6),
.req(w_Req6),
.rstn(rstn)
);

assign w_Trig7 = i_drive7 | w_sendFree;
(* dont_touch="true" *)delay2U outdelay7 (.inR(i_drive7), .outR(w_drive7Next), .rstn(rstn));
(* dont_touch="true" *)contTap Tap7(
.trig(w_Trig7),
.req(w_Req7),
.rstn(rstn)
);

//assign w_Trig8 = i_drive8 | w_sendFree;
//(* dont_touch="true" *)delay2U outdelay8 (.inR(i_drive8), .outR(w_drive8Next), .rstn(rstn));
//contTap Tap8(
//.trig(w_Trig8),
//.req(w_Req8),
//.rstn(rstn)
//);

//assign w_Trig9 = i_drive9 | w_sendFree;
//(* dont_touch="true" *)delay2U outdelay9 (.inR(i_drive9), .outR(w_drive9Next), .rstn(rstn));
//contTap Tap9(
//.trig(w_Trig9),
//.req(w_Req9),
//.rstn(rstn)
//);

//assign w_Trig10 = i_drive10 | w_sendFree;
//(* dont_touch="true" *)delay2U outdelay10 (.inR(i_drive10), .outR(w_drive10Next), .rstn(rstn));
//contTap Tap10(
//.trig(w_Trig10),
//.req(w_Req10),
//.rstn(rstn)
//);

//assign w_Trig11 = i_drive11 | w_sendFree;
//(* dont_touch="true" *)delay2U outdelay11 (.inR(i_drive11), .outR(w_drive11Next), .rstn(rstn));
//contTap Tap11(
//.trig(w_Trig11),
//.req(w_Req11),
//.rstn(rstn)
//);

//assign w_Trig12 = i_drive12 | w_sendFree;
//(* dont_touch="true" *)delay2U outdelay12 (.inR(i_drive12), .outR(w_drive12Next), .rstn(rstn));
//contTap Tap12(
//.trig(w_Trig12),
//.req(w_Req12),
//.rstn(rstn)
//);


//assign w_Trig13 = i_drive13 | w_sendFree;
//(* dont_touch="true" *)delay2U outdelay13 (.inR(i_drive13), .outR(w_drive13Next), .rstn(rstn));
//contTap Tap13(
//.trig(w_Trig13),
//.req(w_Req13),
//.rstn(rstn)
//);


//assign w_Trig14 = i_drive14 | w_sendFree;
//(* dont_touch="true" *)delay2U outdelay14 (.inR(i_drive14), .outR(w_drive14Next), .rstn(rstn));
//contTap Tap14(
//.trig(w_Trig14),
//.req(w_Req14),
//.rstn(rstn)
//);

//assign w_Trig15 = i_drive15 | w_sendFree;
//(* dont_touch="true" *)delay2U outdelay15 (.inR(i_drive15), .outR(w_drive15Next), .rstn(rstn));
//contTap Tap15(
//.trig(w_Trig15),
//.req(w_Req15),
//.rstn(rstn)
//);


assign w_driveNext = w_drive0Next | w_drive1Next | w_drive2Next| w_drive3Next| w_drive4Next | w_drive5Next | w_drive6Next| w_drive7Next;
// | w_drive8Next | w_drive9Next | w_drive10Next| w_drive11Next | w_drive12Next | w_drive13Next | w_drive14Next| w_drive15Next;
assign w_sendDrive = w_driveNext & w_secondReq & w_firstReq &w_Req2 &w_Req3 &w_Req4 &w_Req5 &w_Req6 &w_Req7 ;
//&w_Req8 &w_Req9 &w_Req10 &w_Req11 &w_Req12 &w_Req13 &w_Req14 &w_Req15 ;
assign w_sendFree = i_freeNext;

assign o_free0 = i_freeNext;
assign o_free1 = i_freeNext;
assign o_free2 = i_freeNext;
assign o_free3 = i_freeNext;
assign o_free4 = i_freeNext;
assign o_free5 = i_freeNext;
assign o_free6 = i_freeNext;
assign o_free7 = i_freeNext;
//assign o_free8 = i_freeNext;
//assign o_free9 = i_freeNext;
//assign o_free10 = i_freeNext;
//assign o_free11 = i_freeNext;
//assign o_free12 = i_freeNext;
//assign o_free13 = i_freeNext;
//assign o_free14 = i_freeNext;
//assign o_free15 = i_freeNext;

assign o_driveNext = w_sendDrive;

endmodule


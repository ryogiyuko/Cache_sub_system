//-----------------------------------------------
//	module name: cCopyFork4
//	author: Tong Fu
//  modified by: zhanglzh
//	version: 1st version (2023-09-06)
//-----------------------------------------------
`timescale 1ns / 1ps

module cSplitter16_pmp(
    // global reset signal
    input       rstn,
    // left
    input       i_drive,
    output      o_free,
    // right0
    output      o_driveNext0,
    input       i_freeNext0,
    // right1
    output      o_driveNext1,
    input       i_freeNext1,
    // right2
    output      o_driveNext2,
    input       i_freeNext2,
    // right3
    output      o_driveNext3,
    input       i_freeNext3,
    
    output      o_driveNext4,
    input       i_freeNext4,
    
    output      o_driveNext5,
    input       i_freeNext5,
    
    output      o_driveNext6,
    input       i_freeNext6,
    
    output      o_driveNext7,
    input       i_freeNext7,
    
    output      o_driveNext8,
    input       i_freeNext8,
    
    output      o_driveNext9,
    input       i_freeNext9,
    
    output      o_driveNext10,
    input       i_freeNext10,
    
    output      o_driveNext11,
    input       i_freeNext11,
    
    output      o_driveNext12,
    input       i_freeNext12,
    
    output      o_driveNext13,
    input       i_freeNext13,
    
    output      o_driveNext14,
    input       i_freeNext14,
    
    output      o_driveNext15,
    input       i_freeNext15,
output o_fire

);



wire w_fire;
wire w_driveNext0;
wire w_sendFree;
wire w_sendDrive;

wire w_freeNext,w_free0Next,w_free1Next,w_free2Next,w_free3Next,w_free4Next,w_free5Next,w_free6Next,w_free7Next,w_free8Next,w_free9Next,w_free10Next,w_free11Next,w_free12Next,w_free13Next,w_free14Next,w_free15Next;
wire w_firstTrig, w_firstReq;
wire w_secondTrig, w_secondReq;
wire w_Req2,w_Req3,w_Req4,w_Req5,w_Req6,w_Req7,w_Req8,w_Req9,w_Req10,w_Req11,w_Req12,w_Req13,w_Req14,w_Req15;
wire w_Trig2,w_Trig3,w_Trig4,w_Trig5,w_Trig6,w_Trig7,w_Trig8,w_Trig9,w_Trig10,w_Trig11,w_Trig12,w_Trig13,w_Trig14,w_Trig15;
wire w_delayFree0Next,w_delayFree1Next,w_delayFree2Next,w_delayFree3Next,w_delayFree4Next,w_delayFree5Next,w_delayFree6Next,w_delayFree7Next,w_delayFree8Next,w_delayFree9Next,w_delayFree10Next,w_delayFree11Next,w_delayFree12Next,w_delayFree13Next,w_delayFree14Next,w_delayFree15Next;


(* dont_touch="true" *)delay8U indelay1 (.inR(i_freeNext0), .outR(w_delayFree0Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay2 (.inR(i_freeNext1), .outR(w_delayFree1Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay3 (.inR(i_freeNext2), .outR(w_delayFree2Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay4 (.inR(i_freeNext3), .outR(w_delayFree3Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay5 (.inR(i_freeNext4), .outR(w_delayFree4Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay6 (.inR(i_freeNext5), .outR(w_delayFree5Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay7 (.inR(i_freeNext6), .outR(w_delayFree6Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay8 (.inR(i_freeNext7), .outR(w_delayFree7Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay9 (.inR(i_freeNext8), .outR(w_delayFree8Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay40 (.inR(i_freeNext9), .outR(w_delayFree9Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay11 (.inR(i_freeNext10), .outR(w_delayFree10Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay12 (.inR(i_freeNext11), .outR(w_delayFree11Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay13 (.inR(i_freeNext12), .outR(w_delayFree12Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay14 (.inR(i_freeNext13), .outR(w_delayFree13Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay15 (.inR(i_freeNext14), .outR(w_delayFree14Next), .rstn(rstn));

(* dont_touch="true" *)delay8U indelay16 (.inR(i_freeNext15), .outR(w_delayFree15Next), .rstn(rstn));




(* dont_touch="true" *)delay3U outdelay1 (.inR(w_delayFree0Next), .outR(w_free0Next), .rstn(rstn));

assign w_firstTrig = i_freeNext0 | w_sendDrive;

(* dont_touch="true" *) contTap firstTap(
.trig(w_firstTrig),
.req(w_firstReq),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay2 (.inR(w_delayFree1Next), .outR(w_free1Next), .rstn(rstn));

assign w_secondTrig = i_freeNext1 | w_sendDrive;

(* dont_touch="true" *) contTap secondTap(
.trig(w_secondTrig),
.req(w_secondReq),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay3 (.inR(w_delayFree2Next), .outR(w_free2Next), .rstn(rstn));

assign w_Trig2 = i_freeNext2 | w_sendDrive;

(* dont_touch="true" *) contTap Tap2(
.trig(w_Trig2),
.req(w_Req2),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay4 (.inR(w_delayFree3Next), .outR(w_free3Next), .rstn(rstn));

assign w_Trig3 = i_freeNext3 | w_sendDrive;

(* dont_touch="true" *) contTap Tap3(
.trig(w_Trig3),
.req(w_Req3),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay5 (.inR(w_delayFree4Next), .outR(w_free4Next), .rstn(rstn));

assign w_Trig4 = i_freeNext4 | w_sendDrive;

(* dont_touch="true" *) contTap Tap4(
.trig(w_Trig4),
.req(w_Req4),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay6 (.inR(w_delayFree5Next), .outR(w_free5Next), .rstn(rstn));

assign w_Trig5 = i_freeNext5 | w_sendDrive;

(* dont_touch="true" *) contTap Tap5(
.trig(w_Trig5),
.req(w_Req5),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay7 (.inR(w_delayFree6Next), .outR(w_free6Next), .rstn(rstn));

assign w_Trig6 = i_freeNext6 | w_sendDrive;

(* dont_touch="true" *) contTap Tap6(
.trig(w_Trig6),
.req(w_Req6),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay8 (.inR(w_delayFree7Next), .outR(w_free7Next), .rstn(rstn));

assign w_Trig7 = i_freeNext7 | w_sendDrive;

(* dont_touch="true" *) contTap Tap7(
.trig(w_Trig7),
.req(w_Req7),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay9 (.inR(w_delayFree8Next), .outR(w_free8Next), .rstn(rstn));

assign w_Trig8 = i_freeNext8 | w_sendDrive;

(* dont_touch="true" *) contTap Tap8(
.trig(w_Trig8),
.req(w_Req8),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay10 (.inR(w_delayFree9Next), .outR(w_free9Next), .rstn(rstn));

assign w_Trig9 = i_freeNext9 | w_sendDrive;

(* dont_touch="true" *) contTap Tap9(
.trig(w_Trig9),
.req(w_Req9),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay11 (.inR(w_delayFree10Next), .outR(w_free10Next), .rstn(rstn));

assign w_Trig10 = i_freeNext10 | w_sendDrive;

(* dont_touch="true" *) contTap Tap10(
.trig(w_Trig10),
.req(w_Req10),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay12 (.inR(w_delayFree11Next), .outR(w_free11Next), .rstn(rstn));

assign w_Trig11 = i_freeNext11 | w_sendDrive;

(* dont_touch="true" *) contTap Tap11(
.trig(w_Trig11),
.req(w_Req11),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay13 (.inR(w_delayFree12Next), .outR(w_free12Next), .rstn(rstn));

assign w_Trig12 = i_freeNext12 | w_sendDrive;

(* dont_touch="true" *) contTap Tap12(
.trig(w_Trig12),
.req(w_Req12),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay14 (.inR(w_delayFree13Next), .outR(w_free13Next), .rstn(rstn));

assign w_Trig13 = i_freeNext13 | w_sendDrive;

(* dont_touch="true" *) contTap Tap13(
.trig(w_Trig13),
.req(w_Req13),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay15 (.inR(w_delayFree14Next), .outR(w_free14Next), .rstn(rstn));

assign w_Trig14 = i_freeNext14 | w_sendDrive;

(* dont_touch="true" *) contTap Tap14(
.trig(w_Trig14),
.req(w_Req14),
.rstn(rstn)
);

(* dont_touch="true" *)delay3U outdelay16 (.inR(w_delayFree15Next), .outR(w_free15Next), .rstn(rstn));

assign w_Trig15 = i_freeNext15 | w_sendDrive;

(* dont_touch="true" *) contTap Tap15(
.trig(w_Trig15),
.req(w_Req15),
.rstn(rstn)
);


assign w_freeNext = w_free0Next | w_free1Next | w_free2Next | w_free3Next| w_free4Next | w_free5Next | w_free6Next| w_free7Next| w_free8Next | w_free9Next | w_free10Next| w_free11Next| w_free12Next | w_free13Next | w_free14Next| w_free15Next;
assign w_sendFree = w_freeNext & !(w_secondReq | w_firstReq | w_Req2| w_Req3| w_Req4| w_Req5| w_Req6| w_Req7| w_Req8| w_Req9| w_Req10| w_Req11| w_Req12| w_Req13| w_Req14| w_Req15) ;
assign w_sendDrive = i_drive;
assign o_free = w_sendFree;
assign o_driveNext0 = i_drive;
assign o_driveNext1 = i_drive;
assign o_driveNext2 = i_drive;
assign o_driveNext3 = i_drive;

assign o_driveNext4 = i_drive;
assign o_driveNext5 = i_drive;
assign o_driveNext6 = i_drive;
assign o_driveNext7 = i_drive;

assign o_driveNext8 = i_drive;
assign o_driveNext9 = i_drive;
assign o_driveNext10 = i_drive;
assign o_driveNext11 = i_drive;

assign o_driveNext12 = i_drive;
assign o_driveNext13 = i_drive;
assign o_driveNext14 = i_drive;
assign o_driveNext15 = i_drive;
endmodule

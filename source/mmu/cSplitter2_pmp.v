/*
 * @Description: 2Â·£¬ÊäÈëNÎ»£¬µÚÒ»Â·MÎ»£¬µÚ¶þÂ·N-MÎ»,µ±N=MÊ±£¬Êä³öÁ½Â·¾ùÎªÍêÈ«copy
 * @Author: liaozz
 * @Date: 2024-07-11 17:39:58
 * @LastEditors: liaozz
 * @LastEditTime: 2024-09-14 14:37:06
 */
 `timescale 1ns / 1ps

 module cSplitter2_pmp(
    input  wire i_drive,
    input  wire i_freeNext0,i_freeNext1,

    output wire o_free,
    output wire o_driveNext0,o_driveNext1,


    input wire rstn
);
 
(*dont_touch = "yes"*)wire w_freeNext,w_freeNext0,w_freeNext1;
(*dont_touch = "yes"*)wire w_sendFree;
(*dont_touch = "yes"*)wire w_sendDrive;
(*dont_touch = "yes"*)wire w_firstTrig, w_firstReq;
(*dont_touch = "yes"*)wire w_secondTrig, w_secondReq;
(*dont_touch = "yes"*)wire w_delayFree0Next,w_delayFree1Next;
 
 
 (* dont_touch="true" *)delay8U indelay0 (.inR(i_freeNext0), .outR(w_delayFree0Next), .rstn(rstn));
 (* dont_touch="true" *)delay4U indelay1 (.inR(i_freeNext1), .outR(w_delayFree1Next), .rstn(rstn));

 (* dont_touch="true" *)delay2U outdelay0 (.inR(w_delayFree0Next), .outR(w_freeNext0), .rstn(rstn));
 assign w_firstTrig = w_delayFree0Next | w_sendDrive;
 
 (* dont_touch="true" *) contTap firstTap(
 .trig(w_firstTrig),
 .req(w_firstReq),
 .rstn(rstn)
 );
 
 (* dont_touch="true" *)delay2U outdelay1 (.inR(w_delayFree1Next), .outR(w_freeNext1), .rstn(rstn));
 assign w_secondTrig = w_delayFree1Next | w_sendDrive;
 
 (* dont_touch="true" *) contTap secondTap(
 .trig(w_secondTrig),
 .req(w_secondReq),
 .rstn(rstn)
 );
 
 assign w_freeNext = w_freeNext0 | w_freeNext1;
 assign w_sendFree = w_freeNext & !(w_secondReq | w_firstReq);
 assign w_sendDrive = i_drive;
 assign o_free = w_sendFree;
 assign o_driveNext0 = i_drive;
 assign o_driveNext1 = i_drive;
 
 endmodule
 
 

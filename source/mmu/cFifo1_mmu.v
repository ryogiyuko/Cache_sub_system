`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  cFifo1_mmu
// Author:  Yang Yuyuan
// Date:    2024/11/7
// Description: 
//======================================================

module cFifo1_mmu (
    input  rstn,
    input  i_drive,
    input  i_freeNext,
    output o_free,
    output o_driveNext,
    output o_fire_1
);

    wire [1:0] w_outRRelay_2, w_outARelay_2;

    (* dont_touch="true" *) sender sender (
        .i_drive(i_drive),
        .o_free (o_free),
        .outR   (w_outRRelay_2[0]),
        .i_free (o_driveNext),
        .rstn   (rstn)
    );
    (* dont_touch="true" *) relay relay (
        .inR (w_outRRelay_2[0]),
        .inA (w_outARelay_2[0]),
        .outR(w_outRRelay_2[1]),
        .outA(w_outARelay_2[1]),
        .fire(o_fire_1),
        .rstn(rstn)
    );
    (* dont_touch="true" *) receiver receiver (
        .inR       (w_outRRelay_2[1]),
        .inA       (w_outARelay_2[1]),
        .i_freeNext(i_freeNext),
        .rstn      (rstn)
    );

    (* dont_touch="true" *) delay_mmu #(1) outdelay (
        .inR (o_fire_1),
        .outR(o_driveNext),
        .rstn(rstn)
    );
    
endmodule



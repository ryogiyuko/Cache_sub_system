`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  cPmtFifo1_mmu
// Author:  Yang Yuyuan
// Date:    2024/11/7
// Description: 
//======================================================


module cPmtFifo1_mmu (
    input  i_drive,
    input  i_freeNext,
    input  rstn,
    input  pmt,
    output o_free,
    output o_driveNext,
    output o_fire_1
);

    wire [2:0] w_outRRelay_3, w_outARelay_3;

    (* dont_touch="true" *) sender sender (
        .i_drive(i_drive),
        .o_free (o_free),
        .outR   (w_outRRelay_3[0]),
        .i_free (o_driveNext),
        .rstn   (rstn)
    );

    (* dont_touch="true" *) pmtRelay pmtRelay (
        .inR (w_outRRelay_3[0]),
        .inA (w_outARelay_3[0]),
        .outR(w_outRRelay_3[1]),
        .outA(w_outARelay_3[1]),
        .fire(),
        .pmt (pmt),
        .rstn(rstn)
    );
    (* dont_touch="true" *) relay Relay (
        .inR (w_outRRelay_3[1]),
        .inA (w_outARelay_3[1]),
        .outR(w_outRRelay_3[2]),
        .outA(w_outARelay_3[2]),
        .fire(o_fire_1),
        .rstn(rstn)
    );

    (* dont_touch="true" *) receiver receiver (
        .inR       (w_outRRelay_3[2]),
        .inA       (w_outARelay_3[2]),
        .i_freeNext(i_freeNext),
        .rstn      (rstn)
    );

    (* dont_touch="true" *) delay_mmu #(1) outdelay (
        .inR (o_fire_1),
        .outR(o_driveNext),
        .rstn(rstn)
    );

endmodule

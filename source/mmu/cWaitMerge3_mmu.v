`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  cWaitMerge2_mmu
// Author:  Yang Yuyuan
// Date:    2024/11/5
// Description: 
// 1.Instantiation: cWaitMerge2_mmu #(2) u_cWaitMerge2_mmu(...);
//		    cWaitMerge2_mmu #(.NUM_PORTS(2)) u_cWaitMerge2_mmu(...);
//
// 2.Modification: Modify the modelname (cWaitMergeX_mmu, NUM_PORTS)
//		   Modify the interface (i_drive0, i_data0, o_free0)
//		   Modify the signal (w_idrive, o_free, w_pmt)
//
// 3.Attention: The i_drive should be within 4ns
//               If i_freeNext comes back before the end of o_driveNext, add delay at the end
//======================================================


module cWaitMerge3_mmu #(
    parameter NUM_PORTS = 3
) (
    input  rstn,
    
    input  i_drive0,
    output o_free0,

    input  i_drive1,
    output o_free1,

    input  i_drive2,
    output o_free2,

    output o_driveNext,
    input  i_freeNext
);

    wire [NUM_PORTS-1:0] w_idrive;
    wire [NUM_PORTS-1:0] w_trig;
    wire [NUM_PORTS-1:0] w_req;
    wire                 w_pmt;
    wire                 w_pmtFifoFree;
    wire                 w_freeDelay;

    assign w_idrive           = {i_drive2, i_drive1, i_drive0};
    assign {o_free2, o_free1, o_free0} = {NUM_PORTS{w_freeDelay}};
    assign w_pmt              = w_req[2] & w_req[1] & w_req[0];

    genvar i;
    generate
        for (i = 0; i < NUM_PORTS; i = i + 1) begin : waitUnit
            assign w_trig[i] = w_idrive[i] | w_pmtFifoFree;
            (* dont_touch="true" *) contTap tap (
                .trig(w_trig[i]),
                .req (w_req[i]),
                .rstn(rstn)
            );
        end
    endgenerate

    (* dont_touch="true" *) cPmtFifo1_mmu PmtFifo1 (
        .i_drive    (w_idrive[NUM_PORTS-1]),
        .i_freeNext (i_freeNext),
        .o_free     (w_pmtFifoFree),
        .o_driveNext(o_driveNext),
        .o_fire_1   (),
        .pmt        (w_pmt),
        .rstn       (rstn)
    );

    // If i_freeNext comes back before the end of o_driveNext, add delay
    (* dont_touch="true" *) delay_mmu #(1) delay1 (
        .inR (i_freeNext),
        .outR(w_freeDelay),
        .rstn(rstn)
    );

endmodule


`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  cSplitter2_mmu
// Author:  Yang Yuyuan
// Date:    2024/11/7
// Description: 
// 1.Instantiation: cSplitter2_mmu #(2) u_cSplitter2_mmu(...);
//		    cSplitter2_mmu #(.NUM_PORTS(2)) u_cSplitter2_mmu(...);
//
// 2.Modification: Modify the modelname (cSplitterX_mmu, NUM_PORTS)
//		   Modify the interface (o_driveNext0, i_freeNext0)
//		   Modify the signal (w_ifree, o_driveNext)
//======================================================

module cSplitter2_mmu #(
    parameter NUM_PORTS = 2
) (
    input rstn,

    input  i_drive,
    output o_free,

    output o_driveNext0,
    input  i_freeNext0,

    output o_driveNext1,
    input  i_freeNext1
);

    wire [NUM_PORTS-1:0] w_ifree;
    wire [NUM_PORTS-1:0] w_trig;
    wire [NUM_PORTS-1:0] w_req;
    wire                 w_pmt;
    wire                 w_pmtFifoFree;
    wire                 w_driveDelay;

    assign w_pmt = w_req[1] & w_req[0];
    assign w_ifree                      = {i_freeNext1, i_freeNext0};
    assign {o_driveNext1, o_driveNext0} = {NUM_PORTS{i_drive}};

    genvar i;
    generate
        for (i = 0; i < NUM_PORTS; i = i + 1) begin : splitterUnit
            assign w_trig[i] = w_ifree[i] | w_pmtFifoFree;
            (* dont_touch="true" *) contTap tap (
                .trig(w_trig[i]),
                .req (w_req[i]),
                .rstn(rstn)
            );
        end
    endgenerate

    (* dont_touch="true" *) cPmtFifo1_mmu PmtFifo (
        .i_drive    (w_ifree[NUM_PORTS-1]),
        .i_freeNext (w_pmtFifoFree),
        .o_free     (w_pmtFifoFree),
        .o_driveNext(o_free),
        .o_fire_1   (),
        .pmt        (w_pmt),
        .rstn       (rstn)
    );


endmodule
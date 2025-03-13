`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  cMutexMerge2_mmu
// Author:  Yang Yuyuan
// Date:    2024/11/5
// Description: 
// 1.Instantiation: cMutexMerge2_mmu #(2) u_cMutexMerge2_mmu(...);
//		    cMutexMerge2_mmu #(.NUM_PORTS(2)) u_cMutexMerge2_mmu(...);
//
// 2.Modification: Modify the modelname (cMutexMergeX_mmu, NUM_PORTS, DATA_WIDTH)
//		   Modify the interface (i_drive0, i_data0, o_free0)
//		   Modify the signal (w_idrive, w_ofree, o_data, w_driveNext)
//
// 3.Attention: The i_drive should be within 4ns
//               If i_freeNext comes back before the end of o_driveNext, add delay at the end
//======================================================

module cMutexMerge5_mmu #(
    parameter NUM_PORTS  = 5,
    parameter DATA_WIDTH = 128
) (
    input rstn,

    input                   i_drive0,
    input  [DATA_WIDTH-1:0] i_data0,
    output                  o_free0,

    input                   i_drive1,
    input  [DATA_WIDTH-1:0] i_data1,
    output                  o_free1,

    input                   i_drive2,
    input  [DATA_WIDTH-1:0] i_data2,
    output                  o_free2,

    input                   i_drive3,
    input  [DATA_WIDTH-1:0] i_data3,
    output                  o_free3,

    input                   i_drive4,
    input  [DATA_WIDTH-1:0] i_data4,
    output                  o_free4,

    output                  o_driveNext,
    output [DATA_WIDTH-1:0] o_data,
    input                   i_freeNext
);

    wire [NUM_PORTS-1:0] w_idrive;
    wire [NUM_PORTS-1:0] w_ofree;
    wire [NUM_PORTS-1:0] w_reset;
    wire [NUM_PORTS-1:0] w_trig;
    wire [NUM_PORTS-1:0] w_req;
    wire                 w_driveNext;

    assign w_idrive           = {i_drive4, i_drive3, i_drive2, i_drive1, i_drive0};
    assign w_reset            = {i_freeNext & w_req[4], i_freeNext & w_req[3], i_freeNext & w_req[2], i_freeNext & w_req[1], i_freeNext & w_req[0]};
    assign {o_free4, o_free3, o_free2, o_free1, o_free0} = w_ofree;
    assign o_data             = (w_req[0] == 1'b1) ? i_data0 : 
        (w_req[1] == 1'b1) ? i_data1 : 
        (w_req[2] == 1'b1) ? i_data2 : 
        (w_req[3] == 1'b1) ? i_data3 : 
        (w_req[4] == 1'b1) ? i_data4 : {DATA_WIDTH{1'b0}};
    assign w_driveNext = i_drive0 | i_drive1 | i_drive2 | i_drive3 | i_drive4;

    genvar i;
    generate
        for (i = 0; i < NUM_PORTS; i = i + 1) begin : mutexUnit
            assign w_trig[i] = w_idrive[i] | w_reset[i];
            (* dont_touch="true" *) contTap tap (
                .trig(w_trig[i]),
                .req (w_req[i]),
                .rstn(rstn)
            );

            (* dont_touch="true" *) delay_mmu #(2) delay (
                .inR (w_reset[i]),
                .outR(w_ofree[i]),
                .rstn(rstn)
            );
        end
    endgenerate

    (* dont_touch="true" *) delay_mmu #(3) delay1 (
        .inR (w_driveNext),
        .outR(o_driveNext),
        .rstn(rstn)
    );

endmodule
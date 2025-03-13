`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  cArbMerge8_mmu
// Author:  Yang Yuyuan
// Date:    2024/10/10
// Description: 
// 1.Instantiation: cArbMerge8_mmu #(88, 8) u_cArbMerge8_mmu(...);
//		    cArbMerge8_mmu #(.DATA_WIDTH(88),.NUM_PORTS(8)) u_cArbMerge8_mmu(...);
//
// 2.Modification: Modify the modelname (cArbMergeX_mmu, DATA_WIDTH, NUM_PORTS)
//		   Modify the interface (i_drive0, i_data0, o_free0)
//		   Modify the signal (w_pf1id, w_pf1of, w_idata, o_data)
//======================================================

module cArbMerge11_mmu #(
    parameter NUM_PORTS  = 11,
    parameter DATA_WIDTH = 88
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

    input                   i_drive5,
    input  [DATA_WIDTH-1:0] i_data5,
    output                  o_free5,

    input                   i_drive6,
    input  [DATA_WIDTH-1:0] i_data6,
    output                  o_free6,

    input                   i_drive7,
    input  [DATA_WIDTH-1:0] i_data7,
    output                  o_free7,

    input                   i_drive8,
    input  [DATA_WIDTH-1:0] i_data8,
    output                  o_free8,

    input                   i_drive9,
    input  [DATA_WIDTH-1:0] i_data9,
    output                  o_free9,

    input                   i_drive10,
    input  [DATA_WIDTH-1:0] i_data10,
    output                  o_free10,

    output                  o_driveNext,
    output [DATA_WIDTH-1:0] o_data,
    input                   i_freeNext
);

    wire [DATA_WIDTH-1:0] w_idata   [NUM_PORTS-1:0];
    reg  [DATA_WIDTH-1:0] r_data    [NUM_PORTS-1:0];

    wire [ NUM_PORTS-1:0] w_pf1id;
    wire [ NUM_PORTS-1:0] w_pf1if;
    wire [ NUM_PORTS-1:0] w_pf1of;
    wire [ NUM_PORTS-1:0] w_pf1od;
    wire [ NUM_PORTS-1:0] w_pf1fire;
    wire [ NUM_PORTS-1:0] w_pf1pmt;

    wire [ NUM_PORTS-1:0] w_pf2id;
    wire [ NUM_PORTS-1:0] w_pf2if;
    wire [ NUM_PORTS-1:0] w_pf2of;
    wire [ NUM_PORTS-1:0] w_pf2od;
    wire [ NUM_PORTS-1:0] w_pf2fire;

    wire [ NUM_PORTS-1:0] w_trig;
    wire [ NUM_PORTS-1:0] w_req;
    wire [ NUM_PORTS-1:0] w_grant;
    wire [ NUM_PORTS-1:0] w_reset;

    assign w_pf1id = {i_drive10, i_drive9, i_drive8, i_drive7, i_drive6, i_drive5, i_drive4, i_drive3, i_drive2, i_drive1, i_drive0};
    assign {o_free10, o_free9, o_free8, o_free7, o_free6, o_free5, o_free4, o_free3, o_free2, o_free1, o_free0} = w_pf1of;
    assign w_idata[10] = i_data10;
    assign w_idata[9] = i_data9;
    assign w_idata[8] = i_data8;
    assign w_idata[7] = i_data7;
    assign w_idata[6] = i_data6;
    assign w_idata[5] = i_data5;
    assign w_idata[4] = i_data4;
    assign w_idata[3] = i_data3;
    assign w_idata[2] = i_data2;
    assign w_idata[1] = i_data1;
    assign w_idata[0] = i_data0;
    assign o_data = ({DATA_WIDTH{w_grant[0]}} & r_data[0]) |
		({DATA_WIDTH{w_grant[1]}} & r_data[1]) |
		({DATA_WIDTH{w_grant[2]}} & r_data[2]) |
		({DATA_WIDTH{w_grant[3]}} & r_data[3]) |
		({DATA_WIDTH{w_grant[4]}} & r_data[4]) |
		({DATA_WIDTH{w_grant[5]}} & r_data[5]) |
		({DATA_WIDTH{w_grant[6]}} & r_data[6]) |
		({DATA_WIDTH{w_grant[7]}} & r_data[7]) |
		({DATA_WIDTH{w_grant[8]}} & r_data[8]) |
		({DATA_WIDTH{w_grant[9]}} & r_data[9]) |
		({DATA_WIDTH{w_grant[10]}} & r_data[10]);

    assign o_driveNext = |w_pf2od;
    assign w_pf1pmt = {NUM_PORTS{~(|w_req)}};
    assign w_grant = w_req & (~w_req + 1'b1);

    genvar i;
    generate
        for (i = 0; i < NUM_PORTS; i = i + 1) begin : arbUnit
            assign w_pf1if[i] = w_pf2of[i];
            assign w_pf2if[i] = i_freeNext & w_grant[i];

            (* dont_touch="true" *) cPmtFifo1_mmu PmtFifo1 (
                .i_drive    (w_pf1id[i]),
                .i_freeNext (w_pf1if[i]),
                .o_free     (w_pf1of[i]),
                .o_driveNext(w_pf1od[i]),
                .o_fire_1   (w_pf1fire[i]),
                .pmt        (w_pf1pmt[i]),
                .rstn       (rstn)
            );

            always @(posedge w_pf1fire[i] or negedge rstn) begin
                if (!rstn) begin
                    r_data[i] <= {DATA_WIDTH{1'b0}};
                end else begin
                    r_data[i] <= w_idata[i];
                end
            end

            assign w_trig[i] = w_pf1fire[i] | w_reset[i];
            (* dont_touch="true" *) contTap tap (
                .trig(w_trig[i]),
                .req (w_req[i]),
                .rstn(rstn)
            );

            (* dont_touch="true" *) delay_mmu #(14) delay1 (
                .inR (w_pf1od[i]),
                .outR(w_pf2id[i]),
                .rstn(rstn)
            );

            (* dont_touch="true" *) cPmtFifo1_mmu PmtFifo2 (
                .i_drive    (w_pf2id[i]),
                .i_freeNext (w_pf2if[i]),
                .o_free     (w_pf2of[i]),
                .o_driveNext(w_pf2od[i]),
                .o_fire_1   (w_pf2fire[i]),
                .pmt        (w_grant[i]),
                .rstn       (rstn)
            );

            (* dont_touch="true" *) delay_mmu #(1) delay2 (
                .inR (w_grant[i] & i_freeNext),
                .outR(w_reset[i]),
                .rstn(rstn)
            );
        end
    endgenerate

endmodule


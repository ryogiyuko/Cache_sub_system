`timescale 1ns / 1ps
//======================================================
// Project: mmu_asic
// Module:  delay_mmu
// Author:  Yang Yuyuan
// Date:    2024/11/5
// Description: 
// 1.Instantiation: delay_mmu #(2) u_delay_mmu(...);
//		    delay_mmu #(.NUM_PORTS(2)) u_delay_mmu(...);
//
// 2.Modification: Modify the modelname (delayNU_mmu, DELAY_UNITS)
//
// 3.Attention: delayTime = 1.1 + DELAY_UNITS * 0.65s
//======================================================


module delay_mmu #(
    parameter DELAY_UNITS = 8
) (
    input  inR,
    output outR,
    input  rstn
);

    wire [DELAY_UNITS:0] indelay;
    wire [          4:0] outn;
    wire req0, req0n, req1, req1d, req1n, trig, outt;

    assign indelay[0] = inR;

    genvar i;
    generate
        for (i = 0; i < DELAY_UNITS; i = i + 1) begin : inDelay
            delay1U delay (
                .inR (indelay[i]),
                .outR(indelay[i+1]),
                .rstn(rstn)
            );
        end
    endgenerate

    DFQRM2HM ffState0_donttouch (
        .D (req0n),
        .CK(indelay[DELAY_UNITS]),
        .RB(rstn),
        .Q (req0)
    );
    INVM0HM invTmp0_donttouch (
        .A(req0),
        .Z(req0n)
    );

    XOR2M0HM neqIn_donttouch (
        .A(req0),
        .B(req1d),
        .Z(outt)
    );

    AN2M0HM andDrive_donttouch (
        .A(outt),
        .B(rstn),
        .Z(outR)
    );

    DFQRM2HM ffState_donttouch (
        .D (req1n),
        .CK(outR),
        .RB(rstn),
        .Q (req1)
    );

    INVM0HM invTmp1_donttouch (
        .A(req1),
        .Z(req1n)
    );

    DEL1M1HM delay_donttouch (
        .A(req1),
        .Z(req1d)
    );

endmodule


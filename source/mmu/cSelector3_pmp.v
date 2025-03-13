`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/31 22:29:13
// Design Name: 
// Module Name: cSelector3_14b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cSelector3_pmp(
    i_drive, 
    i_data_3, 
    o_free,

    o_driveNext0, 
    i_freeNext0, 

    o_driveNext1, 
    i_freeNext1,

    o_driveNext2, 
    i_freeNext2,
    rstn
    );

    input         i_drive;
    input         i_freeNext0, i_freeNext1, i_freeNext2;
    input         rstn;
    input [2:0]  i_data_3;

    output        o_free;
    output        o_driveNext0, o_driveNext1, o_driveNext2;

    wire [1:0]    w_outRRelay_2,w_outARelay_2;
    wire          w_fire;
    wire          w_free_1;
    wire          w_freeNext;
    wire          w_driveNext0;

    wire          w_valid_0, w_valid_1, w_valid_2;

    assign w_valid_0 = i_data_3[0];
    assign w_valid_1 = i_data_3[1];
    assign w_valid_2 = i_data_3[2];

    //pipeline
    (* dont_touch="true" *) sender sender(
        .i_drive(i_drive),
        .o_free(w_free_1),
        .outR(w_outRRelay_2[0]),
        .i_free(w_fire),
        .rstn(rstn)
    );

    (* dont_touch="true" *) relay relay0(
        .inR(w_outRRelay_2[0]),
        .inA(w_outARelay_2[0]),
        .outR(w_outRRelay_2[1]),
        .outA(w_outARelay_2[1]),
        .fire(w_fire),
	    .rstn(rstn)
    );

    (* dont_touch="true" *) receiver receiver(
        .inR(w_outRRelay_2[1]),
        .inA(w_outARelay_2[1]),
        .i_freeNext(w_freeNext),
        .rstn(rstn)
    );
    
    //control signal
    (* dont_touch="true" *) delay1U outdelay0(.inR(w_free_1), .outR(o_free), .rstn(rstn));
    (* dont_touch="true" *) delay1U outdelay1(.inR(w_fire), .outR(w_driveNext0), .rstn(rstn));
    
    assign o_driveNext0 = w_driveNext0 & w_valid_0;
    assign o_driveNext1 = w_driveNext0 & w_valid_1;
    assign o_driveNext2 = w_driveNext0 & w_valid_2;
    assign w_freeNext = i_freeNext0 | i_freeNext1 | i_freeNext2;

endmodule


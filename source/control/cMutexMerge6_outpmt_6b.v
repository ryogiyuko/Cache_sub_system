`timescale 1ns / 1ps

module cMutexMerge6_outpmt_6b( 
i_drive0, i_data0, o_free0,
i_drive1, i_data1, o_free1,
i_drive2, i_data2, o_free2,
i_drive3, i_data3, o_free3,
i_drive4, i_data4, o_free4,
i_drive5, i_data5, o_free5,
i_freeNext, o_driveNext, o_data ,
rstn,
pmt
);
 
//input & output port
input i_drive0, i_drive1, i_drive2, i_drive3, i_drive4, i_drive5;
input [5:0] i_data0, i_data1, i_data2, i_data3, i_data4, i_data5;
input i_freeNext;
input rstn;

output o_free0, o_free1, o_free2, o_free3, o_free4, o_free5;
output o_driveNext;
output [5:0] o_data ;
output pmt;
 
//wire & reg
wire w_firstTrig, w_secondTrig, w_thirdTrig, w_fourTrig, w_fiveTrig,w_sixTrig;
wire w_firstReq, w_secondReq, w_thirdReq, w_fourReq, w_fiveReq,w_sixReq;
wire w_driveNext;
wire [5:0]  w_data  ;
wire w_pmt;

wire w_free0, w_free1, w_free2, w_free3, w_free4, w_free5;

delay1U outdelay0(.inR  (o_free0  ), .rstn  (rstn  ), .outR (w_free0 ));
delay1U outdelay1(.inR  (o_free1  ), .rstn  (rstn  ), .outR (w_free1 ));
delay1U outdelay2(.inR  (o_free2  ), .rstn  (rstn  ), .outR (w_free2 ));
delay1U outdelay3(.inR  (o_free3  ), .rstn  (rstn  ), .outR (w_free3 ));
delay1U outdelay4(.inR  (o_free4  ), .rstn  (rstn  ), .outR (w_free4 ));
delay1U outdelay5(.inR  (o_free5  ), .rstn  (rstn  ), .outR (w_free5 ));

assign w_firstTrig = i_drive0 | w_free0;
assign w_secondTrig = i_drive1 | w_free1;
assign w_thirdTrig = i_drive2 | w_free2;
assign w_fourTrig = i_drive3 | w_free3;
assign w_fiveTrig = i_drive4 | w_free4;
assign w_sixTrig = i_drive5 | w_free5;

contTap firstTap(
.trig(w_firstTrig),
.req(w_firstReq), .rstn(rstn)
);

contTap secondTap(
.trig(w_secondTrig),
.req(w_secondReq), .rstn(rstn)
);

contTap thirdTap(
.trig(w_thirdTrig),
.req(w_thirdReq), .rstn(rstn)
);

contTap fourTap(
.trig(w_fourTrig),
.req(w_fourReq), .rstn(rstn)
);

contTap fiveTap(
.trig(w_fiveTrig),
.req(w_fiveReq), .rstn(rstn)
);

contTap sixTap(
.trig(w_sixTrig),
.req(w_sixReq), .rstn(rstn)
);

//delay1U(inR, outR);
delay4U udt_delay1(
.inR    ( w_firstReq | w_secondReq | w_thirdReq | w_fourReq | w_fiveReq | w_sixReq  ),
.outR   ( w_pmt  ), .rstn(rstn)
);

assign w_driveNext = i_drive0 | i_drive1 | i_drive2| i_drive3| i_drive4| i_drive5;

delay3U outdelay(.inR  (w_driveNext  ),.rstn  (rstn  ),.outR (o_driveNext ));

assign o_free0 = i_freeNext & w_firstReq;
assign o_free1 = i_freeNext & w_secondReq;
assign o_free2 = i_freeNext & w_thirdReq;
assign o_free3 = i_freeNext & w_fourReq;
assign o_free4 = i_freeNext & w_fiveReq;
assign o_free5 = i_freeNext & w_sixReq;

assign pmt = w_pmt;
assign w_data  =  (w_firstReq == 1'b1) 	? i_data0 :
			    ( (w_secondReq == 1'b1) ? i_data1 : 
				( (w_thirdReq == 1'b1) 	? i_data2 :
				( (w_fourReq == 1'b1) 	? i_data3 : 
				( (w_fiveReq == 1'b1) 	? i_data4 : 
				( (w_sixReq == 1'b1) 	? i_data5: 6'b0 )))));

assign o_data  = w_data ;

endmodule

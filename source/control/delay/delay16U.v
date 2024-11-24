//-----------------------------------------------
//	module name: delay1U
//	author: Fu Tong , Baoxia Wan , Mingshu Chen
//  modifier: 
//  	modifyer: Anping HE (heap@lzu.edu.cn)
//  		adopting FDPE explicitly
//	version: 2nd version (2021-11-17)
//	description: 
//		one unit delay
//      output ==> input (==>:one uint delay)
//-----------------------------------------------
`timescale 1ns / 1ps

module delay16U(inR, outR, rstn);
input inR, rstn;
output outR;

wire outR0,outR1,outR2;


delay4U delay1(.inR(inR), .outR(outR0), .rstn(rstn));
delay4U delay2(.inR(outR0), .outR(outR1), .rstn(rstn));
delay4U delay3(.inR(outR1), .outR(outR2), .rstn(rstn));
delay4U delay4(.inR(outR2), .outR(outR), .rstn(rstn));
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/02 14:34:30
// Design Name: 
// Module Name: Data_buffer
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


module Data_Buffer(
        input               rstn                          ,
        input               fire                          ,
        
        input   [255:0]     i_allData_in_256              ,
        input   [15:0]      i_lineData_in_16              ,
    
        output  [255:0]     o_allData_out_256             ,
        output  [15:0]      o_lineData_out_16             ,
    
        input   [3:0]       i_buffer_addr_4               ,

        input               i_all_write_enable            ,
        input               i_line_write_enable             
    );

    reg [15:0] data_buffer [15:0];

    reg        r_all_write_flag  ;

    always @(posedge fire or negedge rstn) begin 
        if(rstn == 0) begin 
            r_all_write_flag <= 1'b0;
        end
        else begin 
            if(i_all_write_enable == 1'b1) begin 
                r_all_write_flag <= 1'b1;
            end
            else begin 
                r_all_write_flag <= 1'b0;
            end
        end
    end

    always @(posedge fire or negedge rstn) begin 
        if(rstn == 0) begin 
            data_buffer[0]  <= 16'b0;        data_buffer[1]  <= 16'b0;
            data_buffer[2]  <= 16'b0;        data_buffer[3]  <= 16'b0;
            data_buffer[4]  <= 16'b0;        data_buffer[5]  <= 16'b0;
            data_buffer[6]  <= 16'b0;        data_buffer[7]  <= 16'b0;
            data_buffer[8]  <= 16'b0;        data_buffer[9]  <= 16'b0;
            data_buffer[10] <= 16'b0;        data_buffer[11] <= 16'b0;
            data_buffer[12] <= 16'b0;        data_buffer[13] <= 16'b0;
            data_buffer[14] <= 16'b0;        data_buffer[15] <= 16'b0;

            // data_buffer[0]  <= 16'h1234;        data_buffer[1]  <= 16'h1111;
            // data_buffer[2]  <= 16'h2222;        data_buffer[3]  <= 16'h3333;
            // data_buffer[4]  <= 16'h4444;        data_buffer[5]  <= 16'h5555;
            // data_buffer[6]  <= 16'h6666;        data_buffer[7]  <= 16'h7777;
            // data_buffer[8]  <= 16'h8888;        data_buffer[9]  <= 16'h9999;
            // data_buffer[10] <= 16'haaaa;        data_buffer[11] <= 16'hbbbb;
            // data_buffer[12] <= 16'hcccc;        data_buffer[13] <= 16'hdddd;
            // data_buffer[14] <= 16'heeee;        data_buffer[15] <= 16'hffff;

        end
        else begin 
            if(i_all_write_enable == 1'b1 && r_all_write_flag == 1'b0 && i_line_write_enable == 1'b0) begin 
                data_buffer[0]  <= i_allData_in_256[15:0]   ;        data_buffer[1]  <= i_allData_in_256[31:16]  ;
                data_buffer[2]  <= i_allData_in_256[47:32]  ;        data_buffer[3]  <= i_allData_in_256[63:48]  ;
                data_buffer[4]  <= i_allData_in_256[79:64]  ;        data_buffer[5]  <= i_allData_in_256[95:80]  ;
                data_buffer[6]  <= i_allData_in_256[111:96] ;        data_buffer[7]  <= i_allData_in_256[127:112];
                data_buffer[8]  <= i_allData_in_256[143:128];        data_buffer[9]  <= i_allData_in_256[159:144];
                data_buffer[10] <= i_allData_in_256[175:160];        data_buffer[11] <= i_allData_in_256[191:176];
                data_buffer[12] <= i_allData_in_256[207:192];        data_buffer[13] <= i_allData_in_256[223:208];
                data_buffer[14] <= i_allData_in_256[239:224];        data_buffer[15] <= i_allData_in_256[255:240];
            end
            
            else if(i_line_write_enable == 1'b1 && i_all_write_enable == 1'b0) begin 
                data_buffer[i_buffer_addr_4] <= i_lineData_in_16;
            end
            // else begin 
            //     data_buffer[i_buffer_addr_4] <= i_line_write_enable ? i_lineData_in_16 : data_buffer[i_buffer_addr_4];
            // end


            // else begin 
            //     // data_buffer[0]  <= data_buffer[0] ;        data_buffer[1]  <= data_buffer[1] ;
            //     // data_buffer[2]  <= data_buffer[2] ;        data_buffer[3]  <= data_buffer[3] ;
            //     // data_buffer[4]  <= data_buffer[4] ;        data_buffer[5]  <= data_buffer[5] ;
            //     // data_buffer[6]  <= data_buffer[6] ;        data_buffer[7]  <= data_buffer[7] ;
            //     // data_buffer[8]  <= data_buffer[8] ;        data_buffer[9]  <= data_buffer[9] ;
            //     // data_buffer[10] <= data_buffer[10];        data_buffer[11] <= data_buffer[11];
            //     // data_buffer[12] <= data_buffer[12];        data_buffer[13] <= data_buffer[13];
            //     // data_buffer[14] <= data_buffer[14];        data_buffer[15] <= data_buffer[15];
            // end

            // else begin 
            //     data_buffer[i_buffer_addr_4] <= data_buffer[i_buffer_addr_4];
            // end
        end
    end

    assign o_allData_out_256[15:0]      =   data_buffer[0]  ;  
    assign o_allData_out_256[47:32]     =   data_buffer[2]  ;
    assign o_allData_out_256[79:64]     =   data_buffer[4]  ;
    assign o_allData_out_256[111:96]    =   data_buffer[6]  ;
    assign o_allData_out_256[143:128]   =   data_buffer[8]  ;
    assign o_allData_out_256[175:160]   =   data_buffer[10] ;
    assign o_allData_out_256[207:192]   =   data_buffer[12] ;
    assign o_allData_out_256[239:224]   =   data_buffer[14] ;
    assign o_allData_out_256[31:16]     =   data_buffer[1]  ;
    assign o_allData_out_256[63:48]     =   data_buffer[3]  ;
    assign o_allData_out_256[95:80]     =   data_buffer[5]  ;
    assign o_allData_out_256[127:112]   =   data_buffer[7]  ;
    assign o_allData_out_256[159:144]   =   data_buffer[9]  ;
    assign o_allData_out_256[191:176]   =   data_buffer[11] ;
    assign o_allData_out_256[223:208]   =   data_buffer[13] ;
    assign o_allData_out_256[255:240]   =   data_buffer[15] ;



    assign o_lineData_out_16            =   data_buffer[i_buffer_addr_4];


endmodule

//~ `New testbench
`timescale  1ns / 1ps     

module tb_cFifo2_cache;   

// cFifo2_cache Parameters
parameter PERIOD    = 5;
parameter rst_cycle  = 150;
parameter run_time  = 35;


// cFifo2_cache Inputs    
reg   rstn                                 = 1 ;
reg   i_drive                              = 0 ;
reg   i_freeNext                           = 0 ;

// cFifo2_cache Outputs
wire  o_free                               ;
wire  o_driveNext                          ;
wire  [1:0]  o_fire_2                      ;

initial 
begin
    $sdf_annotate("/team/users/zhao.kangli/2024-superscalarProcessor/DC/DC_zjy/DC_fifo/output/cFifo2_cache.sdf",u_cFifo2_cache); 
end

cFifo2_cache  u_cFifo2_cache (
    .rstn                    ( rstn               ),
    .i_drive                 ( i_drive            ),
    .i_freeNext              ( i_freeNext         ),

    .o_free                  ( o_free             ),
    .o_driveNext             ( o_driveNext        ),
    .o_fire_2                ( o_fire_2     [1:0] )
);

initial
begin
rstn = 1;
    #5; 
    rstn = 0;
    
    #(PERIOD*rst_cycle-5) rstn  =  1;
    #20;


    #2.5;i_drive = ~i_drive;
    #2.5;i_drive = ~i_drive;

    #run_time;

    #2.5;i_freeNext = ~i_freeNext;
    #2.5;i_freeNext = ~i_freeNext;

    #20;

    #2.5;i_drive = ~i_drive;
    #2.5;i_drive = ~i_drive;

    #run_time;

    #2.5;i_freeNext = ~i_freeNext;
    #2.5;i_freeNext = ~i_freeNext;

    #2000;
    $stop;
end

endmodule
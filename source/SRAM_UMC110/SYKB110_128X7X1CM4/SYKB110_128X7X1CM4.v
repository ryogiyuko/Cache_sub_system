/*******************************************************************************
________________________________________________________________________________________________


            Synchronous One-Port Register File Compiler

                UMC 0.11um LL AE Logic Process

________________________________________________________________________________________________

              
        Copyright (C) 2024 Faraday Technology Corporation. All Rights Reserved.       
               
        This source code is an unpublished work belongs to Faraday Technology Corporation       
        It is considered a trade secret and is not to be divulged or       
        used by parties who have not received written authorization from       
        Faraday Technology Corporation       
               
        Faraday's home page can be found at: http://www.faraday-tech.com/       
               
________________________________________________________________________________________________

       IP Name            :  FSR0K_B_SY                
       IP Version         :  1.4.0                     
       IP Release Status  :  Active                    
       Word               :  128                       
       Bit                :  7                         
       Byte               :  1                         
       Mux                :  4                         
       Output Loading     :  0.01                      
       Clock Input Slew   :  0.016                     
       Data Input Slew    :  0.016                     
       Ring Type          :  Ringless Model            
       Ring Width         :  0                         
       Bus Format         :  0                         
       Memaker Path       :  /home/mem/Desktop/memlib  
       GUI Version        :  m20230904                 
       Date               :  2024/09/06 21:04:55       
________________________________________________________________________________________________


   Notice on usage: Fixed delay or timing data are given in this model.
                    It supports SDF back-annotation, please generate SDF file
                    by EDA tools to get the accurate timing.

 |-----------------------------------------------------------------------------|

   Warning : If customer's design viloate the set-up time or hold time criteria 
   of synchronous SRAM, it's possible to hit the meta-stable point of 
   latch circuit in the decoder and cause the data loss in the memory bitcell.
   So please follow the memory IP's spec to design your product.

 *******************************************************************************/

`resetall
`timescale 10ps/1ps


module SYKB110_128X7X1CM4 (A0,A1,A2,A3,A4,A5,A6,DO0,DO1,DO2,DO3,DO4,DO5,DO6,
                           DI0,DI1,DI2,DI3,DI4,DI5,DI6,CK,WEB,DVSE,DVS0,DVS1,
                           DVS2,DVS3,CSB);

  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `TRUE;            
  parameter  AddressSize          = 7;                
  parameter  DVSize               = 4;                
  parameter  Bits                 = 7;                
  parameter  Words                = 128;              
  parameter  Bytes                = 1;                
  parameter  AspectRatio          = 4;                
  parameter  TOH                  = (97.3:158.7:286.1);
  parameter  TWDX                 = (97.2:158.6:286.0);
`ifdef TRC_CHECK
  parameter  TRC_PERIOD           = (156.8:256.7:466.8);
`else
`endif

  output     DO0,DO1,DO2,DO3,DO4,DO5,DO6;
  input      DI0,DI1,DI2,DI3,DI4,DI5,DI6;
  input      A0,A1,A2,A3,A4,A5,A6;
  input      DVSE;                                    
  input      DVS0,DVS1,DVS2,DVS3;
   
  input      WEB;                                     
  input      CK;                                      
  input      CSB;                                     

`protect
  reg        [Bits-1:0]           Memory [Words-1:0];           


  wire       [Bytes*Bits-1:0]     DO_;                
  wire       [AddressSize-1:0]    A_;                 
  wire       [Bits-1:0]           DI_;                
  wire                            WEB_;               
  wire                            CK_;                
  wire                            CS_;                


  reg                             read;               
  reg                             write;              




  wire                            con_A;              
  wire                            con_DI;             
  wire                            con_CK;             
  wire                            ck_per;             
  wire                            con_WEB;            


  reg        [AddressSize-1:0]    Latch_A;            
  reg        [Bits-1:0]           Latch_DI;           
  reg                             Latch_WEB;          
  reg                             Latch_CS;           


  reg        [AddressSize-1:0]    A_i;                
  reg        [Bits-1:0]           DI_i;               
  reg                             WEB_i;              
  reg                             CS_i;               

  reg                             n_flag_A0;          
  reg                             n_flag_A1;          
  reg                             n_flag_A2;          
  reg                             n_flag_A3;          
  reg                             n_flag_A4;          
  reg                             n_flag_A5;          
  reg                             n_flag_A6;          
  reg                             n_flag_DI0;         
  reg                             n_flag_DI1;         
  reg                             n_flag_DI2;         
  reg                             n_flag_DI3;         
  reg                             n_flag_DI4;         
  reg                             n_flag_DI5;         
  reg                             n_flag_DI6;         
  reg                             n_flag_WEB;         
  reg                             n_flag_CS;          
  reg                             n_flag_CK_PER;      
  reg                             n_flag_CK_MINH;     
  reg                             n_flag_CK_MINL;     


  reg                             LAST_n_flag_WEB;    
  reg                             LAST_n_flag_CS;     
  reg                             LAST_n_flag_CK_PER; 
  reg                             LAST_n_flag_CK_MINH;
  reg                             LAST_n_flag_CK_MINL;
  reg        [AddressSize-1:0]    NOT_BUS_A;          
  reg        [AddressSize-1:0]    LAST_NOT_BUS_A;     
  reg        [Bits-1:0]           NOT_BUS_DI;         
  reg        [Bits-1:0]           LAST_NOT_BUS_DI;    


  reg        [AddressSize-1:0]    last_A;             
  reg        [AddressSize-1:0]    latch_last_A;       

  reg        [Bits-1:0]           last_DI;            
  reg        [Bits-1:0]           latch_last_DI;      

  reg                             last_WEB;           
  reg                             latch_last_WEB;     

  reg        [Bits-1:0]           DO_i;               


  reg                             LastClkEdge;        

  reg                             flag_A_x;           
  reg                             flag_CS_x;          

  reg                             NODELAY;            
  reg        [Bits-1:0]           DO_tmp;             
  event                           EventTOHDO;         
  event                           EventNegCS;         
`ifdef MEM_VERIFY
  reg                             taa_verify;         
`else
`endif

  event                           EventTWDXDO;        

  assign     DO_                  = {DO_i};
  assign     con_A                = CS_;
  assign     con_DI               = CS_ & (!WEB_);
  assign     con_WEB              = CS_;
  assign     con_CK               = CS_;
  assign     ck_per               = CS_;

  buf        ido0            (DO0, DO_[0]);                
  buf        ido1            (DO1, DO_[1]);                
  buf        ido2            (DO2, DO_[2]);                
  buf        ido3            (DO3, DO_[3]);                
  buf        ido4            (DO4, DO_[4]);                
  buf        ido5            (DO5, DO_[5]);                
  buf        ido6            (DO6, DO_[6]);                
  buf        ick0            (CK_, CK);                    
  buf        ia0             (A_[0], A0);                  
  buf        ia1             (A_[1], A1);                  
  buf        ia2             (A_[2], A2);                  
  buf        ia3             (A_[3], A3);                  
  buf        ia4             (A_[4], A4);                  
  buf        ia5             (A_[5], A5);                  
  buf        ia6             (A_[6], A6);                  
  buf        idi_0           (DI_[0], DI0);                
  buf        idi_1           (DI_[1], DI1);                
  buf        idi_2           (DI_[2], DI2);                
  buf        idi_3           (DI_[3], DI3);                
  buf        idi_4           (DI_[4], DI4);                
  buf        idi_5           (DI_[5], DI5);                
  buf        idi_6           (DI_[6], DI6);                
  not        ics0            (CS_, CSB);                   
  buf        iweb0           (WEB_, WEB);                  



  initial begin
    $timeformat (-12, 0, " ps", 20);
    flag_A_x = `FALSE;
    NODELAY = 1'b0;
    LastClkEdge = 1'b0;
  `ifdef MEM_INIT_ZERO
       all_core_x(9999,0);
  `else
  `endif
  `ifdef MEM_VERIFY
    taa_verify = 0;
  `else
  `endif
  end

  always @(negedge CS_) begin
    if (SYN_CS == `FALSE) begin
       ->EventNegCS;
    end
  end
  always @(posedge CS_) begin
    if (SYN_CS == `FALSE) begin
       disable NegCS;
    end
  end





  always @(CK_) begin
    casez ({LastClkEdge,CK_})
      2'b01:
         begin
           last_A = latch_last_A;
           last_WEB = latch_last_WEB;
           last_DI = latch_last_DI;
           CS_monitor;
           pre_latch_data;
           read = WEB_;
           write = !WEB_;
           memory_function;
`ifdef TRC_CHECK
           trc_timiming_monitor;
`else
`endif
           latch_last_A = A_;
           latch_last_DI = DI_;
           latch_last_WEB = WEB_;
         end
      2'b?x:
         begin
`ifdef NO_MEM_MSG
`else
           ErrorMessage(0);
`endif
           if (CS_ !== 0) begin
              if (WEB_ !== 1'b1) begin
                 all_core_x(9999,1);
              end else begin
                 #0 disable TOHDO;
                    disable TWDXDO;
                 NODELAY = 1'b1;
                 DO_i = {Bits{1'bX}};
              end
           end
         end
    endcase
    LastClkEdge = CK_;
  end

  always @(
           n_flag_A0 or
           n_flag_A1 or
           n_flag_A2 or
           n_flag_A3 or
           n_flag_A4 or
           n_flag_A5 or
           n_flag_A6 or
           n_flag_DI0 or
           n_flag_DI1 or
           n_flag_DI2 or
           n_flag_DI3 or
           n_flag_DI4 or
           n_flag_DI5 or
           n_flag_DI6 or
           n_flag_WEB or
           n_flag_CS or
           n_flag_CK_PER or
           n_flag_CK_MINH or
           n_flag_CK_MINL 
          )
     begin
       timingcheck_violation;
     end




  always @(EventTOHDO) 
    begin:TOHDO 
      #TOH 
      NODELAY <= 1'b0; 
      DO_i              =  {Bits{1'bX}}; 
      DO_i              <= DO_tmp; 
  end 


  always @(EventTWDXDO) 
    begin:TWDXDO 
      #TWDX 
      NODELAY <= 1'b0; 
      DO_i              =  {Bits{1'bX}}; 
      DO_i              <= DO_tmp; 
  end 

  always @(EventNegCS) 
    begin:NegCS
      #TOH 
      disable TOHDO;
      NODELAY = 1'b0; 
      DO_i              =  {Bits{1'bX}}; 
  end 

  task timingcheck_violation;
    integer i;
    begin
      if ((n_flag_CK_PER  !== LAST_n_flag_CK_PER)  ||
          (n_flag_CK_MINH !== LAST_n_flag_CK_MINH) ||
          (n_flag_CK_MINL !== LAST_n_flag_CK_MINL)) begin
          if (CS_ !== 1'b0) begin
             if (WEB_ !== 1'b1) begin
                all_core_x(9999,1);
             end
             else begin
                #0 disable TOHDO;
                   disable TWDXDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
             end
          end
      end
      else begin
          NOT_BUS_A  = {
                         n_flag_A6,
                         n_flag_A5,
                         n_flag_A4,
                         n_flag_A3,
                         n_flag_A2,
                         n_flag_A1,
                         n_flag_A0};

          NOT_BUS_DI  = {
                         n_flag_DI6,
                         n_flag_DI5,
                         n_flag_DI4,
                         n_flag_DI3,
                         n_flag_DI2,
                         n_flag_DI1,
                         n_flag_DI0};


          for (i=0; i<AddressSize; i=i+1) begin
             Latch_A[i] = (NOT_BUS_A[i] !== LAST_NOT_BUS_A[i]) ? 1'bx : Latch_A[i];
          end
          for (i=0; i<Bits; i=i+1) begin
             Latch_DI[i] = (NOT_BUS_DI[i] !== LAST_NOT_BUS_DI[i]) ? 1'bx : Latch_DI[i];
          end
          Latch_CS  =  (n_flag_CS  !== LAST_n_flag_CS)  ? 1'bx : Latch_CS;
          Latch_WEB = (n_flag_WEB !== LAST_n_flag_WEB)  ? 1'bx : Latch_WEB;
          memory_function;
      end

      LAST_NOT_BUS_A                 = NOT_BUS_A;
      LAST_NOT_BUS_DI                = NOT_BUS_DI;
      LAST_n_flag_WEB                = n_flag_WEB;
      LAST_n_flag_CS                 = n_flag_CS;
      LAST_n_flag_CK_PER             = n_flag_CK_PER;
      LAST_n_flag_CK_MINH            = n_flag_CK_MINH;
      LAST_n_flag_CK_MINL            = n_flag_CK_MINL;
    end
  endtask // end timingcheck_violation;

  task pre_latch_data;
    begin
      Latch_A                        = A_;
      Latch_DI                       = DI_;
      Latch_WEB                      = WEB_;
      Latch_CS                       = CS_;
    end
  endtask //end pre_latch_data
  task memory_function;
    begin
      A_i                            = Latch_A;
      DI_i                           = Latch_DI;
      WEB_i                          = Latch_WEB;
      CS_i                           = Latch_CS;

      if (CS_ == 1'b1) A_monitor;

      casez({WEB_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
              if (NO_SER_TOH == `TRUE) begin
                if (A_i !== last_A) begin
                     NODELAY = 1'b1;
                     DO_tmp = Memory[A_i];
                     ->EventTOHDO;
                end else begin
                  if (WEB_i !== last_WEB) begin
                      NODELAY = 1'b1;
                      DO_tmp = Memory[A_i];
                      ->EventTOHDO;
                  end else begin
                      NODELAY = 1'b0;
                      DO_tmp  = Memory[A_i];
                      DO_i    = DO_tmp;
                  end
                end
              end else begin
                  NODELAY = 1'b1;
                  DO_tmp = Memory[A_i];
                  ->EventTOHDO;
              end
           end
           else begin
                #0 disable TOHDO;
                   disable TWDXDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory[A_i] = DI_i;
                NODELAY = 1'b1;
                DO_tmp = Memory[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                       NODELAY = 1'b1;
                       ->EventTWDXDO;
                  end else begin
                    if (WEB_i !== last_WEB) begin
                          NODELAY = 1'b1;
                          ->EventTWDXDO;
                    end else begin
                      if (DI_i !== last_DI) begin
                            NODELAY = 1'b1;
                            ->EventTWDXDO;
		      end else begin
                           NODELAY = 1'b0;
                           DO_i = DO_tmp;
		      end
                    end
                  end
               end else begin
                    NODELAY = 1'b1;
                    ->EventTWDXDO;
               end
           end else begin
             #0 disable TOHDO;
                disable TWDXDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(9999,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO;
              disable TWDXDO;
           NODELAY = 1'b1;
           DO_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory[A_i] = {Bits{1'bX}};
                #0 disable TOHDO;
                   disable TWDXDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO;
                disable TWDXDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(9999,1);
                end
           end
        end
      endcase
  end
  endtask //memory_function;

  task all_core_x;
     input byte_num;
     input do_x;

     integer byte_num;
     integer do_x;
     integer LoopCount_Address;
     begin
       LoopCount_Address=Words-1;
       while(LoopCount_Address >=0) begin
       if (do_x == 1) Memory[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
       else           Memory[LoopCount_Address]={Bits{1'b0}};
`else
`endif
       if (do_x == 1) begin
          #0 disable TOHDO;
             disable TWDXDO;
          NODELAY = 1'b1;
          DO_i = {Bits{1'bX}};
       end
`ifdef MEM_INIT_ZERO
       else begin
          #0 disable TOHDO;
             disable TWDXDO;
          NODELAY = 1'b1;
          DO_i = {Bits{1'b0}};
       end
`else
`endif
         LoopCount_Address=LoopCount_Address-1;
       end
    end
  endtask //end all_core_x;




  task A_monitor;
     begin
       if (^(A_) !== 1'bX) begin
          flag_A_x = `FALSE;
       end
       else begin
          if (flag_A_x == `FALSE) begin
              flag_A_x = `TRUE;
`ifdef NO_MEM_MSG
`else
              ErrorMessage(2);
`endif
          end
       end
     end
  endtask //end A_monitor;

  task CS_monitor;
     begin
       if (^(CS_) !== 1'bX) begin
          flag_CS_x = `FALSE;
       end
       else begin
          if (flag_CS_x == `FALSE) begin
              flag_CS_x = `TRUE;
`ifdef NO_MEM_MSG
`else
              ErrorMessage(3);
`endif
          end
       end
     end
  endtask //end CS_monitor;

`ifdef TRC_CHECK
  task trc_timiming_monitor;
       integer trc1;
       integer trc2;
       integer trc_check;
     begin
       if (trc1 != 0) begin
         trc2 = trc1;
       end
         trc1 = $time;
	 trc_check = trc1 - trc2;
       if (trc_check < TRC_PERIOD) begin
          if (CS_ !== 1'b0) begin
             if (WEB_ !== 1'b1) begin
                all_core_x(9999,1);
             end
             else begin
                #0 disable TOHDO;
                   disable TWDXDO;
                NODELAY = 1'b1;
                DO_i = {Bits{1'bX}};
             end
          end
       end
     end
  endtask //end trc_timiming_monitor;
`else
`endif

  task ErrorMessage;
     input error_type;
     integer error_type;

     begin
       case (error_type)
         0: $display("** MEM_Error: Abnormal transition occurred (%t) in Clock of %m",$time);
         1: $display("** MEM_Error: Read and Write the same Address, DO is unknown (%t) in clock of %m",$time);
         2: $display("** MEM_Error: Unknown value occurred (%t) in Address of %m",$time);
         3: $display("** MEM_Error: Unknown value occurred (%t) in ChipSelect of %m",$time);
         4: $display("** MEM_Error: Port A and B write the same Address, core is unknown (%t) in clock of %m",$time);
         5: $display("** MEM_Error: Clear all memory core to unknown (%t) in clock of %m",$time);
       endcase
     end
  endtask

  function AddressRangeCheck;
      input  [AddressSize-1:0] AddressItem;
      reg    UnaryResult;
      begin
        UnaryResult = ^AddressItem;
        if(UnaryResult!==1'bX) begin
           if (AddressItem >= Words) begin
              $display("** MEM_Error: Out of range occurred (%t) in Address of %m",$time);
              AddressRangeCheck = `FALSE;
           end else begin
              AddressRangeCheck = `TRUE;
           end
        end
        else begin
           AddressRangeCheck = `FALSE;
        end
      end
  endfunction //end AddressRangeCheck;

   specify
      specparam TAA    = (111.0:182.4:331.9);
      specparam TWDV = (111.0:182.4:331.9);
      specparam TRC  = (156.8:256.7:466.8);
      specparam THPW = (31.7:50.9:92.8);
      specparam TLPW = (40.1:63.5:113.2);
      specparam TAS  = (25.0:43.6:84.7);
      specparam TAH  = (9.0:14.7:26.8);
      specparam TWS  = (22.5:39.8:78.3);
      specparam TWH  = (18.0:29.3:52.4);
      specparam TDS  = (24.7:45.4:93.0);
      specparam TDH  = (8.8:12.4:17.8);
      specparam TCSS = (36.1:62.3:118.9);
      specparam TCSH = (14.8:22.6:37.7);

      $setuphold ( posedge CK &&& con_A,          posedge A0, TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CK &&& con_A,          negedge A0, TAS,     TAH,     n_flag_A0      );
      $setuphold ( posedge CK &&& con_A,          posedge A1, TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CK &&& con_A,          negedge A1, TAS,     TAH,     n_flag_A1      );
      $setuphold ( posedge CK &&& con_A,          posedge A2, TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CK &&& con_A,          negedge A2, TAS,     TAH,     n_flag_A2      );
      $setuphold ( posedge CK &&& con_A,          posedge A3, TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CK &&& con_A,          negedge A3, TAS,     TAH,     n_flag_A3      );
      $setuphold ( posedge CK &&& con_A,          posedge A4, TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CK &&& con_A,          negedge A4, TAS,     TAH,     n_flag_A4      );
      $setuphold ( posedge CK &&& con_A,          posedge A5, TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CK &&& con_A,          negedge A5, TAS,     TAH,     n_flag_A5      );
      $setuphold ( posedge CK &&& con_A,          posedge A6, TAS,     TAH,     n_flag_A6      );
      $setuphold ( posedge CK &&& con_A,          negedge A6, TAS,     TAH,     n_flag_A6      );
      $setuphold ( posedge CK &&& con_DI,         posedge DI0, TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CK &&& con_DI,         negedge DI0, TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CK &&& con_DI,         posedge DI1, TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CK &&& con_DI,         negedge DI1, TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CK &&& con_DI,         posedge DI2, TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CK &&& con_DI,         negedge DI2, TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CK &&& con_DI,         posedge DI3, TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CK &&& con_DI,         negedge DI3, TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CK &&& con_DI,         posedge DI4, TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CK &&& con_DI,         negedge DI4, TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CK &&& con_DI,         posedge DI5, TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CK &&& con_DI,         negedge DI5, TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CK &&& con_DI,         posedge DI6, TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CK &&& con_DI,         negedge DI6, TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CK &&& con_WEB,        posedge WEB, TWS,     TWH,     n_flag_WEB     );
      $setuphold ( posedge CK &&& con_WEB,        negedge WEB, TWS,     TWH,     n_flag_WEB     );
      $setuphold ( posedge CK,                    posedge CSB, TCSS,    TCSH,    n_flag_CS      );
      $setuphold ( posedge CK,                    negedge CSB, TCSS,    TCSH,    n_flag_CS      );
      $period    ( posedge CK &&& ck_per,         TRC,                       n_flag_CK_PER  );
      $width     ( posedge CK &&& con_CK,         THPW,    0,                n_flag_CK_MINH );
      $width     ( negedge CK &&& con_CK,         TLPW,    0,                n_flag_CK_MINL );

      if (NODELAY == 0 && read)  (posedge CK => (DO0 :1'bx)) = TAA  ;
      if (NODELAY == 0 && read)  (posedge CK => (DO1 :1'bx)) = TAA  ;
      if (NODELAY == 0 && read)  (posedge CK => (DO2 :1'bx)) = TAA  ;
      if (NODELAY == 0 && read)  (posedge CK => (DO3 :1'bx)) = TAA  ;
      if (NODELAY == 0 && read)  (posedge CK => (DO4 :1'bx)) = TAA  ;
      if (NODELAY == 0 && read)  (posedge CK => (DO5 :1'bx)) = TAA  ;
      if (NODELAY == 0 && read)  (posedge CK => (DO6 :1'bx)) = TAA  ;

      if (NODELAY == 0 && write)  (posedge CK => (DO0 :1'bx)) = TWDV ;
      if (NODELAY == 0 && write)  (posedge CK => (DO1 :1'bx)) = TWDV ;
      if (NODELAY == 0 && write)  (posedge CK => (DO2 :1'bx)) = TWDV ;
      if (NODELAY == 0 && write)  (posedge CK => (DO3 :1'bx)) = TWDV ;
      if (NODELAY == 0 && write)  (posedge CK => (DO4 :1'bx)) = TWDV ;
      if (NODELAY == 0 && write)  (posedge CK => (DO5 :1'bx)) = TWDV ;
      if (NODELAY == 0 && write)  (posedge CK => (DO6 :1'bx)) = TWDV ;




   endspecify

`endprotect
endmodule

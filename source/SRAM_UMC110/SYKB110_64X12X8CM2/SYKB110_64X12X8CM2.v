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
       Word               :  64                        
       Bit                :  12                        
       Byte               :  8                         
       Mux                :  2                         
       Output Loading     :  0.01                      
       Clock Input Slew   :  0.016                     
       Data Input Slew    :  0.016                     
       Ring Type          :  Ringless Model            
       Ring Width         :  0                         
       Bus Format         :  0                         
       Memaker Path       :  /home/mem/Desktop/memlib  
       GUI Version        :  m20230904                 
       Date               :  2024/09/07 14:44:38       
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


module SYKB110_64X12X8CM2 (A0,A1,A2,A3,A4,A5,DO0,DO1,DO2,DO3,DO4,DO5,DO6,
                           DO7,DO8,DO9,DO10,DO11,DO12,DO13,DO14,DO15,
                           DO16,DO17,DO18,DO19,DO20,DO21,DO22,DO23,
                           DO24,DO25,DO26,DO27,DO28,DO29,DO30,DO31,
                           DO32,DO33,DO34,DO35,DO36,DO37,DO38,DO39,
                           DO40,DO41,DO42,DO43,DO44,DO45,DO46,DO47,
                           DO48,DO49,DO50,DO51,DO52,DO53,DO54,DO55,
                           DO56,DO57,DO58,DO59,DO60,DO61,DO62,DO63,
                           DO64,DO65,DO66,DO67,DO68,DO69,DO70,DO71,
                           DO72,DO73,DO74,DO75,DO76,DO77,DO78,DO79,
                           DO80,DO81,DO82,DO83,DO84,DO85,DO86,DO87,
                           DO88,DO89,DO90,DO91,DO92,DO93,DO94,DO95,
                           DI0,DI1,DI2,DI3,DI4,DI5,DI6,DI7,DI8,DI9,
                           DI10,DI11,DI12,DI13,DI14,DI15,DI16,DI17,
                           DI18,DI19,DI20,DI21,DI22,DI23,DI24,DI25,
                           DI26,DI27,DI28,DI29,DI30,DI31,DI32,DI33,
                           DI34,DI35,DI36,DI37,DI38,DI39,DI40,DI41,
                           DI42,DI43,DI44,DI45,DI46,DI47,DI48,DI49,
                           DI50,DI51,DI52,DI53,DI54,DI55,DI56,DI57,
                           DI58,DI59,DI60,DI61,DI62,DI63,DI64,DI65,
                           DI66,DI67,DI68,DI69,DI70,DI71,DI72,DI73,
                           DI74,DI75,DI76,DI77,DI78,DI79,DI80,DI81,
                           DI82,DI83,DI84,DI85,DI86,DI87,DI88,DI89,
                           DI90,DI91,DI92,DI93,DI94,DI95,CK,WEB0,WEB1,
                           WEB2,WEB3,WEB4,WEB5,WEB6,WEB7,DVSE,DVS0,DVS1,
                           DVS2,DVS3,CSB);

  `define    TRUE                 (1'b1)              
  `define    FALSE                (1'b0)              

  parameter  SYN_CS               = `TRUE;            
  parameter  NO_SER_TOH           = `TRUE;            
  parameter  AddressSize          = 6;                
  parameter  DVSize               = 4;                
  parameter  Bits                 = 12;               
  parameter  Words                = 64;               
  parameter  Bytes                = 8;                
  parameter  AspectRatio          = 2;                
  parameter  TOH                  = (115.2:187.7:335.6);
  parameter  TWDX                 = (115.1:187.5:335.4);
`ifdef TRC_CHECK
  parameter  TRC_PERIOD           = (167.3:273.5:495.3);
`else
`endif

  output     DO0,DO1,DO2,DO3,DO4,DO5,DO6,DO7,DO8,
             DO9,DO10,DO11,DO12,DO13,DO14,DO15,DO16,DO17,DO18,
             DO19,DO20,DO21,DO22,DO23,DO24,DO25,DO26,DO27,DO28,
             DO29,DO30,DO31,DO32,DO33,DO34,DO35,DO36,DO37,DO38,
             DO39,DO40,DO41,DO42,DO43,DO44,DO45,DO46,DO47,DO48,
             DO49,DO50,DO51,DO52,DO53,DO54,DO55,DO56,DO57,DO58,
             DO59,DO60,DO61,DO62,DO63,DO64,DO65,DO66,DO67,DO68,
             DO69,DO70,DO71,DO72,DO73,DO74,DO75,DO76,DO77,DO78,
             DO79,DO80,DO81,DO82,DO83,DO84,DO85,DO86,DO87,DO88,
             DO89,DO90,DO91,DO92,DO93,DO94,DO95;
  input      DI0,DI1,DI2,DI3,DI4,DI5,DI6,DI7,DI8,
             DI9,DI10,DI11,DI12,DI13,DI14,DI15,DI16,DI17,DI18,
             DI19,DI20,DI21,DI22,DI23,DI24,DI25,DI26,DI27,DI28,
             DI29,DI30,DI31,DI32,DI33,DI34,DI35,DI36,DI37,DI38,
             DI39,DI40,DI41,DI42,DI43,DI44,DI45,DI46,DI47,DI48,
             DI49,DI50,DI51,DI52,DI53,DI54,DI55,DI56,DI57,DI58,
             DI59,DI60,DI61,DI62,DI63,DI64,DI65,DI66,DI67,DI68,
             DI69,DI70,DI71,DI72,DI73,DI74,DI75,DI76,DI77,DI78,
             DI79,DI80,DI81,DI82,DI83,DI84,DI85,DI86,DI87,DI88,
             DI89,DI90,DI91,DI92,DI93,DI94,DI95;
  input      A0,A1,A2,A3,A4,A5;
  input      DVSE;                                    
  input      DVS0,DVS1,DVS2,DVS3;
   
  input      WEB0;                                    
  input      WEB1;                                    
  input      WEB2;                                    
  input      WEB3;                                    
  input      WEB4;                                    
  input      WEB5;                                    
  input      WEB6;                                    
  input      WEB7;                                    
  input      CK;                                      
  input      CSB;                                     

`protect
  reg        [Bits-1:0]           Memory_byte0 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte1 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte2 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte3 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte4 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte5 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte6 [Words-1:0];     
  reg        [Bits-1:0]           Memory_byte7 [Words-1:0];     


  wire       [Bytes*Bits-1:0]     DO_;                
  wire       [AddressSize-1:0]    A_;                 
  wire       [Bits-1:0]           DI_byte0_;          
  wire       [Bits-1:0]           DI_byte1_;          
  wire       [Bits-1:0]           DI_byte2_;          
  wire       [Bits-1:0]           DI_byte3_;          
  wire       [Bits-1:0]           DI_byte4_;          
  wire       [Bits-1:0]           DI_byte5_;          
  wire       [Bits-1:0]           DI_byte6_;          
  wire       [Bits-1:0]           DI_byte7_;          
  wire                            WEB0_;              
  wire                            WEB1_;              
  wire                            WEB2_;              
  wire                            WEB3_;              
  wire                            WEB4_;              
  wire                            WEB5_;              
  wire                            WEB6_;              
  wire                            WEB7_;              
  wire                            CK_;                
  wire                            CS_;                


  reg                             read0;              
  reg                             write0;             
  reg                             read1;              
  reg                             write1;             
  reg                             read2;              
  reg                             write2;             
  reg                             read3;              
  reg                             write3;             
  reg                             read4;              
  reg                             write4;             
  reg                             read5;              
  reg                             write5;             
  reg                             read6;              
  reg                             write6;             
  reg                             read7;              
  reg                             write7;             




  wire                            con_A;              
  wire                            con_DI_byte0;       
  wire                            con_DI_byte1;       
  wire                            con_DI_byte2;       
  wire                            con_DI_byte3;       
  wire                            con_DI_byte4;       
  wire                            con_DI_byte5;       
  wire                            con_DI_byte6;       
  wire                            con_DI_byte7;       
  wire                            con_CK;             
  wire                            ck_per;             
  wire                            con_WEB0;           
  wire                            con_WEB1;           
  wire                            con_WEB2;           
  wire                            con_WEB3;           
  wire                            con_WEB4;           
  wire                            con_WEB5;           
  wire                            con_WEB6;           
  wire                            con_WEB7;           


  reg        [AddressSize-1:0]    Latch_A;            
  reg        [Bits-1:0]           Latch_DI_byte0;     
  reg        [Bits-1:0]           Latch_DI_byte1;     
  reg        [Bits-1:0]           Latch_DI_byte2;     
  reg        [Bits-1:0]           Latch_DI_byte3;     
  reg        [Bits-1:0]           Latch_DI_byte4;     
  reg        [Bits-1:0]           Latch_DI_byte5;     
  reg        [Bits-1:0]           Latch_DI_byte6;     
  reg        [Bits-1:0]           Latch_DI_byte7;     
  reg                             Latch_WEB0;         
  reg                             Latch_WEB1;         
  reg                             Latch_WEB2;         
  reg                             Latch_WEB3;         
  reg                             Latch_WEB4;         
  reg                             Latch_WEB5;         
  reg                             Latch_WEB6;         
  reg                             Latch_WEB7;         
  reg                             Latch_CS;           


  reg        [AddressSize-1:0]    A_i;                
  reg        [Bits-1:0]           DI_byte0_i;         
  reg        [Bits-1:0]           DI_byte1_i;         
  reg        [Bits-1:0]           DI_byte2_i;         
  reg        [Bits-1:0]           DI_byte3_i;         
  reg        [Bits-1:0]           DI_byte4_i;         
  reg        [Bits-1:0]           DI_byte5_i;         
  reg        [Bits-1:0]           DI_byte6_i;         
  reg        [Bits-1:0]           DI_byte7_i;         
  reg                             WEB0_i;             
  reg                             WEB1_i;             
  reg                             WEB2_i;             
  reg                             WEB3_i;             
  reg                             WEB4_i;             
  reg                             WEB5_i;             
  reg                             WEB6_i;             
  reg                             WEB7_i;             
  reg                             CS_i;               

  reg                             n_flag_A0;          
  reg                             n_flag_A1;          
  reg                             n_flag_A2;          
  reg                             n_flag_A3;          
  reg                             n_flag_A4;          
  reg                             n_flag_A5;          
  reg                             n_flag_DI0;         
  reg                             n_flag_DI1;         
  reg                             n_flag_DI2;         
  reg                             n_flag_DI3;         
  reg                             n_flag_DI4;         
  reg                             n_flag_DI5;         
  reg                             n_flag_DI6;         
  reg                             n_flag_DI7;         
  reg                             n_flag_DI8;         
  reg                             n_flag_DI9;         
  reg                             n_flag_DI10;        
  reg                             n_flag_DI11;        
  reg                             n_flag_DI12;        
  reg                             n_flag_DI13;        
  reg                             n_flag_DI14;        
  reg                             n_flag_DI15;        
  reg                             n_flag_DI16;        
  reg                             n_flag_DI17;        
  reg                             n_flag_DI18;        
  reg                             n_flag_DI19;        
  reg                             n_flag_DI20;        
  reg                             n_flag_DI21;        
  reg                             n_flag_DI22;        
  reg                             n_flag_DI23;        
  reg                             n_flag_DI24;        
  reg                             n_flag_DI25;        
  reg                             n_flag_DI26;        
  reg                             n_flag_DI27;        
  reg                             n_flag_DI28;        
  reg                             n_flag_DI29;        
  reg                             n_flag_DI30;        
  reg                             n_flag_DI31;        
  reg                             n_flag_DI32;        
  reg                             n_flag_DI33;        
  reg                             n_flag_DI34;        
  reg                             n_flag_DI35;        
  reg                             n_flag_DI36;        
  reg                             n_flag_DI37;        
  reg                             n_flag_DI38;        
  reg                             n_flag_DI39;        
  reg                             n_flag_DI40;        
  reg                             n_flag_DI41;        
  reg                             n_flag_DI42;        
  reg                             n_flag_DI43;        
  reg                             n_flag_DI44;        
  reg                             n_flag_DI45;        
  reg                             n_flag_DI46;        
  reg                             n_flag_DI47;        
  reg                             n_flag_DI48;        
  reg                             n_flag_DI49;        
  reg                             n_flag_DI50;        
  reg                             n_flag_DI51;        
  reg                             n_flag_DI52;        
  reg                             n_flag_DI53;        
  reg                             n_flag_DI54;        
  reg                             n_flag_DI55;        
  reg                             n_flag_DI56;        
  reg                             n_flag_DI57;        
  reg                             n_flag_DI58;        
  reg                             n_flag_DI59;        
  reg                             n_flag_DI60;        
  reg                             n_flag_DI61;        
  reg                             n_flag_DI62;        
  reg                             n_flag_DI63;        
  reg                             n_flag_DI64;        
  reg                             n_flag_DI65;        
  reg                             n_flag_DI66;        
  reg                             n_flag_DI67;        
  reg                             n_flag_DI68;        
  reg                             n_flag_DI69;        
  reg                             n_flag_DI70;        
  reg                             n_flag_DI71;        
  reg                             n_flag_DI72;        
  reg                             n_flag_DI73;        
  reg                             n_flag_DI74;        
  reg                             n_flag_DI75;        
  reg                             n_flag_DI76;        
  reg                             n_flag_DI77;        
  reg                             n_flag_DI78;        
  reg                             n_flag_DI79;        
  reg                             n_flag_DI80;        
  reg                             n_flag_DI81;        
  reg                             n_flag_DI82;        
  reg                             n_flag_DI83;        
  reg                             n_flag_DI84;        
  reg                             n_flag_DI85;        
  reg                             n_flag_DI86;        
  reg                             n_flag_DI87;        
  reg                             n_flag_DI88;        
  reg                             n_flag_DI89;        
  reg                             n_flag_DI90;        
  reg                             n_flag_DI91;        
  reg                             n_flag_DI92;        
  reg                             n_flag_DI93;        
  reg                             n_flag_DI94;        
  reg                             n_flag_DI95;        
  reg                             n_flag_WEB0;        
  reg                             n_flag_WEB1;        
  reg                             n_flag_WEB2;        
  reg                             n_flag_WEB3;        
  reg                             n_flag_WEB4;        
  reg                             n_flag_WEB5;        
  reg                             n_flag_WEB6;        
  reg                             n_flag_WEB7;        
  reg                             n_flag_CS;          
  reg                             n_flag_CK_PER;      
  reg                             n_flag_CK_MINH;     
  reg                             n_flag_CK_MINL;     


  reg                             LAST_n_flag_WEB0;   
  reg                             LAST_n_flag_WEB1;   
  reg                             LAST_n_flag_WEB2;   
  reg                             LAST_n_flag_WEB3;   
  reg                             LAST_n_flag_WEB4;   
  reg                             LAST_n_flag_WEB5;   
  reg                             LAST_n_flag_WEB6;   
  reg                             LAST_n_flag_WEB7;   
  reg                             LAST_n_flag_CS;     
  reg                             LAST_n_flag_CK_PER; 
  reg                             LAST_n_flag_CK_MINH;
  reg                             LAST_n_flag_CK_MINL;
  reg        [AddressSize-1:0]    NOT_BUS_A;          
  reg        [AddressSize-1:0]    LAST_NOT_BUS_A;     
  reg        [Bits-1:0]           NOT_BUS_DI_byte0;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte0;
  reg        [Bits-1:0]           NOT_BUS_DI_byte1;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte1;
  reg        [Bits-1:0]           NOT_BUS_DI_byte2;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte2;
  reg        [Bits-1:0]           NOT_BUS_DI_byte3;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte3;
  reg        [Bits-1:0]           NOT_BUS_DI_byte4;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte4;
  reg        [Bits-1:0]           NOT_BUS_DI_byte5;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte5;
  reg        [Bits-1:0]           NOT_BUS_DI_byte6;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte6;
  reg        [Bits-1:0]           NOT_BUS_DI_byte7;   
  reg        [Bits-1:0]           LAST_NOT_BUS_DI_byte7;


  reg        [AddressSize-1:0]    last_A;             
  reg        [AddressSize-1:0]    latch_last_A;       

  reg        [Bits-1:0]           last_DI_byte0;      
  reg        [Bits-1:0]           latch_last_DI_byte0;
  reg        [Bits-1:0]           last_DI_byte1;      
  reg        [Bits-1:0]           latch_last_DI_byte1;
  reg        [Bits-1:0]           last_DI_byte2;      
  reg        [Bits-1:0]           latch_last_DI_byte2;
  reg        [Bits-1:0]           last_DI_byte3;      
  reg        [Bits-1:0]           latch_last_DI_byte3;
  reg        [Bits-1:0]           last_DI_byte4;      
  reg        [Bits-1:0]           latch_last_DI_byte4;
  reg        [Bits-1:0]           last_DI_byte5;      
  reg        [Bits-1:0]           latch_last_DI_byte5;
  reg        [Bits-1:0]           last_DI_byte6;      
  reg        [Bits-1:0]           latch_last_DI_byte6;
  reg        [Bits-1:0]           last_DI_byte7;      
  reg        [Bits-1:0]           latch_last_DI_byte7;

  reg                             last_WEB0;          
  reg                             latch_last_WEB0;    
  reg                             last_WEB1;          
  reg                             latch_last_WEB1;    
  reg                             last_WEB2;          
  reg                             latch_last_WEB2;    
  reg                             last_WEB3;          
  reg                             latch_last_WEB3;    
  reg                             last_WEB4;          
  reg                             latch_last_WEB4;    
  reg                             last_WEB5;          
  reg                             latch_last_WEB5;    
  reg                             last_WEB6;          
  reg                             latch_last_WEB6;    
  reg                             last_WEB7;          
  reg                             latch_last_WEB7;    

  reg        [Bits-1:0]           DO_byte0_i;         
  reg        [Bits-1:0]           DO_byte1_i;         
  reg        [Bits-1:0]           DO_byte2_i;         
  reg        [Bits-1:0]           DO_byte3_i;         
  reg        [Bits-1:0]           DO_byte4_i;         
  reg        [Bits-1:0]           DO_byte5_i;         
  reg        [Bits-1:0]           DO_byte6_i;         
  reg        [Bits-1:0]           DO_byte7_i;         


  reg                             LastClkEdge;        

  reg                             flag_A_x;           
  reg                             flag_CS_x;          

  reg                             NODELAY0;           
  reg                             NODELAY1;           
  reg                             NODELAY2;           
  reg                             NODELAY3;           
  reg                             NODELAY4;           
  reg                             NODELAY5;           
  reg                             NODELAY6;           
  reg                             NODELAY7;           
  reg        [Bits-1:0]           DO_byte0_tmp;       
  event                           EventTOHDO_byte0;   
  reg        [Bits-1:0]           DO_byte1_tmp;       
  event                           EventTOHDO_byte1;   
  reg        [Bits-1:0]           DO_byte2_tmp;       
  event                           EventTOHDO_byte2;   
  reg        [Bits-1:0]           DO_byte3_tmp;       
  event                           EventTOHDO_byte3;   
  reg        [Bits-1:0]           DO_byte4_tmp;       
  event                           EventTOHDO_byte4;   
  reg        [Bits-1:0]           DO_byte5_tmp;       
  event                           EventTOHDO_byte5;   
  reg        [Bits-1:0]           DO_byte6_tmp;       
  event                           EventTOHDO_byte6;   
  reg        [Bits-1:0]           DO_byte7_tmp;       
  event                           EventTOHDO_byte7;   
  event                           EventNegCS;         
`ifdef MEM_VERIFY
  reg                             taa_verify;         
`else
`endif

  event                           EventTWDXDO_byte0;  
  event                           EventTWDXDO_byte1;  
  event                           EventTWDXDO_byte2;  
  event                           EventTWDXDO_byte3;  
  event                           EventTWDXDO_byte4;  
  event                           EventTWDXDO_byte5;  
  event                           EventTWDXDO_byte6;  
  event                           EventTWDXDO_byte7;  

  assign     DO_                  = {DO_byte7_i,DO_byte6_i,DO_byte5_i,DO_byte4_i,DO_byte3_i,DO_byte2_i,DO_byte1_i,DO_byte0_i};
  assign     con_A                = CS_;
  assign     con_DI_byte0         = CS_ & (!WEB0_);
  assign     con_DI_byte1         = CS_ & (!WEB1_);
  assign     con_DI_byte2         = CS_ & (!WEB2_);
  assign     con_DI_byte3         = CS_ & (!WEB3_);
  assign     con_DI_byte4         = CS_ & (!WEB4_);
  assign     con_DI_byte5         = CS_ & (!WEB5_);
  assign     con_DI_byte6         = CS_ & (!WEB6_);
  assign     con_DI_byte7         = CS_ & (!WEB7_);
  assign     con_WEB0             = CS_;
  assign     con_WEB1             = CS_;
  assign     con_WEB2             = CS_;
  assign     con_WEB3             = CS_;
  assign     con_WEB4             = CS_;
  assign     con_WEB5             = CS_;
  assign     con_WEB6             = CS_;
  assign     con_WEB7             = CS_;
  assign     con_CK               = CS_;
  assign     ck_per               = CS_;

  buf        ido0            (DO0, DO_[0]);                
  buf        ido1            (DO1, DO_[1]);                
  buf        ido2            (DO2, DO_[2]);                
  buf        ido3            (DO3, DO_[3]);                
  buf        ido4            (DO4, DO_[4]);                
  buf        ido5            (DO5, DO_[5]);                
  buf        ido6            (DO6, DO_[6]);                
  buf        ido7            (DO7, DO_[7]);                
  buf        ido8            (DO8, DO_[8]);                
  buf        ido9            (DO9, DO_[9]);                
  buf        ido10           (DO10, DO_[10]);              
  buf        ido11           (DO11, DO_[11]);              
  buf        ido12           (DO12, DO_[12]);              
  buf        ido13           (DO13, DO_[13]);              
  buf        ido14           (DO14, DO_[14]);              
  buf        ido15           (DO15, DO_[15]);              
  buf        ido16           (DO16, DO_[16]);              
  buf        ido17           (DO17, DO_[17]);              
  buf        ido18           (DO18, DO_[18]);              
  buf        ido19           (DO19, DO_[19]);              
  buf        ido20           (DO20, DO_[20]);              
  buf        ido21           (DO21, DO_[21]);              
  buf        ido22           (DO22, DO_[22]);              
  buf        ido23           (DO23, DO_[23]);              
  buf        ido24           (DO24, DO_[24]);              
  buf        ido25           (DO25, DO_[25]);              
  buf        ido26           (DO26, DO_[26]);              
  buf        ido27           (DO27, DO_[27]);              
  buf        ido28           (DO28, DO_[28]);              
  buf        ido29           (DO29, DO_[29]);              
  buf        ido30           (DO30, DO_[30]);              
  buf        ido31           (DO31, DO_[31]);              
  buf        ido32           (DO32, DO_[32]);              
  buf        ido33           (DO33, DO_[33]);              
  buf        ido34           (DO34, DO_[34]);              
  buf        ido35           (DO35, DO_[35]);              
  buf        ido36           (DO36, DO_[36]);              
  buf        ido37           (DO37, DO_[37]);              
  buf        ido38           (DO38, DO_[38]);              
  buf        ido39           (DO39, DO_[39]);              
  buf        ido40           (DO40, DO_[40]);              
  buf        ido41           (DO41, DO_[41]);              
  buf        ido42           (DO42, DO_[42]);              
  buf        ido43           (DO43, DO_[43]);              
  buf        ido44           (DO44, DO_[44]);              
  buf        ido45           (DO45, DO_[45]);              
  buf        ido46           (DO46, DO_[46]);              
  buf        ido47           (DO47, DO_[47]);              
  buf        ido48           (DO48, DO_[48]);              
  buf        ido49           (DO49, DO_[49]);              
  buf        ido50           (DO50, DO_[50]);              
  buf        ido51           (DO51, DO_[51]);              
  buf        ido52           (DO52, DO_[52]);              
  buf        ido53           (DO53, DO_[53]);              
  buf        ido54           (DO54, DO_[54]);              
  buf        ido55           (DO55, DO_[55]);              
  buf        ido56           (DO56, DO_[56]);              
  buf        ido57           (DO57, DO_[57]);              
  buf        ido58           (DO58, DO_[58]);              
  buf        ido59           (DO59, DO_[59]);              
  buf        ido60           (DO60, DO_[60]);              
  buf        ido61           (DO61, DO_[61]);              
  buf        ido62           (DO62, DO_[62]);              
  buf        ido63           (DO63, DO_[63]);              
  buf        ido64           (DO64, DO_[64]);              
  buf        ido65           (DO65, DO_[65]);              
  buf        ido66           (DO66, DO_[66]);              
  buf        ido67           (DO67, DO_[67]);              
  buf        ido68           (DO68, DO_[68]);              
  buf        ido69           (DO69, DO_[69]);              
  buf        ido70           (DO70, DO_[70]);              
  buf        ido71           (DO71, DO_[71]);              
  buf        ido72           (DO72, DO_[72]);              
  buf        ido73           (DO73, DO_[73]);              
  buf        ido74           (DO74, DO_[74]);              
  buf        ido75           (DO75, DO_[75]);              
  buf        ido76           (DO76, DO_[76]);              
  buf        ido77           (DO77, DO_[77]);              
  buf        ido78           (DO78, DO_[78]);              
  buf        ido79           (DO79, DO_[79]);              
  buf        ido80           (DO80, DO_[80]);              
  buf        ido81           (DO81, DO_[81]);              
  buf        ido82           (DO82, DO_[82]);              
  buf        ido83           (DO83, DO_[83]);              
  buf        ido84           (DO84, DO_[84]);              
  buf        ido85           (DO85, DO_[85]);              
  buf        ido86           (DO86, DO_[86]);              
  buf        ido87           (DO87, DO_[87]);              
  buf        ido88           (DO88, DO_[88]);              
  buf        ido89           (DO89, DO_[89]);              
  buf        ido90           (DO90, DO_[90]);              
  buf        ido91           (DO91, DO_[91]);              
  buf        ido92           (DO92, DO_[92]);              
  buf        ido93           (DO93, DO_[93]);              
  buf        ido94           (DO94, DO_[94]);              
  buf        ido95           (DO95, DO_[95]);              
  buf        ick0            (CK_, CK);                    
  buf        ia0             (A_[0], A0);                  
  buf        ia1             (A_[1], A1);                  
  buf        ia2             (A_[2], A2);                  
  buf        ia3             (A_[3], A3);                  
  buf        ia4             (A_[4], A4);                  
  buf        ia5             (A_[5], A5);                  
  buf        idi_byte0_0     (DI_byte0_[0], DI0);          
  buf        idi_byte0_1     (DI_byte0_[1], DI1);          
  buf        idi_byte0_2     (DI_byte0_[2], DI2);          
  buf        idi_byte0_3     (DI_byte0_[3], DI3);          
  buf        idi_byte0_4     (DI_byte0_[4], DI4);          
  buf        idi_byte0_5     (DI_byte0_[5], DI5);          
  buf        idi_byte0_6     (DI_byte0_[6], DI6);          
  buf        idi_byte0_7     (DI_byte0_[7], DI7);          
  buf        idi_byte0_8     (DI_byte0_[8], DI8);          
  buf        idi_byte0_9     (DI_byte0_[9], DI9);          
  buf        idi_byte0_10    (DI_byte0_[10], DI10);        
  buf        idi_byte0_11    (DI_byte0_[11], DI11);        
  buf        idi_byte1_0     (DI_byte1_[0], DI12);         
  buf        idi_byte1_1     (DI_byte1_[1], DI13);         
  buf        idi_byte1_2     (DI_byte1_[2], DI14);         
  buf        idi_byte1_3     (DI_byte1_[3], DI15);         
  buf        idi_byte1_4     (DI_byte1_[4], DI16);         
  buf        idi_byte1_5     (DI_byte1_[5], DI17);         
  buf        idi_byte1_6     (DI_byte1_[6], DI18);         
  buf        idi_byte1_7     (DI_byte1_[7], DI19);         
  buf        idi_byte1_8     (DI_byte1_[8], DI20);         
  buf        idi_byte1_9     (DI_byte1_[9], DI21);         
  buf        idi_byte1_10    (DI_byte1_[10], DI22);        
  buf        idi_byte1_11    (DI_byte1_[11], DI23);        
  buf        idi_byte2_0     (DI_byte2_[0], DI24);         
  buf        idi_byte2_1     (DI_byte2_[1], DI25);         
  buf        idi_byte2_2     (DI_byte2_[2], DI26);         
  buf        idi_byte2_3     (DI_byte2_[3], DI27);         
  buf        idi_byte2_4     (DI_byte2_[4], DI28);         
  buf        idi_byte2_5     (DI_byte2_[5], DI29);         
  buf        idi_byte2_6     (DI_byte2_[6], DI30);         
  buf        idi_byte2_7     (DI_byte2_[7], DI31);         
  buf        idi_byte2_8     (DI_byte2_[8], DI32);         
  buf        idi_byte2_9     (DI_byte2_[9], DI33);         
  buf        idi_byte2_10    (DI_byte2_[10], DI34);        
  buf        idi_byte2_11    (DI_byte2_[11], DI35);        
  buf        idi_byte3_0     (DI_byte3_[0], DI36);         
  buf        idi_byte3_1     (DI_byte3_[1], DI37);         
  buf        idi_byte3_2     (DI_byte3_[2], DI38);         
  buf        idi_byte3_3     (DI_byte3_[3], DI39);         
  buf        idi_byte3_4     (DI_byte3_[4], DI40);         
  buf        idi_byte3_5     (DI_byte3_[5], DI41);         
  buf        idi_byte3_6     (DI_byte3_[6], DI42);         
  buf        idi_byte3_7     (DI_byte3_[7], DI43);         
  buf        idi_byte3_8     (DI_byte3_[8], DI44);         
  buf        idi_byte3_9     (DI_byte3_[9], DI45);         
  buf        idi_byte3_10    (DI_byte3_[10], DI46);        
  buf        idi_byte3_11    (DI_byte3_[11], DI47);        
  buf        idi_byte4_0     (DI_byte4_[0], DI48);         
  buf        idi_byte4_1     (DI_byte4_[1], DI49);         
  buf        idi_byte4_2     (DI_byte4_[2], DI50);         
  buf        idi_byte4_3     (DI_byte4_[3], DI51);         
  buf        idi_byte4_4     (DI_byte4_[4], DI52);         
  buf        idi_byte4_5     (DI_byte4_[5], DI53);         
  buf        idi_byte4_6     (DI_byte4_[6], DI54);         
  buf        idi_byte4_7     (DI_byte4_[7], DI55);         
  buf        idi_byte4_8     (DI_byte4_[8], DI56);         
  buf        idi_byte4_9     (DI_byte4_[9], DI57);         
  buf        idi_byte4_10    (DI_byte4_[10], DI58);        
  buf        idi_byte4_11    (DI_byte4_[11], DI59);        
  buf        idi_byte5_0     (DI_byte5_[0], DI60);         
  buf        idi_byte5_1     (DI_byte5_[1], DI61);         
  buf        idi_byte5_2     (DI_byte5_[2], DI62);         
  buf        idi_byte5_3     (DI_byte5_[3], DI63);         
  buf        idi_byte5_4     (DI_byte5_[4], DI64);         
  buf        idi_byte5_5     (DI_byte5_[5], DI65);         
  buf        idi_byte5_6     (DI_byte5_[6], DI66);         
  buf        idi_byte5_7     (DI_byte5_[7], DI67);         
  buf        idi_byte5_8     (DI_byte5_[8], DI68);         
  buf        idi_byte5_9     (DI_byte5_[9], DI69);         
  buf        idi_byte5_10    (DI_byte5_[10], DI70);        
  buf        idi_byte5_11    (DI_byte5_[11], DI71);        
  buf        idi_byte6_0     (DI_byte6_[0], DI72);         
  buf        idi_byte6_1     (DI_byte6_[1], DI73);         
  buf        idi_byte6_2     (DI_byte6_[2], DI74);         
  buf        idi_byte6_3     (DI_byte6_[3], DI75);         
  buf        idi_byte6_4     (DI_byte6_[4], DI76);         
  buf        idi_byte6_5     (DI_byte6_[5], DI77);         
  buf        idi_byte6_6     (DI_byte6_[6], DI78);         
  buf        idi_byte6_7     (DI_byte6_[7], DI79);         
  buf        idi_byte6_8     (DI_byte6_[8], DI80);         
  buf        idi_byte6_9     (DI_byte6_[9], DI81);         
  buf        idi_byte6_10    (DI_byte6_[10], DI82);        
  buf        idi_byte6_11    (DI_byte6_[11], DI83);        
  buf        idi_byte7_0     (DI_byte7_[0], DI84);         
  buf        idi_byte7_1     (DI_byte7_[1], DI85);         
  buf        idi_byte7_2     (DI_byte7_[2], DI86);         
  buf        idi_byte7_3     (DI_byte7_[3], DI87);         
  buf        idi_byte7_4     (DI_byte7_[4], DI88);         
  buf        idi_byte7_5     (DI_byte7_[5], DI89);         
  buf        idi_byte7_6     (DI_byte7_[6], DI90);         
  buf        idi_byte7_7     (DI_byte7_[7], DI91);         
  buf        idi_byte7_8     (DI_byte7_[8], DI92);         
  buf        idi_byte7_9     (DI_byte7_[9], DI93);         
  buf        idi_byte7_10    (DI_byte7_[10], DI94);        
  buf        idi_byte7_11    (DI_byte7_[11], DI95);        
  not        ics0            (CS_, CSB);                   
  buf        iweb0           (WEB0_, WEB0);                
  buf        iweb1           (WEB1_, WEB1);                
  buf        iweb2           (WEB2_, WEB2);                
  buf        iweb3           (WEB3_, WEB3);                
  buf        iweb4           (WEB4_, WEB4);                
  buf        iweb5           (WEB5_, WEB5);                
  buf        iweb6           (WEB6_, WEB6);                
  buf        iweb7           (WEB7_, WEB7);                



  initial begin
    $timeformat (-12, 0, " ps", 20);
    flag_A_x = `FALSE;
    NODELAY0 = 1'b0;
    NODELAY1 = 1'b0;
    NODELAY2 = 1'b0;
    NODELAY3 = 1'b0;
    NODELAY4 = 1'b0;
    NODELAY5 = 1'b0;
    NODELAY6 = 1'b0;
    NODELAY7 = 1'b0;
    LastClkEdge = 1'b0;
  `ifdef MEM_INIT_ZERO
       all_core_x(0,0);
       all_core_x(1,0);
       all_core_x(2,0);
       all_core_x(3,0);
       all_core_x(4,0);
       all_core_x(5,0);
       all_core_x(6,0);
       all_core_x(7,0);
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
           last_WEB0 = latch_last_WEB0;
           last_WEB1 = latch_last_WEB1;
           last_WEB2 = latch_last_WEB2;
           last_WEB3 = latch_last_WEB3;
           last_WEB4 = latch_last_WEB4;
           last_WEB5 = latch_last_WEB5;
           last_WEB6 = latch_last_WEB6;
           last_WEB7 = latch_last_WEB7;
           last_DI_byte0 = latch_last_DI_byte0;
           last_DI_byte1 = latch_last_DI_byte1;
           last_DI_byte2 = latch_last_DI_byte2;
           last_DI_byte3 = latch_last_DI_byte3;
           last_DI_byte4 = latch_last_DI_byte4;
           last_DI_byte5 = latch_last_DI_byte5;
           last_DI_byte6 = latch_last_DI_byte6;
           last_DI_byte7 = latch_last_DI_byte7;
           CS_monitor;
           pre_latch_data;
           read0 = WEB0_;
           write0 = !WEB0_;
           read1 = WEB1_;
           write1 = !WEB1_;
           read2 = WEB2_;
           write2 = !WEB2_;
           read3 = WEB3_;
           write3 = !WEB3_;
           read4 = WEB4_;
           write4 = !WEB4_;
           read5 = WEB5_;
           write5 = !WEB5_;
           read6 = WEB6_;
           write6 = !WEB6_;
           read7 = WEB7_;
           write7 = !WEB7_;
           memory_function;
`ifdef TRC_CHECK
           trc_timiming_monitor;
`else
`endif
           latch_last_A = A_;
           latch_last_DI_byte0 = DI_byte0_;
           latch_last_DI_byte1 = DI_byte1_;
           latch_last_DI_byte2 = DI_byte2_;
           latch_last_DI_byte3 = DI_byte3_;
           latch_last_DI_byte4 = DI_byte4_;
           latch_last_DI_byte5 = DI_byte5_;
           latch_last_DI_byte6 = DI_byte6_;
           latch_last_DI_byte7 = DI_byte7_;
           latch_last_WEB0 = WEB0_;
           latch_last_WEB1 = WEB1_;
           latch_last_WEB2 = WEB2_;
           latch_last_WEB3 = WEB3_;
           latch_last_WEB4 = WEB4_;
           latch_last_WEB5 = WEB5_;
           latch_last_WEB6 = WEB6_;
           latch_last_WEB7 = WEB7_;
         end
      2'b?x:
         begin
`ifdef NO_MEM_MSG
`else
           ErrorMessage(0);
`endif
           if (CS_ !== 0) begin
              if (WEB0_ !== 1'b1) begin
                 all_core_x(0,1);
              end else begin
                 #0 disable TOHDO_byte0;
                    disable TWDXDO_byte0;
                 NODELAY0 = 1'b1;
                 DO_byte0_i = {Bits{1'bX}};
              end
              if (WEB1_ !== 1'b1) begin
                 all_core_x(1,1);
              end else begin
                 #0 disable TOHDO_byte1;
                    disable TWDXDO_byte1;
                 NODELAY1 = 1'b1;
                 DO_byte1_i = {Bits{1'bX}};
              end
              if (WEB2_ !== 1'b1) begin
                 all_core_x(2,1);
              end else begin
                 #0 disable TOHDO_byte2;
                    disable TWDXDO_byte2;
                 NODELAY2 = 1'b1;
                 DO_byte2_i = {Bits{1'bX}};
              end
              if (WEB3_ !== 1'b1) begin
                 all_core_x(3,1);
              end else begin
                 #0 disable TOHDO_byte3;
                    disable TWDXDO_byte3;
                 NODELAY3 = 1'b1;
                 DO_byte3_i = {Bits{1'bX}};
              end
              if (WEB4_ !== 1'b1) begin
                 all_core_x(4,1);
              end else begin
                 #0 disable TOHDO_byte4;
                    disable TWDXDO_byte4;
                 NODELAY4 = 1'b1;
                 DO_byte4_i = {Bits{1'bX}};
              end
              if (WEB5_ !== 1'b1) begin
                 all_core_x(5,1);
              end else begin
                 #0 disable TOHDO_byte5;
                    disable TWDXDO_byte5;
                 NODELAY5 = 1'b1;
                 DO_byte5_i = {Bits{1'bX}};
              end
              if (WEB6_ !== 1'b1) begin
                 all_core_x(6,1);
              end else begin
                 #0 disable TOHDO_byte6;
                    disable TWDXDO_byte6;
                 NODELAY6 = 1'b1;
                 DO_byte6_i = {Bits{1'bX}};
              end
              if (WEB7_ !== 1'b1) begin
                 all_core_x(7,1);
              end else begin
                 #0 disable TOHDO_byte7;
                    disable TWDXDO_byte7;
                 NODELAY7 = 1'b1;
                 DO_byte7_i = {Bits{1'bX}};
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
           n_flag_DI0 or
           n_flag_DI1 or
           n_flag_DI2 or
           n_flag_DI3 or
           n_flag_DI4 or
           n_flag_DI5 or
           n_flag_DI6 or
           n_flag_DI7 or
           n_flag_DI8 or
           n_flag_DI9 or
           n_flag_DI10 or
           n_flag_DI11 or
           n_flag_DI12 or
           n_flag_DI13 or
           n_flag_DI14 or
           n_flag_DI15 or
           n_flag_DI16 or
           n_flag_DI17 or
           n_flag_DI18 or
           n_flag_DI19 or
           n_flag_DI20 or
           n_flag_DI21 or
           n_flag_DI22 or
           n_flag_DI23 or
           n_flag_DI24 or
           n_flag_DI25 or
           n_flag_DI26 or
           n_flag_DI27 or
           n_flag_DI28 or
           n_flag_DI29 or
           n_flag_DI30 or
           n_flag_DI31 or
           n_flag_DI32 or
           n_flag_DI33 or
           n_flag_DI34 or
           n_flag_DI35 or
           n_flag_DI36 or
           n_flag_DI37 or
           n_flag_DI38 or
           n_flag_DI39 or
           n_flag_DI40 or
           n_flag_DI41 or
           n_flag_DI42 or
           n_flag_DI43 or
           n_flag_DI44 or
           n_flag_DI45 or
           n_flag_DI46 or
           n_flag_DI47 or
           n_flag_DI48 or
           n_flag_DI49 or
           n_flag_DI50 or
           n_flag_DI51 or
           n_flag_DI52 or
           n_flag_DI53 or
           n_flag_DI54 or
           n_flag_DI55 or
           n_flag_DI56 or
           n_flag_DI57 or
           n_flag_DI58 or
           n_flag_DI59 or
           n_flag_DI60 or
           n_flag_DI61 or
           n_flag_DI62 or
           n_flag_DI63 or
           n_flag_DI64 or
           n_flag_DI65 or
           n_flag_DI66 or
           n_flag_DI67 or
           n_flag_DI68 or
           n_flag_DI69 or
           n_flag_DI70 or
           n_flag_DI71 or
           n_flag_DI72 or
           n_flag_DI73 or
           n_flag_DI74 or
           n_flag_DI75 or
           n_flag_DI76 or
           n_flag_DI77 or
           n_flag_DI78 or
           n_flag_DI79 or
           n_flag_DI80 or
           n_flag_DI81 or
           n_flag_DI82 or
           n_flag_DI83 or
           n_flag_DI84 or
           n_flag_DI85 or
           n_flag_DI86 or
           n_flag_DI87 or
           n_flag_DI88 or
           n_flag_DI89 or
           n_flag_DI90 or
           n_flag_DI91 or
           n_flag_DI92 or
           n_flag_DI93 or
           n_flag_DI94 or
           n_flag_DI95 or
           n_flag_WEB0 or
           n_flag_WEB1 or
           n_flag_WEB2 or
           n_flag_WEB3 or
           n_flag_WEB4 or
           n_flag_WEB5 or
           n_flag_WEB6 or
           n_flag_WEB7 or
           n_flag_CS or
           n_flag_CK_PER or
           n_flag_CK_MINH or
           n_flag_CK_MINL 
          )
     begin
       timingcheck_violation;
     end




  always @(EventTOHDO_byte0) 
    begin:TOHDO_byte0 
      #TOH 
      NODELAY0 <= 1'b0; 
      DO_byte0_i              =  {Bits{1'bX}}; 
      DO_byte0_i              <= DO_byte0_tmp; 
  end 

  always @(EventTOHDO_byte1) 
    begin:TOHDO_byte1 
      #TOH 
      NODELAY1 <= 1'b0; 
      DO_byte1_i              =  {Bits{1'bX}}; 
      DO_byte1_i              <= DO_byte1_tmp; 
  end 

  always @(EventTOHDO_byte2) 
    begin:TOHDO_byte2 
      #TOH 
      NODELAY2 <= 1'b0; 
      DO_byte2_i              =  {Bits{1'bX}}; 
      DO_byte2_i              <= DO_byte2_tmp; 
  end 

  always @(EventTOHDO_byte3) 
    begin:TOHDO_byte3 
      #TOH 
      NODELAY3 <= 1'b0; 
      DO_byte3_i              =  {Bits{1'bX}}; 
      DO_byte3_i              <= DO_byte3_tmp; 
  end 

  always @(EventTOHDO_byte4) 
    begin:TOHDO_byte4 
      #TOH 
      NODELAY4 <= 1'b0; 
      DO_byte4_i              =  {Bits{1'bX}}; 
      DO_byte4_i              <= DO_byte4_tmp; 
  end 

  always @(EventTOHDO_byte5) 
    begin:TOHDO_byte5 
      #TOH 
      NODELAY5 <= 1'b0; 
      DO_byte5_i              =  {Bits{1'bX}}; 
      DO_byte5_i              <= DO_byte5_tmp; 
  end 

  always @(EventTOHDO_byte6) 
    begin:TOHDO_byte6 
      #TOH 
      NODELAY6 <= 1'b0; 
      DO_byte6_i              =  {Bits{1'bX}}; 
      DO_byte6_i              <= DO_byte6_tmp; 
  end 

  always @(EventTOHDO_byte7) 
    begin:TOHDO_byte7 
      #TOH 
      NODELAY7 <= 1'b0; 
      DO_byte7_i              =  {Bits{1'bX}}; 
      DO_byte7_i              <= DO_byte7_tmp; 
  end 


  always @(EventTWDXDO_byte0) 
    begin:TWDXDO_byte0 
      #TWDX 
      NODELAY0 <= 1'b0; 
      DO_byte0_i              =  {Bits{1'bX}}; 
      DO_byte0_i              <= DO_byte0_tmp; 
  end 

  always @(EventTWDXDO_byte1) 
    begin:TWDXDO_byte1 
      #TWDX 
      NODELAY1 <= 1'b0; 
      DO_byte1_i              =  {Bits{1'bX}}; 
      DO_byte1_i              <= DO_byte1_tmp; 
  end 

  always @(EventTWDXDO_byte2) 
    begin:TWDXDO_byte2 
      #TWDX 
      NODELAY2 <= 1'b0; 
      DO_byte2_i              =  {Bits{1'bX}}; 
      DO_byte2_i              <= DO_byte2_tmp; 
  end 

  always @(EventTWDXDO_byte3) 
    begin:TWDXDO_byte3 
      #TWDX 
      NODELAY3 <= 1'b0; 
      DO_byte3_i              =  {Bits{1'bX}}; 
      DO_byte3_i              <= DO_byte3_tmp; 
  end 

  always @(EventTWDXDO_byte4) 
    begin:TWDXDO_byte4 
      #TWDX 
      NODELAY4 <= 1'b0; 
      DO_byte4_i              =  {Bits{1'bX}}; 
      DO_byte4_i              <= DO_byte4_tmp; 
  end 

  always @(EventTWDXDO_byte5) 
    begin:TWDXDO_byte5 
      #TWDX 
      NODELAY5 <= 1'b0; 
      DO_byte5_i              =  {Bits{1'bX}}; 
      DO_byte5_i              <= DO_byte5_tmp; 
  end 

  always @(EventTWDXDO_byte6) 
    begin:TWDXDO_byte6 
      #TWDX 
      NODELAY6 <= 1'b0; 
      DO_byte6_i              =  {Bits{1'bX}}; 
      DO_byte6_i              <= DO_byte6_tmp; 
  end 

  always @(EventTWDXDO_byte7) 
    begin:TWDXDO_byte7 
      #TWDX 
      NODELAY7 <= 1'b0; 
      DO_byte7_i              =  {Bits{1'bX}}; 
      DO_byte7_i              <= DO_byte7_tmp; 
  end 

  always @(EventNegCS) 
    begin:NegCS
      #TOH 
      disable TOHDO_byte0;
      NODELAY0 = 1'b0; 
      DO_byte0_i              =  {Bits{1'bX}}; 
      disable TOHDO_byte1;
      NODELAY1 = 1'b0; 
      DO_byte1_i              =  {Bits{1'bX}}; 
      disable TOHDO_byte2;
      NODELAY2 = 1'b0; 
      DO_byte2_i              =  {Bits{1'bX}}; 
      disable TOHDO_byte3;
      NODELAY3 = 1'b0; 
      DO_byte3_i              =  {Bits{1'bX}}; 
      disable TOHDO_byte4;
      NODELAY4 = 1'b0; 
      DO_byte4_i              =  {Bits{1'bX}}; 
      disable TOHDO_byte5;
      NODELAY5 = 1'b0; 
      DO_byte5_i              =  {Bits{1'bX}}; 
      disable TOHDO_byte6;
      NODELAY6 = 1'b0; 
      DO_byte6_i              =  {Bits{1'bX}}; 
      disable TOHDO_byte7;
      NODELAY7 = 1'b0; 
      DO_byte7_i              =  {Bits{1'bX}}; 
  end 

  task timingcheck_violation;
    integer i;
    begin
      if ((n_flag_CK_PER  !== LAST_n_flag_CK_PER)  ||
          (n_flag_CK_MINH !== LAST_n_flag_CK_MINH) ||
          (n_flag_CK_MINL !== LAST_n_flag_CK_MINL)) begin
          if (CS_ !== 1'b0) begin
             if (WEB0_ !== 1'b1) begin
                all_core_x(0,1);
             end
             else begin
                #0 disable TOHDO_byte0;
                   disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
             end
             if (WEB1_ !== 1'b1) begin
                all_core_x(1,1);
             end
             else begin
                #0 disable TOHDO_byte1;
                   disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
             end
             if (WEB2_ !== 1'b1) begin
                all_core_x(2,1);
             end
             else begin
                #0 disable TOHDO_byte2;
                   disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
             end
             if (WEB3_ !== 1'b1) begin
                all_core_x(3,1);
             end
             else begin
                #0 disable TOHDO_byte3;
                   disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
             end
             if (WEB4_ !== 1'b1) begin
                all_core_x(4,1);
             end
             else begin
                #0 disable TOHDO_byte4;
                   disable TWDXDO_byte4;
                NODELAY4 = 1'b1;
                DO_byte4_i = {Bits{1'bX}};
             end
             if (WEB5_ !== 1'b1) begin
                all_core_x(5,1);
             end
             else begin
                #0 disable TOHDO_byte5;
                   disable TWDXDO_byte5;
                NODELAY5 = 1'b1;
                DO_byte5_i = {Bits{1'bX}};
             end
             if (WEB6_ !== 1'b1) begin
                all_core_x(6,1);
             end
             else begin
                #0 disable TOHDO_byte6;
                   disable TWDXDO_byte6;
                NODELAY6 = 1'b1;
                DO_byte6_i = {Bits{1'bX}};
             end
             if (WEB7_ !== 1'b1) begin
                all_core_x(7,1);
             end
             else begin
                #0 disable TOHDO_byte7;
                   disable TWDXDO_byte7;
                NODELAY7 = 1'b1;
                DO_byte7_i = {Bits{1'bX}};
             end
          end
      end
      else begin
          NOT_BUS_A  = {
                         n_flag_A5,
                         n_flag_A4,
                         n_flag_A3,
                         n_flag_A2,
                         n_flag_A1,
                         n_flag_A0};

          NOT_BUS_DI_byte0  = {
                         n_flag_DI11,
                         n_flag_DI10,
                         n_flag_DI9,
                         n_flag_DI8,
                         n_flag_DI7,
                         n_flag_DI6,
                         n_flag_DI5,
                         n_flag_DI4,
                         n_flag_DI3,
                         n_flag_DI2,
                         n_flag_DI1,
                         n_flag_DI0};

          NOT_BUS_DI_byte1  = {
                         n_flag_DI23,
                         n_flag_DI22,
                         n_flag_DI21,
                         n_flag_DI20,
                         n_flag_DI19,
                         n_flag_DI18,
                         n_flag_DI17,
                         n_flag_DI16,
                         n_flag_DI15,
                         n_flag_DI14,
                         n_flag_DI13,
                         n_flag_DI12};

          NOT_BUS_DI_byte2  = {
                         n_flag_DI35,
                         n_flag_DI34,
                         n_flag_DI33,
                         n_flag_DI32,
                         n_flag_DI31,
                         n_flag_DI30,
                         n_flag_DI29,
                         n_flag_DI28,
                         n_flag_DI27,
                         n_flag_DI26,
                         n_flag_DI25,
                         n_flag_DI24};

          NOT_BUS_DI_byte3  = {
                         n_flag_DI47,
                         n_flag_DI46,
                         n_flag_DI45,
                         n_flag_DI44,
                         n_flag_DI43,
                         n_flag_DI42,
                         n_flag_DI41,
                         n_flag_DI40,
                         n_flag_DI39,
                         n_flag_DI38,
                         n_flag_DI37,
                         n_flag_DI36};

          NOT_BUS_DI_byte4  = {
                         n_flag_DI59,
                         n_flag_DI58,
                         n_flag_DI57,
                         n_flag_DI56,
                         n_flag_DI55,
                         n_flag_DI54,
                         n_flag_DI53,
                         n_flag_DI52,
                         n_flag_DI51,
                         n_flag_DI50,
                         n_flag_DI49,
                         n_flag_DI48};

          NOT_BUS_DI_byte5  = {
                         n_flag_DI71,
                         n_flag_DI70,
                         n_flag_DI69,
                         n_flag_DI68,
                         n_flag_DI67,
                         n_flag_DI66,
                         n_flag_DI65,
                         n_flag_DI64,
                         n_flag_DI63,
                         n_flag_DI62,
                         n_flag_DI61,
                         n_flag_DI60};

          NOT_BUS_DI_byte6  = {
                         n_flag_DI83,
                         n_flag_DI82,
                         n_flag_DI81,
                         n_flag_DI80,
                         n_flag_DI79,
                         n_flag_DI78,
                         n_flag_DI77,
                         n_flag_DI76,
                         n_flag_DI75,
                         n_flag_DI74,
                         n_flag_DI73,
                         n_flag_DI72};

          NOT_BUS_DI_byte7  = {
                         n_flag_DI95,
                         n_flag_DI94,
                         n_flag_DI93,
                         n_flag_DI92,
                         n_flag_DI91,
                         n_flag_DI90,
                         n_flag_DI89,
                         n_flag_DI88,
                         n_flag_DI87,
                         n_flag_DI86,
                         n_flag_DI85,
                         n_flag_DI84};


          for (i=0; i<AddressSize; i=i+1) begin
             Latch_A[i] = (NOT_BUS_A[i] !== LAST_NOT_BUS_A[i]) ? 1'bx : Latch_A[i];
          end
          for (i=0; i<Bits; i=i+1) begin
             Latch_DI_byte0[i] = (NOT_BUS_DI_byte0[i] !== LAST_NOT_BUS_DI_byte0[i]) ? 1'bx : Latch_DI_byte0[i];
             Latch_DI_byte1[i] = (NOT_BUS_DI_byte1[i] !== LAST_NOT_BUS_DI_byte1[i]) ? 1'bx : Latch_DI_byte1[i];
             Latch_DI_byte2[i] = (NOT_BUS_DI_byte2[i] !== LAST_NOT_BUS_DI_byte2[i]) ? 1'bx : Latch_DI_byte2[i];
             Latch_DI_byte3[i] = (NOT_BUS_DI_byte3[i] !== LAST_NOT_BUS_DI_byte3[i]) ? 1'bx : Latch_DI_byte3[i];
             Latch_DI_byte4[i] = (NOT_BUS_DI_byte4[i] !== LAST_NOT_BUS_DI_byte4[i]) ? 1'bx : Latch_DI_byte4[i];
             Latch_DI_byte5[i] = (NOT_BUS_DI_byte5[i] !== LAST_NOT_BUS_DI_byte5[i]) ? 1'bx : Latch_DI_byte5[i];
             Latch_DI_byte6[i] = (NOT_BUS_DI_byte6[i] !== LAST_NOT_BUS_DI_byte6[i]) ? 1'bx : Latch_DI_byte6[i];
             Latch_DI_byte7[i] = (NOT_BUS_DI_byte7[i] !== LAST_NOT_BUS_DI_byte7[i]) ? 1'bx : Latch_DI_byte7[i];
          end
          Latch_CS  =  (n_flag_CS  !== LAST_n_flag_CS)  ? 1'bx : Latch_CS;
          Latch_WEB0 = (n_flag_WEB0 !== LAST_n_flag_WEB0)  ? 1'bx : Latch_WEB0;
          Latch_WEB1 = (n_flag_WEB1 !== LAST_n_flag_WEB1)  ? 1'bx : Latch_WEB1;
          Latch_WEB2 = (n_flag_WEB2 !== LAST_n_flag_WEB2)  ? 1'bx : Latch_WEB2;
          Latch_WEB3 = (n_flag_WEB3 !== LAST_n_flag_WEB3)  ? 1'bx : Latch_WEB3;
          Latch_WEB4 = (n_flag_WEB4 !== LAST_n_flag_WEB4)  ? 1'bx : Latch_WEB4;
          Latch_WEB5 = (n_flag_WEB5 !== LAST_n_flag_WEB5)  ? 1'bx : Latch_WEB5;
          Latch_WEB6 = (n_flag_WEB6 !== LAST_n_flag_WEB6)  ? 1'bx : Latch_WEB6;
          Latch_WEB7 = (n_flag_WEB7 !== LAST_n_flag_WEB7)  ? 1'bx : Latch_WEB7;
          memory_function;
      end

      LAST_NOT_BUS_A                 = NOT_BUS_A;
      LAST_NOT_BUS_DI_byte0          = NOT_BUS_DI_byte0;
      LAST_NOT_BUS_DI_byte1          = NOT_BUS_DI_byte1;
      LAST_NOT_BUS_DI_byte2          = NOT_BUS_DI_byte2;
      LAST_NOT_BUS_DI_byte3          = NOT_BUS_DI_byte3;
      LAST_NOT_BUS_DI_byte4          = NOT_BUS_DI_byte4;
      LAST_NOT_BUS_DI_byte5          = NOT_BUS_DI_byte5;
      LAST_NOT_BUS_DI_byte6          = NOT_BUS_DI_byte6;
      LAST_NOT_BUS_DI_byte7          = NOT_BUS_DI_byte7;
      LAST_n_flag_WEB0               = n_flag_WEB0;
      LAST_n_flag_WEB1               = n_flag_WEB1;
      LAST_n_flag_WEB2               = n_flag_WEB2;
      LAST_n_flag_WEB3               = n_flag_WEB3;
      LAST_n_flag_WEB4               = n_flag_WEB4;
      LAST_n_flag_WEB5               = n_flag_WEB5;
      LAST_n_flag_WEB6               = n_flag_WEB6;
      LAST_n_flag_WEB7               = n_flag_WEB7;
      LAST_n_flag_CS                 = n_flag_CS;
      LAST_n_flag_CK_PER             = n_flag_CK_PER;
      LAST_n_flag_CK_MINH            = n_flag_CK_MINH;
      LAST_n_flag_CK_MINL            = n_flag_CK_MINL;
    end
  endtask // end timingcheck_violation;

  task pre_latch_data;
    begin
      Latch_A                        = A_;
      Latch_DI_byte0                 = DI_byte0_;
      Latch_DI_byte1                 = DI_byte1_;
      Latch_DI_byte2                 = DI_byte2_;
      Latch_DI_byte3                 = DI_byte3_;
      Latch_DI_byte4                 = DI_byte4_;
      Latch_DI_byte5                 = DI_byte5_;
      Latch_DI_byte6                 = DI_byte6_;
      Latch_DI_byte7                 = DI_byte7_;
      Latch_WEB0                     = WEB0_;
      Latch_WEB1                     = WEB1_;
      Latch_WEB2                     = WEB2_;
      Latch_WEB3                     = WEB3_;
      Latch_WEB4                     = WEB4_;
      Latch_WEB5                     = WEB5_;
      Latch_WEB6                     = WEB6_;
      Latch_WEB7                     = WEB7_;
      Latch_CS                       = CS_;
    end
  endtask //end pre_latch_data
  task memory_function;
    begin
      A_i                            = Latch_A;
      DI_byte0_i                     = Latch_DI_byte0;
      DI_byte1_i                     = Latch_DI_byte1;
      DI_byte2_i                     = Latch_DI_byte2;
      DI_byte3_i                     = Latch_DI_byte3;
      DI_byte4_i                     = Latch_DI_byte4;
      DI_byte5_i                     = Latch_DI_byte5;
      DI_byte6_i                     = Latch_DI_byte6;
      DI_byte7_i                     = Latch_DI_byte7;
      WEB0_i                         = Latch_WEB0;
      WEB1_i                         = Latch_WEB1;
      WEB2_i                         = Latch_WEB2;
      WEB3_i                         = Latch_WEB3;
      WEB4_i                         = Latch_WEB4;
      WEB5_i                         = Latch_WEB5;
      WEB6_i                         = Latch_WEB6;
      WEB7_i                         = Latch_WEB7;
      CS_i                           = Latch_CS;

      if (CS_ == 1'b1) A_monitor;


      casez({WEB0_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                 DO_byte0_tmp = Memory_byte0[A_i];
                 NODELAY0 = 1'b1;
                 ->EventTOHDO_byte0;
               end else begin
                 if (WEB0_i !== last_WEB0) begin
                   DO_byte0_tmp = Memory_byte0[A_i];
                   NODELAY0 = 1'b1;
                   ->EventTOHDO_byte0;
                 end else begin
                   NODELAY0 = 1'b0;
                   DO_byte0_tmp = Memory_byte0[A_i];
                   DO_byte0_i = DO_byte0_tmp;
                 end
               end
             end else begin
                DO_byte0_tmp = Memory_byte0[A_i];
                NODELAY0 = 1'b1;
                ->EventTOHDO_byte0;
             end
           end
           else begin
                #0 disable TOHDO_byte0;
                   disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte0[A_i] = DI_byte0_i;
                NODELAY0 = 1'b1;
                DO_byte0_tmp = Memory_byte0[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                     NODELAY0 = 1'b1;
                     ->EventTWDXDO_byte0;
                  end else begin
                    if (WEB0_i !== last_WEB0) begin
                       NODELAY0 = 1'b1;
                       ->EventTWDXDO_byte0;
                    end else begin
                      if (DI_byte0_i !== last_DI_byte0) begin
                         NODELAY0 = 1'b1;
                         ->EventTWDXDO_byte0;
                      end else begin
                         NODELAY0 = 1'b0;
                         DO_byte0_i = DO_byte0_tmp;
                      end
                    end
                  end
                end else begin
                  NODELAY0 = 1'b1;
                  ->EventTWDXDO_byte0;
                end
           end else begin
             #0 disable TOHDO_byte0;
                disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(0,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte0;
              disable TWDXDO_byte0;
           NODELAY0 = 1'b1;
           DO_byte0_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte0[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte0;
                   disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte0;
                disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(0,1);
                end
           end
        end
      endcase

      casez({WEB1_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                 DO_byte1_tmp = Memory_byte1[A_i];
                 NODELAY1 = 1'b1;
                 ->EventTOHDO_byte1;
               end else begin
                 if (WEB1_i !== last_WEB1) begin
                   DO_byte1_tmp = Memory_byte1[A_i];
                   NODELAY1 = 1'b1;
                   ->EventTOHDO_byte1;
                 end else begin
                   NODELAY1 = 1'b0;
                   DO_byte1_tmp = Memory_byte1[A_i];
                   DO_byte1_i = DO_byte1_tmp;
                 end
               end
             end else begin
                DO_byte1_tmp = Memory_byte1[A_i];
                NODELAY1 = 1'b1;
                ->EventTOHDO_byte1;
             end
           end
           else begin
                #0 disable TOHDO_byte1;
                   disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte1[A_i] = DI_byte1_i;
                NODELAY1 = 1'b1;
                DO_byte1_tmp = Memory_byte1[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                     NODELAY1 = 1'b1;
                     ->EventTWDXDO_byte1;
                  end else begin
                    if (WEB1_i !== last_WEB1) begin
                       NODELAY1 = 1'b1;
                       ->EventTWDXDO_byte1;
                    end else begin
                      if (DI_byte1_i !== last_DI_byte1) begin
                         NODELAY1 = 1'b1;
                         ->EventTWDXDO_byte1;
                      end else begin
                         NODELAY1 = 1'b0;
                         DO_byte1_i = DO_byte1_tmp;
                      end
                    end
                  end
                end else begin
                  NODELAY1 = 1'b1;
                  ->EventTWDXDO_byte1;
                end
           end else begin
             #0 disable TOHDO_byte1;
                disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(1,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte1;
              disable TWDXDO_byte1;
           NODELAY1 = 1'b1;
           DO_byte1_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte1[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte1;
                   disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte1;
                disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(1,1);
                end
           end
        end
      endcase

      casez({WEB2_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                 DO_byte2_tmp = Memory_byte2[A_i];
                 NODELAY2 = 1'b1;
                 ->EventTOHDO_byte2;
               end else begin
                 if (WEB2_i !== last_WEB2) begin
                   DO_byte2_tmp = Memory_byte2[A_i];
                   NODELAY2 = 1'b1;
                   ->EventTOHDO_byte2;
                 end else begin
                   NODELAY2 = 1'b0;
                   DO_byte2_tmp = Memory_byte2[A_i];
                   DO_byte2_i = DO_byte2_tmp;
                 end
               end
             end else begin
                DO_byte2_tmp = Memory_byte2[A_i];
                NODELAY2 = 1'b1;
                ->EventTOHDO_byte2;
             end
           end
           else begin
                #0 disable TOHDO_byte2;
                   disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte2[A_i] = DI_byte2_i;
                NODELAY2 = 1'b1;
                DO_byte2_tmp = Memory_byte2[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                     NODELAY2 = 1'b1;
                     ->EventTWDXDO_byte2;
                  end else begin
                    if (WEB2_i !== last_WEB2) begin
                       NODELAY2 = 1'b1;
                       ->EventTWDXDO_byte2;
                    end else begin
                      if (DI_byte2_i !== last_DI_byte2) begin
                         NODELAY2 = 1'b1;
                         ->EventTWDXDO_byte2;
                      end else begin
                         NODELAY2 = 1'b0;
                         DO_byte2_i = DO_byte2_tmp;
                      end
                    end
                  end
                end else begin
                  NODELAY2 = 1'b1;
                  ->EventTWDXDO_byte2;
                end
           end else begin
             #0 disable TOHDO_byte2;
                disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(2,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte2;
              disable TWDXDO_byte2;
           NODELAY2 = 1'b1;
           DO_byte2_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte2[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte2;
                   disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte2;
                disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(2,1);
                end
           end
        end
      endcase

      casez({WEB3_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                 DO_byte3_tmp = Memory_byte3[A_i];
                 NODELAY3 = 1'b1;
                 ->EventTOHDO_byte3;
               end else begin
                 if (WEB3_i !== last_WEB3) begin
                   DO_byte3_tmp = Memory_byte3[A_i];
                   NODELAY3 = 1'b1;
                   ->EventTOHDO_byte3;
                 end else begin
                   NODELAY3 = 1'b0;
                   DO_byte3_tmp = Memory_byte3[A_i];
                   DO_byte3_i = DO_byte3_tmp;
                 end
               end
             end else begin
                DO_byte3_tmp = Memory_byte3[A_i];
                NODELAY3 = 1'b1;
                ->EventTOHDO_byte3;
             end
           end
           else begin
                #0 disable TOHDO_byte3;
                   disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte3[A_i] = DI_byte3_i;
                NODELAY3 = 1'b1;
                DO_byte3_tmp = Memory_byte3[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                     NODELAY3 = 1'b1;
                     ->EventTWDXDO_byte3;
                  end else begin
                    if (WEB3_i !== last_WEB3) begin
                       NODELAY3 = 1'b1;
                       ->EventTWDXDO_byte3;
                    end else begin
                      if (DI_byte3_i !== last_DI_byte3) begin
                         NODELAY3 = 1'b1;
                         ->EventTWDXDO_byte3;
                      end else begin
                         NODELAY3 = 1'b0;
                         DO_byte3_i = DO_byte3_tmp;
                      end
                    end
                  end
                end else begin
                  NODELAY3 = 1'b1;
                  ->EventTWDXDO_byte3;
                end
           end else begin
             #0 disable TOHDO_byte3;
                disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(3,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte3;
              disable TWDXDO_byte3;
           NODELAY3 = 1'b1;
           DO_byte3_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte3[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte3;
                   disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte3;
                disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(3,1);
                end
           end
        end
      endcase

      casez({WEB4_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                 DO_byte4_tmp = Memory_byte4[A_i];
                 NODELAY4 = 1'b1;
                 ->EventTOHDO_byte4;
               end else begin
                 if (WEB4_i !== last_WEB4) begin
                   DO_byte4_tmp = Memory_byte4[A_i];
                   NODELAY4 = 1'b1;
                   ->EventTOHDO_byte4;
                 end else begin
                   NODELAY4 = 1'b0;
                   DO_byte4_tmp = Memory_byte4[A_i];
                   DO_byte4_i = DO_byte4_tmp;
                 end
               end
             end else begin
                DO_byte4_tmp = Memory_byte4[A_i];
                NODELAY4 = 1'b1;
                ->EventTOHDO_byte4;
             end
           end
           else begin
                #0 disable TOHDO_byte4;
                   disable TWDXDO_byte4;
                NODELAY4 = 1'b1;
                DO_byte4_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte4[A_i] = DI_byte4_i;
                NODELAY4 = 1'b1;
                DO_byte4_tmp = Memory_byte4[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                     NODELAY4 = 1'b1;
                     ->EventTWDXDO_byte4;
                  end else begin
                    if (WEB4_i !== last_WEB4) begin
                       NODELAY4 = 1'b1;
                       ->EventTWDXDO_byte4;
                    end else begin
                      if (DI_byte4_i !== last_DI_byte4) begin
                         NODELAY4 = 1'b1;
                         ->EventTWDXDO_byte4;
                      end else begin
                         NODELAY4 = 1'b0;
                         DO_byte4_i = DO_byte4_tmp;
                      end
                    end
                  end
                end else begin
                  NODELAY4 = 1'b1;
                  ->EventTWDXDO_byte4;
                end
           end else begin
             #0 disable TOHDO_byte4;
                disable TWDXDO_byte4;
                NODELAY4 = 1'b1;
                DO_byte4_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(4,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte4;
              disable TWDXDO_byte4;
           NODELAY4 = 1'b1;
           DO_byte4_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte4[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte4;
                   disable TWDXDO_byte4;
                NODELAY4 = 1'b1;
                DO_byte4_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte4;
                disable TWDXDO_byte4;
                NODELAY4 = 1'b1;
                DO_byte4_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(4,1);
                end
           end
        end
      endcase

      casez({WEB5_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                 DO_byte5_tmp = Memory_byte5[A_i];
                 NODELAY5 = 1'b1;
                 ->EventTOHDO_byte5;
               end else begin
                 if (WEB5_i !== last_WEB5) begin
                   DO_byte5_tmp = Memory_byte5[A_i];
                   NODELAY5 = 1'b1;
                   ->EventTOHDO_byte5;
                 end else begin
                   NODELAY5 = 1'b0;
                   DO_byte5_tmp = Memory_byte5[A_i];
                   DO_byte5_i = DO_byte5_tmp;
                 end
               end
             end else begin
                DO_byte5_tmp = Memory_byte5[A_i];
                NODELAY5 = 1'b1;
                ->EventTOHDO_byte5;
             end
           end
           else begin
                #0 disable TOHDO_byte5;
                   disable TWDXDO_byte5;
                NODELAY5 = 1'b1;
                DO_byte5_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte5[A_i] = DI_byte5_i;
                NODELAY5 = 1'b1;
                DO_byte5_tmp = Memory_byte5[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                     NODELAY5 = 1'b1;
                     ->EventTWDXDO_byte5;
                  end else begin
                    if (WEB5_i !== last_WEB5) begin
                       NODELAY5 = 1'b1;
                       ->EventTWDXDO_byte5;
                    end else begin
                      if (DI_byte5_i !== last_DI_byte5) begin
                         NODELAY5 = 1'b1;
                         ->EventTWDXDO_byte5;
                      end else begin
                         NODELAY5 = 1'b0;
                         DO_byte5_i = DO_byte5_tmp;
                      end
                    end
                  end
                end else begin
                  NODELAY5 = 1'b1;
                  ->EventTWDXDO_byte5;
                end
           end else begin
             #0 disable TOHDO_byte5;
                disable TWDXDO_byte5;
                NODELAY5 = 1'b1;
                DO_byte5_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(5,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte5;
              disable TWDXDO_byte5;
           NODELAY5 = 1'b1;
           DO_byte5_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte5[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte5;
                   disable TWDXDO_byte5;
                NODELAY5 = 1'b1;
                DO_byte5_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte5;
                disable TWDXDO_byte5;
                NODELAY5 = 1'b1;
                DO_byte5_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(5,1);
                end
           end
        end
      endcase

      casez({WEB6_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                 DO_byte6_tmp = Memory_byte6[A_i];
                 NODELAY6 = 1'b1;
                 ->EventTOHDO_byte6;
               end else begin
                 if (WEB6_i !== last_WEB6) begin
                   DO_byte6_tmp = Memory_byte6[A_i];
                   NODELAY6 = 1'b1;
                   ->EventTOHDO_byte6;
                 end else begin
                   NODELAY6 = 1'b0;
                   DO_byte6_tmp = Memory_byte6[A_i];
                   DO_byte6_i = DO_byte6_tmp;
                 end
               end
             end else begin
                DO_byte6_tmp = Memory_byte6[A_i];
                NODELAY6 = 1'b1;
                ->EventTOHDO_byte6;
             end
           end
           else begin
                #0 disable TOHDO_byte6;
                   disable TWDXDO_byte6;
                NODELAY6 = 1'b1;
                DO_byte6_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte6[A_i] = DI_byte6_i;
                NODELAY6 = 1'b1;
                DO_byte6_tmp = Memory_byte6[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                     NODELAY6 = 1'b1;
                     ->EventTWDXDO_byte6;
                  end else begin
                    if (WEB6_i !== last_WEB6) begin
                       NODELAY6 = 1'b1;
                       ->EventTWDXDO_byte6;
                    end else begin
                      if (DI_byte6_i !== last_DI_byte6) begin
                         NODELAY6 = 1'b1;
                         ->EventTWDXDO_byte6;
                      end else begin
                         NODELAY6 = 1'b0;
                         DO_byte6_i = DO_byte6_tmp;
                      end
                    end
                  end
                end else begin
                  NODELAY6 = 1'b1;
                  ->EventTWDXDO_byte6;
                end
           end else begin
             #0 disable TOHDO_byte6;
                disable TWDXDO_byte6;
                NODELAY6 = 1'b1;
                DO_byte6_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(6,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte6;
              disable TWDXDO_byte6;
           NODELAY6 = 1'b1;
           DO_byte6_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte6[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte6;
                   disable TWDXDO_byte6;
                NODELAY6 = 1'b1;
                DO_byte6_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte6;
                disable TWDXDO_byte6;
                NODELAY6 = 1'b1;
                DO_byte6_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(6,1);
                end
           end
        end
      endcase

      casez({WEB7_i,CS_i})
        2'b11: begin
           if (AddressRangeCheck(A_i)) begin
             if (NO_SER_TOH == `TRUE) begin
               if (A_i !== last_A) begin
                 DO_byte7_tmp = Memory_byte7[A_i];
                 NODELAY7 = 1'b1;
                 ->EventTOHDO_byte7;
               end else begin
                 if (WEB7_i !== last_WEB7) begin
                   DO_byte7_tmp = Memory_byte7[A_i];
                   NODELAY7 = 1'b1;
                   ->EventTOHDO_byte7;
                 end else begin
                   NODELAY7 = 1'b0;
                   DO_byte7_tmp = Memory_byte7[A_i];
                   DO_byte7_i = DO_byte7_tmp;
                 end
               end
             end else begin
                DO_byte7_tmp = Memory_byte7[A_i];
                NODELAY7 = 1'b1;
                ->EventTOHDO_byte7;
             end
           end
           else begin
                #0 disable TOHDO_byte7;
                   disable TWDXDO_byte7;
                NODELAY7 = 1'b1;
                DO_byte7_i = {Bits{1'bX}};
           end
        end
        2'b01: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte7[A_i] = DI_byte7_i;
                NODELAY7 = 1'b1;
                DO_byte7_tmp = Memory_byte7[A_i];
                if (NO_SER_TOH == `TRUE) begin
                  if (A_i !== last_A) begin
                     NODELAY7 = 1'b1;
                     ->EventTWDXDO_byte7;
                  end else begin
                    if (WEB7_i !== last_WEB7) begin
                       NODELAY7 = 1'b1;
                       ->EventTWDXDO_byte7;
                    end else begin
                      if (DI_byte7_i !== last_DI_byte7) begin
                         NODELAY7 = 1'b1;
                         ->EventTWDXDO_byte7;
                      end else begin
                         NODELAY7 = 1'b0;
                         DO_byte7_i = DO_byte7_tmp;
                      end
                    end
                  end
                end else begin
                  NODELAY7 = 1'b1;
                  ->EventTWDXDO_byte7;
                end
           end else begin
             #0 disable TOHDO_byte7;
                disable TWDXDO_byte7;
                NODELAY7 = 1'b1;
                DO_byte7_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(7,1);
                end
           end
        end
        2'b1x: begin
           #0 disable TOHDO_byte7;
              disable TWDXDO_byte7;
           NODELAY7 = 1'b1;
           DO_byte7_i = {Bits{1'bX}};
        end
        2'b0x,
        2'bx1,
        2'bxx: begin
           if (AddressRangeCheck(A_i)) begin
                Memory_byte7[A_i] = {Bits{1'bX}};
                #0 disable TOHDO_byte7;
                   disable TWDXDO_byte7;
                NODELAY7 = 1'b1;
                DO_byte7_i = {Bits{1'bX}};
           end else begin
             #0 disable TOHDO_byte7;
                disable TWDXDO_byte7;
                NODELAY7 = 1'b1;
                DO_byte7_i = {Bits{1'bX}};
                if (^(A_i) === 1'bX) begin
                  all_core_x(7,1);
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
          case (byte_num)
             0       : begin
                         if (do_x == 1) Memory_byte0[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte0[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte0;
                               disable TWDXDO_byte0;
                            NODELAY0 = 1'b1;
                            DO_byte0_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte0;
                               disable TWDXDO_byte0;
                            NODELAY0 = 1'b1;
                            DO_byte0_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             1       : begin
                         if (do_x == 1) Memory_byte1[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte1[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte1;
                               disable TWDXDO_byte1;
                            NODELAY1 = 1'b1;
                            DO_byte1_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte1;
                               disable TWDXDO_byte1;
                            NODELAY1 = 1'b1;
                            DO_byte1_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             2       : begin
                         if (do_x == 1) Memory_byte2[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte2[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte2;
                               disable TWDXDO_byte2;
                            NODELAY2 = 1'b1;
                            DO_byte2_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte2;
                               disable TWDXDO_byte2;
                            NODELAY2 = 1'b1;
                            DO_byte2_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             3       : begin
                         if (do_x == 1) Memory_byte3[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte3[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte3;
                               disable TWDXDO_byte3;
                            NODELAY3 = 1'b1;
                            DO_byte3_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte3;
                               disable TWDXDO_byte3;
                            NODELAY3 = 1'b1;
                            DO_byte3_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             4       : begin
                         if (do_x == 1) Memory_byte4[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte4[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte4;
                               disable TWDXDO_byte4;
                            NODELAY4 = 1'b1;
                            DO_byte4_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte4;
                               disable TWDXDO_byte4;
                            NODELAY4 = 1'b1;
                            DO_byte4_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             5       : begin
                         if (do_x == 1) Memory_byte5[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte5[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte5;
                               disable TWDXDO_byte5;
                            NODELAY5 = 1'b1;
                            DO_byte5_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte5;
                               disable TWDXDO_byte5;
                            NODELAY5 = 1'b1;
                            DO_byte5_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             6       : begin
                         if (do_x == 1) Memory_byte6[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte6[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte6;
                               disable TWDXDO_byte6;
                            NODELAY6 = 1'b1;
                            DO_byte6_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte6;
                               disable TWDXDO_byte6;
                            NODELAY6 = 1'b1;
                            DO_byte6_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             7       : begin
                         if (do_x == 1) Memory_byte7[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte7[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte7;
                               disable TWDXDO_byte7;
                            NODELAY7 = 1'b1;
                            DO_byte7_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte7;
                               disable TWDXDO_byte7;
                            NODELAY7 = 1'b1;
                            DO_byte7_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
             default : begin
                         if (do_x == 1) Memory_byte0[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte0[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte0;
                               disable TWDXDO_byte0;
                            NODELAY0 = 1'b1;
                            DO_byte0_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte0;
                               disable TWDXDO_byte0;
                            NODELAY0 = 1'b1;
                            DO_byte0_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte1[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte1[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte1;
                               disable TWDXDO_byte1;
                            NODELAY1 = 1'b1;
                            DO_byte1_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte1;
                               disable TWDXDO_byte1;
                            NODELAY1 = 1'b1;
                            DO_byte1_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte2[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte2[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte2;
                               disable TWDXDO_byte2;
                            NODELAY2 = 1'b1;
                            DO_byte2_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte2;
                               disable TWDXDO_byte2;
                            NODELAY2 = 1'b1;
                            DO_byte2_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte3[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte3[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte3;
                               disable TWDXDO_byte3;
                            NODELAY3 = 1'b1;
                            DO_byte3_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte3;
                               disable TWDXDO_byte3;
                            NODELAY3 = 1'b1;
                            DO_byte3_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte4[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte4[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte4;
                               disable TWDXDO_byte4;
                            NODELAY4 = 1'b1;
                            DO_byte4_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte4;
                               disable TWDXDO_byte4;
                            NODELAY4 = 1'b1;
                            DO_byte4_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte5[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte5[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte5;
                               disable TWDXDO_byte5;
                            NODELAY5 = 1'b1;
                            DO_byte5_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte5;
                               disable TWDXDO_byte5;
                            NODELAY5 = 1'b1;
                            DO_byte5_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte6[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte6[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte6;
                               disable TWDXDO_byte6;
                            NODELAY6 = 1'b1;
                            DO_byte6_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte6;
                               disable TWDXDO_byte6;
                            NODELAY6 = 1'b1;
                            DO_byte6_i = {Bits{1'b0}};
                         end
`else
`endif
                         if (do_x == 1) Memory_byte7[LoopCount_Address]={Bits{1'bX}};
`ifdef MEM_INIT_ZERO
                         else           Memory_byte7[LoopCount_Address]={Bits{1'b0}};
`else
`endif
                         if (do_x == 1) begin
                            #0 disable TOHDO_byte7;
                               disable TWDXDO_byte7;
                            NODELAY7 = 1'b1;
                            DO_byte7_i = {Bits{1'bX}};
                         end
`ifdef MEM_INIT_ZERO
                         else begin
                            #0 disable TOHDO_byte7;
                               disable TWDXDO_byte7;
                            NODELAY7 = 1'b1;
                            DO_byte7_i = {Bits{1'b0}};
                         end
`else
`endif
                       end
         endcase
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
             if (WEB0_ !== 1'b1) begin
                all_core_x(0,1);
             end
             else begin
                #0 disable TOHDO_byte0;
                   disable TWDXDO_byte0;
                NODELAY0 = 1'b1;
                DO_byte0_i = {Bits{1'bX}};
             end
             if (WEB1_ !== 1'b1) begin
                all_core_x(1,1);
             end
             else begin
                #0 disable TOHDO_byte1;
                   disable TWDXDO_byte1;
                NODELAY1 = 1'b1;
                DO_byte1_i = {Bits{1'bX}};
             end
             if (WEB2_ !== 1'b1) begin
                all_core_x(2,1);
             end
             else begin
                #0 disable TOHDO_byte2;
                   disable TWDXDO_byte2;
                NODELAY2 = 1'b1;
                DO_byte2_i = {Bits{1'bX}};
             end
             if (WEB3_ !== 1'b1) begin
                all_core_x(3,1);
             end
             else begin
                #0 disable TOHDO_byte3;
                   disable TWDXDO_byte3;
                NODELAY3 = 1'b1;
                DO_byte3_i = {Bits{1'bX}};
             end
             if (WEB4_ !== 1'b1) begin
                all_core_x(4,1);
             end
             else begin
                #0 disable TOHDO_byte4;
                   disable TWDXDO_byte4;
                NODELAY4 = 1'b1;
                DO_byte4_i = {Bits{1'bX}};
             end
             if (WEB5_ !== 1'b1) begin
                all_core_x(5,1);
             end
             else begin
                #0 disable TOHDO_byte5;
                   disable TWDXDO_byte5;
                NODELAY5 = 1'b1;
                DO_byte5_i = {Bits{1'bX}};
             end
             if (WEB6_ !== 1'b1) begin
                all_core_x(6,1);
             end
             else begin
                #0 disable TOHDO_byte6;
                   disable TWDXDO_byte6;
                NODELAY6 = 1'b1;
                DO_byte6_i = {Bits{1'bX}};
             end
             if (WEB7_ !== 1'b1) begin
                all_core_x(7,1);
             end
             else begin
                #0 disable TOHDO_byte7;
                   disable TWDXDO_byte7;
                NODELAY7 = 1'b1;
                DO_byte7_i = {Bits{1'bX}};
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
      specparam TAA    = (129.5:211.7:381.5);
      specparam TWDV = (129.5:211.7:381.5);
      specparam TRC  = (167.3:273.5:495.3);
      specparam THPW = (31.9:51.2:93.3);
      specparam TLPW = (40.3:63.9:113.8);
      specparam TAS  = (25.4:44.3:85.7);
      specparam TAH  = (9.0:14.7:26.8);
      specparam TWS  = (19.5:33.5:65.5);
      specparam TWH  = (23.4:36.9:63.5);
      specparam TDS  = (10.1:20.9:48.2);
      specparam TDH  = (17.2:25.6:39.7);
      specparam TCSS = (36.5:62.9:119.8);
      specparam TCSH = (15.6:24.0:40.8);

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
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI0, TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI0, TDS,     TDH,     n_flag_DI0     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI1, TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI1, TDS,     TDH,     n_flag_DI1     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI2, TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI2, TDS,     TDH,     n_flag_DI2     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI3, TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI3, TDS,     TDH,     n_flag_DI3     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI4, TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI4, TDS,     TDH,     n_flag_DI4     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI5, TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI5, TDS,     TDH,     n_flag_DI5     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI6, TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI6, TDS,     TDH,     n_flag_DI6     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI7, TDS,     TDH,     n_flag_DI7     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI7, TDS,     TDH,     n_flag_DI7     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI8, TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI8, TDS,     TDH,     n_flag_DI8     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI9, TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI9, TDS,     TDH,     n_flag_DI9     );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI10, TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI10, TDS,     TDH,     n_flag_DI10    );
      $setuphold ( posedge CK &&& con_DI_byte0,   posedge DI11, TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CK &&& con_DI_byte0,   negedge DI11, TDS,     TDH,     n_flag_DI11    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI12, TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI12, TDS,     TDH,     n_flag_DI12    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI13, TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI13, TDS,     TDH,     n_flag_DI13    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI14, TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI14, TDS,     TDH,     n_flag_DI14    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI15, TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI15, TDS,     TDH,     n_flag_DI15    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI16, TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI16, TDS,     TDH,     n_flag_DI16    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI17, TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI17, TDS,     TDH,     n_flag_DI17    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI18, TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI18, TDS,     TDH,     n_flag_DI18    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI19, TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI19, TDS,     TDH,     n_flag_DI19    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI20, TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI20, TDS,     TDH,     n_flag_DI20    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI21, TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI21, TDS,     TDH,     n_flag_DI21    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI22, TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI22, TDS,     TDH,     n_flag_DI22    );
      $setuphold ( posedge CK &&& con_DI_byte1,   posedge DI23, TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CK &&& con_DI_byte1,   negedge DI23, TDS,     TDH,     n_flag_DI23    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI24, TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI24, TDS,     TDH,     n_flag_DI24    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI25, TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI25, TDS,     TDH,     n_flag_DI25    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI26, TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI26, TDS,     TDH,     n_flag_DI26    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI27, TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI27, TDS,     TDH,     n_flag_DI27    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI28, TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI28, TDS,     TDH,     n_flag_DI28    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI29, TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI29, TDS,     TDH,     n_flag_DI29    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI30, TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI30, TDS,     TDH,     n_flag_DI30    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI31, TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI31, TDS,     TDH,     n_flag_DI31    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI32, TDS,     TDH,     n_flag_DI32    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI32, TDS,     TDH,     n_flag_DI32    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI33, TDS,     TDH,     n_flag_DI33    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI33, TDS,     TDH,     n_flag_DI33    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI34, TDS,     TDH,     n_flag_DI34    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI34, TDS,     TDH,     n_flag_DI34    );
      $setuphold ( posedge CK &&& con_DI_byte2,   posedge DI35, TDS,     TDH,     n_flag_DI35    );
      $setuphold ( posedge CK &&& con_DI_byte2,   negedge DI35, TDS,     TDH,     n_flag_DI35    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI36, TDS,     TDH,     n_flag_DI36    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI36, TDS,     TDH,     n_flag_DI36    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI37, TDS,     TDH,     n_flag_DI37    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI37, TDS,     TDH,     n_flag_DI37    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI38, TDS,     TDH,     n_flag_DI38    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI38, TDS,     TDH,     n_flag_DI38    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI39, TDS,     TDH,     n_flag_DI39    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI39, TDS,     TDH,     n_flag_DI39    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI40, TDS,     TDH,     n_flag_DI40    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI40, TDS,     TDH,     n_flag_DI40    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI41, TDS,     TDH,     n_flag_DI41    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI41, TDS,     TDH,     n_flag_DI41    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI42, TDS,     TDH,     n_flag_DI42    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI42, TDS,     TDH,     n_flag_DI42    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI43, TDS,     TDH,     n_flag_DI43    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI43, TDS,     TDH,     n_flag_DI43    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI44, TDS,     TDH,     n_flag_DI44    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI44, TDS,     TDH,     n_flag_DI44    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI45, TDS,     TDH,     n_flag_DI45    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI45, TDS,     TDH,     n_flag_DI45    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI46, TDS,     TDH,     n_flag_DI46    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI46, TDS,     TDH,     n_flag_DI46    );
      $setuphold ( posedge CK &&& con_DI_byte3,   posedge DI47, TDS,     TDH,     n_flag_DI47    );
      $setuphold ( posedge CK &&& con_DI_byte3,   negedge DI47, TDS,     TDH,     n_flag_DI47    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI48, TDS,     TDH,     n_flag_DI48    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI48, TDS,     TDH,     n_flag_DI48    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI49, TDS,     TDH,     n_flag_DI49    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI49, TDS,     TDH,     n_flag_DI49    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI50, TDS,     TDH,     n_flag_DI50    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI50, TDS,     TDH,     n_flag_DI50    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI51, TDS,     TDH,     n_flag_DI51    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI51, TDS,     TDH,     n_flag_DI51    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI52, TDS,     TDH,     n_flag_DI52    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI52, TDS,     TDH,     n_flag_DI52    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI53, TDS,     TDH,     n_flag_DI53    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI53, TDS,     TDH,     n_flag_DI53    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI54, TDS,     TDH,     n_flag_DI54    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI54, TDS,     TDH,     n_flag_DI54    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI55, TDS,     TDH,     n_flag_DI55    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI55, TDS,     TDH,     n_flag_DI55    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI56, TDS,     TDH,     n_flag_DI56    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI56, TDS,     TDH,     n_flag_DI56    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI57, TDS,     TDH,     n_flag_DI57    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI57, TDS,     TDH,     n_flag_DI57    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI58, TDS,     TDH,     n_flag_DI58    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI58, TDS,     TDH,     n_flag_DI58    );
      $setuphold ( posedge CK &&& con_DI_byte4,   posedge DI59, TDS,     TDH,     n_flag_DI59    );
      $setuphold ( posedge CK &&& con_DI_byte4,   negedge DI59, TDS,     TDH,     n_flag_DI59    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI60, TDS,     TDH,     n_flag_DI60    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI60, TDS,     TDH,     n_flag_DI60    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI61, TDS,     TDH,     n_flag_DI61    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI61, TDS,     TDH,     n_flag_DI61    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI62, TDS,     TDH,     n_flag_DI62    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI62, TDS,     TDH,     n_flag_DI62    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI63, TDS,     TDH,     n_flag_DI63    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI63, TDS,     TDH,     n_flag_DI63    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI64, TDS,     TDH,     n_flag_DI64    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI64, TDS,     TDH,     n_flag_DI64    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI65, TDS,     TDH,     n_flag_DI65    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI65, TDS,     TDH,     n_flag_DI65    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI66, TDS,     TDH,     n_flag_DI66    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI66, TDS,     TDH,     n_flag_DI66    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI67, TDS,     TDH,     n_flag_DI67    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI67, TDS,     TDH,     n_flag_DI67    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI68, TDS,     TDH,     n_flag_DI68    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI68, TDS,     TDH,     n_flag_DI68    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI69, TDS,     TDH,     n_flag_DI69    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI69, TDS,     TDH,     n_flag_DI69    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI70, TDS,     TDH,     n_flag_DI70    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI70, TDS,     TDH,     n_flag_DI70    );
      $setuphold ( posedge CK &&& con_DI_byte5,   posedge DI71, TDS,     TDH,     n_flag_DI71    );
      $setuphold ( posedge CK &&& con_DI_byte5,   negedge DI71, TDS,     TDH,     n_flag_DI71    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI72, TDS,     TDH,     n_flag_DI72    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI72, TDS,     TDH,     n_flag_DI72    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI73, TDS,     TDH,     n_flag_DI73    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI73, TDS,     TDH,     n_flag_DI73    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI74, TDS,     TDH,     n_flag_DI74    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI74, TDS,     TDH,     n_flag_DI74    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI75, TDS,     TDH,     n_flag_DI75    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI75, TDS,     TDH,     n_flag_DI75    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI76, TDS,     TDH,     n_flag_DI76    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI76, TDS,     TDH,     n_flag_DI76    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI77, TDS,     TDH,     n_flag_DI77    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI77, TDS,     TDH,     n_flag_DI77    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI78, TDS,     TDH,     n_flag_DI78    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI78, TDS,     TDH,     n_flag_DI78    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI79, TDS,     TDH,     n_flag_DI79    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI79, TDS,     TDH,     n_flag_DI79    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI80, TDS,     TDH,     n_flag_DI80    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI80, TDS,     TDH,     n_flag_DI80    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI81, TDS,     TDH,     n_flag_DI81    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI81, TDS,     TDH,     n_flag_DI81    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI82, TDS,     TDH,     n_flag_DI82    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI82, TDS,     TDH,     n_flag_DI82    );
      $setuphold ( posedge CK &&& con_DI_byte6,   posedge DI83, TDS,     TDH,     n_flag_DI83    );
      $setuphold ( posedge CK &&& con_DI_byte6,   negedge DI83, TDS,     TDH,     n_flag_DI83    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI84, TDS,     TDH,     n_flag_DI84    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI84, TDS,     TDH,     n_flag_DI84    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI85, TDS,     TDH,     n_flag_DI85    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI85, TDS,     TDH,     n_flag_DI85    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI86, TDS,     TDH,     n_flag_DI86    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI86, TDS,     TDH,     n_flag_DI86    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI87, TDS,     TDH,     n_flag_DI87    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI87, TDS,     TDH,     n_flag_DI87    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI88, TDS,     TDH,     n_flag_DI88    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI88, TDS,     TDH,     n_flag_DI88    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI89, TDS,     TDH,     n_flag_DI89    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI89, TDS,     TDH,     n_flag_DI89    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI90, TDS,     TDH,     n_flag_DI90    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI90, TDS,     TDH,     n_flag_DI90    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI91, TDS,     TDH,     n_flag_DI91    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI91, TDS,     TDH,     n_flag_DI91    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI92, TDS,     TDH,     n_flag_DI92    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI92, TDS,     TDH,     n_flag_DI92    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI93, TDS,     TDH,     n_flag_DI93    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI93, TDS,     TDH,     n_flag_DI93    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI94, TDS,     TDH,     n_flag_DI94    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI94, TDS,     TDH,     n_flag_DI94    );
      $setuphold ( posedge CK &&& con_DI_byte7,   posedge DI95, TDS,     TDH,     n_flag_DI95    );
      $setuphold ( posedge CK &&& con_DI_byte7,   negedge DI95, TDS,     TDH,     n_flag_DI95    );
      $setuphold ( posedge CK &&& con_WEB0,       posedge WEB0, TWS,     TWH,     n_flag_WEB0    );
      $setuphold ( posedge CK &&& con_WEB0,       negedge WEB0, TWS,     TWH,     n_flag_WEB0    );
      $setuphold ( posedge CK &&& con_WEB1,       posedge WEB1, TWS,     TWH,     n_flag_WEB1    );
      $setuphold ( posedge CK &&& con_WEB1,       negedge WEB1, TWS,     TWH,     n_flag_WEB1    );
      $setuphold ( posedge CK &&& con_WEB2,       posedge WEB2, TWS,     TWH,     n_flag_WEB2    );
      $setuphold ( posedge CK &&& con_WEB2,       negedge WEB2, TWS,     TWH,     n_flag_WEB2    );
      $setuphold ( posedge CK &&& con_WEB3,       posedge WEB3, TWS,     TWH,     n_flag_WEB3    );
      $setuphold ( posedge CK &&& con_WEB3,       negedge WEB3, TWS,     TWH,     n_flag_WEB3    );
      $setuphold ( posedge CK &&& con_WEB4,       posedge WEB4, TWS,     TWH,     n_flag_WEB4    );
      $setuphold ( posedge CK &&& con_WEB4,       negedge WEB4, TWS,     TWH,     n_flag_WEB4    );
      $setuphold ( posedge CK &&& con_WEB5,       posedge WEB5, TWS,     TWH,     n_flag_WEB5    );
      $setuphold ( posedge CK &&& con_WEB5,       negedge WEB5, TWS,     TWH,     n_flag_WEB5    );
      $setuphold ( posedge CK &&& con_WEB6,       posedge WEB6, TWS,     TWH,     n_flag_WEB6    );
      $setuphold ( posedge CK &&& con_WEB6,       negedge WEB6, TWS,     TWH,     n_flag_WEB6    );
      $setuphold ( posedge CK &&& con_WEB7,       posedge WEB7, TWS,     TWH,     n_flag_WEB7    );
      $setuphold ( posedge CK &&& con_WEB7,       negedge WEB7, TWS,     TWH,     n_flag_WEB7    );
      $setuphold ( posedge CK,                    posedge CSB, TCSS,    TCSH,    n_flag_CS      );
      $setuphold ( posedge CK,                    negedge CSB, TCSS,    TCSH,    n_flag_CS      );
      $period    ( posedge CK &&& ck_per,         TRC,                       n_flag_CK_PER  );
      $width     ( posedge CK &&& con_CK,         THPW,    0,                n_flag_CK_MINH );
      $width     ( negedge CK &&& con_CK,         TLPW,    0,                n_flag_CK_MINL );

      if (NODELAY0 == 0 && read0)  (posedge CK => (DO0 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && read0)  (posedge CK => (DO1 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && read0)  (posedge CK => (DO2 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && read0)  (posedge CK => (DO3 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && read0)  (posedge CK => (DO4 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && read0)  (posedge CK => (DO5 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && read0)  (posedge CK => (DO6 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && read0)  (posedge CK => (DO7 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && read0)  (posedge CK => (DO8 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && read0)  (posedge CK => (DO9 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && read0)  (posedge CK => (DO10 :1'bx)) = TAA  ;
      if (NODELAY0 == 0 && read0)  (posedge CK => (DO11 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO12 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO13 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO14 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO15 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO16 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO17 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO18 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO19 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO20 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO21 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO22 :1'bx)) = TAA  ;
      if (NODELAY1 == 0 && read1)  (posedge CK => (DO23 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO24 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO25 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO26 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO27 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO28 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO29 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO30 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO31 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO32 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO33 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO34 :1'bx)) = TAA  ;
      if (NODELAY2 == 0 && read2)  (posedge CK => (DO35 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO36 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO37 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO38 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO39 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO40 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO41 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO42 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO43 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO44 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO45 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO46 :1'bx)) = TAA  ;
      if (NODELAY3 == 0 && read3)  (posedge CK => (DO47 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO48 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO49 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO50 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO51 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO52 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO53 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO54 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO55 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO56 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO57 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO58 :1'bx)) = TAA  ;
      if (NODELAY4 == 0 && read4)  (posedge CK => (DO59 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO60 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO61 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO62 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO63 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO64 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO65 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO66 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO67 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO68 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO69 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO70 :1'bx)) = TAA  ;
      if (NODELAY5 == 0 && read5)  (posedge CK => (DO71 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO72 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO73 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO74 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO75 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO76 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO77 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO78 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO79 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO80 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO81 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO82 :1'bx)) = TAA  ;
      if (NODELAY6 == 0 && read6)  (posedge CK => (DO83 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO84 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO85 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO86 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO87 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO88 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO89 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO90 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO91 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO92 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO93 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO94 :1'bx)) = TAA  ;
      if (NODELAY7 == 0 && read7)  (posedge CK => (DO95 :1'bx)) = TAA  ;

      if (NODELAY0 == 0 && write0)  (posedge CK => (DO0 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && write0)  (posedge CK => (DO1 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && write0)  (posedge CK => (DO2 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && write0)  (posedge CK => (DO3 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && write0)  (posedge CK => (DO4 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && write0)  (posedge CK => (DO5 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && write0)  (posedge CK => (DO6 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && write0)  (posedge CK => (DO7 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && write0)  (posedge CK => (DO8 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && write0)  (posedge CK => (DO9 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && write0)  (posedge CK => (DO10 :1'bx)) = TWDV ;
      if (NODELAY0 == 0 && write0)  (posedge CK => (DO11 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO12 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO13 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO14 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO15 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO16 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO17 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO18 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO19 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO20 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO21 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO22 :1'bx)) = TWDV ;
      if (NODELAY1 == 0 && write1)  (posedge CK => (DO23 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO24 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO25 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO26 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO27 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO28 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO29 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO30 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO31 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO32 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO33 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO34 :1'bx)) = TWDV ;
      if (NODELAY2 == 0 && write2)  (posedge CK => (DO35 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO36 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO37 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO38 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO39 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO40 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO41 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO42 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO43 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO44 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO45 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO46 :1'bx)) = TWDV ;
      if (NODELAY3 == 0 && write3)  (posedge CK => (DO47 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO48 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO49 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO50 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO51 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO52 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO53 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO54 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO55 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO56 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO57 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO58 :1'bx)) = TWDV ;
      if (NODELAY4 == 0 && write4)  (posedge CK => (DO59 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO60 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO61 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO62 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO63 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO64 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO65 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO66 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO67 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO68 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO69 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO70 :1'bx)) = TWDV ;
      if (NODELAY5 == 0 && write5)  (posedge CK => (DO71 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO72 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO73 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO74 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO75 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO76 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO77 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO78 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO79 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO80 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO81 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO82 :1'bx)) = TWDV ;
      if (NODELAY6 == 0 && write6)  (posedge CK => (DO83 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO84 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO85 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO86 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO87 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO88 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO89 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO90 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO91 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO92 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO93 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO94 :1'bx)) = TWDV ;
      if (NODELAY7 == 0 && write7)  (posedge CK => (DO95 :1'bx)) = TWDV ;




   endspecify

`endprotect
endmodule

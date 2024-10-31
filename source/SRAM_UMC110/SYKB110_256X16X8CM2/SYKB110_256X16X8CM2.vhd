-- |-----------------------------------------------------------------------|
-- ________________________________________________________________________________________________
-- 
-- 
--             Synchronous One-Port Register File Compiler
-- 
--                 UMC 0.11um LL AE Logic Process
-- 
-- ________________________________________________________________________________________________
-- 
--               
--         Copyright (C) 2024 Faraday Technology Corporation. All Rights Reserved.       
--                
--         This source code is an unpublished work belongs to Faraday Technology Corporation       
--         It is considered a trade secret and is not to be divulged or       
--         used by parties who have not received written authorization from       
--         Faraday Technology Corporation       
--                
--         Faraday's home page can be found at: http://www.faraday-tech.com/       
--                
-- ________________________________________________________________________________________________
-- 
--        IP Name            :  FSR0K_B_SY                
--        IP Version         :  1.4.0                     
--        IP Release Status  :  Active                    
--        Word               :  256                       
--        Bit                :  16                        
--        Byte               :  8                         
--        Mux                :  2                         
--        Output Loading     :  0.01                      
--        Clock Input Slew   :  0.016                     
--        Data Input Slew    :  0.016                     
--        Ring Type          :  Ringless Model            
--        Ring Width         :  0                         
--        Bus Format         :  0                         
--        Memaker Path       :  /home/mem/Desktop/memlib  
--        GUI Version        :  m20230904                 
--        Date               :  2024/09/07 14:52:49       
-- ________________________________________________________________________________________________
-- 
--
-- Notice on usage: Fixed delay or timing data are given in this model.
--                  It supports SDF back-annotation, please generate SDF file
--                  by EDA tools to get the accurate timing.
--
-- |-----------------------------------------------------------------------|
--
-- Warning : 
--   If customer's design viloate the set-up time or hold time criteria of 
--   synchronous SRAM, it's possible to hit the meta-stable point of 
--   latch circuit in the decoder and cause the data loss in the memory 
--   bitcell. So please follow the memory IP's spec to design your 
--   product.
--
-- |-----------------------------------------------------------------------|

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Primitives.all;
use IEEE.VITAL_Timing.all;
use std.textio.all;
use IEEE.std_logic_textio.all;

-- entity declaration --
entity SYKB110_256X16X8CM2 is
   generic(
      SYN_CS:          integer  := 1;
      NO_SER_TOH:      integer  := 1;
      AddressSize:     integer  := 8;
      DVSize:          integer  := 4;
      Bits:            integer  := 16;
      Words:           integer  := 256;
      Bytes:           integer  := 8;
      AspectRatio:     integer  := 2;
      TOH:             time     := 2.293 ns;
      TWDX:            time     := 2.290 ns;

      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;

      tpd_CK_DO0_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO1_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO2_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO3_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO4_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO5_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO6_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO7_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO8_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO9_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO10_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO11_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO12_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO13_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO14_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO15_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO16_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO17_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO18_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO19_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO20_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO21_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO22_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO23_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO24_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO25_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO26_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO27_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO28_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO29_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO30_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO31_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO32_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO33_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO34_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO35_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO36_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO37_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO38_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO39_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO40_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO41_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO42_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO43_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO44_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO45_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO46_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO47_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO48_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO49_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO50_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO51_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO52_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO53_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO54_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO55_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO56_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO57_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO58_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO59_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO60_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO61_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO62_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO63_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO64_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO65_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO66_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO67_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO68_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO69_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO70_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO71_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO72_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO73_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO74_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO75_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO76_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO77_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO78_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO79_NODELAY4_EQ_0_AN_read4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO80_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO81_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO82_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO83_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO84_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO85_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO86_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO87_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO88_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO89_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO90_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO91_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO92_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO93_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO94_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO95_NODELAY5_EQ_0_AN_read5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO96_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO97_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO98_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO99_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO100_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO101_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO102_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO103_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO104_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO105_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO106_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO107_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO108_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO109_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO110_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO111_NODELAY6_EQ_0_AN_read6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO112_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO113_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO114_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO115_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO116_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO117_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO118_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO119_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO120_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO121_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO122_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO123_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO124_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO125_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO126_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO127_NODELAY7_EQ_0_AN_read7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);

      tpd_CK_DO0_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO1_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO2_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO3_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO4_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO5_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO6_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO7_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO8_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO9_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO10_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO11_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO12_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO13_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO14_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO15_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO16_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO17_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO18_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO19_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO20_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO21_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO22_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO23_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO24_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO25_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO26_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO27_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO28_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO29_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO30_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO31_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO32_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO33_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO34_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO35_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO36_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO37_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO38_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO39_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO40_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO41_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO42_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO43_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO44_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO45_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO46_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO47_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO48_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO49_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO50_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO51_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO52_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO53_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO54_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO55_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO56_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO57_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO58_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO59_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO60_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO61_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO62_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO63_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO64_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO65_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO66_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO67_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO68_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO69_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO70_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO71_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO72_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO73_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO74_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO75_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO76_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO77_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO78_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO79_NODELAY4_EQ_0_AN_write4_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO80_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO81_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO82_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO83_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO84_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO85_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO86_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO87_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO88_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO89_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO90_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO91_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO92_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO93_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO94_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO95_NODELAY5_EQ_0_AN_write5_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO96_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO97_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO98_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO99_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO100_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO101_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO102_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO103_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO104_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO105_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO106_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO107_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO108_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO109_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO110_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO111_NODELAY6_EQ_0_AN_write6_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO112_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO113_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO114_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO115_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO116_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO117_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO118_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO119_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO120_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO121_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO122_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO123_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO124_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO125_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO126_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);
      tpd_CK_DO127_NODELAY7_EQ_0_AN_write7_posedge : VitalDelayType01 :=  (2.547 ns, 2.547 ns);

      tsetup_A0_CK_posedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A0_CK_negedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A1_CK_posedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A1_CK_negedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A2_CK_posedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A2_CK_negedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A3_CK_posedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A3_CK_negedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A4_CK_posedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A4_CK_negedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A5_CK_posedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A5_CK_negedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A6_CK_posedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A6_CK_negedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A7_CK_posedge_posedge    :  VitalDelayType := 0.476 ns;
      tsetup_A7_CK_negedge_posedge    :  VitalDelayType := 0.476 ns;
      thold_A0_CK_posedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A0_CK_negedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A1_CK_posedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A1_CK_negedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A2_CK_posedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A2_CK_negedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A3_CK_posedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A3_CK_negedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A4_CK_posedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A4_CK_negedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A5_CK_posedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A5_CK_negedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A6_CK_posedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A6_CK_negedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A7_CK_posedge_posedge     :  VitalDelayType := 0.147 ns;
      thold_A7_CK_negedge_posedge     :  VitalDelayType := 0.147 ns;
      tsetup_DI0_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI0_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI1_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI1_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI2_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI2_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI3_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI3_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI4_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI4_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI5_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI5_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI6_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI6_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI7_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI7_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI8_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI8_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI9_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI9_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI10_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI10_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI11_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI11_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI12_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI12_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI13_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI13_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI14_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI14_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI15_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI15_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI16_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI16_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI17_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI17_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI18_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI18_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI19_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI19_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI20_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI20_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI21_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI21_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI22_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI22_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI23_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI23_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI24_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI24_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI25_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI25_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI26_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI26_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI27_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI27_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI28_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI28_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI29_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI29_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI30_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI30_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI31_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI31_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI32_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI32_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI33_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI33_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI34_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI34_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI35_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI35_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI36_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI36_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI37_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI37_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI38_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI38_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI39_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI39_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI40_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI40_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI41_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI41_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI42_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI42_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI43_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI43_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI44_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI44_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI45_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI45_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI46_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI46_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI47_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI47_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI48_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI48_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI49_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI49_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI50_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI50_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI51_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI51_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI52_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI52_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI53_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI53_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI54_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI54_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI55_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI55_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI56_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI56_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI57_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI57_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI58_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI58_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI59_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI59_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI60_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI60_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI61_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI61_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI62_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI62_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI63_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI63_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI64_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI64_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI65_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI65_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI66_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI66_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI67_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI67_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI68_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI68_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI69_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI69_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI70_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI70_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI71_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI71_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI72_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI72_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI73_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI73_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI74_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI74_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI75_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI75_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI76_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI76_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI77_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI77_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI78_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI78_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI79_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI79_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI80_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI80_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI81_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI81_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI82_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI82_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI83_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI83_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI84_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI84_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI85_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI85_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI86_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI86_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI87_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI87_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI88_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI88_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI89_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI89_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI90_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI90_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI91_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI91_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI92_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI92_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI93_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI93_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI94_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI94_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI95_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI95_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI96_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI96_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI97_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI97_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI98_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI98_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI99_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI99_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI100_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI100_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI101_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI101_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI102_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI102_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI103_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI103_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI104_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI104_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI105_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI105_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI106_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI106_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI107_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI107_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI108_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI108_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI109_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI109_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI110_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI110_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI111_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI111_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI112_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI112_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI113_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI113_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI114_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI114_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI115_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI115_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI116_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI116_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI117_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI117_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI118_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI118_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI119_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI119_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI120_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI120_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI121_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI121_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI122_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI122_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI123_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI123_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI124_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI124_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI125_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI125_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI126_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI126_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI127_CK_posedge_posedge    :  VitalDelayType := 0.170 ns;
      tsetup_DI127_CK_negedge_posedge    :  VitalDelayType := 0.170 ns;
      thold_DI0_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI0_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI1_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI1_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI2_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI2_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI3_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI3_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI4_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI4_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI5_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI5_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI6_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI6_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI7_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI7_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI8_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI8_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI9_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI9_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI10_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI10_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI11_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI11_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI12_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI12_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI13_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI13_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI14_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI14_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI15_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI15_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI16_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI16_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI17_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI17_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI18_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI18_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI19_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI19_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI20_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI20_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI21_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI21_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI22_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI22_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI23_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI23_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI24_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI24_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI25_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI25_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI26_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI26_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI27_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI27_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI28_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI28_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI29_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI29_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI30_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI30_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI31_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI31_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI32_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI32_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI33_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI33_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI34_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI34_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI35_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI35_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI36_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI36_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI37_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI37_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI38_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI38_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI39_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI39_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI40_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI40_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI41_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI41_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI42_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI42_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI43_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI43_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI44_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI44_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI45_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI45_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI46_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI46_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI47_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI47_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI48_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI48_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI49_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI49_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI50_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI50_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI51_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI51_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI52_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI52_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI53_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI53_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI54_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI54_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI55_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI55_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI56_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI56_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI57_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI57_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI58_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI58_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI59_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI59_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI60_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI60_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI61_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI61_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI62_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI62_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI63_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI63_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI64_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI64_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI65_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI65_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI66_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI66_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI67_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI67_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI68_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI68_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI69_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI69_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI70_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI70_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI71_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI71_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI72_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI72_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI73_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI73_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI74_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI74_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI75_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI75_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI76_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI76_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI77_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI77_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI78_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI78_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI79_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI79_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI80_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI80_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI81_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI81_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI82_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI82_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI83_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI83_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI84_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI84_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI85_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI85_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI86_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI86_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI87_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI87_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI88_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI88_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI89_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI89_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI90_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI90_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI91_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI91_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI92_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI92_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI93_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI93_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI94_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI94_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI95_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI95_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI96_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI96_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI97_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI97_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI98_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI98_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI99_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI99_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI100_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI100_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI101_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI101_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI102_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI102_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI103_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI103_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI104_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI104_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI105_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI105_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI106_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI106_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI107_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI107_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI108_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI108_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI109_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI109_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI110_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI110_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI111_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI111_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI112_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI112_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI113_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI113_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI114_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI114_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI115_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI115_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI116_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI116_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI117_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI117_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI118_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI118_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI119_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI119_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI120_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI120_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI121_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI121_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI122_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI122_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI123_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI123_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI124_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI124_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI125_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI125_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI126_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI126_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI127_CK_posedge_posedge     :  VitalDelayType := 0.304 ns;
      thold_DI127_CK_negedge_posedge     :  VitalDelayType := 0.304 ns;


      tsetup_WEB0_CK_posedge_posedge  :  VitalDelayType := 0.356 ns;
      tsetup_WEB0_CK_negedge_posedge  :  VitalDelayType := 0.356 ns;
      thold_WEB0_CK_posedge_posedge   :  VitalDelayType := 0.418 ns;
      thold_WEB0_CK_negedge_posedge   :  VitalDelayType := 0.418 ns;
      tsetup_WEB1_CK_posedge_posedge  :  VitalDelayType := 0.356 ns;
      tsetup_WEB1_CK_negedge_posedge  :  VitalDelayType := 0.356 ns;
      thold_WEB1_CK_posedge_posedge   :  VitalDelayType := 0.418 ns;
      thold_WEB1_CK_negedge_posedge   :  VitalDelayType := 0.418 ns;
      tsetup_WEB2_CK_posedge_posedge  :  VitalDelayType := 0.356 ns;
      tsetup_WEB2_CK_negedge_posedge  :  VitalDelayType := 0.356 ns;
      thold_WEB2_CK_posedge_posedge   :  VitalDelayType := 0.418 ns;
      thold_WEB2_CK_negedge_posedge   :  VitalDelayType := 0.418 ns;
      tsetup_WEB3_CK_posedge_posedge  :  VitalDelayType := 0.356 ns;
      tsetup_WEB3_CK_negedge_posedge  :  VitalDelayType := 0.356 ns;
      thold_WEB3_CK_posedge_posedge   :  VitalDelayType := 0.418 ns;
      thold_WEB3_CK_negedge_posedge   :  VitalDelayType := 0.418 ns;
      tsetup_WEB4_CK_posedge_posedge  :  VitalDelayType := 0.356 ns;
      tsetup_WEB4_CK_negedge_posedge  :  VitalDelayType := 0.356 ns;
      thold_WEB4_CK_posedge_posedge   :  VitalDelayType := 0.418 ns;
      thold_WEB4_CK_negedge_posedge   :  VitalDelayType := 0.418 ns;
      tsetup_WEB5_CK_posedge_posedge  :  VitalDelayType := 0.356 ns;
      tsetup_WEB5_CK_negedge_posedge  :  VitalDelayType := 0.356 ns;
      thold_WEB5_CK_posedge_posedge   :  VitalDelayType := 0.418 ns;
      thold_WEB5_CK_negedge_posedge   :  VitalDelayType := 0.418 ns;
      tsetup_WEB6_CK_posedge_posedge  :  VitalDelayType := 0.356 ns;
      tsetup_WEB6_CK_negedge_posedge  :  VitalDelayType := 0.356 ns;
      thold_WEB6_CK_posedge_posedge   :  VitalDelayType := 0.418 ns;
      thold_WEB6_CK_negedge_posedge   :  VitalDelayType := 0.418 ns;
      tsetup_WEB7_CK_posedge_posedge  :  VitalDelayType := 0.356 ns;
      tsetup_WEB7_CK_negedge_posedge  :  VitalDelayType := 0.356 ns;
      thold_WEB7_CK_posedge_posedge   :  VitalDelayType := 0.418 ns;
      thold_WEB7_CK_negedge_posedge   :  VitalDelayType := 0.418 ns;
      tsetup_CSB_CK_posedge_posedge    :  VitalDelayType := 0.662 ns;
      tsetup_CSB_CK_negedge_posedge    :  VitalDelayType := 0.662 ns;
      thold_CSB_CK_posedge_posedge     :  VitalDelayType := 0.243 ns;
      thold_CSB_CK_negedge_posedge     :  VitalDelayType := 0.243 ns;


      
      tperiod_CK                        :  VitalDelayType := 3.243 ns;
      tpw_CK_posedge                 :  VitalDelayType := 0.512 ns;
      tpw_CK_negedge                 :  VitalDelayType := 0.639 ns;
      tipd_A0                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A1                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A2                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A3                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A4                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A5                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A6                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A7                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI0                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI1                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI2                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI3                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI4                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI5                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI6                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI7                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI8                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI9                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI10                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI11                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI12                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI13                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI14                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI15                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI16                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI17                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI18                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI19                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI20                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI21                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI22                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI23                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI24                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI25                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI26                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI27                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI28                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI29                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI30                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI31                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI32                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI33                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI34                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI35                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI36                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI37                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI38                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI39                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI40                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI41                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI42                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI43                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI44                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI45                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI46                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI47                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI48                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI49                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI50                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI51                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI52                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI53                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI54                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI55                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI56                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI57                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI58                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI59                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI60                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI61                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI62                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI63                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI64                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI65                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI66                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI67                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI68                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI69                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI70                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI71                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI72                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI73                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI74                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI75                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI76                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI77                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI78                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI79                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI80                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI81                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI82                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI83                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI84                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI85                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI86                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI87                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI88                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI89                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI90                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI91                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI92                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI93                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI94                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI95                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI96                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI97                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI98                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI99                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI100                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI101                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI102                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI103                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI104                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI105                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI106                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI107                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI108                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI109                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI110                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI111                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI112                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI113                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI114                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI115                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI116                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI117                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI118                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI119                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI120                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI121                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI122                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI123                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI124                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI125                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI126                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_DI127                    :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB0                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB1                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB2                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB3                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB4                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB5                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB6                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB7                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CSB                        :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CK                        :  VitalDelayType01 := (0.000 ns, 0.000 ns)
      );

   port(
      A0                         :   IN   std_logic;
      A1                         :   IN   std_logic;
      A2                         :   IN   std_logic;
      A3                         :   IN   std_logic;
      A4                         :   IN   std_logic;
      A5                         :   IN   std_logic;
      A6                         :   IN   std_logic;
      A7                         :   IN   std_logic;
      DO0                        :   OUT   std_logic;
      DO1                        :   OUT   std_logic;
      DO2                        :   OUT   std_logic;
      DO3                        :   OUT   std_logic;
      DO4                        :   OUT   std_logic;
      DO5                        :   OUT   std_logic;
      DO6                        :   OUT   std_logic;
      DO7                        :   OUT   std_logic;
      DO8                        :   OUT   std_logic;
      DO9                        :   OUT   std_logic;
      DO10                        :   OUT   std_logic;
      DO11                        :   OUT   std_logic;
      DO12                        :   OUT   std_logic;
      DO13                        :   OUT   std_logic;
      DO14                        :   OUT   std_logic;
      DO15                        :   OUT   std_logic;
      DO16                        :   OUT   std_logic;
      DO17                        :   OUT   std_logic;
      DO18                        :   OUT   std_logic;
      DO19                        :   OUT   std_logic;
      DO20                        :   OUT   std_logic;
      DO21                        :   OUT   std_logic;
      DO22                        :   OUT   std_logic;
      DO23                        :   OUT   std_logic;
      DO24                        :   OUT   std_logic;
      DO25                        :   OUT   std_logic;
      DO26                        :   OUT   std_logic;
      DO27                        :   OUT   std_logic;
      DO28                        :   OUT   std_logic;
      DO29                        :   OUT   std_logic;
      DO30                        :   OUT   std_logic;
      DO31                        :   OUT   std_logic;
      DO32                        :   OUT   std_logic;
      DO33                        :   OUT   std_logic;
      DO34                        :   OUT   std_logic;
      DO35                        :   OUT   std_logic;
      DO36                        :   OUT   std_logic;
      DO37                        :   OUT   std_logic;
      DO38                        :   OUT   std_logic;
      DO39                        :   OUT   std_logic;
      DO40                        :   OUT   std_logic;
      DO41                        :   OUT   std_logic;
      DO42                        :   OUT   std_logic;
      DO43                        :   OUT   std_logic;
      DO44                        :   OUT   std_logic;
      DO45                        :   OUT   std_logic;
      DO46                        :   OUT   std_logic;
      DO47                        :   OUT   std_logic;
      DO48                        :   OUT   std_logic;
      DO49                        :   OUT   std_logic;
      DO50                        :   OUT   std_logic;
      DO51                        :   OUT   std_logic;
      DO52                        :   OUT   std_logic;
      DO53                        :   OUT   std_logic;
      DO54                        :   OUT   std_logic;
      DO55                        :   OUT   std_logic;
      DO56                        :   OUT   std_logic;
      DO57                        :   OUT   std_logic;
      DO58                        :   OUT   std_logic;
      DO59                        :   OUT   std_logic;
      DO60                        :   OUT   std_logic;
      DO61                        :   OUT   std_logic;
      DO62                        :   OUT   std_logic;
      DO63                        :   OUT   std_logic;
      DO64                        :   OUT   std_logic;
      DO65                        :   OUT   std_logic;
      DO66                        :   OUT   std_logic;
      DO67                        :   OUT   std_logic;
      DO68                        :   OUT   std_logic;
      DO69                        :   OUT   std_logic;
      DO70                        :   OUT   std_logic;
      DO71                        :   OUT   std_logic;
      DO72                        :   OUT   std_logic;
      DO73                        :   OUT   std_logic;
      DO74                        :   OUT   std_logic;
      DO75                        :   OUT   std_logic;
      DO76                        :   OUT   std_logic;
      DO77                        :   OUT   std_logic;
      DO78                        :   OUT   std_logic;
      DO79                        :   OUT   std_logic;
      DO80                        :   OUT   std_logic;
      DO81                        :   OUT   std_logic;
      DO82                        :   OUT   std_logic;
      DO83                        :   OUT   std_logic;
      DO84                        :   OUT   std_logic;
      DO85                        :   OUT   std_logic;
      DO86                        :   OUT   std_logic;
      DO87                        :   OUT   std_logic;
      DO88                        :   OUT   std_logic;
      DO89                        :   OUT   std_logic;
      DO90                        :   OUT   std_logic;
      DO91                        :   OUT   std_logic;
      DO92                        :   OUT   std_logic;
      DO93                        :   OUT   std_logic;
      DO94                        :   OUT   std_logic;
      DO95                        :   OUT   std_logic;
      DO96                        :   OUT   std_logic;
      DO97                        :   OUT   std_logic;
      DO98                        :   OUT   std_logic;
      DO99                        :   OUT   std_logic;
      DO100                        :   OUT   std_logic;
      DO101                        :   OUT   std_logic;
      DO102                        :   OUT   std_logic;
      DO103                        :   OUT   std_logic;
      DO104                        :   OUT   std_logic;
      DO105                        :   OUT   std_logic;
      DO106                        :   OUT   std_logic;
      DO107                        :   OUT   std_logic;
      DO108                        :   OUT   std_logic;
      DO109                        :   OUT   std_logic;
      DO110                        :   OUT   std_logic;
      DO111                        :   OUT   std_logic;
      DO112                        :   OUT   std_logic;
      DO113                        :   OUT   std_logic;
      DO114                        :   OUT   std_logic;
      DO115                        :   OUT   std_logic;
      DO116                        :   OUT   std_logic;
      DO117                        :   OUT   std_logic;
      DO118                        :   OUT   std_logic;
      DO119                        :   OUT   std_logic;
      DO120                        :   OUT   std_logic;
      DO121                        :   OUT   std_logic;
      DO122                        :   OUT   std_logic;
      DO123                        :   OUT   std_logic;
      DO124                        :   OUT   std_logic;
      DO125                        :   OUT   std_logic;
      DO126                        :   OUT   std_logic;
      DO127                        :   OUT   std_logic;
      DI0                        :   IN   std_logic;
      DI1                        :   IN   std_logic;
      DI2                        :   IN   std_logic;
      DI3                        :   IN   std_logic;
      DI4                        :   IN   std_logic;
      DI5                        :   IN   std_logic;
      DI6                        :   IN   std_logic;
      DI7                        :   IN   std_logic;
      DI8                        :   IN   std_logic;
      DI9                        :   IN   std_logic;
      DI10                        :   IN   std_logic;
      DI11                        :   IN   std_logic;
      DI12                        :   IN   std_logic;
      DI13                        :   IN   std_logic;
      DI14                        :   IN   std_logic;
      DI15                        :   IN   std_logic;
      DI16                        :   IN   std_logic;
      DI17                        :   IN   std_logic;
      DI18                        :   IN   std_logic;
      DI19                        :   IN   std_logic;
      DI20                        :   IN   std_logic;
      DI21                        :   IN   std_logic;
      DI22                        :   IN   std_logic;
      DI23                        :   IN   std_logic;
      DI24                        :   IN   std_logic;
      DI25                        :   IN   std_logic;
      DI26                        :   IN   std_logic;
      DI27                        :   IN   std_logic;
      DI28                        :   IN   std_logic;
      DI29                        :   IN   std_logic;
      DI30                        :   IN   std_logic;
      DI31                        :   IN   std_logic;
      DI32                        :   IN   std_logic;
      DI33                        :   IN   std_logic;
      DI34                        :   IN   std_logic;
      DI35                        :   IN   std_logic;
      DI36                        :   IN   std_logic;
      DI37                        :   IN   std_logic;
      DI38                        :   IN   std_logic;
      DI39                        :   IN   std_logic;
      DI40                        :   IN   std_logic;
      DI41                        :   IN   std_logic;
      DI42                        :   IN   std_logic;
      DI43                        :   IN   std_logic;
      DI44                        :   IN   std_logic;
      DI45                        :   IN   std_logic;
      DI46                        :   IN   std_logic;
      DI47                        :   IN   std_logic;
      DI48                        :   IN   std_logic;
      DI49                        :   IN   std_logic;
      DI50                        :   IN   std_logic;
      DI51                        :   IN   std_logic;
      DI52                        :   IN   std_logic;
      DI53                        :   IN   std_logic;
      DI54                        :   IN   std_logic;
      DI55                        :   IN   std_logic;
      DI56                        :   IN   std_logic;
      DI57                        :   IN   std_logic;
      DI58                        :   IN   std_logic;
      DI59                        :   IN   std_logic;
      DI60                        :   IN   std_logic;
      DI61                        :   IN   std_logic;
      DI62                        :   IN   std_logic;
      DI63                        :   IN   std_logic;
      DI64                        :   IN   std_logic;
      DI65                        :   IN   std_logic;
      DI66                        :   IN   std_logic;
      DI67                        :   IN   std_logic;
      DI68                        :   IN   std_logic;
      DI69                        :   IN   std_logic;
      DI70                        :   IN   std_logic;
      DI71                        :   IN   std_logic;
      DI72                        :   IN   std_logic;
      DI73                        :   IN   std_logic;
      DI74                        :   IN   std_logic;
      DI75                        :   IN   std_logic;
      DI76                        :   IN   std_logic;
      DI77                        :   IN   std_logic;
      DI78                        :   IN   std_logic;
      DI79                        :   IN   std_logic;
      DI80                        :   IN   std_logic;
      DI81                        :   IN   std_logic;
      DI82                        :   IN   std_logic;
      DI83                        :   IN   std_logic;
      DI84                        :   IN   std_logic;
      DI85                        :   IN   std_logic;
      DI86                        :   IN   std_logic;
      DI87                        :   IN   std_logic;
      DI88                        :   IN   std_logic;
      DI89                        :   IN   std_logic;
      DI90                        :   IN   std_logic;
      DI91                        :   IN   std_logic;
      DI92                        :   IN   std_logic;
      DI93                        :   IN   std_logic;
      DI94                        :   IN   std_logic;
      DI95                        :   IN   std_logic;
      DI96                        :   IN   std_logic;
      DI97                        :   IN   std_logic;
      DI98                        :   IN   std_logic;
      DI99                        :   IN   std_logic;
      DI100                        :   IN   std_logic;
      DI101                        :   IN   std_logic;
      DI102                        :   IN   std_logic;
      DI103                        :   IN   std_logic;
      DI104                        :   IN   std_logic;
      DI105                        :   IN   std_logic;
      DI106                        :   IN   std_logic;
      DI107                        :   IN   std_logic;
      DI108                        :   IN   std_logic;
      DI109                        :   IN   std_logic;
      DI110                        :   IN   std_logic;
      DI111                        :   IN   std_logic;
      DI112                        :   IN   std_logic;
      DI113                        :   IN   std_logic;
      DI114                        :   IN   std_logic;
      DI115                        :   IN   std_logic;
      DI116                        :   IN   std_logic;
      DI117                        :   IN   std_logic;
      DI118                        :   IN   std_logic;
      DI119                        :   IN   std_logic;
      DI120                        :   IN   std_logic;
      DI121                        :   IN   std_logic;
      DI122                        :   IN   std_logic;
      DI123                        :   IN   std_logic;
      DI124                        :   IN   std_logic;
      DI125                        :   IN   std_logic;
      DI126                        :   IN   std_logic;
      DI127                        :   IN   std_logic;
      WEB0                       :   IN   std_logic;
      WEB1                       :   IN   std_logic;
      WEB2                       :   IN   std_logic;
      WEB3                       :   IN   std_logic;
      WEB4                       :   IN   std_logic;
      WEB5                       :   IN   std_logic;
      WEB6                       :   IN   std_logic;
      WEB7                       :   IN   std_logic;
      DVSE                          :   IN   std_logic;
      DVS0                       :   IN   std_logic;
      DVS1                       :   IN   std_logic;
      DVS2                       :   IN   std_logic;
      DVS3                       :   IN   std_logic;
      CK                            :   IN   std_logic;
      CSB                           :   IN   std_logic
      );

attribute VITAL_LEVEL0 of SYKB110_256X16X8CM2 : entity is TRUE;

end SYKB110_256X16X8CM2;

-- architecture body --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Primitives.all;
use IEEE.VITAL_Timing.all;

architecture behavior of SYKB110_256X16X8CM2 is
   -- attribute VITALMEMORY_LEVEL1 of behavior : architecture is TRUE;

   CONSTANT True_flg:       integer := 0;
   CONSTANT False_flg:      integer := 1;
   CONSTANT Range_flg:      integer := 2;

   FUNCTION Minimum ( CONSTANT t1, t2 : IN TIME ) RETURN TIME IS
   BEGIN
      IF (t1 < t2) THEN RETURN (t1); ELSE RETURN (t2); END IF;
   END Minimum;

   FUNCTION Maximum ( CONSTANT t1, t2 : IN TIME ) RETURN TIME IS
   BEGIN
      IF (t1 < t2) THEN RETURN (t2); ELSE RETURN (t1); END IF;
   END Maximum;

   FUNCTION BVtoI(bin: std_logic_vector) RETURN integer IS
      variable result: integer;
   BEGIN
      result := 0;
      for i in bin'range loop
         if bin(i) = '1' then
            result := result + 2**i;
         end if;
      end loop;
      return result;
   END; -- BVtoI

   PROCEDURE ScheduleOutputDelayTOH (
       SIGNAL   OutSignal        : OUT std_logic;
       VARIABLE Data             : IN  std_logic;
       CONSTANT Delay            : IN  VitalDelayType01 := VitalDefDelay01;
       VARIABLE Previous_A       : IN  std_logic_vector(AddressSize-1 downto 0);
       VARIABLE Current_A        : IN  std_logic_vector(AddressSize-1 downto 0);
       VARIABLE Previous_WEB       : IN  std_logic;
       VARIABLE Current_WEB        : IN  std_logic;
       CONSTANT NO_SER_TOH       : IN  integer
   ) IS
   BEGIN
      if (NO_SER_TOH /= 1) then
         OutSignal <= TRANSPORT 'X' AFTER TOH;
         OutSignal <= TRANSPORT Data AFTER Maximum(Delay(tr10), Delay(tr01));
      else
         if (Current_A /= Previous_A) then
            OutSignal <= TRANSPORT 'X' AFTER TOH;
            OutSignal <= TRANSPORT Data AFTER Maximum(Delay(tr10), Delay(tr01));
         else
	   if (Current_WEB /= Previous_WEB) then
             OutSignal <= TRANSPORT 'X' AFTER TOH;
             OutSignal <= TRANSPORT Data AFTER Maximum(Delay(tr10), Delay(tr01));
	   else
             OutSignal <= TRANSPORT Data AFTER Maximum(Delay(tr10), Delay(tr01));
           end if;
         end if;
      end if;
   END ScheduleOutputDelayTOH;

   PROCEDURE ScheduleOutputDelayTWDX (
       SIGNAL   OutSignal        : OUT std_logic;
       VARIABLE Data             : IN  std_logic;
       CONSTANT Delay            : IN  VitalDelayType01 := VitalDefDelay01;
       VARIABLE Previous_A       : IN  std_logic_vector(AddressSize-1 downto 0);
       VARIABLE Current_A        : IN  std_logic_vector(AddressSize-1 downto 0);
       VARIABLE Previous_WEB     : IN  std_logic;
       VARIABLE Current_WEB      : IN  std_logic;
       VARIABLE Previous_DI      : IN  std_logic_vector(Bits-1 downto 0) := (others => 'X');
       VARIABLE Current_DI       : IN  std_logic_vector(Bits-1 downto 0) := (others => 'X');
       CONSTANT NO_SER_TOH       : IN  integer
   ) IS
   BEGIN
      if (NO_SER_TOH /= 1) then
         OutSignal <= TRANSPORT 'X' AFTER TWDX;
         OutSignal <= TRANSPORT Data AFTER Maximum(Delay(tr10), Delay(tr01));
      else
         if (Current_A /= Previous_A) then
            OutSignal <= TRANSPORT 'X' AFTER TWDX;
            OutSignal <= TRANSPORT Data AFTER Maximum(Delay(tr10), Delay(tr01));
         else
	   if (Current_WEB /= Previous_WEB) then
             OutSignal <= TRANSPORT 'X' AFTER TWDX;
             OutSignal <= TRANSPORT Data AFTER Maximum(Delay(tr10), Delay(tr01));
	   else
	     if (Current_DI /= Previous_DI) then
               OutSignal <= TRANSPORT 'X' AFTER TWDX;
               OutSignal <= TRANSPORT Data AFTER Maximum(Delay(tr10), Delay(tr01));
	     else
               OutSignal <= TRANSPORT Data AFTER Maximum(Delay(tr10), Delay(tr01));
             end if;
           end if;
         end if;
      end if;
   END ScheduleOutputDelayTWDX;

   FUNCTION TO_INTEGER (
     a: std_logic_vector
   ) RETURN INTEGER IS
     VARIABLE y: INTEGER := 0;
   BEGIN
        y := 0;
        FOR i IN a'RANGE LOOP
            y := y * 2;
            IF a(i) /= '1' AND a(i) /= '0' THEN
                y := 0;
                EXIT;
            ELSIF a(i) = '1' THEN
                y := y + 1;
            END IF;
        END LOOP;
        RETURN y;
   END TO_INTEGER;

   function AddressRangeCheck(AddressItem: std_logic_vector; flag_Address: integer) return integer is
     variable Uresult : std_logic;
     variable status  : integer := 0;

   begin
      if (Bits /= 1) then
         Uresult := AddressItem(0) xor AddressItem(1);
         for i in 2 to AddressItem'length-1 loop
            Uresult := Uresult xor AddressItem(i);
         end loop;
      else
         Uresult := AddressItem(0);
      end if;

      if (Uresult = 'U') then
         status := False_flg;
      elsif (Uresult = 'X') then
         status := False_flg;
      elsif (Uresult = 'Z') then
         status := False_flg;
      else
         status := True_flg;
      end if;

      if (status=False_flg) then
        if (flag_Address = True_flg) then
           -- Generate Error Messae --
           assert FALSE report "** MEM_Error: Unknown value occurred in Address." severity WARNING;
        end if;
      end if;

      if (status=True_flg) then
         if ((BVtoI(AddressItem)) >= Words) then
             assert FALSE report "** MEM_Error: Out of range occurred in Address." severity WARNING; 
             status := Range_flg;
         else
             status := True_flg;
         end if;
      end if;

      return status;
   end AddressRangeCheck;

   function CS_monitor(CSItem: std_logic; flag_CS: integer) return integer is
     variable status  : integer := 0;

   begin
      if (CSItem = 'U') then
         status := False_flg;
      elsif (CSItem = 'X') then
         status := False_flg;
      elsif (CSItem = 'Z') then
         status := False_flg;
      else
         status := True_flg;
      end if;

      if (status=False_flg) then
        if (flag_CS = True_flg) then
           -- Generate Error Messae --
           assert FALSE report "** MEM_Error: Unknown value occurred in ChipSelect." severity WARNING;
        end if;
      end if;

      return status;
   end CS_monitor;

   Type memoryArray Is array (Words-1 downto 0) Of std_logic_vector (Bits-1 downto 0);

   SIGNAL CSB_ipd         : std_logic := 'X';
   SIGNAL CK_ipd         : std_logic := 'X';
   SIGNAL A_ipd          : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   SIGNAL WEB0_ipd       : std_logic := 'X';
   SIGNAL DI0_ipd        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL DO0_int        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL WEB1_ipd       : std_logic := 'X';
   SIGNAL DI1_ipd        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL DO1_int        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL WEB2_ipd       : std_logic := 'X';
   SIGNAL DI2_ipd        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL DO2_int        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL WEB3_ipd       : std_logic := 'X';
   SIGNAL DI3_ipd        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL DO3_int        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL WEB4_ipd       : std_logic := 'X';
   SIGNAL DI4_ipd        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL DO4_int        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL WEB5_ipd       : std_logic := 'X';
   SIGNAL DI5_ipd        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL DO5_int        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL WEB6_ipd       : std_logic := 'X';
   SIGNAL DI6_ipd        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL DO6_int        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL WEB7_ipd       : std_logic := 'X';
   SIGNAL DI7_ipd        : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   SIGNAL DO7_int        : std_logic_vector(Bits-1 downto 0) := (others => 'X');

begin

   ---------------------
   --  INPUT PATH DELAYs
   ---------------------
   WireDelay : block
   begin
   VitalWireDelay (CK_ipd, CK, tipd_CK);
   VitalWireDelay (CSB_ipd, CSB, tipd_CSB);
   VitalWireDelay (WEB0_ipd, WEB0, tipd_WEB0);
   VitalWireDelay (WEB1_ipd, WEB1, tipd_WEB1);
   VitalWireDelay (WEB2_ipd, WEB2, tipd_WEB2);
   VitalWireDelay (WEB3_ipd, WEB3, tipd_WEB3);
   VitalWireDelay (WEB4_ipd, WEB4, tipd_WEB4);
   VitalWireDelay (WEB5_ipd, WEB5, tipd_WEB5);
   VitalWireDelay (WEB6_ipd, WEB6, tipd_WEB6);
   VitalWireDelay (WEB7_ipd, WEB7, tipd_WEB7);
   VitalWireDelay (A_ipd(0), A0, tipd_A0);
   VitalWireDelay (A_ipd(1), A1, tipd_A1);
   VitalWireDelay (A_ipd(2), A2, tipd_A2);
   VitalWireDelay (A_ipd(3), A3, tipd_A3);
   VitalWireDelay (A_ipd(4), A4, tipd_A4);
   VitalWireDelay (A_ipd(5), A5, tipd_A5);
   VitalWireDelay (A_ipd(6), A6, tipd_A6);
   VitalWireDelay (A_ipd(7), A7, tipd_A7);
   VitalWireDelay (DI0_ipd(0), DI0, tipd_DI0);
   VitalWireDelay (DI0_ipd(1), DI1, tipd_DI1);
   VitalWireDelay (DI0_ipd(2), DI2, tipd_DI2);
   VitalWireDelay (DI0_ipd(3), DI3, tipd_DI3);
   VitalWireDelay (DI0_ipd(4), DI4, tipd_DI4);
   VitalWireDelay (DI0_ipd(5), DI5, tipd_DI5);
   VitalWireDelay (DI0_ipd(6), DI6, tipd_DI6);
   VitalWireDelay (DI0_ipd(7), DI7, tipd_DI7);
   VitalWireDelay (DI0_ipd(8), DI8, tipd_DI8);
   VitalWireDelay (DI0_ipd(9), DI9, tipd_DI9);
   VitalWireDelay (DI0_ipd(10), DI10, tipd_DI10);
   VitalWireDelay (DI0_ipd(11), DI11, tipd_DI11);
   VitalWireDelay (DI0_ipd(12), DI12, tipd_DI12);
   VitalWireDelay (DI0_ipd(13), DI13, tipd_DI13);
   VitalWireDelay (DI0_ipd(14), DI14, tipd_DI14);
   VitalWireDelay (DI0_ipd(15), DI15, tipd_DI15);
   VitalWireDelay (DI1_ipd(0), DI16, tipd_DI16);
   VitalWireDelay (DI1_ipd(1), DI17, tipd_DI17);
   VitalWireDelay (DI1_ipd(2), DI18, tipd_DI18);
   VitalWireDelay (DI1_ipd(3), DI19, tipd_DI19);
   VitalWireDelay (DI1_ipd(4), DI20, tipd_DI20);
   VitalWireDelay (DI1_ipd(5), DI21, tipd_DI21);
   VitalWireDelay (DI1_ipd(6), DI22, tipd_DI22);
   VitalWireDelay (DI1_ipd(7), DI23, tipd_DI23);
   VitalWireDelay (DI1_ipd(8), DI24, tipd_DI24);
   VitalWireDelay (DI1_ipd(9), DI25, tipd_DI25);
   VitalWireDelay (DI1_ipd(10), DI26, tipd_DI26);
   VitalWireDelay (DI1_ipd(11), DI27, tipd_DI27);
   VitalWireDelay (DI1_ipd(12), DI28, tipd_DI28);
   VitalWireDelay (DI1_ipd(13), DI29, tipd_DI29);
   VitalWireDelay (DI1_ipd(14), DI30, tipd_DI30);
   VitalWireDelay (DI1_ipd(15), DI31, tipd_DI31);
   VitalWireDelay (DI2_ipd(0), DI32, tipd_DI32);
   VitalWireDelay (DI2_ipd(1), DI33, tipd_DI33);
   VitalWireDelay (DI2_ipd(2), DI34, tipd_DI34);
   VitalWireDelay (DI2_ipd(3), DI35, tipd_DI35);
   VitalWireDelay (DI2_ipd(4), DI36, tipd_DI36);
   VitalWireDelay (DI2_ipd(5), DI37, tipd_DI37);
   VitalWireDelay (DI2_ipd(6), DI38, tipd_DI38);
   VitalWireDelay (DI2_ipd(7), DI39, tipd_DI39);
   VitalWireDelay (DI2_ipd(8), DI40, tipd_DI40);
   VitalWireDelay (DI2_ipd(9), DI41, tipd_DI41);
   VitalWireDelay (DI2_ipd(10), DI42, tipd_DI42);
   VitalWireDelay (DI2_ipd(11), DI43, tipd_DI43);
   VitalWireDelay (DI2_ipd(12), DI44, tipd_DI44);
   VitalWireDelay (DI2_ipd(13), DI45, tipd_DI45);
   VitalWireDelay (DI2_ipd(14), DI46, tipd_DI46);
   VitalWireDelay (DI2_ipd(15), DI47, tipd_DI47);
   VitalWireDelay (DI3_ipd(0), DI48, tipd_DI48);
   VitalWireDelay (DI3_ipd(1), DI49, tipd_DI49);
   VitalWireDelay (DI3_ipd(2), DI50, tipd_DI50);
   VitalWireDelay (DI3_ipd(3), DI51, tipd_DI51);
   VitalWireDelay (DI3_ipd(4), DI52, tipd_DI52);
   VitalWireDelay (DI3_ipd(5), DI53, tipd_DI53);
   VitalWireDelay (DI3_ipd(6), DI54, tipd_DI54);
   VitalWireDelay (DI3_ipd(7), DI55, tipd_DI55);
   VitalWireDelay (DI3_ipd(8), DI56, tipd_DI56);
   VitalWireDelay (DI3_ipd(9), DI57, tipd_DI57);
   VitalWireDelay (DI3_ipd(10), DI58, tipd_DI58);
   VitalWireDelay (DI3_ipd(11), DI59, tipd_DI59);
   VitalWireDelay (DI3_ipd(12), DI60, tipd_DI60);
   VitalWireDelay (DI3_ipd(13), DI61, tipd_DI61);
   VitalWireDelay (DI3_ipd(14), DI62, tipd_DI62);
   VitalWireDelay (DI3_ipd(15), DI63, tipd_DI63);
   VitalWireDelay (DI4_ipd(0), DI64, tipd_DI64);
   VitalWireDelay (DI4_ipd(1), DI65, tipd_DI65);
   VitalWireDelay (DI4_ipd(2), DI66, tipd_DI66);
   VitalWireDelay (DI4_ipd(3), DI67, tipd_DI67);
   VitalWireDelay (DI4_ipd(4), DI68, tipd_DI68);
   VitalWireDelay (DI4_ipd(5), DI69, tipd_DI69);
   VitalWireDelay (DI4_ipd(6), DI70, tipd_DI70);
   VitalWireDelay (DI4_ipd(7), DI71, tipd_DI71);
   VitalWireDelay (DI4_ipd(8), DI72, tipd_DI72);
   VitalWireDelay (DI4_ipd(9), DI73, tipd_DI73);
   VitalWireDelay (DI4_ipd(10), DI74, tipd_DI74);
   VitalWireDelay (DI4_ipd(11), DI75, tipd_DI75);
   VitalWireDelay (DI4_ipd(12), DI76, tipd_DI76);
   VitalWireDelay (DI4_ipd(13), DI77, tipd_DI77);
   VitalWireDelay (DI4_ipd(14), DI78, tipd_DI78);
   VitalWireDelay (DI4_ipd(15), DI79, tipd_DI79);
   VitalWireDelay (DI5_ipd(0), DI80, tipd_DI80);
   VitalWireDelay (DI5_ipd(1), DI81, tipd_DI81);
   VitalWireDelay (DI5_ipd(2), DI82, tipd_DI82);
   VitalWireDelay (DI5_ipd(3), DI83, tipd_DI83);
   VitalWireDelay (DI5_ipd(4), DI84, tipd_DI84);
   VitalWireDelay (DI5_ipd(5), DI85, tipd_DI85);
   VitalWireDelay (DI5_ipd(6), DI86, tipd_DI86);
   VitalWireDelay (DI5_ipd(7), DI87, tipd_DI87);
   VitalWireDelay (DI5_ipd(8), DI88, tipd_DI88);
   VitalWireDelay (DI5_ipd(9), DI89, tipd_DI89);
   VitalWireDelay (DI5_ipd(10), DI90, tipd_DI90);
   VitalWireDelay (DI5_ipd(11), DI91, tipd_DI91);
   VitalWireDelay (DI5_ipd(12), DI92, tipd_DI92);
   VitalWireDelay (DI5_ipd(13), DI93, tipd_DI93);
   VitalWireDelay (DI5_ipd(14), DI94, tipd_DI94);
   VitalWireDelay (DI5_ipd(15), DI95, tipd_DI95);
   VitalWireDelay (DI6_ipd(0), DI96, tipd_DI96);
   VitalWireDelay (DI6_ipd(1), DI97, tipd_DI97);
   VitalWireDelay (DI6_ipd(2), DI98, tipd_DI98);
   VitalWireDelay (DI6_ipd(3), DI99, tipd_DI99);
   VitalWireDelay (DI6_ipd(4), DI100, tipd_DI100);
   VitalWireDelay (DI6_ipd(5), DI101, tipd_DI101);
   VitalWireDelay (DI6_ipd(6), DI102, tipd_DI102);
   VitalWireDelay (DI6_ipd(7), DI103, tipd_DI103);
   VitalWireDelay (DI6_ipd(8), DI104, tipd_DI104);
   VitalWireDelay (DI6_ipd(9), DI105, tipd_DI105);
   VitalWireDelay (DI6_ipd(10), DI106, tipd_DI106);
   VitalWireDelay (DI6_ipd(11), DI107, tipd_DI107);
   VitalWireDelay (DI6_ipd(12), DI108, tipd_DI108);
   VitalWireDelay (DI6_ipd(13), DI109, tipd_DI109);
   VitalWireDelay (DI6_ipd(14), DI110, tipd_DI110);
   VitalWireDelay (DI6_ipd(15), DI111, tipd_DI111);
   VitalWireDelay (DI7_ipd(0), DI112, tipd_DI112);
   VitalWireDelay (DI7_ipd(1), DI113, tipd_DI113);
   VitalWireDelay (DI7_ipd(2), DI114, tipd_DI114);
   VitalWireDelay (DI7_ipd(3), DI115, tipd_DI115);
   VitalWireDelay (DI7_ipd(4), DI116, tipd_DI116);
   VitalWireDelay (DI7_ipd(5), DI117, tipd_DI117);
   VitalWireDelay (DI7_ipd(6), DI118, tipd_DI118);
   VitalWireDelay (DI7_ipd(7), DI119, tipd_DI119);
   VitalWireDelay (DI7_ipd(8), DI120, tipd_DI120);
   VitalWireDelay (DI7_ipd(9), DI121, tipd_DI121);
   VitalWireDelay (DI7_ipd(10), DI122, tipd_DI122);
   VitalWireDelay (DI7_ipd(11), DI123, tipd_DI123);
   VitalWireDelay (DI7_ipd(12), DI124, tipd_DI124);
   VitalWireDelay (DI7_ipd(13), DI125, tipd_DI125);
   VitalWireDelay (DI7_ipd(14), DI126, tipd_DI126);
   VitalWireDelay (DI7_ipd(15), DI127, tipd_DI127);

   end block;

   VitalBUF (DO0, DO0_int(0));
   VitalBUF (DO1, DO0_int(1));
   VitalBUF (DO2, DO0_int(2));
   VitalBUF (DO3, DO0_int(3));
   VitalBUF (DO4, DO0_int(4));
   VitalBUF (DO5, DO0_int(5));
   VitalBUF (DO6, DO0_int(6));
   VitalBUF (DO7, DO0_int(7));
   VitalBUF (DO8, DO0_int(8));
   VitalBUF (DO9, DO0_int(9));
   VitalBUF (DO10, DO0_int(10));
   VitalBUF (DO11, DO0_int(11));
   VitalBUF (DO12, DO0_int(12));
   VitalBUF (DO13, DO0_int(13));
   VitalBUF (DO14, DO0_int(14));
   VitalBUF (DO15, DO0_int(15));
   VitalBUF (DO16, DO1_int(0));
   VitalBUF (DO17, DO1_int(1));
   VitalBUF (DO18, DO1_int(2));
   VitalBUF (DO19, DO1_int(3));
   VitalBUF (DO20, DO1_int(4));
   VitalBUF (DO21, DO1_int(5));
   VitalBUF (DO22, DO1_int(6));
   VitalBUF (DO23, DO1_int(7));
   VitalBUF (DO24, DO1_int(8));
   VitalBUF (DO25, DO1_int(9));
   VitalBUF (DO26, DO1_int(10));
   VitalBUF (DO27, DO1_int(11));
   VitalBUF (DO28, DO1_int(12));
   VitalBUF (DO29, DO1_int(13));
   VitalBUF (DO30, DO1_int(14));
   VitalBUF (DO31, DO1_int(15));
   VitalBUF (DO32, DO2_int(0));
   VitalBUF (DO33, DO2_int(1));
   VitalBUF (DO34, DO2_int(2));
   VitalBUF (DO35, DO2_int(3));
   VitalBUF (DO36, DO2_int(4));
   VitalBUF (DO37, DO2_int(5));
   VitalBUF (DO38, DO2_int(6));
   VitalBUF (DO39, DO2_int(7));
   VitalBUF (DO40, DO2_int(8));
   VitalBUF (DO41, DO2_int(9));
   VitalBUF (DO42, DO2_int(10));
   VitalBUF (DO43, DO2_int(11));
   VitalBUF (DO44, DO2_int(12));
   VitalBUF (DO45, DO2_int(13));
   VitalBUF (DO46, DO2_int(14));
   VitalBUF (DO47, DO2_int(15));
   VitalBUF (DO48, DO3_int(0));
   VitalBUF (DO49, DO3_int(1));
   VitalBUF (DO50, DO3_int(2));
   VitalBUF (DO51, DO3_int(3));
   VitalBUF (DO52, DO3_int(4));
   VitalBUF (DO53, DO3_int(5));
   VitalBUF (DO54, DO3_int(6));
   VitalBUF (DO55, DO3_int(7));
   VitalBUF (DO56, DO3_int(8));
   VitalBUF (DO57, DO3_int(9));
   VitalBUF (DO58, DO3_int(10));
   VitalBUF (DO59, DO3_int(11));
   VitalBUF (DO60, DO3_int(12));
   VitalBUF (DO61, DO3_int(13));
   VitalBUF (DO62, DO3_int(14));
   VitalBUF (DO63, DO3_int(15));
   VitalBUF (DO64, DO4_int(0));
   VitalBUF (DO65, DO4_int(1));
   VitalBUF (DO66, DO4_int(2));
   VitalBUF (DO67, DO4_int(3));
   VitalBUF (DO68, DO4_int(4));
   VitalBUF (DO69, DO4_int(5));
   VitalBUF (DO70, DO4_int(6));
   VitalBUF (DO71, DO4_int(7));
   VitalBUF (DO72, DO4_int(8));
   VitalBUF (DO73, DO4_int(9));
   VitalBUF (DO74, DO4_int(10));
   VitalBUF (DO75, DO4_int(11));
   VitalBUF (DO76, DO4_int(12));
   VitalBUF (DO77, DO4_int(13));
   VitalBUF (DO78, DO4_int(14));
   VitalBUF (DO79, DO4_int(15));
   VitalBUF (DO80, DO5_int(0));
   VitalBUF (DO81, DO5_int(1));
   VitalBUF (DO82, DO5_int(2));
   VitalBUF (DO83, DO5_int(3));
   VitalBUF (DO84, DO5_int(4));
   VitalBUF (DO85, DO5_int(5));
   VitalBUF (DO86, DO5_int(6));
   VitalBUF (DO87, DO5_int(7));
   VitalBUF (DO88, DO5_int(8));
   VitalBUF (DO89, DO5_int(9));
   VitalBUF (DO90, DO5_int(10));
   VitalBUF (DO91, DO5_int(11));
   VitalBUF (DO92, DO5_int(12));
   VitalBUF (DO93, DO5_int(13));
   VitalBUF (DO94, DO5_int(14));
   VitalBUF (DO95, DO5_int(15));
   VitalBUF (DO96, DO6_int(0));
   VitalBUF (DO97, DO6_int(1));
   VitalBUF (DO98, DO6_int(2));
   VitalBUF (DO99, DO6_int(3));
   VitalBUF (DO100, DO6_int(4));
   VitalBUF (DO101, DO6_int(5));
   VitalBUF (DO102, DO6_int(6));
   VitalBUF (DO103, DO6_int(7));
   VitalBUF (DO104, DO6_int(8));
   VitalBUF (DO105, DO6_int(9));
   VitalBUF (DO106, DO6_int(10));
   VitalBUF (DO107, DO6_int(11));
   VitalBUF (DO108, DO6_int(12));
   VitalBUF (DO109, DO6_int(13));
   VitalBUF (DO110, DO6_int(14));
   VitalBUF (DO111, DO6_int(15));
   VitalBUF (DO112, DO7_int(0));
   VitalBUF (DO113, DO7_int(1));
   VitalBUF (DO114, DO7_int(2));
   VitalBUF (DO115, DO7_int(3));
   VitalBUF (DO116, DO7_int(4));
   VitalBUF (DO117, DO7_int(5));
   VitalBUF (DO118, DO7_int(6));
   VitalBUF (DO119, DO7_int(7));
   VitalBUF (DO120, DO7_int(8));
   VitalBUF (DO121, DO7_int(9));
   VitalBUF (DO122, DO7_int(10));
   VitalBUF (DO123, DO7_int(11));
   VitalBUF (DO124, DO7_int(12));
   VitalBUF (DO125, DO7_int(13));
   VitalBUF (DO126, DO7_int(14));
   VitalBUF (DO127, DO7_int(15));

   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : PROCESS (CSB_ipd, 
                            A_ipd,
                            WEB0_ipd,
                            DI0_ipd,
                            WEB1_ipd,
                            DI1_ipd,
                            WEB2_ipd,
                            DI2_ipd,
                            WEB3_ipd,
                            DI3_ipd,
                            WEB4_ipd,
                            DI4_ipd,
                            WEB5_ipd,
                            DI5_ipd,
                            WEB6_ipd,
                            DI6_ipd,
                            WEB7_ipd,
                            DI7_ipd,
                            CK_ipd)

   -- timing check results
   VARIABLE Tviol_A0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI9_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI10_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI11_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI12_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI13_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI14_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI15_0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI9_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI10_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI11_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI12_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI13_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI14_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI15_1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI9_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI10_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI11_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI12_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI13_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI14_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI15_2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI9_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI10_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI11_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI12_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI13_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI14_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI15_3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI9_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI10_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI11_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI12_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI13_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI14_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI15_4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI9_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI10_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI11_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI12_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI13_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI14_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI15_5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI9_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI10_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI11_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI12_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI13_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI14_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI15_6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI9_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI10_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI11_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI12_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI13_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI14_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI15_7_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_CSB_CK_posedge  : STD_ULOGIC := '0';

   

   VARIABLE Pviol_CK    : STD_ULOGIC := '0';
   VARIABLE Pdata_CK    : VitalPeriodDataType := VitalPeriodDataInit;

   VARIABLE Tmkr_A0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI9_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI10_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI11_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI12_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI13_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI14_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI15_0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI9_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI10_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI11_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI12_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI13_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI14_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI15_1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI9_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI10_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI11_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI12_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI13_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI14_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI15_2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI9_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI10_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI11_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI12_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI13_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI14_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI15_3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI9_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI10_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI11_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI12_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI13_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI14_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI15_4_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI9_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI10_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI11_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI12_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI13_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI14_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI15_5_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI9_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI10_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI11_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI12_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI13_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI14_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI15_6_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI9_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI10_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI11_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI12_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI13_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI14_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI15_7_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_CSB_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;



   VARIABLE DO0_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore0  : memoryArray;
   VARIABLE DO1_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore1  : memoryArray;
   VARIABLE DO2_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore2  : memoryArray;
   VARIABLE DO3_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore3  : memoryArray;
   VARIABLE DO4_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore4  : memoryArray;
   VARIABLE DO5_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore5  : memoryArray;
   VARIABLE DO6_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore6  : memoryArray;
   VARIABLE DO7_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore7  : memoryArray;

   VARIABLE ck_change   : std_logic_vector(1 downto 0);
   VARIABLE web0_cs      : std_logic_vector(1 downto 0);
   VARIABLE web1_cs      : std_logic_vector(1 downto 0);
   VARIABLE web2_cs      : std_logic_vector(1 downto 0);
   VARIABLE web3_cs      : std_logic_vector(1 downto 0);
   VARIABLE web4_cs      : std_logic_vector(1 downto 0);
   VARIABLE web5_cs      : std_logic_vector(1 downto 0);
   VARIABLE web6_cs      : std_logic_vector(1 downto 0);
   VARIABLE web7_cs      : std_logic_vector(1 downto 0);

   -- previous latch data
   VARIABLE Latch_A        : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE Latch_DI0       : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE Latch_WEB0      : std_logic := 'X';
   VARIABLE Latch_DI1       : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE Latch_WEB1      : std_logic := 'X';
   VARIABLE Latch_DI2       : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE Latch_WEB2      : std_logic := 'X';
   VARIABLE Latch_DI3       : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE Latch_WEB3      : std_logic := 'X';
   VARIABLE Latch_DI4       : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE Latch_WEB4      : std_logic := 'X';
   VARIABLE Latch_DI5       : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE Latch_WEB5      : std_logic := 'X';
   VARIABLE Latch_DI6       : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE Latch_WEB6      : std_logic := 'X';
   VARIABLE Latch_DI7       : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE Latch_WEB7      : std_logic := 'X';
   VARIABLE Latch_CSB       : std_logic := 'X';

   -- internal latch data
   VARIABLE A_i            : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE DI0_i           : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE WEB0_i          : std_logic := 'X';
   VARIABLE DI1_i           : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE WEB1_i          : std_logic := 'X';
   VARIABLE DI2_i           : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE WEB2_i          : std_logic := 'X';
   VARIABLE DI3_i           : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE WEB3_i          : std_logic := 'X';
   VARIABLE DI4_i           : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE WEB4_i          : std_logic := 'X';
   VARIABLE DI5_i           : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE WEB5_i          : std_logic := 'X';
   VARIABLE DI6_i           : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE WEB6_i          : std_logic := 'X';
   VARIABLE DI7_i           : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE WEB7_i          : std_logic := 'X';
   VARIABLE CSB_i           : std_logic := 'X';


   VARIABLE last_A         : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE last_DI0    : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE last_WEB0   : std_logic := 'X';
   VARIABLE last_DI1    : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE last_WEB1   : std_logic := 'X';
   VARIABLE last_DI2    : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE last_WEB2   : std_logic := 'X';
   VARIABLE last_DI3    : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE last_WEB3   : std_logic := 'X';
   VARIABLE last_DI4    : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE last_WEB4   : std_logic := 'X';
   VARIABLE last_DI5    : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE last_WEB5   : std_logic := 'X';
   VARIABLE last_DI6    : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE last_WEB6   : std_logic := 'X';
   VARIABLE last_DI7    : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE last_WEB7   : std_logic := 'X';

   VARIABLE LastClkEdge    : std_logic := 'X';

   VARIABLE flag_A: integer   := True_flg;
   VARIABLE flag_CSB: integer   := True_flg;
   
   
   begin

   ------------------------
   --  Timing Check Section
   ------------------------
   if (TimingChecksOn) then
         VitalSetupHoldCheck (
          Violation               => Tviol_A0_CK_posedge,
          TimingData              => Tmkr_A0_CK_posedge,
          TestSignal              => A_ipd(0),
          TestSignalName          => "A0",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A0_CK_posedge_posedge,
          SetupLow                => tsetup_A0_CK_negedge_posedge,
          HoldHigh                => thold_A0_CK_negedge_posedge,
          HoldLow                 => thold_A0_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A1_CK_posedge,
          TimingData              => Tmkr_A1_CK_posedge,
          TestSignal              => A_ipd(1),
          TestSignalName          => "A1",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A1_CK_posedge_posedge,
          SetupLow                => tsetup_A1_CK_negedge_posedge,
          HoldHigh                => thold_A1_CK_negedge_posedge,
          HoldLow                 => thold_A1_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A2_CK_posedge,
          TimingData              => Tmkr_A2_CK_posedge,
          TestSignal              => A_ipd(2),
          TestSignalName          => "A2",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A2_CK_posedge_posedge,
          SetupLow                => tsetup_A2_CK_negedge_posedge,
          HoldHigh                => thold_A2_CK_negedge_posedge,
          HoldLow                 => thold_A2_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A3_CK_posedge,
          TimingData              => Tmkr_A3_CK_posedge,
          TestSignal              => A_ipd(3),
          TestSignalName          => "A3",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A3_CK_posedge_posedge,
          SetupLow                => tsetup_A3_CK_negedge_posedge,
          HoldHigh                => thold_A3_CK_negedge_posedge,
          HoldLow                 => thold_A3_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A4_CK_posedge,
          TimingData              => Tmkr_A4_CK_posedge,
          TestSignal              => A_ipd(4),
          TestSignalName          => "A4",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A4_CK_posedge_posedge,
          SetupLow                => tsetup_A4_CK_negedge_posedge,
          HoldHigh                => thold_A4_CK_negedge_posedge,
          HoldLow                 => thold_A4_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A5_CK_posedge,
          TimingData              => Tmkr_A5_CK_posedge,
          TestSignal              => A_ipd(5),
          TestSignalName          => "A5",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A5_CK_posedge_posedge,
          SetupLow                => tsetup_A5_CK_negedge_posedge,
          HoldHigh                => thold_A5_CK_negedge_posedge,
          HoldLow                 => thold_A5_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A6_CK_posedge,
          TimingData              => Tmkr_A6_CK_posedge,
          TestSignal              => A_ipd(6),
          TestSignalName          => "A6",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A6_CK_posedge_posedge,
          SetupLow                => tsetup_A6_CK_negedge_posedge,
          HoldHigh                => thold_A6_CK_negedge_posedge,
          HoldLow                 => thold_A6_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A7_CK_posedge,
          TimingData              => Tmkr_A7_CK_posedge,
          TestSignal              => A_ipd(7),
          TestSignalName          => "A7",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A7_CK_posedge_posedge,
          SetupLow                => tsetup_A7_CK_negedge_posedge,
          HoldHigh                => thold_A7_CK_negedge_posedge,
          HoldLow                 => thold_A7_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);

         VitalSetupHoldCheck (
          Violation               => Tviol_WEB0_CK_posedge,
          TimingData              => Tmkr_WEB0_CK_posedge,
          TestSignal              => WEB0_ipd,
          TestSignalName          => "WEB0",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB0_CK_posedge_posedge,
          SetupLow                => tsetup_WEB0_CK_negedge_posedge,
          HoldHigh                => thold_WEB0_CK_negedge_posedge,
          HoldLow                 => thold_WEB0_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB1_CK_posedge,
          TimingData              => Tmkr_WEB1_CK_posedge,
          TestSignal              => WEB1_ipd,
          TestSignalName          => "WEB1",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB1_CK_posedge_posedge,
          SetupLow                => tsetup_WEB1_CK_negedge_posedge,
          HoldHigh                => thold_WEB1_CK_negedge_posedge,
          HoldLow                 => thold_WEB1_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB2_CK_posedge,
          TimingData              => Tmkr_WEB2_CK_posedge,
          TestSignal              => WEB2_ipd,
          TestSignalName          => "WEB2",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB2_CK_posedge_posedge,
          SetupLow                => tsetup_WEB2_CK_negedge_posedge,
          HoldHigh                => thold_WEB2_CK_negedge_posedge,
          HoldLow                 => thold_WEB2_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB3_CK_posedge,
          TimingData              => Tmkr_WEB3_CK_posedge,
          TestSignal              => WEB3_ipd,
          TestSignalName          => "WEB3",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB3_CK_posedge_posedge,
          SetupLow                => tsetup_WEB3_CK_negedge_posedge,
          HoldHigh                => thold_WEB3_CK_negedge_posedge,
          HoldLow                 => thold_WEB3_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB4_CK_posedge,
          TimingData              => Tmkr_WEB4_CK_posedge,
          TestSignal              => WEB4_ipd,
          TestSignalName          => "WEB4",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB4_CK_posedge_posedge,
          SetupLow                => tsetup_WEB4_CK_negedge_posedge,
          HoldHigh                => thold_WEB4_CK_negedge_posedge,
          HoldLow                 => thold_WEB4_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB5_CK_posedge,
          TimingData              => Tmkr_WEB5_CK_posedge,
          TestSignal              => WEB5_ipd,
          TestSignalName          => "WEB5",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB5_CK_posedge_posedge,
          SetupLow                => tsetup_WEB5_CK_negedge_posedge,
          HoldHigh                => thold_WEB5_CK_negedge_posedge,
          HoldLow                 => thold_WEB5_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB6_CK_posedge,
          TimingData              => Tmkr_WEB6_CK_posedge,
          TestSignal              => WEB6_ipd,
          TestSignalName          => "WEB6",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB6_CK_posedge_posedge,
          SetupLow                => tsetup_WEB6_CK_negedge_posedge,
          HoldHigh                => thold_WEB6_CK_negedge_posedge,
          HoldLow                 => thold_WEB6_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB7_CK_posedge,
          TimingData              => Tmkr_WEB7_CK_posedge,
          TestSignal              => WEB7_ipd,
          TestSignalName          => "WEB7",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB7_CK_posedge_posedge,
          SetupLow                => tsetup_WEB7_CK_negedge_posedge,
          HoldHigh                => thold_WEB7_CK_negedge_posedge,
          HoldLow                 => thold_WEB7_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);

         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_0_CK_posedge,
          TimingData              => Tmkr_DI0_0_CK_posedge,
          TestSignal              => DI0_ipd(0),
          TestSignalName          => "DI0",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI0_CK_posedge_posedge,
          SetupLow                => tsetup_DI0_CK_negedge_posedge,
          HoldHigh                => thold_DI0_CK_negedge_posedge,
          HoldLow                 => thold_DI0_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_0_CK_posedge,
          TimingData              => Tmkr_DI1_0_CK_posedge,
          TestSignal              => DI0_ipd(1),
          TestSignalName          => "DI1",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI1_CK_posedge_posedge,
          SetupLow                => tsetup_DI1_CK_negedge_posedge,
          HoldHigh                => thold_DI1_CK_negedge_posedge,
          HoldLow                 => thold_DI1_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_0_CK_posedge,
          TimingData              => Tmkr_DI2_0_CK_posedge,
          TestSignal              => DI0_ipd(2),
          TestSignalName          => "DI2",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI2_CK_posedge_posedge,
          SetupLow                => tsetup_DI2_CK_negedge_posedge,
          HoldHigh                => thold_DI2_CK_negedge_posedge,
          HoldLow                 => thold_DI2_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_0_CK_posedge,
          TimingData              => Tmkr_DI3_0_CK_posedge,
          TestSignal              => DI0_ipd(3),
          TestSignalName          => "DI3",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI3_CK_posedge_posedge,
          SetupLow                => tsetup_DI3_CK_negedge_posedge,
          HoldHigh                => thold_DI3_CK_negedge_posedge,
          HoldLow                 => thold_DI3_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_0_CK_posedge,
          TimingData              => Tmkr_DI4_0_CK_posedge,
          TestSignal              => DI0_ipd(4),
          TestSignalName          => "DI4",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI4_CK_posedge_posedge,
          SetupLow                => tsetup_DI4_CK_negedge_posedge,
          HoldHigh                => thold_DI4_CK_negedge_posedge,
          HoldLow                 => thold_DI4_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_0_CK_posedge,
          TimingData              => Tmkr_DI5_0_CK_posedge,
          TestSignal              => DI0_ipd(5),
          TestSignalName          => "DI5",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI5_CK_posedge_posedge,
          SetupLow                => tsetup_DI5_CK_negedge_posedge,
          HoldHigh                => thold_DI5_CK_negedge_posedge,
          HoldLow                 => thold_DI5_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_0_CK_posedge,
          TimingData              => Tmkr_DI6_0_CK_posedge,
          TestSignal              => DI0_ipd(6),
          TestSignalName          => "DI6",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI6_CK_posedge_posedge,
          SetupLow                => tsetup_DI6_CK_negedge_posedge,
          HoldHigh                => thold_DI6_CK_negedge_posedge,
          HoldLow                 => thold_DI6_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_0_CK_posedge,
          TimingData              => Tmkr_DI7_0_CK_posedge,
          TestSignal              => DI0_ipd(7),
          TestSignalName          => "DI7",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI7_CK_posedge_posedge,
          SetupLow                => tsetup_DI7_CK_negedge_posedge,
          HoldHigh                => thold_DI7_CK_negedge_posedge,
          HoldLow                 => thold_DI7_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_0_CK_posedge,
          TimingData              => Tmkr_DI8_0_CK_posedge,
          TestSignal              => DI0_ipd(8),
          TestSignalName          => "DI8",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI8_CK_posedge_posedge,
          SetupLow                => tsetup_DI8_CK_negedge_posedge,
          HoldHigh                => thold_DI8_CK_negedge_posedge,
          HoldLow                 => thold_DI8_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI9_0_CK_posedge,
          TimingData              => Tmkr_DI9_0_CK_posedge,
          TestSignal              => DI0_ipd(9),
          TestSignalName          => "DI9",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI9_CK_posedge_posedge,
          SetupLow                => tsetup_DI9_CK_negedge_posedge,
          HoldHigh                => thold_DI9_CK_negedge_posedge,
          HoldLow                 => thold_DI9_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI10_0_CK_posedge,
          TimingData              => Tmkr_DI10_0_CK_posedge,
          TestSignal              => DI0_ipd(10),
          TestSignalName          => "DI10",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI10_CK_posedge_posedge,
          SetupLow                => tsetup_DI10_CK_negedge_posedge,
          HoldHigh                => thold_DI10_CK_negedge_posedge,
          HoldLow                 => thold_DI10_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI11_0_CK_posedge,
          TimingData              => Tmkr_DI11_0_CK_posedge,
          TestSignal              => DI0_ipd(11),
          TestSignalName          => "DI11",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI11_CK_posedge_posedge,
          SetupLow                => tsetup_DI11_CK_negedge_posedge,
          HoldHigh                => thold_DI11_CK_negedge_posedge,
          HoldLow                 => thold_DI11_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI12_0_CK_posedge,
          TimingData              => Tmkr_DI12_0_CK_posedge,
          TestSignal              => DI0_ipd(12),
          TestSignalName          => "DI12",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI12_CK_posedge_posedge,
          SetupLow                => tsetup_DI12_CK_negedge_posedge,
          HoldHigh                => thold_DI12_CK_negedge_posedge,
          HoldLow                 => thold_DI12_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI13_0_CK_posedge,
          TimingData              => Tmkr_DI13_0_CK_posedge,
          TestSignal              => DI0_ipd(13),
          TestSignalName          => "DI13",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI13_CK_posedge_posedge,
          SetupLow                => tsetup_DI13_CK_negedge_posedge,
          HoldHigh                => thold_DI13_CK_negedge_posedge,
          HoldLow                 => thold_DI13_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI14_0_CK_posedge,
          TimingData              => Tmkr_DI14_0_CK_posedge,
          TestSignal              => DI0_ipd(14),
          TestSignalName          => "DI14",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI14_CK_posedge_posedge,
          SetupLow                => tsetup_DI14_CK_negedge_posedge,
          HoldHigh                => thold_DI14_CK_negedge_posedge,
          HoldLow                 => thold_DI14_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI15_0_CK_posedge,
          TimingData              => Tmkr_DI15_0_CK_posedge,
          TestSignal              => DI0_ipd(15),
          TestSignalName          => "DI15",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI15_CK_posedge_posedge,
          SetupLow                => tsetup_DI15_CK_negedge_posedge,
          HoldHigh                => thold_DI15_CK_negedge_posedge,
          HoldLow                 => thold_DI15_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_1_CK_posedge,
          TimingData              => Tmkr_DI0_1_CK_posedge,
          TestSignal              => DI1_ipd(0),
          TestSignalName          => "DI16",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI16_CK_posedge_posedge,
          SetupLow                => tsetup_DI16_CK_negedge_posedge,
          HoldHigh                => thold_DI16_CK_negedge_posedge,
          HoldLow                 => thold_DI16_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_1_CK_posedge,
          TimingData              => Tmkr_DI1_1_CK_posedge,
          TestSignal              => DI1_ipd(1),
          TestSignalName          => "DI17",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI17_CK_posedge_posedge,
          SetupLow                => tsetup_DI17_CK_negedge_posedge,
          HoldHigh                => thold_DI17_CK_negedge_posedge,
          HoldLow                 => thold_DI17_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_1_CK_posedge,
          TimingData              => Tmkr_DI2_1_CK_posedge,
          TestSignal              => DI1_ipd(2),
          TestSignalName          => "DI18",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI18_CK_posedge_posedge,
          SetupLow                => tsetup_DI18_CK_negedge_posedge,
          HoldHigh                => thold_DI18_CK_negedge_posedge,
          HoldLow                 => thold_DI18_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_1_CK_posedge,
          TimingData              => Tmkr_DI3_1_CK_posedge,
          TestSignal              => DI1_ipd(3),
          TestSignalName          => "DI19",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI19_CK_posedge_posedge,
          SetupLow                => tsetup_DI19_CK_negedge_posedge,
          HoldHigh                => thold_DI19_CK_negedge_posedge,
          HoldLow                 => thold_DI19_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_1_CK_posedge,
          TimingData              => Tmkr_DI4_1_CK_posedge,
          TestSignal              => DI1_ipd(4),
          TestSignalName          => "DI20",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI20_CK_posedge_posedge,
          SetupLow                => tsetup_DI20_CK_negedge_posedge,
          HoldHigh                => thold_DI20_CK_negedge_posedge,
          HoldLow                 => thold_DI20_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_1_CK_posedge,
          TimingData              => Tmkr_DI5_1_CK_posedge,
          TestSignal              => DI1_ipd(5),
          TestSignalName          => "DI21",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI21_CK_posedge_posedge,
          SetupLow                => tsetup_DI21_CK_negedge_posedge,
          HoldHigh                => thold_DI21_CK_negedge_posedge,
          HoldLow                 => thold_DI21_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_1_CK_posedge,
          TimingData              => Tmkr_DI6_1_CK_posedge,
          TestSignal              => DI1_ipd(6),
          TestSignalName          => "DI22",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI22_CK_posedge_posedge,
          SetupLow                => tsetup_DI22_CK_negedge_posedge,
          HoldHigh                => thold_DI22_CK_negedge_posedge,
          HoldLow                 => thold_DI22_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_1_CK_posedge,
          TimingData              => Tmkr_DI7_1_CK_posedge,
          TestSignal              => DI1_ipd(7),
          TestSignalName          => "DI23",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI23_CK_posedge_posedge,
          SetupLow                => tsetup_DI23_CK_negedge_posedge,
          HoldHigh                => thold_DI23_CK_negedge_posedge,
          HoldLow                 => thold_DI23_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_1_CK_posedge,
          TimingData              => Tmkr_DI8_1_CK_posedge,
          TestSignal              => DI1_ipd(8),
          TestSignalName          => "DI24",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI24_CK_posedge_posedge,
          SetupLow                => tsetup_DI24_CK_negedge_posedge,
          HoldHigh                => thold_DI24_CK_negedge_posedge,
          HoldLow                 => thold_DI24_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI9_1_CK_posedge,
          TimingData              => Tmkr_DI9_1_CK_posedge,
          TestSignal              => DI1_ipd(9),
          TestSignalName          => "DI25",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI25_CK_posedge_posedge,
          SetupLow                => tsetup_DI25_CK_negedge_posedge,
          HoldHigh                => thold_DI25_CK_negedge_posedge,
          HoldLow                 => thold_DI25_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI10_1_CK_posedge,
          TimingData              => Tmkr_DI10_1_CK_posedge,
          TestSignal              => DI1_ipd(10),
          TestSignalName          => "DI26",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI26_CK_posedge_posedge,
          SetupLow                => tsetup_DI26_CK_negedge_posedge,
          HoldHigh                => thold_DI26_CK_negedge_posedge,
          HoldLow                 => thold_DI26_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI11_1_CK_posedge,
          TimingData              => Tmkr_DI11_1_CK_posedge,
          TestSignal              => DI1_ipd(11),
          TestSignalName          => "DI27",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI27_CK_posedge_posedge,
          SetupLow                => tsetup_DI27_CK_negedge_posedge,
          HoldHigh                => thold_DI27_CK_negedge_posedge,
          HoldLow                 => thold_DI27_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI12_1_CK_posedge,
          TimingData              => Tmkr_DI12_1_CK_posedge,
          TestSignal              => DI1_ipd(12),
          TestSignalName          => "DI28",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI28_CK_posedge_posedge,
          SetupLow                => tsetup_DI28_CK_negedge_posedge,
          HoldHigh                => thold_DI28_CK_negedge_posedge,
          HoldLow                 => thold_DI28_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI13_1_CK_posedge,
          TimingData              => Tmkr_DI13_1_CK_posedge,
          TestSignal              => DI1_ipd(13),
          TestSignalName          => "DI29",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI29_CK_posedge_posedge,
          SetupLow                => tsetup_DI29_CK_negedge_posedge,
          HoldHigh                => thold_DI29_CK_negedge_posedge,
          HoldLow                 => thold_DI29_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI14_1_CK_posedge,
          TimingData              => Tmkr_DI14_1_CK_posedge,
          TestSignal              => DI1_ipd(14),
          TestSignalName          => "DI30",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI30_CK_posedge_posedge,
          SetupLow                => tsetup_DI30_CK_negedge_posedge,
          HoldHigh                => thold_DI30_CK_negedge_posedge,
          HoldLow                 => thold_DI30_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI15_1_CK_posedge,
          TimingData              => Tmkr_DI15_1_CK_posedge,
          TestSignal              => DI1_ipd(15),
          TestSignalName          => "DI31",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI31_CK_posedge_posedge,
          SetupLow                => tsetup_DI31_CK_negedge_posedge,
          HoldHigh                => thold_DI31_CK_negedge_posedge,
          HoldLow                 => thold_DI31_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_2_CK_posedge,
          TimingData              => Tmkr_DI0_2_CK_posedge,
          TestSignal              => DI2_ipd(0),
          TestSignalName          => "DI32",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI32_CK_posedge_posedge,
          SetupLow                => tsetup_DI32_CK_negedge_posedge,
          HoldHigh                => thold_DI32_CK_negedge_posedge,
          HoldLow                 => thold_DI32_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_2_CK_posedge,
          TimingData              => Tmkr_DI1_2_CK_posedge,
          TestSignal              => DI2_ipd(1),
          TestSignalName          => "DI33",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI33_CK_posedge_posedge,
          SetupLow                => tsetup_DI33_CK_negedge_posedge,
          HoldHigh                => thold_DI33_CK_negedge_posedge,
          HoldLow                 => thold_DI33_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_2_CK_posedge,
          TimingData              => Tmkr_DI2_2_CK_posedge,
          TestSignal              => DI2_ipd(2),
          TestSignalName          => "DI34",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI34_CK_posedge_posedge,
          SetupLow                => tsetup_DI34_CK_negedge_posedge,
          HoldHigh                => thold_DI34_CK_negedge_posedge,
          HoldLow                 => thold_DI34_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_2_CK_posedge,
          TimingData              => Tmkr_DI3_2_CK_posedge,
          TestSignal              => DI2_ipd(3),
          TestSignalName          => "DI35",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI35_CK_posedge_posedge,
          SetupLow                => tsetup_DI35_CK_negedge_posedge,
          HoldHigh                => thold_DI35_CK_negedge_posedge,
          HoldLow                 => thold_DI35_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_2_CK_posedge,
          TimingData              => Tmkr_DI4_2_CK_posedge,
          TestSignal              => DI2_ipd(4),
          TestSignalName          => "DI36",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI36_CK_posedge_posedge,
          SetupLow                => tsetup_DI36_CK_negedge_posedge,
          HoldHigh                => thold_DI36_CK_negedge_posedge,
          HoldLow                 => thold_DI36_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_2_CK_posedge,
          TimingData              => Tmkr_DI5_2_CK_posedge,
          TestSignal              => DI2_ipd(5),
          TestSignalName          => "DI37",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI37_CK_posedge_posedge,
          SetupLow                => tsetup_DI37_CK_negedge_posedge,
          HoldHigh                => thold_DI37_CK_negedge_posedge,
          HoldLow                 => thold_DI37_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_2_CK_posedge,
          TimingData              => Tmkr_DI6_2_CK_posedge,
          TestSignal              => DI2_ipd(6),
          TestSignalName          => "DI38",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI38_CK_posedge_posedge,
          SetupLow                => tsetup_DI38_CK_negedge_posedge,
          HoldHigh                => thold_DI38_CK_negedge_posedge,
          HoldLow                 => thold_DI38_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_2_CK_posedge,
          TimingData              => Tmkr_DI7_2_CK_posedge,
          TestSignal              => DI2_ipd(7),
          TestSignalName          => "DI39",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI39_CK_posedge_posedge,
          SetupLow                => tsetup_DI39_CK_negedge_posedge,
          HoldHigh                => thold_DI39_CK_negedge_posedge,
          HoldLow                 => thold_DI39_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_2_CK_posedge,
          TimingData              => Tmkr_DI8_2_CK_posedge,
          TestSignal              => DI2_ipd(8),
          TestSignalName          => "DI40",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI40_CK_posedge_posedge,
          SetupLow                => tsetup_DI40_CK_negedge_posedge,
          HoldHigh                => thold_DI40_CK_negedge_posedge,
          HoldLow                 => thold_DI40_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI9_2_CK_posedge,
          TimingData              => Tmkr_DI9_2_CK_posedge,
          TestSignal              => DI2_ipd(9),
          TestSignalName          => "DI41",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI41_CK_posedge_posedge,
          SetupLow                => tsetup_DI41_CK_negedge_posedge,
          HoldHigh                => thold_DI41_CK_negedge_posedge,
          HoldLow                 => thold_DI41_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI10_2_CK_posedge,
          TimingData              => Tmkr_DI10_2_CK_posedge,
          TestSignal              => DI2_ipd(10),
          TestSignalName          => "DI42",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI42_CK_posedge_posedge,
          SetupLow                => tsetup_DI42_CK_negedge_posedge,
          HoldHigh                => thold_DI42_CK_negedge_posedge,
          HoldLow                 => thold_DI42_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI11_2_CK_posedge,
          TimingData              => Tmkr_DI11_2_CK_posedge,
          TestSignal              => DI2_ipd(11),
          TestSignalName          => "DI43",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI43_CK_posedge_posedge,
          SetupLow                => tsetup_DI43_CK_negedge_posedge,
          HoldHigh                => thold_DI43_CK_negedge_posedge,
          HoldLow                 => thold_DI43_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI12_2_CK_posedge,
          TimingData              => Tmkr_DI12_2_CK_posedge,
          TestSignal              => DI2_ipd(12),
          TestSignalName          => "DI44",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI44_CK_posedge_posedge,
          SetupLow                => tsetup_DI44_CK_negedge_posedge,
          HoldHigh                => thold_DI44_CK_negedge_posedge,
          HoldLow                 => thold_DI44_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI13_2_CK_posedge,
          TimingData              => Tmkr_DI13_2_CK_posedge,
          TestSignal              => DI2_ipd(13),
          TestSignalName          => "DI45",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI45_CK_posedge_posedge,
          SetupLow                => tsetup_DI45_CK_negedge_posedge,
          HoldHigh                => thold_DI45_CK_negedge_posedge,
          HoldLow                 => thold_DI45_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI14_2_CK_posedge,
          TimingData              => Tmkr_DI14_2_CK_posedge,
          TestSignal              => DI2_ipd(14),
          TestSignalName          => "DI46",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI46_CK_posedge_posedge,
          SetupLow                => tsetup_DI46_CK_negedge_posedge,
          HoldHigh                => thold_DI46_CK_negedge_posedge,
          HoldLow                 => thold_DI46_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI15_2_CK_posedge,
          TimingData              => Tmkr_DI15_2_CK_posedge,
          TestSignal              => DI2_ipd(15),
          TestSignalName          => "DI47",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI47_CK_posedge_posedge,
          SetupLow                => tsetup_DI47_CK_negedge_posedge,
          HoldHigh                => thold_DI47_CK_negedge_posedge,
          HoldLow                 => thold_DI47_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_3_CK_posedge,
          TimingData              => Tmkr_DI0_3_CK_posedge,
          TestSignal              => DI3_ipd(0),
          TestSignalName          => "DI48",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI48_CK_posedge_posedge,
          SetupLow                => tsetup_DI48_CK_negedge_posedge,
          HoldHigh                => thold_DI48_CK_negedge_posedge,
          HoldLow                 => thold_DI48_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_3_CK_posedge,
          TimingData              => Tmkr_DI1_3_CK_posedge,
          TestSignal              => DI3_ipd(1),
          TestSignalName          => "DI49",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI49_CK_posedge_posedge,
          SetupLow                => tsetup_DI49_CK_negedge_posedge,
          HoldHigh                => thold_DI49_CK_negedge_posedge,
          HoldLow                 => thold_DI49_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_3_CK_posedge,
          TimingData              => Tmkr_DI2_3_CK_posedge,
          TestSignal              => DI3_ipd(2),
          TestSignalName          => "DI50",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI50_CK_posedge_posedge,
          SetupLow                => tsetup_DI50_CK_negedge_posedge,
          HoldHigh                => thold_DI50_CK_negedge_posedge,
          HoldLow                 => thold_DI50_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_3_CK_posedge,
          TimingData              => Tmkr_DI3_3_CK_posedge,
          TestSignal              => DI3_ipd(3),
          TestSignalName          => "DI51",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI51_CK_posedge_posedge,
          SetupLow                => tsetup_DI51_CK_negedge_posedge,
          HoldHigh                => thold_DI51_CK_negedge_posedge,
          HoldLow                 => thold_DI51_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_3_CK_posedge,
          TimingData              => Tmkr_DI4_3_CK_posedge,
          TestSignal              => DI3_ipd(4),
          TestSignalName          => "DI52",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI52_CK_posedge_posedge,
          SetupLow                => tsetup_DI52_CK_negedge_posedge,
          HoldHigh                => thold_DI52_CK_negedge_posedge,
          HoldLow                 => thold_DI52_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_3_CK_posedge,
          TimingData              => Tmkr_DI5_3_CK_posedge,
          TestSignal              => DI3_ipd(5),
          TestSignalName          => "DI53",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI53_CK_posedge_posedge,
          SetupLow                => tsetup_DI53_CK_negedge_posedge,
          HoldHigh                => thold_DI53_CK_negedge_posedge,
          HoldLow                 => thold_DI53_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_3_CK_posedge,
          TimingData              => Tmkr_DI6_3_CK_posedge,
          TestSignal              => DI3_ipd(6),
          TestSignalName          => "DI54",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI54_CK_posedge_posedge,
          SetupLow                => tsetup_DI54_CK_negedge_posedge,
          HoldHigh                => thold_DI54_CK_negedge_posedge,
          HoldLow                 => thold_DI54_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_3_CK_posedge,
          TimingData              => Tmkr_DI7_3_CK_posedge,
          TestSignal              => DI3_ipd(7),
          TestSignalName          => "DI55",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI55_CK_posedge_posedge,
          SetupLow                => tsetup_DI55_CK_negedge_posedge,
          HoldHigh                => thold_DI55_CK_negedge_posedge,
          HoldLow                 => thold_DI55_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_3_CK_posedge,
          TimingData              => Tmkr_DI8_3_CK_posedge,
          TestSignal              => DI3_ipd(8),
          TestSignalName          => "DI56",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI56_CK_posedge_posedge,
          SetupLow                => tsetup_DI56_CK_negedge_posedge,
          HoldHigh                => thold_DI56_CK_negedge_posedge,
          HoldLow                 => thold_DI56_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI9_3_CK_posedge,
          TimingData              => Tmkr_DI9_3_CK_posedge,
          TestSignal              => DI3_ipd(9),
          TestSignalName          => "DI57",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI57_CK_posedge_posedge,
          SetupLow                => tsetup_DI57_CK_negedge_posedge,
          HoldHigh                => thold_DI57_CK_negedge_posedge,
          HoldLow                 => thold_DI57_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI10_3_CK_posedge,
          TimingData              => Tmkr_DI10_3_CK_posedge,
          TestSignal              => DI3_ipd(10),
          TestSignalName          => "DI58",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI58_CK_posedge_posedge,
          SetupLow                => tsetup_DI58_CK_negedge_posedge,
          HoldHigh                => thold_DI58_CK_negedge_posedge,
          HoldLow                 => thold_DI58_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI11_3_CK_posedge,
          TimingData              => Tmkr_DI11_3_CK_posedge,
          TestSignal              => DI3_ipd(11),
          TestSignalName          => "DI59",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI59_CK_posedge_posedge,
          SetupLow                => tsetup_DI59_CK_negedge_posedge,
          HoldHigh                => thold_DI59_CK_negedge_posedge,
          HoldLow                 => thold_DI59_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI12_3_CK_posedge,
          TimingData              => Tmkr_DI12_3_CK_posedge,
          TestSignal              => DI3_ipd(12),
          TestSignalName          => "DI60",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI60_CK_posedge_posedge,
          SetupLow                => tsetup_DI60_CK_negedge_posedge,
          HoldHigh                => thold_DI60_CK_negedge_posedge,
          HoldLow                 => thold_DI60_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI13_3_CK_posedge,
          TimingData              => Tmkr_DI13_3_CK_posedge,
          TestSignal              => DI3_ipd(13),
          TestSignalName          => "DI61",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI61_CK_posedge_posedge,
          SetupLow                => tsetup_DI61_CK_negedge_posedge,
          HoldHigh                => thold_DI61_CK_negedge_posedge,
          HoldLow                 => thold_DI61_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI14_3_CK_posedge,
          TimingData              => Tmkr_DI14_3_CK_posedge,
          TestSignal              => DI3_ipd(14),
          TestSignalName          => "DI62",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI62_CK_posedge_posedge,
          SetupLow                => tsetup_DI62_CK_negedge_posedge,
          HoldHigh                => thold_DI62_CK_negedge_posedge,
          HoldLow                 => thold_DI62_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI15_3_CK_posedge,
          TimingData              => Tmkr_DI15_3_CK_posedge,
          TestSignal              => DI3_ipd(15),
          TestSignalName          => "DI63",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI63_CK_posedge_posedge,
          SetupLow                => tsetup_DI63_CK_negedge_posedge,
          HoldHigh                => thold_DI63_CK_negedge_posedge,
          HoldLow                 => thold_DI63_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_4_CK_posedge,
          TimingData              => Tmkr_DI0_4_CK_posedge,
          TestSignal              => DI4_ipd(0),
          TestSignalName          => "DI64",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI64_CK_posedge_posedge,
          SetupLow                => tsetup_DI64_CK_negedge_posedge,
          HoldHigh                => thold_DI64_CK_negedge_posedge,
          HoldLow                 => thold_DI64_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_4_CK_posedge,
          TimingData              => Tmkr_DI1_4_CK_posedge,
          TestSignal              => DI4_ipd(1),
          TestSignalName          => "DI65",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI65_CK_posedge_posedge,
          SetupLow                => tsetup_DI65_CK_negedge_posedge,
          HoldHigh                => thold_DI65_CK_negedge_posedge,
          HoldLow                 => thold_DI65_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_4_CK_posedge,
          TimingData              => Tmkr_DI2_4_CK_posedge,
          TestSignal              => DI4_ipd(2),
          TestSignalName          => "DI66",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI66_CK_posedge_posedge,
          SetupLow                => tsetup_DI66_CK_negedge_posedge,
          HoldHigh                => thold_DI66_CK_negedge_posedge,
          HoldLow                 => thold_DI66_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_4_CK_posedge,
          TimingData              => Tmkr_DI3_4_CK_posedge,
          TestSignal              => DI4_ipd(3),
          TestSignalName          => "DI67",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI67_CK_posedge_posedge,
          SetupLow                => tsetup_DI67_CK_negedge_posedge,
          HoldHigh                => thold_DI67_CK_negedge_posedge,
          HoldLow                 => thold_DI67_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_4_CK_posedge,
          TimingData              => Tmkr_DI4_4_CK_posedge,
          TestSignal              => DI4_ipd(4),
          TestSignalName          => "DI68",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI68_CK_posedge_posedge,
          SetupLow                => tsetup_DI68_CK_negedge_posedge,
          HoldHigh                => thold_DI68_CK_negedge_posedge,
          HoldLow                 => thold_DI68_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_4_CK_posedge,
          TimingData              => Tmkr_DI5_4_CK_posedge,
          TestSignal              => DI4_ipd(5),
          TestSignalName          => "DI69",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI69_CK_posedge_posedge,
          SetupLow                => tsetup_DI69_CK_negedge_posedge,
          HoldHigh                => thold_DI69_CK_negedge_posedge,
          HoldLow                 => thold_DI69_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_4_CK_posedge,
          TimingData              => Tmkr_DI6_4_CK_posedge,
          TestSignal              => DI4_ipd(6),
          TestSignalName          => "DI70",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI70_CK_posedge_posedge,
          SetupLow                => tsetup_DI70_CK_negedge_posedge,
          HoldHigh                => thold_DI70_CK_negedge_posedge,
          HoldLow                 => thold_DI70_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_4_CK_posedge,
          TimingData              => Tmkr_DI7_4_CK_posedge,
          TestSignal              => DI4_ipd(7),
          TestSignalName          => "DI71",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI71_CK_posedge_posedge,
          SetupLow                => tsetup_DI71_CK_negedge_posedge,
          HoldHigh                => thold_DI71_CK_negedge_posedge,
          HoldLow                 => thold_DI71_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_4_CK_posedge,
          TimingData              => Tmkr_DI8_4_CK_posedge,
          TestSignal              => DI4_ipd(8),
          TestSignalName          => "DI72",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI72_CK_posedge_posedge,
          SetupLow                => tsetup_DI72_CK_negedge_posedge,
          HoldHigh                => thold_DI72_CK_negedge_posedge,
          HoldLow                 => thold_DI72_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI9_4_CK_posedge,
          TimingData              => Tmkr_DI9_4_CK_posedge,
          TestSignal              => DI4_ipd(9),
          TestSignalName          => "DI73",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI73_CK_posedge_posedge,
          SetupLow                => tsetup_DI73_CK_negedge_posedge,
          HoldHigh                => thold_DI73_CK_negedge_posedge,
          HoldLow                 => thold_DI73_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI10_4_CK_posedge,
          TimingData              => Tmkr_DI10_4_CK_posedge,
          TestSignal              => DI4_ipd(10),
          TestSignalName          => "DI74",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI74_CK_posedge_posedge,
          SetupLow                => tsetup_DI74_CK_negedge_posedge,
          HoldHigh                => thold_DI74_CK_negedge_posedge,
          HoldLow                 => thold_DI74_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI11_4_CK_posedge,
          TimingData              => Tmkr_DI11_4_CK_posedge,
          TestSignal              => DI4_ipd(11),
          TestSignalName          => "DI75",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI75_CK_posedge_posedge,
          SetupLow                => tsetup_DI75_CK_negedge_posedge,
          HoldHigh                => thold_DI75_CK_negedge_posedge,
          HoldLow                 => thold_DI75_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI12_4_CK_posedge,
          TimingData              => Tmkr_DI12_4_CK_posedge,
          TestSignal              => DI4_ipd(12),
          TestSignalName          => "DI76",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI76_CK_posedge_posedge,
          SetupLow                => tsetup_DI76_CK_negedge_posedge,
          HoldHigh                => thold_DI76_CK_negedge_posedge,
          HoldLow                 => thold_DI76_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI13_4_CK_posedge,
          TimingData              => Tmkr_DI13_4_CK_posedge,
          TestSignal              => DI4_ipd(13),
          TestSignalName          => "DI77",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI77_CK_posedge_posedge,
          SetupLow                => tsetup_DI77_CK_negedge_posedge,
          HoldHigh                => thold_DI77_CK_negedge_posedge,
          HoldLow                 => thold_DI77_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI14_4_CK_posedge,
          TimingData              => Tmkr_DI14_4_CK_posedge,
          TestSignal              => DI4_ipd(14),
          TestSignalName          => "DI78",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI78_CK_posedge_posedge,
          SetupLow                => tsetup_DI78_CK_negedge_posedge,
          HoldHigh                => thold_DI78_CK_negedge_posedge,
          HoldLow                 => thold_DI78_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI15_4_CK_posedge,
          TimingData              => Tmkr_DI15_4_CK_posedge,
          TestSignal              => DI4_ipd(15),
          TestSignalName          => "DI79",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI79_CK_posedge_posedge,
          SetupLow                => tsetup_DI79_CK_negedge_posedge,
          HoldHigh                => thold_DI79_CK_negedge_posedge,
          HoldLow                 => thold_DI79_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_5_CK_posedge,
          TimingData              => Tmkr_DI0_5_CK_posedge,
          TestSignal              => DI5_ipd(0),
          TestSignalName          => "DI80",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI80_CK_posedge_posedge,
          SetupLow                => tsetup_DI80_CK_negedge_posedge,
          HoldHigh                => thold_DI80_CK_negedge_posedge,
          HoldLow                 => thold_DI80_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_5_CK_posedge,
          TimingData              => Tmkr_DI1_5_CK_posedge,
          TestSignal              => DI5_ipd(1),
          TestSignalName          => "DI81",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI81_CK_posedge_posedge,
          SetupLow                => tsetup_DI81_CK_negedge_posedge,
          HoldHigh                => thold_DI81_CK_negedge_posedge,
          HoldLow                 => thold_DI81_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_5_CK_posedge,
          TimingData              => Tmkr_DI2_5_CK_posedge,
          TestSignal              => DI5_ipd(2),
          TestSignalName          => "DI82",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI82_CK_posedge_posedge,
          SetupLow                => tsetup_DI82_CK_negedge_posedge,
          HoldHigh                => thold_DI82_CK_negedge_posedge,
          HoldLow                 => thold_DI82_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_5_CK_posedge,
          TimingData              => Tmkr_DI3_5_CK_posedge,
          TestSignal              => DI5_ipd(3),
          TestSignalName          => "DI83",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI83_CK_posedge_posedge,
          SetupLow                => tsetup_DI83_CK_negedge_posedge,
          HoldHigh                => thold_DI83_CK_negedge_posedge,
          HoldLow                 => thold_DI83_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_5_CK_posedge,
          TimingData              => Tmkr_DI4_5_CK_posedge,
          TestSignal              => DI5_ipd(4),
          TestSignalName          => "DI84",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI84_CK_posedge_posedge,
          SetupLow                => tsetup_DI84_CK_negedge_posedge,
          HoldHigh                => thold_DI84_CK_negedge_posedge,
          HoldLow                 => thold_DI84_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_5_CK_posedge,
          TimingData              => Tmkr_DI5_5_CK_posedge,
          TestSignal              => DI5_ipd(5),
          TestSignalName          => "DI85",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI85_CK_posedge_posedge,
          SetupLow                => tsetup_DI85_CK_negedge_posedge,
          HoldHigh                => thold_DI85_CK_negedge_posedge,
          HoldLow                 => thold_DI85_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_5_CK_posedge,
          TimingData              => Tmkr_DI6_5_CK_posedge,
          TestSignal              => DI5_ipd(6),
          TestSignalName          => "DI86",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI86_CK_posedge_posedge,
          SetupLow                => tsetup_DI86_CK_negedge_posedge,
          HoldHigh                => thold_DI86_CK_negedge_posedge,
          HoldLow                 => thold_DI86_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_5_CK_posedge,
          TimingData              => Tmkr_DI7_5_CK_posedge,
          TestSignal              => DI5_ipd(7),
          TestSignalName          => "DI87",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI87_CK_posedge_posedge,
          SetupLow                => tsetup_DI87_CK_negedge_posedge,
          HoldHigh                => thold_DI87_CK_negedge_posedge,
          HoldLow                 => thold_DI87_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_5_CK_posedge,
          TimingData              => Tmkr_DI8_5_CK_posedge,
          TestSignal              => DI5_ipd(8),
          TestSignalName          => "DI88",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI88_CK_posedge_posedge,
          SetupLow                => tsetup_DI88_CK_negedge_posedge,
          HoldHigh                => thold_DI88_CK_negedge_posedge,
          HoldLow                 => thold_DI88_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI9_5_CK_posedge,
          TimingData              => Tmkr_DI9_5_CK_posedge,
          TestSignal              => DI5_ipd(9),
          TestSignalName          => "DI89",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI89_CK_posedge_posedge,
          SetupLow                => tsetup_DI89_CK_negedge_posedge,
          HoldHigh                => thold_DI89_CK_negedge_posedge,
          HoldLow                 => thold_DI89_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI10_5_CK_posedge,
          TimingData              => Tmkr_DI10_5_CK_posedge,
          TestSignal              => DI5_ipd(10),
          TestSignalName          => "DI90",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI90_CK_posedge_posedge,
          SetupLow                => tsetup_DI90_CK_negedge_posedge,
          HoldHigh                => thold_DI90_CK_negedge_posedge,
          HoldLow                 => thold_DI90_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI11_5_CK_posedge,
          TimingData              => Tmkr_DI11_5_CK_posedge,
          TestSignal              => DI5_ipd(11),
          TestSignalName          => "DI91",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI91_CK_posedge_posedge,
          SetupLow                => tsetup_DI91_CK_negedge_posedge,
          HoldHigh                => thold_DI91_CK_negedge_posedge,
          HoldLow                 => thold_DI91_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI12_5_CK_posedge,
          TimingData              => Tmkr_DI12_5_CK_posedge,
          TestSignal              => DI5_ipd(12),
          TestSignalName          => "DI92",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI92_CK_posedge_posedge,
          SetupLow                => tsetup_DI92_CK_negedge_posedge,
          HoldHigh                => thold_DI92_CK_negedge_posedge,
          HoldLow                 => thold_DI92_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI13_5_CK_posedge,
          TimingData              => Tmkr_DI13_5_CK_posedge,
          TestSignal              => DI5_ipd(13),
          TestSignalName          => "DI93",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI93_CK_posedge_posedge,
          SetupLow                => tsetup_DI93_CK_negedge_posedge,
          HoldHigh                => thold_DI93_CK_negedge_posedge,
          HoldLow                 => thold_DI93_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI14_5_CK_posedge,
          TimingData              => Tmkr_DI14_5_CK_posedge,
          TestSignal              => DI5_ipd(14),
          TestSignalName          => "DI94",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI94_CK_posedge_posedge,
          SetupLow                => tsetup_DI94_CK_negedge_posedge,
          HoldHigh                => thold_DI94_CK_negedge_posedge,
          HoldLow                 => thold_DI94_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI15_5_CK_posedge,
          TimingData              => Tmkr_DI15_5_CK_posedge,
          TestSignal              => DI5_ipd(15),
          TestSignalName          => "DI95",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI95_CK_posedge_posedge,
          SetupLow                => tsetup_DI95_CK_negedge_posedge,
          HoldHigh                => thold_DI95_CK_negedge_posedge,
          HoldLow                 => thold_DI95_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_6_CK_posedge,
          TimingData              => Tmkr_DI0_6_CK_posedge,
          TestSignal              => DI6_ipd(0),
          TestSignalName          => "DI96",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI96_CK_posedge_posedge,
          SetupLow                => tsetup_DI96_CK_negedge_posedge,
          HoldHigh                => thold_DI96_CK_negedge_posedge,
          HoldLow                 => thold_DI96_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_6_CK_posedge,
          TimingData              => Tmkr_DI1_6_CK_posedge,
          TestSignal              => DI6_ipd(1),
          TestSignalName          => "DI97",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI97_CK_posedge_posedge,
          SetupLow                => tsetup_DI97_CK_negedge_posedge,
          HoldHigh                => thold_DI97_CK_negedge_posedge,
          HoldLow                 => thold_DI97_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_6_CK_posedge,
          TimingData              => Tmkr_DI2_6_CK_posedge,
          TestSignal              => DI6_ipd(2),
          TestSignalName          => "DI98",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI98_CK_posedge_posedge,
          SetupLow                => tsetup_DI98_CK_negedge_posedge,
          HoldHigh                => thold_DI98_CK_negedge_posedge,
          HoldLow                 => thold_DI98_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_6_CK_posedge,
          TimingData              => Tmkr_DI3_6_CK_posedge,
          TestSignal              => DI6_ipd(3),
          TestSignalName          => "DI99",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI99_CK_posedge_posedge,
          SetupLow                => tsetup_DI99_CK_negedge_posedge,
          HoldHigh                => thold_DI99_CK_negedge_posedge,
          HoldLow                 => thold_DI99_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_6_CK_posedge,
          TimingData              => Tmkr_DI4_6_CK_posedge,
          TestSignal              => DI6_ipd(4),
          TestSignalName          => "DI100",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI100_CK_posedge_posedge,
          SetupLow                => tsetup_DI100_CK_negedge_posedge,
          HoldHigh                => thold_DI100_CK_negedge_posedge,
          HoldLow                 => thold_DI100_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_6_CK_posedge,
          TimingData              => Tmkr_DI5_6_CK_posedge,
          TestSignal              => DI6_ipd(5),
          TestSignalName          => "DI101",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI101_CK_posedge_posedge,
          SetupLow                => tsetup_DI101_CK_negedge_posedge,
          HoldHigh                => thold_DI101_CK_negedge_posedge,
          HoldLow                 => thold_DI101_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_6_CK_posedge,
          TimingData              => Tmkr_DI6_6_CK_posedge,
          TestSignal              => DI6_ipd(6),
          TestSignalName          => "DI102",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI102_CK_posedge_posedge,
          SetupLow                => tsetup_DI102_CK_negedge_posedge,
          HoldHigh                => thold_DI102_CK_negedge_posedge,
          HoldLow                 => thold_DI102_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_6_CK_posedge,
          TimingData              => Tmkr_DI7_6_CK_posedge,
          TestSignal              => DI6_ipd(7),
          TestSignalName          => "DI103",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI103_CK_posedge_posedge,
          SetupLow                => tsetup_DI103_CK_negedge_posedge,
          HoldHigh                => thold_DI103_CK_negedge_posedge,
          HoldLow                 => thold_DI103_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_6_CK_posedge,
          TimingData              => Tmkr_DI8_6_CK_posedge,
          TestSignal              => DI6_ipd(8),
          TestSignalName          => "DI104",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI104_CK_posedge_posedge,
          SetupLow                => tsetup_DI104_CK_negedge_posedge,
          HoldHigh                => thold_DI104_CK_negedge_posedge,
          HoldLow                 => thold_DI104_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI9_6_CK_posedge,
          TimingData              => Tmkr_DI9_6_CK_posedge,
          TestSignal              => DI6_ipd(9),
          TestSignalName          => "DI105",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI105_CK_posedge_posedge,
          SetupLow                => tsetup_DI105_CK_negedge_posedge,
          HoldHigh                => thold_DI105_CK_negedge_posedge,
          HoldLow                 => thold_DI105_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI10_6_CK_posedge,
          TimingData              => Tmkr_DI10_6_CK_posedge,
          TestSignal              => DI6_ipd(10),
          TestSignalName          => "DI106",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI106_CK_posedge_posedge,
          SetupLow                => tsetup_DI106_CK_negedge_posedge,
          HoldHigh                => thold_DI106_CK_negedge_posedge,
          HoldLow                 => thold_DI106_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI11_6_CK_posedge,
          TimingData              => Tmkr_DI11_6_CK_posedge,
          TestSignal              => DI6_ipd(11),
          TestSignalName          => "DI107",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI107_CK_posedge_posedge,
          SetupLow                => tsetup_DI107_CK_negedge_posedge,
          HoldHigh                => thold_DI107_CK_negedge_posedge,
          HoldLow                 => thold_DI107_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI12_6_CK_posedge,
          TimingData              => Tmkr_DI12_6_CK_posedge,
          TestSignal              => DI6_ipd(12),
          TestSignalName          => "DI108",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI108_CK_posedge_posedge,
          SetupLow                => tsetup_DI108_CK_negedge_posedge,
          HoldHigh                => thold_DI108_CK_negedge_posedge,
          HoldLow                 => thold_DI108_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI13_6_CK_posedge,
          TimingData              => Tmkr_DI13_6_CK_posedge,
          TestSignal              => DI6_ipd(13),
          TestSignalName          => "DI109",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI109_CK_posedge_posedge,
          SetupLow                => tsetup_DI109_CK_negedge_posedge,
          HoldHigh                => thold_DI109_CK_negedge_posedge,
          HoldLow                 => thold_DI109_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI14_6_CK_posedge,
          TimingData              => Tmkr_DI14_6_CK_posedge,
          TestSignal              => DI6_ipd(14),
          TestSignalName          => "DI110",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI110_CK_posedge_posedge,
          SetupLow                => tsetup_DI110_CK_negedge_posedge,
          HoldHigh                => thold_DI110_CK_negedge_posedge,
          HoldLow                 => thold_DI110_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI15_6_CK_posedge,
          TimingData              => Tmkr_DI15_6_CK_posedge,
          TestSignal              => DI6_ipd(15),
          TestSignalName          => "DI111",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI111_CK_posedge_posedge,
          SetupLow                => tsetup_DI111_CK_negedge_posedge,
          HoldHigh                => thold_DI111_CK_negedge_posedge,
          HoldLow                 => thold_DI111_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_7_CK_posedge,
          TimingData              => Tmkr_DI0_7_CK_posedge,
          TestSignal              => DI7_ipd(0),
          TestSignalName          => "DI112",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI112_CK_posedge_posedge,
          SetupLow                => tsetup_DI112_CK_negedge_posedge,
          HoldHigh                => thold_DI112_CK_negedge_posedge,
          HoldLow                 => thold_DI112_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_7_CK_posedge,
          TimingData              => Tmkr_DI1_7_CK_posedge,
          TestSignal              => DI7_ipd(1),
          TestSignalName          => "DI113",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI113_CK_posedge_posedge,
          SetupLow                => tsetup_DI113_CK_negedge_posedge,
          HoldHigh                => thold_DI113_CK_negedge_posedge,
          HoldLow                 => thold_DI113_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_7_CK_posedge,
          TimingData              => Tmkr_DI2_7_CK_posedge,
          TestSignal              => DI7_ipd(2),
          TestSignalName          => "DI114",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI114_CK_posedge_posedge,
          SetupLow                => tsetup_DI114_CK_negedge_posedge,
          HoldHigh                => thold_DI114_CK_negedge_posedge,
          HoldLow                 => thold_DI114_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_7_CK_posedge,
          TimingData              => Tmkr_DI3_7_CK_posedge,
          TestSignal              => DI7_ipd(3),
          TestSignalName          => "DI115",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI115_CK_posedge_posedge,
          SetupLow                => tsetup_DI115_CK_negedge_posedge,
          HoldHigh                => thold_DI115_CK_negedge_posedge,
          HoldLow                 => thold_DI115_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_7_CK_posedge,
          TimingData              => Tmkr_DI4_7_CK_posedge,
          TestSignal              => DI7_ipd(4),
          TestSignalName          => "DI116",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI116_CK_posedge_posedge,
          SetupLow                => tsetup_DI116_CK_negedge_posedge,
          HoldHigh                => thold_DI116_CK_negedge_posedge,
          HoldLow                 => thold_DI116_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_7_CK_posedge,
          TimingData              => Tmkr_DI5_7_CK_posedge,
          TestSignal              => DI7_ipd(5),
          TestSignalName          => "DI117",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI117_CK_posedge_posedge,
          SetupLow                => tsetup_DI117_CK_negedge_posedge,
          HoldHigh                => thold_DI117_CK_negedge_posedge,
          HoldLow                 => thold_DI117_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_7_CK_posedge,
          TimingData              => Tmkr_DI6_7_CK_posedge,
          TestSignal              => DI7_ipd(6),
          TestSignalName          => "DI118",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI118_CK_posedge_posedge,
          SetupLow                => tsetup_DI118_CK_negedge_posedge,
          HoldHigh                => thold_DI118_CK_negedge_posedge,
          HoldLow                 => thold_DI118_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_7_CK_posedge,
          TimingData              => Tmkr_DI7_7_CK_posedge,
          TestSignal              => DI7_ipd(7),
          TestSignalName          => "DI119",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI119_CK_posedge_posedge,
          SetupLow                => tsetup_DI119_CK_negedge_posedge,
          HoldHigh                => thold_DI119_CK_negedge_posedge,
          HoldLow                 => thold_DI119_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_7_CK_posedge,
          TimingData              => Tmkr_DI8_7_CK_posedge,
          TestSignal              => DI7_ipd(8),
          TestSignalName          => "DI120",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI120_CK_posedge_posedge,
          SetupLow                => tsetup_DI120_CK_negedge_posedge,
          HoldHigh                => thold_DI120_CK_negedge_posedge,
          HoldLow                 => thold_DI120_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI9_7_CK_posedge,
          TimingData              => Tmkr_DI9_7_CK_posedge,
          TestSignal              => DI7_ipd(9),
          TestSignalName          => "DI121",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI121_CK_posedge_posedge,
          SetupLow                => tsetup_DI121_CK_negedge_posedge,
          HoldHigh                => thold_DI121_CK_negedge_posedge,
          HoldLow                 => thold_DI121_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI10_7_CK_posedge,
          TimingData              => Tmkr_DI10_7_CK_posedge,
          TestSignal              => DI7_ipd(10),
          TestSignalName          => "DI122",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI122_CK_posedge_posedge,
          SetupLow                => tsetup_DI122_CK_negedge_posedge,
          HoldHigh                => thold_DI122_CK_negedge_posedge,
          HoldLow                 => thold_DI122_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI11_7_CK_posedge,
          TimingData              => Tmkr_DI11_7_CK_posedge,
          TestSignal              => DI7_ipd(11),
          TestSignalName          => "DI123",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI123_CK_posedge_posedge,
          SetupLow                => tsetup_DI123_CK_negedge_posedge,
          HoldHigh                => thold_DI123_CK_negedge_posedge,
          HoldLow                 => thold_DI123_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI12_7_CK_posedge,
          TimingData              => Tmkr_DI12_7_CK_posedge,
          TestSignal              => DI7_ipd(12),
          TestSignalName          => "DI124",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI124_CK_posedge_posedge,
          SetupLow                => tsetup_DI124_CK_negedge_posedge,
          HoldHigh                => thold_DI124_CK_negedge_posedge,
          HoldLow                 => thold_DI124_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI13_7_CK_posedge,
          TimingData              => Tmkr_DI13_7_CK_posedge,
          TestSignal              => DI7_ipd(13),
          TestSignalName          => "DI125",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI125_CK_posedge_posedge,
          SetupLow                => tsetup_DI125_CK_negedge_posedge,
          HoldHigh                => thold_DI125_CK_negedge_posedge,
          HoldLow                 => thold_DI125_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI14_7_CK_posedge,
          TimingData              => Tmkr_DI14_7_CK_posedge,
          TestSignal              => DI7_ipd(14),
          TestSignalName          => "DI126",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI126_CK_posedge_posedge,
          SetupLow                => tsetup_DI126_CK_negedge_posedge,
          HoldHigh                => thold_DI126_CK_negedge_posedge,
          HoldLow                 => thold_DI126_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI15_7_CK_posedge,
          TimingData              => Tmkr_DI15_7_CK_posedge,
          TestSignal              => DI7_ipd(15),
          TestSignalName          => "DI127",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI127_CK_posedge_posedge,
          SetupLow                => tsetup_DI127_CK_negedge_posedge,
          HoldHigh                => thold_DI127_CK_negedge_posedge,
          HoldLow                 => thold_DI127_CK_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);


         VitalSetupHoldCheck (
          Violation               => Tviol_CSB_CK_posedge,
          TimingData              => Tmkr_CSB_CK_posedge,
          TestSignal              => CSB_ipd,
          TestSignalName          => "CSB",
          TestDelay               => 0 ns,
          RefSignal               => CK_ipd,
          RefSignalName           => "CK",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_CSB_CK_posedge_posedge,
          SetupLow                => tsetup_CSB_CK_negedge_posedge,
          HoldHigh                => thold_CSB_CK_negedge_posedge,
          HoldLow                 => thold_CSB_CK_posedge_posedge,
          CheckEnabled            => NOW /= 0 ns,
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);


         VitalPeriodPulseCheck (
          Violation               => Pviol_CK,
          PeriodData              => Pdata_CK,
          TestSignal              => CK_ipd,
          TestSignalName          => "CK",
          TestDelay               => 0 ns,
          Period                  => tperiod_CK,
          PulseWidthHigh          => tpw_CK_posedge,
          PulseWidthLow           => tpw_CK_negedge,
          CheckEnabled            => 
                           NOW /= 0 ns AND CSB_ipd = '0',
          HeaderMsg               => InstancePath & "/SYKB110_256X16X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
	  
	  
   end if;

   -------------------------
   --  Functionality Section
   -------------------------

       if (CSB_ipd = '1' and CSB_ipd'event) then
          if (SYN_CS = 0) then
             DO0_zd := (OTHERS => 'X');
             DO0_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
             DO1_zd := (OTHERS => 'X');
             DO1_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
             DO2_zd := (OTHERS => 'X');
             DO2_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
             DO3_zd := (OTHERS => 'X');
             DO3_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
             DO4_zd := (OTHERS => 'X');
             DO4_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
             DO5_zd := (OTHERS => 'X');
             DO5_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
             DO6_zd := (OTHERS => 'X');
             DO6_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
             DO7_zd := (OTHERS => 'X');
             DO7_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
          end if;
       end if;

       if (CK_ipd'event) then
         ck_change := LastClkEdge&CK_ipd;
         case ck_change is
            when "01"   =>
					      	    
                if (CS_monitor(CSB_ipd,flag_CSB) = True_flg) then
                   -- Reduce error message --
                   flag_CSB := True_flg;
                else
                   flag_CSB := False_flg;
                end if;

                Latch_A    := A_ipd;
                Latch_CSB   := CSB_ipd;
                Latch_DI0  := DI0_ipd;
                Latch_WEB0 := WEB0_ipd;
                Latch_DI1  := DI1_ipd;
                Latch_WEB1 := WEB1_ipd;
                Latch_DI2  := DI2_ipd;
                Latch_WEB2 := WEB2_ipd;
                Latch_DI3  := DI3_ipd;
                Latch_WEB3 := WEB3_ipd;
                Latch_DI4  := DI4_ipd;
                Latch_WEB4 := WEB4_ipd;
                Latch_DI5  := DI5_ipd;
                Latch_WEB5 := WEB5_ipd;
                Latch_DI6  := DI6_ipd;
                Latch_WEB6 := WEB6_ipd;
                Latch_DI7  := DI7_ipd;
                Latch_WEB7 := WEB7_ipd;

                -- memory_function
                A_i    := Latch_A;
                CSB_i   := Latch_CSB;
                DI0_i  := Latch_DI0;
                WEB0_i := Latch_WEB0;
                DI1_i  := Latch_DI1;
                WEB1_i := Latch_WEB1;
                DI2_i  := Latch_DI2;
                WEB2_i := Latch_WEB2;
                DI3_i  := Latch_DI3;
                WEB3_i := Latch_WEB3;
                DI4_i  := Latch_DI4;
                WEB4_i := Latch_WEB4;
                DI5_i  := Latch_DI5;
                WEB5_i := Latch_WEB5;
                DI6_i  := Latch_DI6;
                WEB6_i := Latch_WEB6;
                DI7_i  := Latch_DI7;
                WEB7_i := Latch_WEB7;



                web0_cs    := WEB0_i&CSB_i;
                case web0_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO0_zd := memoryCore0(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO0_int(0), DO0_zd(0),
                                tpd_CK_DO0_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(1), DO0_zd(1),
                                tpd_CK_DO1_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(2), DO0_zd(2),
                                tpd_CK_DO2_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(3), DO0_zd(3),
                                tpd_CK_DO3_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(4), DO0_zd(4),
                                tpd_CK_DO4_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(5), DO0_zd(5),
                                tpd_CK_DO5_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(6), DO0_zd(6),
                                tpd_CK_DO6_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(7), DO0_zd(7),
                                tpd_CK_DO7_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(8), DO0_zd(8),
                                tpd_CK_DO8_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(9), DO0_zd(9),
                                tpd_CK_DO9_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(10), DO0_zd(10),
                                tpd_CK_DO10_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(11), DO0_zd(11),
                                tpd_CK_DO11_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(12), DO0_zd(12),
                                tpd_CK_DO12_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(13), DO0_zd(13),
                                tpd_CK_DO13_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(14), DO0_zd(14),
                                tpd_CK_DO14_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(15), DO0_zd(15),
                                tpd_CK_DO15_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO0_zd := (OTHERS => 'X');
                           DO0_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore0(to_integer(A_i)) := DI0_i;
                           DO0_zd := memoryCore0(to_integer(A_i));
			   
                             ScheduleOutputDelayTWDX(DO0_int(0), DO0_zd(0),
                                tpd_CK_DO0_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(1), DO0_zd(1),
                                tpd_CK_DO1_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(2), DO0_zd(2),
                                tpd_CK_DO2_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(3), DO0_zd(3),
                                tpd_CK_DO3_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(4), DO0_zd(4),
                                tpd_CK_DO4_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(5), DO0_zd(5),
                                tpd_CK_DO5_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(6), DO0_zd(6),
                                tpd_CK_DO6_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(7), DO0_zd(7),
                                tpd_CK_DO7_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(8), DO0_zd(8),
                                tpd_CK_DO8_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(9), DO0_zd(9),
                                tpd_CK_DO9_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(10), DO0_zd(10),
                                tpd_CK_DO10_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(11), DO0_zd(11),
                                tpd_CK_DO11_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(12), DO0_zd(12),
                                tpd_CK_DO12_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(13), DO0_zd(13),
                                tpd_CK_DO13_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(14), DO0_zd(14),
                                tpd_CK_DO14_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(15), DO0_zd(15),
                                tpd_CK_DO15_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);

	               elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO0_zd := (OTHERS => 'X');
                           DO0_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO0_zd := (OTHERS => 'X');
                           DO0_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore0(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO0_zd := (OTHERS => 'X');
                                DO0_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore0(to_integer(A_i)) := (OTHERS => 'X');
                                   DO0_zd := (OTHERS => 'X');
                                   DO0_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO0_zd := (OTHERS => 'X');
                                    DO0_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO0_zd := (OTHERS => 'X');
                                   DO0_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore0(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web1_cs    := WEB1_i&CSB_i;
                case web1_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO1_zd := memoryCore1(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO1_int(0), DO1_zd(0),
                                tpd_CK_DO16_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(1), DO1_zd(1),
                                tpd_CK_DO17_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(2), DO1_zd(2),
                                tpd_CK_DO18_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(3), DO1_zd(3),
                                tpd_CK_DO19_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(4), DO1_zd(4),
                                tpd_CK_DO20_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(5), DO1_zd(5),
                                tpd_CK_DO21_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(6), DO1_zd(6),
                                tpd_CK_DO22_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(7), DO1_zd(7),
                                tpd_CK_DO23_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(8), DO1_zd(8),
                                tpd_CK_DO24_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(9), DO1_zd(9),
                                tpd_CK_DO25_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(10), DO1_zd(10),
                                tpd_CK_DO26_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(11), DO1_zd(11),
                                tpd_CK_DO27_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(12), DO1_zd(12),
                                tpd_CK_DO28_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(13), DO1_zd(13),
                                tpd_CK_DO29_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(14), DO1_zd(14),
                                tpd_CK_DO30_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(15), DO1_zd(15),
                                tpd_CK_DO31_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO1_zd := (OTHERS => 'X');
                           DO1_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore1(to_integer(A_i)) := DI1_i;
                           DO1_zd := memoryCore1(to_integer(A_i));
			   
                             ScheduleOutputDelayTWDX(DO1_int(0), DO1_zd(0),
                                tpd_CK_DO16_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(1), DO1_zd(1),
                                tpd_CK_DO17_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(2), DO1_zd(2),
                                tpd_CK_DO18_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(3), DO1_zd(3),
                                tpd_CK_DO19_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(4), DO1_zd(4),
                                tpd_CK_DO20_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(5), DO1_zd(5),
                                tpd_CK_DO21_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(6), DO1_zd(6),
                                tpd_CK_DO22_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(7), DO1_zd(7),
                                tpd_CK_DO23_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(8), DO1_zd(8),
                                tpd_CK_DO24_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(9), DO1_zd(9),
                                tpd_CK_DO25_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(10), DO1_zd(10),
                                tpd_CK_DO26_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(11), DO1_zd(11),
                                tpd_CK_DO27_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(12), DO1_zd(12),
                                tpd_CK_DO28_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(13), DO1_zd(13),
                                tpd_CK_DO29_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(14), DO1_zd(14),
                                tpd_CK_DO30_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(15), DO1_zd(15),
                                tpd_CK_DO31_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);

	               elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO1_zd := (OTHERS => 'X');
                           DO1_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO1_zd := (OTHERS => 'X');
                           DO1_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore1(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO1_zd := (OTHERS => 'X');
                                DO1_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore1(to_integer(A_i)) := (OTHERS => 'X');
                                   DO1_zd := (OTHERS => 'X');
                                   DO1_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO1_zd := (OTHERS => 'X');
                                    DO1_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO1_zd := (OTHERS => 'X');
                                   DO1_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore1(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web2_cs    := WEB2_i&CSB_i;
                case web2_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO2_zd := memoryCore2(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO2_int(0), DO2_zd(0),
                                tpd_CK_DO32_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(1), DO2_zd(1),
                                tpd_CK_DO33_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(2), DO2_zd(2),
                                tpd_CK_DO34_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(3), DO2_zd(3),
                                tpd_CK_DO35_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(4), DO2_zd(4),
                                tpd_CK_DO36_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(5), DO2_zd(5),
                                tpd_CK_DO37_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(6), DO2_zd(6),
                                tpd_CK_DO38_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(7), DO2_zd(7),
                                tpd_CK_DO39_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(8), DO2_zd(8),
                                tpd_CK_DO40_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(9), DO2_zd(9),
                                tpd_CK_DO41_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(10), DO2_zd(10),
                                tpd_CK_DO42_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(11), DO2_zd(11),
                                tpd_CK_DO43_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(12), DO2_zd(12),
                                tpd_CK_DO44_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(13), DO2_zd(13),
                                tpd_CK_DO45_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(14), DO2_zd(14),
                                tpd_CK_DO46_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(15), DO2_zd(15),
                                tpd_CK_DO47_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO2_zd := (OTHERS => 'X');
                           DO2_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore2(to_integer(A_i)) := DI2_i;
                           DO2_zd := memoryCore2(to_integer(A_i));
			   
                             ScheduleOutputDelayTWDX(DO2_int(0), DO2_zd(0),
                                tpd_CK_DO32_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(1), DO2_zd(1),
                                tpd_CK_DO33_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(2), DO2_zd(2),
                                tpd_CK_DO34_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(3), DO2_zd(3),
                                tpd_CK_DO35_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(4), DO2_zd(4),
                                tpd_CK_DO36_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(5), DO2_zd(5),
                                tpd_CK_DO37_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(6), DO2_zd(6),
                                tpd_CK_DO38_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(7), DO2_zd(7),
                                tpd_CK_DO39_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(8), DO2_zd(8),
                                tpd_CK_DO40_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(9), DO2_zd(9),
                                tpd_CK_DO41_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(10), DO2_zd(10),
                                tpd_CK_DO42_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(11), DO2_zd(11),
                                tpd_CK_DO43_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(12), DO2_zd(12),
                                tpd_CK_DO44_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(13), DO2_zd(13),
                                tpd_CK_DO45_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(14), DO2_zd(14),
                                tpd_CK_DO46_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(15), DO2_zd(15),
                                tpd_CK_DO47_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);

	               elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO2_zd := (OTHERS => 'X');
                           DO2_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO2_zd := (OTHERS => 'X');
                           DO2_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore2(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO2_zd := (OTHERS => 'X');
                                DO2_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore2(to_integer(A_i)) := (OTHERS => 'X');
                                   DO2_zd := (OTHERS => 'X');
                                   DO2_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO2_zd := (OTHERS => 'X');
                                    DO2_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO2_zd := (OTHERS => 'X');
                                   DO2_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore2(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web3_cs    := WEB3_i&CSB_i;
                case web3_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO3_zd := memoryCore3(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO3_int(0), DO3_zd(0),
                                tpd_CK_DO48_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(1), DO3_zd(1),
                                tpd_CK_DO49_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(2), DO3_zd(2),
                                tpd_CK_DO50_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(3), DO3_zd(3),
                                tpd_CK_DO51_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(4), DO3_zd(4),
                                tpd_CK_DO52_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(5), DO3_zd(5),
                                tpd_CK_DO53_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(6), DO3_zd(6),
                                tpd_CK_DO54_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(7), DO3_zd(7),
                                tpd_CK_DO55_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(8), DO3_zd(8),
                                tpd_CK_DO56_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(9), DO3_zd(9),
                                tpd_CK_DO57_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(10), DO3_zd(10),
                                tpd_CK_DO58_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(11), DO3_zd(11),
                                tpd_CK_DO59_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(12), DO3_zd(12),
                                tpd_CK_DO60_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(13), DO3_zd(13),
                                tpd_CK_DO61_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(14), DO3_zd(14),
                                tpd_CK_DO62_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(15), DO3_zd(15),
                                tpd_CK_DO63_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO3_zd := (OTHERS => 'X');
                           DO3_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore3(to_integer(A_i)) := DI3_i;
                           DO3_zd := memoryCore3(to_integer(A_i));
			   
                             ScheduleOutputDelayTWDX(DO3_int(0), DO3_zd(0),
                                tpd_CK_DO48_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(1), DO3_zd(1),
                                tpd_CK_DO49_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(2), DO3_zd(2),
                                tpd_CK_DO50_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(3), DO3_zd(3),
                                tpd_CK_DO51_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(4), DO3_zd(4),
                                tpd_CK_DO52_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(5), DO3_zd(5),
                                tpd_CK_DO53_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(6), DO3_zd(6),
                                tpd_CK_DO54_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(7), DO3_zd(7),
                                tpd_CK_DO55_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(8), DO3_zd(8),
                                tpd_CK_DO56_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(9), DO3_zd(9),
                                tpd_CK_DO57_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(10), DO3_zd(10),
                                tpd_CK_DO58_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(11), DO3_zd(11),
                                tpd_CK_DO59_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(12), DO3_zd(12),
                                tpd_CK_DO60_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(13), DO3_zd(13),
                                tpd_CK_DO61_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(14), DO3_zd(14),
                                tpd_CK_DO62_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(15), DO3_zd(15),
                                tpd_CK_DO63_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);

	               elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO3_zd := (OTHERS => 'X');
                           DO3_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO3_zd := (OTHERS => 'X');
                           DO3_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore3(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO3_zd := (OTHERS => 'X');
                                DO3_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore3(to_integer(A_i)) := (OTHERS => 'X');
                                   DO3_zd := (OTHERS => 'X');
                                   DO3_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO3_zd := (OTHERS => 'X');
                                    DO3_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO3_zd := (OTHERS => 'X');
                                   DO3_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore3(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web4_cs    := WEB4_i&CSB_i;
                case web4_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO4_zd := memoryCore4(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO4_int(0), DO4_zd(0),
                                tpd_CK_DO64_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(1), DO4_zd(1),
                                tpd_CK_DO65_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(2), DO4_zd(2),
                                tpd_CK_DO66_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(3), DO4_zd(3),
                                tpd_CK_DO67_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(4), DO4_zd(4),
                                tpd_CK_DO68_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(5), DO4_zd(5),
                                tpd_CK_DO69_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(6), DO4_zd(6),
                                tpd_CK_DO70_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(7), DO4_zd(7),
                                tpd_CK_DO71_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(8), DO4_zd(8),
                                tpd_CK_DO72_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(9), DO4_zd(9),
                                tpd_CK_DO73_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(10), DO4_zd(10),
                                tpd_CK_DO74_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(11), DO4_zd(11),
                                tpd_CK_DO75_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(12), DO4_zd(12),
                                tpd_CK_DO76_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(13), DO4_zd(13),
                                tpd_CK_DO77_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(14), DO4_zd(14),
                                tpd_CK_DO78_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(15), DO4_zd(15),
                                tpd_CK_DO79_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO4_zd := (OTHERS => 'X');
                           DO4_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore4(to_integer(A_i)) := DI4_i;
                           DO4_zd := memoryCore4(to_integer(A_i));
			   
                             ScheduleOutputDelayTWDX(DO4_int(0), DO4_zd(0),
                                tpd_CK_DO64_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(1), DO4_zd(1),
                                tpd_CK_DO65_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(2), DO4_zd(2),
                                tpd_CK_DO66_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(3), DO4_zd(3),
                                tpd_CK_DO67_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(4), DO4_zd(4),
                                tpd_CK_DO68_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(5), DO4_zd(5),
                                tpd_CK_DO69_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(6), DO4_zd(6),
                                tpd_CK_DO70_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(7), DO4_zd(7),
                                tpd_CK_DO71_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(8), DO4_zd(8),
                                tpd_CK_DO72_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(9), DO4_zd(9),
                                tpd_CK_DO73_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(10), DO4_zd(10),
                                tpd_CK_DO74_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(11), DO4_zd(11),
                                tpd_CK_DO75_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(12), DO4_zd(12),
                                tpd_CK_DO76_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(13), DO4_zd(13),
                                tpd_CK_DO77_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(14), DO4_zd(14),
                                tpd_CK_DO78_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(15), DO4_zd(15),
                                tpd_CK_DO79_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);

	               elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO4_zd := (OTHERS => 'X');
                           DO4_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO4_zd := (OTHERS => 'X');
                           DO4_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore4(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO4_zd := (OTHERS => 'X');
                                DO4_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore4(to_integer(A_i)) := (OTHERS => 'X');
                                   DO4_zd := (OTHERS => 'X');
                                   DO4_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO4_zd := (OTHERS => 'X');
                                    DO4_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO4_zd := (OTHERS => 'X');
                                   DO4_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore4(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web5_cs    := WEB5_i&CSB_i;
                case web5_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO5_zd := memoryCore5(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO5_int(0), DO5_zd(0),
                                tpd_CK_DO80_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(1), DO5_zd(1),
                                tpd_CK_DO81_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(2), DO5_zd(2),
                                tpd_CK_DO82_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(3), DO5_zd(3),
                                tpd_CK_DO83_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(4), DO5_zd(4),
                                tpd_CK_DO84_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(5), DO5_zd(5),
                                tpd_CK_DO85_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(6), DO5_zd(6),
                                tpd_CK_DO86_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(7), DO5_zd(7),
                                tpd_CK_DO87_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(8), DO5_zd(8),
                                tpd_CK_DO88_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(9), DO5_zd(9),
                                tpd_CK_DO89_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(10), DO5_zd(10),
                                tpd_CK_DO90_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(11), DO5_zd(11),
                                tpd_CK_DO91_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(12), DO5_zd(12),
                                tpd_CK_DO92_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(13), DO5_zd(13),
                                tpd_CK_DO93_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(14), DO5_zd(14),
                                tpd_CK_DO94_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(15), DO5_zd(15),
                                tpd_CK_DO95_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO5_zd := (OTHERS => 'X');
                           DO5_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore5(to_integer(A_i)) := DI5_i;
                           DO5_zd := memoryCore5(to_integer(A_i));
			   
                             ScheduleOutputDelayTWDX(DO5_int(0), DO5_zd(0),
                                tpd_CK_DO80_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(1), DO5_zd(1),
                                tpd_CK_DO81_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(2), DO5_zd(2),
                                tpd_CK_DO82_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(3), DO5_zd(3),
                                tpd_CK_DO83_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(4), DO5_zd(4),
                                tpd_CK_DO84_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(5), DO5_zd(5),
                                tpd_CK_DO85_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(6), DO5_zd(6),
                                tpd_CK_DO86_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(7), DO5_zd(7),
                                tpd_CK_DO87_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(8), DO5_zd(8),
                                tpd_CK_DO88_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(9), DO5_zd(9),
                                tpd_CK_DO89_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(10), DO5_zd(10),
                                tpd_CK_DO90_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(11), DO5_zd(11),
                                tpd_CK_DO91_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(12), DO5_zd(12),
                                tpd_CK_DO92_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(13), DO5_zd(13),
                                tpd_CK_DO93_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(14), DO5_zd(14),
                                tpd_CK_DO94_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(15), DO5_zd(15),
                                tpd_CK_DO95_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);

	               elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO5_zd := (OTHERS => 'X');
                           DO5_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO5_zd := (OTHERS => 'X');
                           DO5_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore5(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO5_zd := (OTHERS => 'X');
                                DO5_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore5(to_integer(A_i)) := (OTHERS => 'X');
                                   DO5_zd := (OTHERS => 'X');
                                   DO5_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO5_zd := (OTHERS => 'X');
                                    DO5_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO5_zd := (OTHERS => 'X');
                                   DO5_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore5(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web6_cs    := WEB6_i&CSB_i;
                case web6_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO6_zd := memoryCore6(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO6_int(0), DO6_zd(0),
                                tpd_CK_DO96_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(1), DO6_zd(1),
                                tpd_CK_DO97_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(2), DO6_zd(2),
                                tpd_CK_DO98_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(3), DO6_zd(3),
                                tpd_CK_DO99_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(4), DO6_zd(4),
                                tpd_CK_DO100_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(5), DO6_zd(5),
                                tpd_CK_DO101_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(6), DO6_zd(6),
                                tpd_CK_DO102_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(7), DO6_zd(7),
                                tpd_CK_DO103_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(8), DO6_zd(8),
                                tpd_CK_DO104_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(9), DO6_zd(9),
                                tpd_CK_DO105_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(10), DO6_zd(10),
                                tpd_CK_DO106_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(11), DO6_zd(11),
                                tpd_CK_DO107_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(12), DO6_zd(12),
                                tpd_CK_DO108_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(13), DO6_zd(13),
                                tpd_CK_DO109_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(14), DO6_zd(14),
                                tpd_CK_DO110_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(15), DO6_zd(15),
                                tpd_CK_DO111_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO6_zd := (OTHERS => 'X');
                           DO6_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore6(to_integer(A_i)) := DI6_i;
                           DO6_zd := memoryCore6(to_integer(A_i));
			   
                             ScheduleOutputDelayTWDX(DO6_int(0), DO6_zd(0),
                                tpd_CK_DO96_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(1), DO6_zd(1),
                                tpd_CK_DO97_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(2), DO6_zd(2),
                                tpd_CK_DO98_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(3), DO6_zd(3),
                                tpd_CK_DO99_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(4), DO6_zd(4),
                                tpd_CK_DO100_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(5), DO6_zd(5),
                                tpd_CK_DO101_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(6), DO6_zd(6),
                                tpd_CK_DO102_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(7), DO6_zd(7),
                                tpd_CK_DO103_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(8), DO6_zd(8),
                                tpd_CK_DO104_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(9), DO6_zd(9),
                                tpd_CK_DO105_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(10), DO6_zd(10),
                                tpd_CK_DO106_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(11), DO6_zd(11),
                                tpd_CK_DO107_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(12), DO6_zd(12),
                                tpd_CK_DO108_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(13), DO6_zd(13),
                                tpd_CK_DO109_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(14), DO6_zd(14),
                                tpd_CK_DO110_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(15), DO6_zd(15),
                                tpd_CK_DO111_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);

	               elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO6_zd := (OTHERS => 'X');
                           DO6_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO6_zd := (OTHERS => 'X');
                           DO6_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore6(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO6_zd := (OTHERS => 'X');
                                DO6_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore6(to_integer(A_i)) := (OTHERS => 'X');
                                   DO6_zd := (OTHERS => 'X');
                                   DO6_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO6_zd := (OTHERS => 'X');
                                    DO6_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO6_zd := (OTHERS => 'X');
                                   DO6_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore6(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web7_cs    := WEB7_i&CSB_i;
                case web7_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO7_zd := memoryCore7(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO7_int(0), DO7_zd(0),
                                tpd_CK_DO112_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(1), DO7_zd(1),
                                tpd_CK_DO113_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(2), DO7_zd(2),
                                tpd_CK_DO114_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(3), DO7_zd(3),
                                tpd_CK_DO115_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(4), DO7_zd(4),
                                tpd_CK_DO116_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(5), DO7_zd(5),
                                tpd_CK_DO117_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(6), DO7_zd(6),
                                tpd_CK_DO118_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(7), DO7_zd(7),
                                tpd_CK_DO119_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(8), DO7_zd(8),
                                tpd_CK_DO120_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(9), DO7_zd(9),
                                tpd_CK_DO121_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(10), DO7_zd(10),
                                tpd_CK_DO122_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(11), DO7_zd(11),
                                tpd_CK_DO123_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(12), DO7_zd(12),
                                tpd_CK_DO124_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(13), DO7_zd(13),
                                tpd_CK_DO125_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(14), DO7_zd(14),
                                tpd_CK_DO126_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(15), DO7_zd(15),
                                tpd_CK_DO127_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO7_zd := (OTHERS => 'X');
                           DO7_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore7(to_integer(A_i)) := DI7_i;
                           DO7_zd := memoryCore7(to_integer(A_i));
			   
                             ScheduleOutputDelayTWDX(DO7_int(0), DO7_zd(0),
                                tpd_CK_DO112_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(1), DO7_zd(1),
                                tpd_CK_DO113_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(2), DO7_zd(2),
                                tpd_CK_DO114_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(3), DO7_zd(3),
                                tpd_CK_DO115_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(4), DO7_zd(4),
                                tpd_CK_DO116_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(5), DO7_zd(5),
                                tpd_CK_DO117_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(6), DO7_zd(6),
                                tpd_CK_DO118_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(7), DO7_zd(7),
                                tpd_CK_DO119_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(8), DO7_zd(8),
                                tpd_CK_DO120_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(9), DO7_zd(9),
                                tpd_CK_DO121_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(10), DO7_zd(10),
                                tpd_CK_DO122_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(11), DO7_zd(11),
                                tpd_CK_DO123_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(12), DO7_zd(12),
                                tpd_CK_DO124_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(13), DO7_zd(13),
                                tpd_CK_DO125_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(14), DO7_zd(14),
                                tpd_CK_DO126_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(15), DO7_zd(15),
                                tpd_CK_DO127_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);

	               elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO7_zd := (OTHERS => 'X');
                           DO7_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO7_zd := (OTHERS => 'X');
                           DO7_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore7(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO7_zd := (OTHERS => 'X');
                                DO7_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore7(to_integer(A_i)) := (OTHERS => 'X');
                                   DO7_zd := (OTHERS => 'X');
                                   DO7_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO7_zd := (OTHERS => 'X');
                                    DO7_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO7_zd := (OTHERS => 'X');
                                   DO7_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore7(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;



                -- end memory_function
                last_A := A_ipd;
                last_DI0 := DI0_ipd;
                last_WEB0 := WEB0_ipd;
                last_DI1 := DI1_ipd;
                last_WEB1 := WEB1_ipd;
                last_DI2 := DI2_ipd;
                last_WEB2 := WEB2_ipd;
                last_DI3 := DI3_ipd;
                last_WEB3 := WEB3_ipd;
                last_DI4 := DI4_ipd;
                last_WEB4 := WEB4_ipd;
                last_DI5 := DI5_ipd;
                last_WEB5 := WEB5_ipd;
                last_DI6 := DI6_ipd;
                last_WEB6 := WEB6_ipd;
                last_DI7 := DI7_ipd;
                last_WEB7 := WEB7_ipd;
            when "10"   => -- do nothing
            when others => if (NOW /= 0 ns) then
                              assert FALSE report "** MEM_Error: Abnormal transition occurred." severity WARNING;
                           end if;
                           if (CSB_ipd /= '1') then
                              DO0_zd := (OTHERS => 'X');
                              DO0_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                              if (WEB0_ipd /= '1') then
                                 FOR i IN Words-1 downto 0 LOOP
                                    memoryCore0(i) := (OTHERS => 'X');
                                 END LOOP;
                              end if;
                              DO1_zd := (OTHERS => 'X');
                              DO1_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                              if (WEB1_ipd /= '1') then
                                 FOR i IN Words-1 downto 0 LOOP
                                    memoryCore1(i) := (OTHERS => 'X');
                                 END LOOP;
                              end if;
                              DO2_zd := (OTHERS => 'X');
                              DO2_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                              if (WEB2_ipd /= '1') then
                                 FOR i IN Words-1 downto 0 LOOP
                                    memoryCore2(i) := (OTHERS => 'X');
                                 END LOOP;
                              end if;
                              DO3_zd := (OTHERS => 'X');
                              DO3_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                              if (WEB3_ipd /= '1') then
                                 FOR i IN Words-1 downto 0 LOOP
                                    memoryCore3(i) := (OTHERS => 'X');
                                 END LOOP;
                              end if;
                              DO4_zd := (OTHERS => 'X');
                              DO4_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                              if (WEB4_ipd /= '1') then
                                 FOR i IN Words-1 downto 0 LOOP
                                    memoryCore4(i) := (OTHERS => 'X');
                                 END LOOP;
                              end if;
                              DO5_zd := (OTHERS => 'X');
                              DO5_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                              if (WEB5_ipd /= '1') then
                                 FOR i IN Words-1 downto 0 LOOP
                                    memoryCore5(i) := (OTHERS => 'X');
                                 END LOOP;
                              end if;
                              DO6_zd := (OTHERS => 'X');
                              DO6_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                              if (WEB6_ipd /= '1') then
                                 FOR i IN Words-1 downto 0 LOOP
                                    memoryCore6(i) := (OTHERS => 'X');
                                 END LOOP;
                              end if;
                              DO7_zd := (OTHERS => 'X');
                              DO7_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                              if (WEB7_ipd /= '1') then
                                 FOR i IN Words-1 downto 0 LOOP
                                    memoryCore7(i) := (OTHERS => 'X');
                                 END LOOP;
                              end if;
                           end if;
         end case;

         LastClkEdge := CK_ipd;
       end if;


       if (
           Tviol_A0_CK_posedge     = 'X' or
           Tviol_A1_CK_posedge     = 'X' or
           Tviol_A2_CK_posedge     = 'X' or
           Tviol_A3_CK_posedge     = 'X' or
           Tviol_A4_CK_posedge     = 'X' or
           Tviol_A5_CK_posedge     = 'X' or
           Tviol_A6_CK_posedge     = 'X' or
           Tviol_A7_CK_posedge     = 'X' or
           Tviol_WEB0_CK_posedge  = 'X' or
           Tviol_WEB1_CK_posedge  = 'X' or
           Tviol_WEB2_CK_posedge  = 'X' or
           Tviol_WEB3_CK_posedge  = 'X' or
           Tviol_WEB4_CK_posedge  = 'X' or
           Tviol_WEB5_CK_posedge  = 'X' or
           Tviol_WEB6_CK_posedge  = 'X' or
           Tviol_WEB7_CK_posedge  = 'X' or
           Tviol_DI0_0_CK_posedge   = 'X' or 
           Tviol_DI1_0_CK_posedge   = 'X' or 
           Tviol_DI2_0_CK_posedge   = 'X' or 
           Tviol_DI3_0_CK_posedge   = 'X' or 
           Tviol_DI4_0_CK_posedge   = 'X' or 
           Tviol_DI5_0_CK_posedge   = 'X' or 
           Tviol_DI6_0_CK_posedge   = 'X' or 
           Tviol_DI7_0_CK_posedge   = 'X' or 
           Tviol_DI8_0_CK_posedge   = 'X' or 
           Tviol_DI9_0_CK_posedge   = 'X' or 
           Tviol_DI10_0_CK_posedge   = 'X' or 
           Tviol_DI11_0_CK_posedge   = 'X' or 
           Tviol_DI12_0_CK_posedge   = 'X' or 
           Tviol_DI13_0_CK_posedge   = 'X' or 
           Tviol_DI14_0_CK_posedge   = 'X' or 
           Tviol_DI15_0_CK_posedge   = 'X' or 
           Tviol_DI0_1_CK_posedge   = 'X' or 
           Tviol_DI1_1_CK_posedge   = 'X' or 
           Tviol_DI2_1_CK_posedge   = 'X' or 
           Tviol_DI3_1_CK_posedge   = 'X' or 
           Tviol_DI4_1_CK_posedge   = 'X' or 
           Tviol_DI5_1_CK_posedge   = 'X' or 
           Tviol_DI6_1_CK_posedge   = 'X' or 
           Tviol_DI7_1_CK_posedge   = 'X' or 
           Tviol_DI8_1_CK_posedge   = 'X' or 
           Tviol_DI9_1_CK_posedge   = 'X' or 
           Tviol_DI10_1_CK_posedge   = 'X' or 
           Tviol_DI11_1_CK_posedge   = 'X' or 
           Tviol_DI12_1_CK_posedge   = 'X' or 
           Tviol_DI13_1_CK_posedge   = 'X' or 
           Tviol_DI14_1_CK_posedge   = 'X' or 
           Tviol_DI15_1_CK_posedge   = 'X' or 
           Tviol_DI0_2_CK_posedge   = 'X' or 
           Tviol_DI1_2_CK_posedge   = 'X' or 
           Tviol_DI2_2_CK_posedge   = 'X' or 
           Tviol_DI3_2_CK_posedge   = 'X' or 
           Tviol_DI4_2_CK_posedge   = 'X' or 
           Tviol_DI5_2_CK_posedge   = 'X' or 
           Tviol_DI6_2_CK_posedge   = 'X' or 
           Tviol_DI7_2_CK_posedge   = 'X' or 
           Tviol_DI8_2_CK_posedge   = 'X' or 
           Tviol_DI9_2_CK_posedge   = 'X' or 
           Tviol_DI10_2_CK_posedge   = 'X' or 
           Tviol_DI11_2_CK_posedge   = 'X' or 
           Tviol_DI12_2_CK_posedge   = 'X' or 
           Tviol_DI13_2_CK_posedge   = 'X' or 
           Tviol_DI14_2_CK_posedge   = 'X' or 
           Tviol_DI15_2_CK_posedge   = 'X' or 
           Tviol_DI0_3_CK_posedge   = 'X' or 
           Tviol_DI1_3_CK_posedge   = 'X' or 
           Tviol_DI2_3_CK_posedge   = 'X' or 
           Tviol_DI3_3_CK_posedge   = 'X' or 
           Tviol_DI4_3_CK_posedge   = 'X' or 
           Tviol_DI5_3_CK_posedge   = 'X' or 
           Tviol_DI6_3_CK_posedge   = 'X' or 
           Tviol_DI7_3_CK_posedge   = 'X' or 
           Tviol_DI8_3_CK_posedge   = 'X' or 
           Tviol_DI9_3_CK_posedge   = 'X' or 
           Tviol_DI10_3_CK_posedge   = 'X' or 
           Tviol_DI11_3_CK_posedge   = 'X' or 
           Tviol_DI12_3_CK_posedge   = 'X' or 
           Tviol_DI13_3_CK_posedge   = 'X' or 
           Tviol_DI14_3_CK_posedge   = 'X' or 
           Tviol_DI15_3_CK_posedge   = 'X' or 
           Tviol_DI0_4_CK_posedge   = 'X' or 
           Tviol_DI1_4_CK_posedge   = 'X' or 
           Tviol_DI2_4_CK_posedge   = 'X' or 
           Tviol_DI3_4_CK_posedge   = 'X' or 
           Tviol_DI4_4_CK_posedge   = 'X' or 
           Tviol_DI5_4_CK_posedge   = 'X' or 
           Tviol_DI6_4_CK_posedge   = 'X' or 
           Tviol_DI7_4_CK_posedge   = 'X' or 
           Tviol_DI8_4_CK_posedge   = 'X' or 
           Tviol_DI9_4_CK_posedge   = 'X' or 
           Tviol_DI10_4_CK_posedge   = 'X' or 
           Tviol_DI11_4_CK_posedge   = 'X' or 
           Tviol_DI12_4_CK_posedge   = 'X' or 
           Tviol_DI13_4_CK_posedge   = 'X' or 
           Tviol_DI14_4_CK_posedge   = 'X' or 
           Tviol_DI15_4_CK_posedge   = 'X' or 
           Tviol_DI0_5_CK_posedge   = 'X' or 
           Tviol_DI1_5_CK_posedge   = 'X' or 
           Tviol_DI2_5_CK_posedge   = 'X' or 
           Tviol_DI3_5_CK_posedge   = 'X' or 
           Tviol_DI4_5_CK_posedge   = 'X' or 
           Tviol_DI5_5_CK_posedge   = 'X' or 
           Tviol_DI6_5_CK_posedge   = 'X' or 
           Tviol_DI7_5_CK_posedge   = 'X' or 
           Tviol_DI8_5_CK_posedge   = 'X' or 
           Tviol_DI9_5_CK_posedge   = 'X' or 
           Tviol_DI10_5_CK_posedge   = 'X' or 
           Tviol_DI11_5_CK_posedge   = 'X' or 
           Tviol_DI12_5_CK_posedge   = 'X' or 
           Tviol_DI13_5_CK_posedge   = 'X' or 
           Tviol_DI14_5_CK_posedge   = 'X' or 
           Tviol_DI15_5_CK_posedge   = 'X' or 
           Tviol_DI0_6_CK_posedge   = 'X' or 
           Tviol_DI1_6_CK_posedge   = 'X' or 
           Tviol_DI2_6_CK_posedge   = 'X' or 
           Tviol_DI3_6_CK_posedge   = 'X' or 
           Tviol_DI4_6_CK_posedge   = 'X' or 
           Tviol_DI5_6_CK_posedge   = 'X' or 
           Tviol_DI6_6_CK_posedge   = 'X' or 
           Tviol_DI7_6_CK_posedge   = 'X' or 
           Tviol_DI8_6_CK_posedge   = 'X' or 
           Tviol_DI9_6_CK_posedge   = 'X' or 
           Tviol_DI10_6_CK_posedge   = 'X' or 
           Tviol_DI11_6_CK_posedge   = 'X' or 
           Tviol_DI12_6_CK_posedge   = 'X' or 
           Tviol_DI13_6_CK_posedge   = 'X' or 
           Tviol_DI14_6_CK_posedge   = 'X' or 
           Tviol_DI15_6_CK_posedge   = 'X' or 
           Tviol_DI0_7_CK_posedge   = 'X' or 
           Tviol_DI1_7_CK_posedge   = 'X' or 
           Tviol_DI2_7_CK_posedge   = 'X' or 
           Tviol_DI3_7_CK_posedge   = 'X' or 
           Tviol_DI4_7_CK_posedge   = 'X' or 
           Tviol_DI5_7_CK_posedge   = 'X' or 
           Tviol_DI6_7_CK_posedge   = 'X' or 
           Tviol_DI7_7_CK_posedge   = 'X' or 
           Tviol_DI8_7_CK_posedge   = 'X' or 
           Tviol_DI9_7_CK_posedge   = 'X' or 
           Tviol_DI10_7_CK_posedge   = 'X' or 
           Tviol_DI11_7_CK_posedge   = 'X' or 
           Tviol_DI12_7_CK_posedge   = 'X' or 
           Tviol_DI13_7_CK_posedge   = 'X' or 
           Tviol_DI14_7_CK_posedge   = 'X' or 
           Tviol_DI15_7_CK_posedge   = 'X' or 
           Tviol_CSB_CK_posedge    = 'X' or
           Pviol_CK               = 'X'
          ) then

         if (Pviol_CK = 'X') then
            if (CSB_ipd /= '1') then
               DO0_zd := (OTHERS => 'X');
               DO0_int <= TRANSPORT (OTHERS => 'X');
               if (WEB0_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore0(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               DO1_zd := (OTHERS => 'X');
               DO1_int <= TRANSPORT (OTHERS => 'X');
               if (WEB1_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore1(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               DO2_zd := (OTHERS => 'X');
               DO2_int <= TRANSPORT (OTHERS => 'X');
               if (WEB2_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore2(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               DO3_zd := (OTHERS => 'X');
               DO3_int <= TRANSPORT (OTHERS => 'X');
               if (WEB3_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore3(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               DO4_zd := (OTHERS => 'X');
               DO4_int <= TRANSPORT (OTHERS => 'X');
               if (WEB4_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore4(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               DO5_zd := (OTHERS => 'X');
               DO5_int <= TRANSPORT (OTHERS => 'X');
               if (WEB5_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore5(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               DO6_zd := (OTHERS => 'X');
               DO6_int <= TRANSPORT (OTHERS => 'X');
               if (WEB6_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore6(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               DO7_zd := (OTHERS => 'X');
               DO7_int <= TRANSPORT (OTHERS => 'X');
               if (WEB7_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore7(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
            end if;
         else
              if (Tviol_A0_CK_posedge = 'X') then
                 Latch_A(0) := 'X';
              else
                 Latch_A(0) := Latch_A(0);
              end if;
              if (Tviol_A1_CK_posedge = 'X') then
                 Latch_A(1) := 'X';
              else
                 Latch_A(1) := Latch_A(1);
              end if;
              if (Tviol_A2_CK_posedge = 'X') then
                 Latch_A(2) := 'X';
              else
                 Latch_A(2) := Latch_A(2);
              end if;
              if (Tviol_A3_CK_posedge = 'X') then
                 Latch_A(3) := 'X';
              else
                 Latch_A(3) := Latch_A(3);
              end if;
              if (Tviol_A4_CK_posedge = 'X') then
                 Latch_A(4) := 'X';
              else
                 Latch_A(4) := Latch_A(4);
              end if;
              if (Tviol_A5_CK_posedge = 'X') then
                 Latch_A(5) := 'X';
              else
                 Latch_A(5) := Latch_A(5);
              end if;
              if (Tviol_A6_CK_posedge = 'X') then
                 Latch_A(6) := 'X';
              else
                 Latch_A(6) := Latch_A(6);
              end if;
              if (Tviol_A7_CK_posedge = 'X') then
                 Latch_A(7) := 'X';
              else
                 Latch_A(7) := Latch_A(7);
              end if;

              if (Tviol_DI0_0_CK_posedge = 'X') then
                 Latch_DI0(0) := 'X';
              else
                 Latch_DI0(0) := Latch_DI0(0);
              end if;
              if (Tviol_DI1_0_CK_posedge = 'X') then
                 Latch_DI0(1) := 'X';
              else
                 Latch_DI0(1) := Latch_DI0(1);
              end if;
              if (Tviol_DI2_0_CK_posedge = 'X') then
                 Latch_DI0(2) := 'X';
              else
                 Latch_DI0(2) := Latch_DI0(2);
              end if;
              if (Tviol_DI3_0_CK_posedge = 'X') then
                 Latch_DI0(3) := 'X';
              else
                 Latch_DI0(3) := Latch_DI0(3);
              end if;
              if (Tviol_DI4_0_CK_posedge = 'X') then
                 Latch_DI0(4) := 'X';
              else
                 Latch_DI0(4) := Latch_DI0(4);
              end if;
              if (Tviol_DI5_0_CK_posedge = 'X') then
                 Latch_DI0(5) := 'X';
              else
                 Latch_DI0(5) := Latch_DI0(5);
              end if;
              if (Tviol_DI6_0_CK_posedge = 'X') then
                 Latch_DI0(6) := 'X';
              else
                 Latch_DI0(6) := Latch_DI0(6);
              end if;
              if (Tviol_DI7_0_CK_posedge = 'X') then
                 Latch_DI0(7) := 'X';
              else
                 Latch_DI0(7) := Latch_DI0(7);
              end if;
              if (Tviol_DI8_0_CK_posedge = 'X') then
                 Latch_DI0(8) := 'X';
              else
                 Latch_DI0(8) := Latch_DI0(8);
              end if;
              if (Tviol_DI9_0_CK_posedge = 'X') then
                 Latch_DI0(9) := 'X';
              else
                 Latch_DI0(9) := Latch_DI0(9);
              end if;
              if (Tviol_DI10_0_CK_posedge = 'X') then
                 Latch_DI0(10) := 'X';
              else
                 Latch_DI0(10) := Latch_DI0(10);
              end if;
              if (Tviol_DI11_0_CK_posedge = 'X') then
                 Latch_DI0(11) := 'X';
              else
                 Latch_DI0(11) := Latch_DI0(11);
              end if;
              if (Tviol_DI12_0_CK_posedge = 'X') then
                 Latch_DI0(12) := 'X';
              else
                 Latch_DI0(12) := Latch_DI0(12);
              end if;
              if (Tviol_DI13_0_CK_posedge = 'X') then
                 Latch_DI0(13) := 'X';
              else
                 Latch_DI0(13) := Latch_DI0(13);
              end if;
              if (Tviol_DI14_0_CK_posedge = 'X') then
                 Latch_DI0(14) := 'X';
              else
                 Latch_DI0(14) := Latch_DI0(14);
              end if;
              if (Tviol_DI15_0_CK_posedge = 'X') then
                 Latch_DI0(15) := 'X';
              else
                 Latch_DI0(15) := Latch_DI0(15);
              end if;
              if (Tviol_DI0_1_CK_posedge = 'X') then
                 Latch_DI1(0) := 'X';
              else
                 Latch_DI1(0) := Latch_DI1(0);
              end if;
              if (Tviol_DI1_1_CK_posedge = 'X') then
                 Latch_DI1(1) := 'X';
              else
                 Latch_DI1(1) := Latch_DI1(1);
              end if;
              if (Tviol_DI2_1_CK_posedge = 'X') then
                 Latch_DI1(2) := 'X';
              else
                 Latch_DI1(2) := Latch_DI1(2);
              end if;
              if (Tviol_DI3_1_CK_posedge = 'X') then
                 Latch_DI1(3) := 'X';
              else
                 Latch_DI1(3) := Latch_DI1(3);
              end if;
              if (Tviol_DI4_1_CK_posedge = 'X') then
                 Latch_DI1(4) := 'X';
              else
                 Latch_DI1(4) := Latch_DI1(4);
              end if;
              if (Tviol_DI5_1_CK_posedge = 'X') then
                 Latch_DI1(5) := 'X';
              else
                 Latch_DI1(5) := Latch_DI1(5);
              end if;
              if (Tviol_DI6_1_CK_posedge = 'X') then
                 Latch_DI1(6) := 'X';
              else
                 Latch_DI1(6) := Latch_DI1(6);
              end if;
              if (Tviol_DI7_1_CK_posedge = 'X') then
                 Latch_DI1(7) := 'X';
              else
                 Latch_DI1(7) := Latch_DI1(7);
              end if;
              if (Tviol_DI8_1_CK_posedge = 'X') then
                 Latch_DI1(8) := 'X';
              else
                 Latch_DI1(8) := Latch_DI1(8);
              end if;
              if (Tviol_DI9_1_CK_posedge = 'X') then
                 Latch_DI1(9) := 'X';
              else
                 Latch_DI1(9) := Latch_DI1(9);
              end if;
              if (Tviol_DI10_1_CK_posedge = 'X') then
                 Latch_DI1(10) := 'X';
              else
                 Latch_DI1(10) := Latch_DI1(10);
              end if;
              if (Tviol_DI11_1_CK_posedge = 'X') then
                 Latch_DI1(11) := 'X';
              else
                 Latch_DI1(11) := Latch_DI1(11);
              end if;
              if (Tviol_DI12_1_CK_posedge = 'X') then
                 Latch_DI1(12) := 'X';
              else
                 Latch_DI1(12) := Latch_DI1(12);
              end if;
              if (Tviol_DI13_1_CK_posedge = 'X') then
                 Latch_DI1(13) := 'X';
              else
                 Latch_DI1(13) := Latch_DI1(13);
              end if;
              if (Tviol_DI14_1_CK_posedge = 'X') then
                 Latch_DI1(14) := 'X';
              else
                 Latch_DI1(14) := Latch_DI1(14);
              end if;
              if (Tviol_DI15_1_CK_posedge = 'X') then
                 Latch_DI1(15) := 'X';
              else
                 Latch_DI1(15) := Latch_DI1(15);
              end if;
              if (Tviol_DI0_2_CK_posedge = 'X') then
                 Latch_DI2(0) := 'X';
              else
                 Latch_DI2(0) := Latch_DI2(0);
              end if;
              if (Tviol_DI1_2_CK_posedge = 'X') then
                 Latch_DI2(1) := 'X';
              else
                 Latch_DI2(1) := Latch_DI2(1);
              end if;
              if (Tviol_DI2_2_CK_posedge = 'X') then
                 Latch_DI2(2) := 'X';
              else
                 Latch_DI2(2) := Latch_DI2(2);
              end if;
              if (Tviol_DI3_2_CK_posedge = 'X') then
                 Latch_DI2(3) := 'X';
              else
                 Latch_DI2(3) := Latch_DI2(3);
              end if;
              if (Tviol_DI4_2_CK_posedge = 'X') then
                 Latch_DI2(4) := 'X';
              else
                 Latch_DI2(4) := Latch_DI2(4);
              end if;
              if (Tviol_DI5_2_CK_posedge = 'X') then
                 Latch_DI2(5) := 'X';
              else
                 Latch_DI2(5) := Latch_DI2(5);
              end if;
              if (Tviol_DI6_2_CK_posedge = 'X') then
                 Latch_DI2(6) := 'X';
              else
                 Latch_DI2(6) := Latch_DI2(6);
              end if;
              if (Tviol_DI7_2_CK_posedge = 'X') then
                 Latch_DI2(7) := 'X';
              else
                 Latch_DI2(7) := Latch_DI2(7);
              end if;
              if (Tviol_DI8_2_CK_posedge = 'X') then
                 Latch_DI2(8) := 'X';
              else
                 Latch_DI2(8) := Latch_DI2(8);
              end if;
              if (Tviol_DI9_2_CK_posedge = 'X') then
                 Latch_DI2(9) := 'X';
              else
                 Latch_DI2(9) := Latch_DI2(9);
              end if;
              if (Tviol_DI10_2_CK_posedge = 'X') then
                 Latch_DI2(10) := 'X';
              else
                 Latch_DI2(10) := Latch_DI2(10);
              end if;
              if (Tviol_DI11_2_CK_posedge = 'X') then
                 Latch_DI2(11) := 'X';
              else
                 Latch_DI2(11) := Latch_DI2(11);
              end if;
              if (Tviol_DI12_2_CK_posedge = 'X') then
                 Latch_DI2(12) := 'X';
              else
                 Latch_DI2(12) := Latch_DI2(12);
              end if;
              if (Tviol_DI13_2_CK_posedge = 'X') then
                 Latch_DI2(13) := 'X';
              else
                 Latch_DI2(13) := Latch_DI2(13);
              end if;
              if (Tviol_DI14_2_CK_posedge = 'X') then
                 Latch_DI2(14) := 'X';
              else
                 Latch_DI2(14) := Latch_DI2(14);
              end if;
              if (Tviol_DI15_2_CK_posedge = 'X') then
                 Latch_DI2(15) := 'X';
              else
                 Latch_DI2(15) := Latch_DI2(15);
              end if;
              if (Tviol_DI0_3_CK_posedge = 'X') then
                 Latch_DI3(0) := 'X';
              else
                 Latch_DI3(0) := Latch_DI3(0);
              end if;
              if (Tviol_DI1_3_CK_posedge = 'X') then
                 Latch_DI3(1) := 'X';
              else
                 Latch_DI3(1) := Latch_DI3(1);
              end if;
              if (Tviol_DI2_3_CK_posedge = 'X') then
                 Latch_DI3(2) := 'X';
              else
                 Latch_DI3(2) := Latch_DI3(2);
              end if;
              if (Tviol_DI3_3_CK_posedge = 'X') then
                 Latch_DI3(3) := 'X';
              else
                 Latch_DI3(3) := Latch_DI3(3);
              end if;
              if (Tviol_DI4_3_CK_posedge = 'X') then
                 Latch_DI3(4) := 'X';
              else
                 Latch_DI3(4) := Latch_DI3(4);
              end if;
              if (Tviol_DI5_3_CK_posedge = 'X') then
                 Latch_DI3(5) := 'X';
              else
                 Latch_DI3(5) := Latch_DI3(5);
              end if;
              if (Tviol_DI6_3_CK_posedge = 'X') then
                 Latch_DI3(6) := 'X';
              else
                 Latch_DI3(6) := Latch_DI3(6);
              end if;
              if (Tviol_DI7_3_CK_posedge = 'X') then
                 Latch_DI3(7) := 'X';
              else
                 Latch_DI3(7) := Latch_DI3(7);
              end if;
              if (Tviol_DI8_3_CK_posedge = 'X') then
                 Latch_DI3(8) := 'X';
              else
                 Latch_DI3(8) := Latch_DI3(8);
              end if;
              if (Tviol_DI9_3_CK_posedge = 'X') then
                 Latch_DI3(9) := 'X';
              else
                 Latch_DI3(9) := Latch_DI3(9);
              end if;
              if (Tviol_DI10_3_CK_posedge = 'X') then
                 Latch_DI3(10) := 'X';
              else
                 Latch_DI3(10) := Latch_DI3(10);
              end if;
              if (Tviol_DI11_3_CK_posedge = 'X') then
                 Latch_DI3(11) := 'X';
              else
                 Latch_DI3(11) := Latch_DI3(11);
              end if;
              if (Tviol_DI12_3_CK_posedge = 'X') then
                 Latch_DI3(12) := 'X';
              else
                 Latch_DI3(12) := Latch_DI3(12);
              end if;
              if (Tviol_DI13_3_CK_posedge = 'X') then
                 Latch_DI3(13) := 'X';
              else
                 Latch_DI3(13) := Latch_DI3(13);
              end if;
              if (Tviol_DI14_3_CK_posedge = 'X') then
                 Latch_DI3(14) := 'X';
              else
                 Latch_DI3(14) := Latch_DI3(14);
              end if;
              if (Tviol_DI15_3_CK_posedge = 'X') then
                 Latch_DI3(15) := 'X';
              else
                 Latch_DI3(15) := Latch_DI3(15);
              end if;
              if (Tviol_DI0_4_CK_posedge = 'X') then
                 Latch_DI4(0) := 'X';
              else
                 Latch_DI4(0) := Latch_DI4(0);
              end if;
              if (Tviol_DI1_4_CK_posedge = 'X') then
                 Latch_DI4(1) := 'X';
              else
                 Latch_DI4(1) := Latch_DI4(1);
              end if;
              if (Tviol_DI2_4_CK_posedge = 'X') then
                 Latch_DI4(2) := 'X';
              else
                 Latch_DI4(2) := Latch_DI4(2);
              end if;
              if (Tviol_DI3_4_CK_posedge = 'X') then
                 Latch_DI4(3) := 'X';
              else
                 Latch_DI4(3) := Latch_DI4(3);
              end if;
              if (Tviol_DI4_4_CK_posedge = 'X') then
                 Latch_DI4(4) := 'X';
              else
                 Latch_DI4(4) := Latch_DI4(4);
              end if;
              if (Tviol_DI5_4_CK_posedge = 'X') then
                 Latch_DI4(5) := 'X';
              else
                 Latch_DI4(5) := Latch_DI4(5);
              end if;
              if (Tviol_DI6_4_CK_posedge = 'X') then
                 Latch_DI4(6) := 'X';
              else
                 Latch_DI4(6) := Latch_DI4(6);
              end if;
              if (Tviol_DI7_4_CK_posedge = 'X') then
                 Latch_DI4(7) := 'X';
              else
                 Latch_DI4(7) := Latch_DI4(7);
              end if;
              if (Tviol_DI8_4_CK_posedge = 'X') then
                 Latch_DI4(8) := 'X';
              else
                 Latch_DI4(8) := Latch_DI4(8);
              end if;
              if (Tviol_DI9_4_CK_posedge = 'X') then
                 Latch_DI4(9) := 'X';
              else
                 Latch_DI4(9) := Latch_DI4(9);
              end if;
              if (Tviol_DI10_4_CK_posedge = 'X') then
                 Latch_DI4(10) := 'X';
              else
                 Latch_DI4(10) := Latch_DI4(10);
              end if;
              if (Tviol_DI11_4_CK_posedge = 'X') then
                 Latch_DI4(11) := 'X';
              else
                 Latch_DI4(11) := Latch_DI4(11);
              end if;
              if (Tviol_DI12_4_CK_posedge = 'X') then
                 Latch_DI4(12) := 'X';
              else
                 Latch_DI4(12) := Latch_DI4(12);
              end if;
              if (Tviol_DI13_4_CK_posedge = 'X') then
                 Latch_DI4(13) := 'X';
              else
                 Latch_DI4(13) := Latch_DI4(13);
              end if;
              if (Tviol_DI14_4_CK_posedge = 'X') then
                 Latch_DI4(14) := 'X';
              else
                 Latch_DI4(14) := Latch_DI4(14);
              end if;
              if (Tviol_DI15_4_CK_posedge = 'X') then
                 Latch_DI4(15) := 'X';
              else
                 Latch_DI4(15) := Latch_DI4(15);
              end if;
              if (Tviol_DI0_5_CK_posedge = 'X') then
                 Latch_DI5(0) := 'X';
              else
                 Latch_DI5(0) := Latch_DI5(0);
              end if;
              if (Tviol_DI1_5_CK_posedge = 'X') then
                 Latch_DI5(1) := 'X';
              else
                 Latch_DI5(1) := Latch_DI5(1);
              end if;
              if (Tviol_DI2_5_CK_posedge = 'X') then
                 Latch_DI5(2) := 'X';
              else
                 Latch_DI5(2) := Latch_DI5(2);
              end if;
              if (Tviol_DI3_5_CK_posedge = 'X') then
                 Latch_DI5(3) := 'X';
              else
                 Latch_DI5(3) := Latch_DI5(3);
              end if;
              if (Tviol_DI4_5_CK_posedge = 'X') then
                 Latch_DI5(4) := 'X';
              else
                 Latch_DI5(4) := Latch_DI5(4);
              end if;
              if (Tviol_DI5_5_CK_posedge = 'X') then
                 Latch_DI5(5) := 'X';
              else
                 Latch_DI5(5) := Latch_DI5(5);
              end if;
              if (Tviol_DI6_5_CK_posedge = 'X') then
                 Latch_DI5(6) := 'X';
              else
                 Latch_DI5(6) := Latch_DI5(6);
              end if;
              if (Tviol_DI7_5_CK_posedge = 'X') then
                 Latch_DI5(7) := 'X';
              else
                 Latch_DI5(7) := Latch_DI5(7);
              end if;
              if (Tviol_DI8_5_CK_posedge = 'X') then
                 Latch_DI5(8) := 'X';
              else
                 Latch_DI5(8) := Latch_DI5(8);
              end if;
              if (Tviol_DI9_5_CK_posedge = 'X') then
                 Latch_DI5(9) := 'X';
              else
                 Latch_DI5(9) := Latch_DI5(9);
              end if;
              if (Tviol_DI10_5_CK_posedge = 'X') then
                 Latch_DI5(10) := 'X';
              else
                 Latch_DI5(10) := Latch_DI5(10);
              end if;
              if (Tviol_DI11_5_CK_posedge = 'X') then
                 Latch_DI5(11) := 'X';
              else
                 Latch_DI5(11) := Latch_DI5(11);
              end if;
              if (Tviol_DI12_5_CK_posedge = 'X') then
                 Latch_DI5(12) := 'X';
              else
                 Latch_DI5(12) := Latch_DI5(12);
              end if;
              if (Tviol_DI13_5_CK_posedge = 'X') then
                 Latch_DI5(13) := 'X';
              else
                 Latch_DI5(13) := Latch_DI5(13);
              end if;
              if (Tviol_DI14_5_CK_posedge = 'X') then
                 Latch_DI5(14) := 'X';
              else
                 Latch_DI5(14) := Latch_DI5(14);
              end if;
              if (Tviol_DI15_5_CK_posedge = 'X') then
                 Latch_DI5(15) := 'X';
              else
                 Latch_DI5(15) := Latch_DI5(15);
              end if;
              if (Tviol_DI0_6_CK_posedge = 'X') then
                 Latch_DI6(0) := 'X';
              else
                 Latch_DI6(0) := Latch_DI6(0);
              end if;
              if (Tviol_DI1_6_CK_posedge = 'X') then
                 Latch_DI6(1) := 'X';
              else
                 Latch_DI6(1) := Latch_DI6(1);
              end if;
              if (Tviol_DI2_6_CK_posedge = 'X') then
                 Latch_DI6(2) := 'X';
              else
                 Latch_DI6(2) := Latch_DI6(2);
              end if;
              if (Tviol_DI3_6_CK_posedge = 'X') then
                 Latch_DI6(3) := 'X';
              else
                 Latch_DI6(3) := Latch_DI6(3);
              end if;
              if (Tviol_DI4_6_CK_posedge = 'X') then
                 Latch_DI6(4) := 'X';
              else
                 Latch_DI6(4) := Latch_DI6(4);
              end if;
              if (Tviol_DI5_6_CK_posedge = 'X') then
                 Latch_DI6(5) := 'X';
              else
                 Latch_DI6(5) := Latch_DI6(5);
              end if;
              if (Tviol_DI6_6_CK_posedge = 'X') then
                 Latch_DI6(6) := 'X';
              else
                 Latch_DI6(6) := Latch_DI6(6);
              end if;
              if (Tviol_DI7_6_CK_posedge = 'X') then
                 Latch_DI6(7) := 'X';
              else
                 Latch_DI6(7) := Latch_DI6(7);
              end if;
              if (Tviol_DI8_6_CK_posedge = 'X') then
                 Latch_DI6(8) := 'X';
              else
                 Latch_DI6(8) := Latch_DI6(8);
              end if;
              if (Tviol_DI9_6_CK_posedge = 'X') then
                 Latch_DI6(9) := 'X';
              else
                 Latch_DI6(9) := Latch_DI6(9);
              end if;
              if (Tviol_DI10_6_CK_posedge = 'X') then
                 Latch_DI6(10) := 'X';
              else
                 Latch_DI6(10) := Latch_DI6(10);
              end if;
              if (Tviol_DI11_6_CK_posedge = 'X') then
                 Latch_DI6(11) := 'X';
              else
                 Latch_DI6(11) := Latch_DI6(11);
              end if;
              if (Tviol_DI12_6_CK_posedge = 'X') then
                 Latch_DI6(12) := 'X';
              else
                 Latch_DI6(12) := Latch_DI6(12);
              end if;
              if (Tviol_DI13_6_CK_posedge = 'X') then
                 Latch_DI6(13) := 'X';
              else
                 Latch_DI6(13) := Latch_DI6(13);
              end if;
              if (Tviol_DI14_6_CK_posedge = 'X') then
                 Latch_DI6(14) := 'X';
              else
                 Latch_DI6(14) := Latch_DI6(14);
              end if;
              if (Tviol_DI15_6_CK_posedge = 'X') then
                 Latch_DI6(15) := 'X';
              else
                 Latch_DI6(15) := Latch_DI6(15);
              end if;
              if (Tviol_DI0_7_CK_posedge = 'X') then
                 Latch_DI7(0) := 'X';
              else
                 Latch_DI7(0) := Latch_DI7(0);
              end if;
              if (Tviol_DI1_7_CK_posedge = 'X') then
                 Latch_DI7(1) := 'X';
              else
                 Latch_DI7(1) := Latch_DI7(1);
              end if;
              if (Tviol_DI2_7_CK_posedge = 'X') then
                 Latch_DI7(2) := 'X';
              else
                 Latch_DI7(2) := Latch_DI7(2);
              end if;
              if (Tviol_DI3_7_CK_posedge = 'X') then
                 Latch_DI7(3) := 'X';
              else
                 Latch_DI7(3) := Latch_DI7(3);
              end if;
              if (Tviol_DI4_7_CK_posedge = 'X') then
                 Latch_DI7(4) := 'X';
              else
                 Latch_DI7(4) := Latch_DI7(4);
              end if;
              if (Tviol_DI5_7_CK_posedge = 'X') then
                 Latch_DI7(5) := 'X';
              else
                 Latch_DI7(5) := Latch_DI7(5);
              end if;
              if (Tviol_DI6_7_CK_posedge = 'X') then
                 Latch_DI7(6) := 'X';
              else
                 Latch_DI7(6) := Latch_DI7(6);
              end if;
              if (Tviol_DI7_7_CK_posedge = 'X') then
                 Latch_DI7(7) := 'X';
              else
                 Latch_DI7(7) := Latch_DI7(7);
              end if;
              if (Tviol_DI8_7_CK_posedge = 'X') then
                 Latch_DI7(8) := 'X';
              else
                 Latch_DI7(8) := Latch_DI7(8);
              end if;
              if (Tviol_DI9_7_CK_posedge = 'X') then
                 Latch_DI7(9) := 'X';
              else
                 Latch_DI7(9) := Latch_DI7(9);
              end if;
              if (Tviol_DI10_7_CK_posedge = 'X') then
                 Latch_DI7(10) := 'X';
              else
                 Latch_DI7(10) := Latch_DI7(10);
              end if;
              if (Tviol_DI11_7_CK_posedge = 'X') then
                 Latch_DI7(11) := 'X';
              else
                 Latch_DI7(11) := Latch_DI7(11);
              end if;
              if (Tviol_DI12_7_CK_posedge = 'X') then
                 Latch_DI7(12) := 'X';
              else
                 Latch_DI7(12) := Latch_DI7(12);
              end if;
              if (Tviol_DI13_7_CK_posedge = 'X') then
                 Latch_DI7(13) := 'X';
              else
                 Latch_DI7(13) := Latch_DI7(13);
              end if;
              if (Tviol_DI14_7_CK_posedge = 'X') then
                 Latch_DI7(14) := 'X';
              else
                 Latch_DI7(14) := Latch_DI7(14);
              end if;
              if (Tviol_DI15_7_CK_posedge = 'X') then
                 Latch_DI7(15) := 'X';
              else
                 Latch_DI7(15) := Latch_DI7(15);
              end if;


            if (Tviol_WEB0_CK_posedge = 'X') then
               Latch_WEB0 := 'X';
            else
               Latch_WEB0 := Latch_WEB0;
            end if;
            if (Tviol_WEB0_CK_posedge = 'X') then
               Latch_WEB1 := 'X';
            else
               Latch_WEB1 := Latch_WEB1;
            end if;
            if (Tviol_WEB0_CK_posedge = 'X') then
               Latch_WEB2 := 'X';
            else
               Latch_WEB2 := Latch_WEB2;
            end if;
            if (Tviol_WEB0_CK_posedge = 'X') then
               Latch_WEB3 := 'X';
            else
               Latch_WEB3 := Latch_WEB3;
            end if;
            if (Tviol_WEB0_CK_posedge = 'X') then
               Latch_WEB4 := 'X';
            else
               Latch_WEB4 := Latch_WEB4;
            end if;
            if (Tviol_WEB0_CK_posedge = 'X') then
               Latch_WEB5 := 'X';
            else
               Latch_WEB5 := Latch_WEB5;
            end if;
            if (Tviol_WEB0_CK_posedge = 'X') then
               Latch_WEB6 := 'X';
            else
               Latch_WEB6 := Latch_WEB6;
            end if;
            if (Tviol_WEB0_CK_posedge = 'X') then
               Latch_WEB7 := 'X';
            else
               Latch_WEB7 := Latch_WEB7;
            end if;
            if (Tviol_CSB_CK_posedge = 'X') then
               Latch_CSB := 'X';
            else
               Latch_CSB := Latch_CSB;
            end if;

                -- memory_function
                A_i    := Latch_A;
                CSB_i   := Latch_CSB;
                DI0_i  := Latch_DI0;
                WEB0_i := Latch_WEB0;
                DI1_i  := Latch_DI1;
                WEB1_i := Latch_WEB1;
                DI2_i  := Latch_DI2;
                WEB2_i := Latch_WEB2;
                DI3_i  := Latch_DI3;
                WEB3_i := Latch_WEB3;
                DI4_i  := Latch_DI4;
                WEB4_i := Latch_WEB4;
                DI5_i  := Latch_DI5;
                WEB5_i := Latch_WEB5;
                DI6_i  := Latch_DI6;
                WEB6_i := Latch_WEB6;
                DI7_i  := Latch_DI7;
                WEB7_i := Latch_WEB7;



                web0_cs    := WEB0_i&CSB_i;
                case web0_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO0_zd := memoryCore0(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO0_int(0), DO0_zd(0),
                                tpd_CK_DO0_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(1), DO0_zd(1),
                                tpd_CK_DO1_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(2), DO0_zd(2),
                                tpd_CK_DO2_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(3), DO0_zd(3),
                                tpd_CK_DO3_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(4), DO0_zd(4),
                                tpd_CK_DO4_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(5), DO0_zd(5),
                                tpd_CK_DO5_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(6), DO0_zd(6),
                                tpd_CK_DO6_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(7), DO0_zd(7),
                                tpd_CK_DO7_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(8), DO0_zd(8),
                                tpd_CK_DO8_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(9), DO0_zd(9),
                                tpd_CK_DO9_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(10), DO0_zd(10),
                                tpd_CK_DO10_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(11), DO0_zd(11),
                                tpd_CK_DO11_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(12), DO0_zd(12),
                                tpd_CK_DO12_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(13), DO0_zd(13),
                                tpd_CK_DO13_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(14), DO0_zd(14),
                                tpd_CK_DO14_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO0_int(15), DO0_zd(15),
                                tpd_CK_DO15_NODELAY0_EQ_0_AN_read0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO0_zd := (OTHERS => 'X');
                           DO0_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore0(to_integer(A_i)) := DI0_i;
                           DO0_zd := memoryCore0(to_integer(A_i));
	
                             ScheduleOutputDelayTWDX(DO0_int(0), DO0_zd(0),
                                tpd_CK_DO0_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(1), DO0_zd(1),
                                tpd_CK_DO1_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(2), DO0_zd(2),
                                tpd_CK_DO2_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(3), DO0_zd(3),
                                tpd_CK_DO3_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(4), DO0_zd(4),
                                tpd_CK_DO4_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(5), DO0_zd(5),
                                tpd_CK_DO5_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(6), DO0_zd(6),
                                tpd_CK_DO6_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(7), DO0_zd(7),
                                tpd_CK_DO7_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(8), DO0_zd(8),
                                tpd_CK_DO8_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(9), DO0_zd(9),
                                tpd_CK_DO9_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(10), DO0_zd(10),
                                tpd_CK_DO10_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(11), DO0_zd(11),
                                tpd_CK_DO11_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(12), DO0_zd(12),
                                tpd_CK_DO12_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(13), DO0_zd(13),
                                tpd_CK_DO13_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(14), DO0_zd(14),
                                tpd_CK_DO14_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO0_int(15), DO0_zd(15),
                                tpd_CK_DO15_NODELAY0_EQ_0_AN_write0_posedge,
                                last_A,A_i,last_WEB0,WEB0_i,last_DI0,DI0_i,NO_SER_TOH);

                       elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO0_zd := (OTHERS => 'X');
                           DO0_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO0_zd := (OTHERS => 'X');
                           DO0_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore0(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO0_zd := (OTHERS => 'X');
                                DO0_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore0(to_integer(A_i)) := (OTHERS => 'X');
                                   DO0_zd := (OTHERS => 'X');
                                   DO0_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO0_zd := (OTHERS => 'X');
                                    DO0_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO0_zd := (OTHERS => 'X');
                                   DO0_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore0(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web1_cs    := WEB1_i&CSB_i;
                case web1_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO1_zd := memoryCore1(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO1_int(0), DO1_zd(0),
                                tpd_CK_DO16_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(1), DO1_zd(1),
                                tpd_CK_DO17_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(2), DO1_zd(2),
                                tpd_CK_DO18_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(3), DO1_zd(3),
                                tpd_CK_DO19_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(4), DO1_zd(4),
                                tpd_CK_DO20_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(5), DO1_zd(5),
                                tpd_CK_DO21_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(6), DO1_zd(6),
                                tpd_CK_DO22_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(7), DO1_zd(7),
                                tpd_CK_DO23_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(8), DO1_zd(8),
                                tpd_CK_DO24_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(9), DO1_zd(9),
                                tpd_CK_DO25_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(10), DO1_zd(10),
                                tpd_CK_DO26_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(11), DO1_zd(11),
                                tpd_CK_DO27_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(12), DO1_zd(12),
                                tpd_CK_DO28_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(13), DO1_zd(13),
                                tpd_CK_DO29_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(14), DO1_zd(14),
                                tpd_CK_DO30_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(15), DO1_zd(15),
                                tpd_CK_DO31_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO1_zd := (OTHERS => 'X');
                           DO1_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore1(to_integer(A_i)) := DI1_i;
                           DO1_zd := memoryCore1(to_integer(A_i));
	
                             ScheduleOutputDelayTWDX(DO1_int(0), DO1_zd(0),
                                tpd_CK_DO16_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(1), DO1_zd(1),
                                tpd_CK_DO17_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(2), DO1_zd(2),
                                tpd_CK_DO18_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(3), DO1_zd(3),
                                tpd_CK_DO19_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(4), DO1_zd(4),
                                tpd_CK_DO20_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(5), DO1_zd(5),
                                tpd_CK_DO21_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(6), DO1_zd(6),
                                tpd_CK_DO22_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(7), DO1_zd(7),
                                tpd_CK_DO23_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(8), DO1_zd(8),
                                tpd_CK_DO24_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(9), DO1_zd(9),
                                tpd_CK_DO25_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(10), DO1_zd(10),
                                tpd_CK_DO26_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(11), DO1_zd(11),
                                tpd_CK_DO27_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(12), DO1_zd(12),
                                tpd_CK_DO28_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(13), DO1_zd(13),
                                tpd_CK_DO29_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(14), DO1_zd(14),
                                tpd_CK_DO30_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(15), DO1_zd(15),
                                tpd_CK_DO31_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);

                       elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO1_zd := (OTHERS => 'X');
                           DO1_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO1_zd := (OTHERS => 'X');
                           DO1_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore1(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO1_zd := (OTHERS => 'X');
                                DO1_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore1(to_integer(A_i)) := (OTHERS => 'X');
                                   DO1_zd := (OTHERS => 'X');
                                   DO1_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO1_zd := (OTHERS => 'X');
                                    DO1_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO1_zd := (OTHERS => 'X');
                                   DO1_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore1(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web2_cs    := WEB2_i&CSB_i;
                case web2_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO2_zd := memoryCore2(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO2_int(0), DO2_zd(0),
                                tpd_CK_DO32_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(1), DO2_zd(1),
                                tpd_CK_DO33_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(2), DO2_zd(2),
                                tpd_CK_DO34_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(3), DO2_zd(3),
                                tpd_CK_DO35_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(4), DO2_zd(4),
                                tpd_CK_DO36_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(5), DO2_zd(5),
                                tpd_CK_DO37_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(6), DO2_zd(6),
                                tpd_CK_DO38_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(7), DO2_zd(7),
                                tpd_CK_DO39_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(8), DO2_zd(8),
                                tpd_CK_DO40_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(9), DO2_zd(9),
                                tpd_CK_DO41_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(10), DO2_zd(10),
                                tpd_CK_DO42_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(11), DO2_zd(11),
                                tpd_CK_DO43_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(12), DO2_zd(12),
                                tpd_CK_DO44_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(13), DO2_zd(13),
                                tpd_CK_DO45_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(14), DO2_zd(14),
                                tpd_CK_DO46_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(15), DO2_zd(15),
                                tpd_CK_DO47_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO2_zd := (OTHERS => 'X');
                           DO2_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore2(to_integer(A_i)) := DI2_i;
                           DO2_zd := memoryCore2(to_integer(A_i));
	
                             ScheduleOutputDelayTWDX(DO2_int(0), DO2_zd(0),
                                tpd_CK_DO32_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(1), DO2_zd(1),
                                tpd_CK_DO33_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(2), DO2_zd(2),
                                tpd_CK_DO34_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(3), DO2_zd(3),
                                tpd_CK_DO35_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(4), DO2_zd(4),
                                tpd_CK_DO36_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(5), DO2_zd(5),
                                tpd_CK_DO37_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(6), DO2_zd(6),
                                tpd_CK_DO38_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(7), DO2_zd(7),
                                tpd_CK_DO39_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(8), DO2_zd(8),
                                tpd_CK_DO40_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(9), DO2_zd(9),
                                tpd_CK_DO41_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(10), DO2_zd(10),
                                tpd_CK_DO42_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(11), DO2_zd(11),
                                tpd_CK_DO43_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(12), DO2_zd(12),
                                tpd_CK_DO44_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(13), DO2_zd(13),
                                tpd_CK_DO45_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(14), DO2_zd(14),
                                tpd_CK_DO46_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(15), DO2_zd(15),
                                tpd_CK_DO47_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);

                       elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO2_zd := (OTHERS => 'X');
                           DO2_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO2_zd := (OTHERS => 'X');
                           DO2_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore2(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO2_zd := (OTHERS => 'X');
                                DO2_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore2(to_integer(A_i)) := (OTHERS => 'X');
                                   DO2_zd := (OTHERS => 'X');
                                   DO2_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO2_zd := (OTHERS => 'X');
                                    DO2_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO2_zd := (OTHERS => 'X');
                                   DO2_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore2(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web3_cs    := WEB3_i&CSB_i;
                case web3_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO3_zd := memoryCore3(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO3_int(0), DO3_zd(0),
                                tpd_CK_DO48_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(1), DO3_zd(1),
                                tpd_CK_DO49_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(2), DO3_zd(2),
                                tpd_CK_DO50_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(3), DO3_zd(3),
                                tpd_CK_DO51_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(4), DO3_zd(4),
                                tpd_CK_DO52_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(5), DO3_zd(5),
                                tpd_CK_DO53_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(6), DO3_zd(6),
                                tpd_CK_DO54_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(7), DO3_zd(7),
                                tpd_CK_DO55_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(8), DO3_zd(8),
                                tpd_CK_DO56_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(9), DO3_zd(9),
                                tpd_CK_DO57_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(10), DO3_zd(10),
                                tpd_CK_DO58_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(11), DO3_zd(11),
                                tpd_CK_DO59_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(12), DO3_zd(12),
                                tpd_CK_DO60_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(13), DO3_zd(13),
                                tpd_CK_DO61_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(14), DO3_zd(14),
                                tpd_CK_DO62_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(15), DO3_zd(15),
                                tpd_CK_DO63_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO3_zd := (OTHERS => 'X');
                           DO3_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore3(to_integer(A_i)) := DI3_i;
                           DO3_zd := memoryCore3(to_integer(A_i));
	
                             ScheduleOutputDelayTWDX(DO3_int(0), DO3_zd(0),
                                tpd_CK_DO48_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(1), DO3_zd(1),
                                tpd_CK_DO49_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(2), DO3_zd(2),
                                tpd_CK_DO50_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(3), DO3_zd(3),
                                tpd_CK_DO51_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(4), DO3_zd(4),
                                tpd_CK_DO52_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(5), DO3_zd(5),
                                tpd_CK_DO53_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(6), DO3_zd(6),
                                tpd_CK_DO54_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(7), DO3_zd(7),
                                tpd_CK_DO55_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(8), DO3_zd(8),
                                tpd_CK_DO56_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(9), DO3_zd(9),
                                tpd_CK_DO57_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(10), DO3_zd(10),
                                tpd_CK_DO58_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(11), DO3_zd(11),
                                tpd_CK_DO59_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(12), DO3_zd(12),
                                tpd_CK_DO60_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(13), DO3_zd(13),
                                tpd_CK_DO61_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(14), DO3_zd(14),
                                tpd_CK_DO62_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(15), DO3_zd(15),
                                tpd_CK_DO63_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);

                       elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO3_zd := (OTHERS => 'X');
                           DO3_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO3_zd := (OTHERS => 'X');
                           DO3_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore3(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO3_zd := (OTHERS => 'X');
                                DO3_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore3(to_integer(A_i)) := (OTHERS => 'X');
                                   DO3_zd := (OTHERS => 'X');
                                   DO3_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO3_zd := (OTHERS => 'X');
                                    DO3_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO3_zd := (OTHERS => 'X');
                                   DO3_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore3(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web4_cs    := WEB4_i&CSB_i;
                case web4_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO4_zd := memoryCore4(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO4_int(0), DO4_zd(0),
                                tpd_CK_DO64_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(1), DO4_zd(1),
                                tpd_CK_DO65_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(2), DO4_zd(2),
                                tpd_CK_DO66_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(3), DO4_zd(3),
                                tpd_CK_DO67_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(4), DO4_zd(4),
                                tpd_CK_DO68_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(5), DO4_zd(5),
                                tpd_CK_DO69_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(6), DO4_zd(6),
                                tpd_CK_DO70_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(7), DO4_zd(7),
                                tpd_CK_DO71_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(8), DO4_zd(8),
                                tpd_CK_DO72_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(9), DO4_zd(9),
                                tpd_CK_DO73_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(10), DO4_zd(10),
                                tpd_CK_DO74_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(11), DO4_zd(11),
                                tpd_CK_DO75_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(12), DO4_zd(12),
                                tpd_CK_DO76_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(13), DO4_zd(13),
                                tpd_CK_DO77_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(14), DO4_zd(14),
                                tpd_CK_DO78_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO4_int(15), DO4_zd(15),
                                tpd_CK_DO79_NODELAY4_EQ_0_AN_read4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO4_zd := (OTHERS => 'X');
                           DO4_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore4(to_integer(A_i)) := DI4_i;
                           DO4_zd := memoryCore4(to_integer(A_i));
	
                             ScheduleOutputDelayTWDX(DO4_int(0), DO4_zd(0),
                                tpd_CK_DO64_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(1), DO4_zd(1),
                                tpd_CK_DO65_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(2), DO4_zd(2),
                                tpd_CK_DO66_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(3), DO4_zd(3),
                                tpd_CK_DO67_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(4), DO4_zd(4),
                                tpd_CK_DO68_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(5), DO4_zd(5),
                                tpd_CK_DO69_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(6), DO4_zd(6),
                                tpd_CK_DO70_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(7), DO4_zd(7),
                                tpd_CK_DO71_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(8), DO4_zd(8),
                                tpd_CK_DO72_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(9), DO4_zd(9),
                                tpd_CK_DO73_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(10), DO4_zd(10),
                                tpd_CK_DO74_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(11), DO4_zd(11),
                                tpd_CK_DO75_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(12), DO4_zd(12),
                                tpd_CK_DO76_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(13), DO4_zd(13),
                                tpd_CK_DO77_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(14), DO4_zd(14),
                                tpd_CK_DO78_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO4_int(15), DO4_zd(15),
                                tpd_CK_DO79_NODELAY4_EQ_0_AN_write4_posedge,
                                last_A,A_i,last_WEB4,WEB4_i,last_DI4,DI4_i,NO_SER_TOH);

                       elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO4_zd := (OTHERS => 'X');
                           DO4_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO4_zd := (OTHERS => 'X');
                           DO4_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore4(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO4_zd := (OTHERS => 'X');
                                DO4_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore4(to_integer(A_i)) := (OTHERS => 'X');
                                   DO4_zd := (OTHERS => 'X');
                                   DO4_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO4_zd := (OTHERS => 'X');
                                    DO4_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO4_zd := (OTHERS => 'X');
                                   DO4_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore4(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web5_cs    := WEB5_i&CSB_i;
                case web5_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO5_zd := memoryCore5(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO5_int(0), DO5_zd(0),
                                tpd_CK_DO80_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(1), DO5_zd(1),
                                tpd_CK_DO81_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(2), DO5_zd(2),
                                tpd_CK_DO82_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(3), DO5_zd(3),
                                tpd_CK_DO83_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(4), DO5_zd(4),
                                tpd_CK_DO84_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(5), DO5_zd(5),
                                tpd_CK_DO85_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(6), DO5_zd(6),
                                tpd_CK_DO86_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(7), DO5_zd(7),
                                tpd_CK_DO87_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(8), DO5_zd(8),
                                tpd_CK_DO88_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(9), DO5_zd(9),
                                tpd_CK_DO89_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(10), DO5_zd(10),
                                tpd_CK_DO90_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(11), DO5_zd(11),
                                tpd_CK_DO91_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(12), DO5_zd(12),
                                tpd_CK_DO92_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(13), DO5_zd(13),
                                tpd_CK_DO93_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(14), DO5_zd(14),
                                tpd_CK_DO94_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO5_int(15), DO5_zd(15),
                                tpd_CK_DO95_NODELAY5_EQ_0_AN_read5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO5_zd := (OTHERS => 'X');
                           DO5_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore5(to_integer(A_i)) := DI5_i;
                           DO5_zd := memoryCore5(to_integer(A_i));
	
                             ScheduleOutputDelayTWDX(DO5_int(0), DO5_zd(0),
                                tpd_CK_DO80_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(1), DO5_zd(1),
                                tpd_CK_DO81_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(2), DO5_zd(2),
                                tpd_CK_DO82_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(3), DO5_zd(3),
                                tpd_CK_DO83_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(4), DO5_zd(4),
                                tpd_CK_DO84_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(5), DO5_zd(5),
                                tpd_CK_DO85_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(6), DO5_zd(6),
                                tpd_CK_DO86_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(7), DO5_zd(7),
                                tpd_CK_DO87_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(8), DO5_zd(8),
                                tpd_CK_DO88_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(9), DO5_zd(9),
                                tpd_CK_DO89_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(10), DO5_zd(10),
                                tpd_CK_DO90_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(11), DO5_zd(11),
                                tpd_CK_DO91_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(12), DO5_zd(12),
                                tpd_CK_DO92_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(13), DO5_zd(13),
                                tpd_CK_DO93_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(14), DO5_zd(14),
                                tpd_CK_DO94_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO5_int(15), DO5_zd(15),
                                tpd_CK_DO95_NODELAY5_EQ_0_AN_write5_posedge,
                                last_A,A_i,last_WEB5,WEB5_i,last_DI5,DI5_i,NO_SER_TOH);

                       elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO5_zd := (OTHERS => 'X');
                           DO5_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO5_zd := (OTHERS => 'X');
                           DO5_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore5(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO5_zd := (OTHERS => 'X');
                                DO5_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore5(to_integer(A_i)) := (OTHERS => 'X');
                                   DO5_zd := (OTHERS => 'X');
                                   DO5_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO5_zd := (OTHERS => 'X');
                                    DO5_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO5_zd := (OTHERS => 'X');
                                   DO5_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore5(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web6_cs    := WEB6_i&CSB_i;
                case web6_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO6_zd := memoryCore6(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO6_int(0), DO6_zd(0),
                                tpd_CK_DO96_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(1), DO6_zd(1),
                                tpd_CK_DO97_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(2), DO6_zd(2),
                                tpd_CK_DO98_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(3), DO6_zd(3),
                                tpd_CK_DO99_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(4), DO6_zd(4),
                                tpd_CK_DO100_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(5), DO6_zd(5),
                                tpd_CK_DO101_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(6), DO6_zd(6),
                                tpd_CK_DO102_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(7), DO6_zd(7),
                                tpd_CK_DO103_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(8), DO6_zd(8),
                                tpd_CK_DO104_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(9), DO6_zd(9),
                                tpd_CK_DO105_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(10), DO6_zd(10),
                                tpd_CK_DO106_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(11), DO6_zd(11),
                                tpd_CK_DO107_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(12), DO6_zd(12),
                                tpd_CK_DO108_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(13), DO6_zd(13),
                                tpd_CK_DO109_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(14), DO6_zd(14),
                                tpd_CK_DO110_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO6_int(15), DO6_zd(15),
                                tpd_CK_DO111_NODELAY6_EQ_0_AN_read6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO6_zd := (OTHERS => 'X');
                           DO6_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore6(to_integer(A_i)) := DI6_i;
                           DO6_zd := memoryCore6(to_integer(A_i));
	
                             ScheduleOutputDelayTWDX(DO6_int(0), DO6_zd(0),
                                tpd_CK_DO96_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(1), DO6_zd(1),
                                tpd_CK_DO97_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(2), DO6_zd(2),
                                tpd_CK_DO98_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(3), DO6_zd(3),
                                tpd_CK_DO99_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(4), DO6_zd(4),
                                tpd_CK_DO100_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(5), DO6_zd(5),
                                tpd_CK_DO101_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(6), DO6_zd(6),
                                tpd_CK_DO102_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(7), DO6_zd(7),
                                tpd_CK_DO103_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(8), DO6_zd(8),
                                tpd_CK_DO104_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(9), DO6_zd(9),
                                tpd_CK_DO105_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(10), DO6_zd(10),
                                tpd_CK_DO106_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(11), DO6_zd(11),
                                tpd_CK_DO107_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(12), DO6_zd(12),
                                tpd_CK_DO108_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(13), DO6_zd(13),
                                tpd_CK_DO109_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(14), DO6_zd(14),
                                tpd_CK_DO110_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO6_int(15), DO6_zd(15),
                                tpd_CK_DO111_NODELAY6_EQ_0_AN_write6_posedge,
                                last_A,A_i,last_WEB6,WEB6_i,last_DI6,DI6_i,NO_SER_TOH);

                       elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO6_zd := (OTHERS => 'X');
                           DO6_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO6_zd := (OTHERS => 'X');
                           DO6_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore6(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO6_zd := (OTHERS => 'X');
                                DO6_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore6(to_integer(A_i)) := (OTHERS => 'X');
                                   DO6_zd := (OTHERS => 'X');
                                   DO6_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO6_zd := (OTHERS => 'X');
                                    DO6_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO6_zd := (OTHERS => 'X');
                                   DO6_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore6(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;


                web7_cs    := WEB7_i&CSB_i;
                case web7_cs is
                   when "10" => 
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           DO7_zd := memoryCore7(to_integer(A_i));
			   
                             ScheduleOutputDelayTOH(DO7_int(0), DO7_zd(0),
                                tpd_CK_DO112_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(1), DO7_zd(1),
                                tpd_CK_DO113_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(2), DO7_zd(2),
                                tpd_CK_DO114_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(3), DO7_zd(3),
                                tpd_CK_DO115_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(4), DO7_zd(4),
                                tpd_CK_DO116_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(5), DO7_zd(5),
                                tpd_CK_DO117_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(6), DO7_zd(6),
                                tpd_CK_DO118_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(7), DO7_zd(7),
                                tpd_CK_DO119_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(8), DO7_zd(8),
                                tpd_CK_DO120_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(9), DO7_zd(9),
                                tpd_CK_DO121_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(10), DO7_zd(10),
                                tpd_CK_DO122_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(11), DO7_zd(11),
                                tpd_CK_DO123_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(12), DO7_zd(12),
                                tpd_CK_DO124_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(13), DO7_zd(13),
                                tpd_CK_DO125_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(14), DO7_zd(14),
                                tpd_CK_DO126_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO7_int(15), DO7_zd(15),
                                tpd_CK_DO127_NODELAY7_EQ_0_AN_read7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,NO_SER_TOH);

                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO7_zd := (OTHERS => 'X');
                           DO7_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when "00" => 
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           -- Reduce error message --
                           flag_A := True_flg;
                           --------------------------
                           memoryCore7(to_integer(A_i)) := DI7_i;
                           DO7_zd := memoryCore7(to_integer(A_i));
	
                             ScheduleOutputDelayTWDX(DO7_int(0), DO7_zd(0),
                                tpd_CK_DO112_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(1), DO7_zd(1),
                                tpd_CK_DO113_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(2), DO7_zd(2),
                                tpd_CK_DO114_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(3), DO7_zd(3),
                                tpd_CK_DO115_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(4), DO7_zd(4),
                                tpd_CK_DO116_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(5), DO7_zd(5),
                                tpd_CK_DO117_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(6), DO7_zd(6),
                                tpd_CK_DO118_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(7), DO7_zd(7),
                                tpd_CK_DO119_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(8), DO7_zd(8),
                                tpd_CK_DO120_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(9), DO7_zd(9),
                                tpd_CK_DO121_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(10), DO7_zd(10),
                                tpd_CK_DO122_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(11), DO7_zd(11),
                                tpd_CK_DO123_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(12), DO7_zd(12),
                                tpd_CK_DO124_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(13), DO7_zd(13),
                                tpd_CK_DO125_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(14), DO7_zd(14),
                                tpd_CK_DO126_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO7_int(15), DO7_zd(15),
                                tpd_CK_DO127_NODELAY7_EQ_0_AN_write7_posedge,
                                last_A,A_i,last_WEB7,WEB7_i,last_DI7,DI7_i,NO_SER_TOH);

                       elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO7_zd := (OTHERS => 'X');
                           DO7_int <= TRANSPORT (OTHERS => 'X');
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO7_zd := (OTHERS => 'X');
                           DO7_int <= TRANSPORT (OTHERS => 'X') AFTER TWDX;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore7(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;

                   when "1X" |
                        "1U" |
                        "1Z" => DO7_zd := (OTHERS => 'X');
                                DO7_int <= TRANSPORT (OTHERS => 'X') AFTER TOH; 
                   when "11" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                                if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                                   -- Reduce error message --
                                   flag_A := True_flg;
                                   --------------------------
                                   memoryCore7(to_integer(A_i)) := (OTHERS => 'X');
                                   DO7_zd := (OTHERS => 'X');
                                   DO7_int <= TRANSPORT (OTHERS => 'X');
                                elsif (AddressRangeCheck(A_i,flag_A) = Range_flg) then
                                    -- Reduce error message --
                                    flag_A := False_flg;
                                    --------------------------
                                    DO7_zd := (OTHERS => 'X');
                                    DO7_int <= TRANSPORT (OTHERS => 'X');
                                else
                                   -- Reduce error message --
                                   flag_A := False_flg;
                                   --------------------------
                                   DO7_zd := (OTHERS => 'X');
                                   DO7_int <= TRANSPORT (OTHERS => 'X');
                                   FOR i IN Words-1 downto 0 LOOP
                                      memoryCore7(i) := (OTHERS => 'X');
                                   END LOOP;
                                end if;
                end case;

                -- end memory_function

         end if;
       end if;

   end PROCESS;


end behavior;


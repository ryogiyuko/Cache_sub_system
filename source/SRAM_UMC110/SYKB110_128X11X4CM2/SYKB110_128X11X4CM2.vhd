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
--        Word               :  128                       
--        Bit                :  11                        
--        Byte               :  4                         
--        Mux                :  2                         
--        Output Loading     :  0.01                      
--        Clock Input Slew   :  0.016                     
--        Data Input Slew    :  0.016                     
--        Ring Type          :  Ringless Model            
--        Ring Width         :  0                         
--        Bus Format         :  0                         
--        Memaker Path       :  /home/mem/Desktop/memlib  
--        GUI Version        :  m20230904                 
--        Date               :  2024/09/07 15:32:14       
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
entity SYKB110_128X11X4CM2 is
   generic(
      SYN_CS:          integer  := 1;
      NO_SER_TOH:      integer  := 1;
      AddressSize:     integer  := 7;
      DVSize:          integer  := 4;
      Bits:            integer  := 11;
      Words:           integer  := 128;
      Bytes:           integer  := 4;
      AspectRatio:     integer  := 2;
      TOH:             time     := 1.813 ns;
      TWDX:            time     := 1.811 ns;

      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;

      tpd_CK_DO0_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO1_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO2_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO3_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO4_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO5_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO6_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO7_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO8_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO9_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO10_NODELAY0_EQ_0_AN_read0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO11_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO12_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO13_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO14_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO15_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO16_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO17_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO18_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO19_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO20_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO21_NODELAY1_EQ_0_AN_read1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO22_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO23_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO24_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO25_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO26_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO27_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO28_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO29_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO30_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO31_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO32_NODELAY2_EQ_0_AN_read2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO33_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO34_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO35_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO36_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO37_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO38_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO39_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO40_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO41_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO42_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO43_NODELAY3_EQ_0_AN_read3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);

      tpd_CK_DO0_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO1_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO2_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO3_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO4_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO5_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO6_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO7_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO8_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO9_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO10_NODELAY0_EQ_0_AN_write0_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO11_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO12_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO13_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO14_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO15_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO16_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO17_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO18_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO19_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO20_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO21_NODELAY1_EQ_0_AN_write1_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO22_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO23_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO24_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO25_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO26_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO27_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO28_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO29_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO30_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO31_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO32_NODELAY2_EQ_0_AN_write2_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO33_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO34_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO35_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO36_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO37_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO38_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO39_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO40_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO41_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO42_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);
      tpd_CK_DO43_NODELAY3_EQ_0_AN_write3_posedge : VitalDelayType01 :=  (2.051 ns, 2.051 ns);

      tsetup_A0_CK_posedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A0_CK_negedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A1_CK_posedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A1_CK_negedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A2_CK_posedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A2_CK_negedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A3_CK_posedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A3_CK_negedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A4_CK_posedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A4_CK_negedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A5_CK_posedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A5_CK_negedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A6_CK_posedge_posedge    :  VitalDelayType := 0.446 ns;
      tsetup_A6_CK_negedge_posedge    :  VitalDelayType := 0.446 ns;
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
      tsetup_DI0_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI0_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI1_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI1_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI2_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI2_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI3_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI3_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI4_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI4_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI5_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI5_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI6_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI6_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI7_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI7_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI8_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI8_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI9_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI9_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI10_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI10_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI11_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI11_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI12_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI12_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI13_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI13_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI14_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI14_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI15_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI15_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI16_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI16_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI17_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI17_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI18_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI18_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI19_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI19_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI20_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI20_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI21_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI21_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI22_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI22_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI23_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI23_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI24_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI24_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI25_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI25_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI26_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI26_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI27_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI27_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI28_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI28_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI29_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI29_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI30_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI30_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI31_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI31_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI32_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI32_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI33_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI33_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI34_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI34_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI35_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI35_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI36_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI36_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI37_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI37_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI38_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI38_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI39_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI39_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI40_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI40_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI41_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI41_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI42_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI42_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI43_CK_posedge_posedge    :  VitalDelayType := 0.279 ns;
      tsetup_DI43_CK_negedge_posedge    :  VitalDelayType := 0.279 ns;
      thold_DI0_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI0_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI1_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI1_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI2_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI2_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI3_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI3_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI4_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI4_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI5_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI5_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI6_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI6_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI7_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI7_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI8_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI8_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI9_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI9_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI10_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI10_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI11_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI11_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI12_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI12_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI13_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI13_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI14_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI14_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI15_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI15_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI16_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI16_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI17_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI17_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI18_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI18_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI19_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI19_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI20_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI20_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI21_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI21_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI22_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI22_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI23_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI23_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI24_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI24_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI25_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI25_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI26_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI26_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI27_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI27_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI28_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI28_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI29_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI29_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI30_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI30_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI31_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI31_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI32_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI32_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI33_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI33_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI34_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI34_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI35_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI35_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI36_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI36_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI37_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI37_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI38_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI38_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI39_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI39_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI40_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI40_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI41_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI41_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI42_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI42_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI43_CK_posedge_posedge     :  VitalDelayType := 0.175 ns;
      thold_DI43_CK_negedge_posedge     :  VitalDelayType := 0.175 ns;


      tsetup_WEB0_CK_posedge_posedge  :  VitalDelayType := 0.312 ns;
      tsetup_WEB0_CK_negedge_posedge  :  VitalDelayType := 0.312 ns;
      thold_WEB0_CK_posedge_posedge   :  VitalDelayType := 0.286 ns;
      thold_WEB0_CK_negedge_posedge   :  VitalDelayType := 0.286 ns;
      tsetup_WEB1_CK_posedge_posedge  :  VitalDelayType := 0.312 ns;
      tsetup_WEB1_CK_negedge_posedge  :  VitalDelayType := 0.312 ns;
      thold_WEB1_CK_posedge_posedge   :  VitalDelayType := 0.286 ns;
      thold_WEB1_CK_negedge_posedge   :  VitalDelayType := 0.286 ns;
      tsetup_WEB2_CK_posedge_posedge  :  VitalDelayType := 0.312 ns;
      tsetup_WEB2_CK_negedge_posedge  :  VitalDelayType := 0.312 ns;
      thold_WEB2_CK_posedge_posedge   :  VitalDelayType := 0.286 ns;
      thold_WEB2_CK_negedge_posedge   :  VitalDelayType := 0.286 ns;
      tsetup_WEB3_CK_posedge_posedge  :  VitalDelayType := 0.312 ns;
      tsetup_WEB3_CK_negedge_posedge  :  VitalDelayType := 0.312 ns;
      thold_WEB3_CK_posedge_posedge   :  VitalDelayType := 0.286 ns;
      thold_WEB3_CK_negedge_posedge   :  VitalDelayType := 0.286 ns;
      tsetup_CSB_CK_posedge_posedge    :  VitalDelayType := 0.633 ns;
      tsetup_CSB_CK_negedge_posedge    :  VitalDelayType := 0.633 ns;
      thold_CSB_CK_posedge_posedge     :  VitalDelayType := 0.236 ns;
      thold_CSB_CK_negedge_posedge     :  VitalDelayType := 0.236 ns;


      
      tperiod_CK                        :  VitalDelayType := 2.783 ns;
      tpw_CK_posedge                 :  VitalDelayType := 0.512 ns;
      tpw_CK_negedge                 :  VitalDelayType := 0.639 ns;
      tipd_A0                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A1                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A2                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A3                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A4                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A5                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A6                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
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
      tipd_WEB0                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB1                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB2                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB3                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
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
      WEB0                       :   IN   std_logic;
      WEB1                       :   IN   std_logic;
      WEB2                       :   IN   std_logic;
      WEB3                       :   IN   std_logic;
      DVSE                          :   IN   std_logic;
      DVS0                       :   IN   std_logic;
      DVS1                       :   IN   std_logic;
      DVS2                       :   IN   std_logic;
      DVS3                       :   IN   std_logic;
      CK                            :   IN   std_logic;
      CSB                           :   IN   std_logic
      );

attribute VITAL_LEVEL0 of SYKB110_128X11X4CM2 : entity is TRUE;

end SYKB110_128X11X4CM2;

-- architecture body --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Primitives.all;
use IEEE.VITAL_Timing.all;

architecture behavior of SYKB110_128X11X4CM2 is
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
   VitalWireDelay (A_ipd(0), A0, tipd_A0);
   VitalWireDelay (A_ipd(1), A1, tipd_A1);
   VitalWireDelay (A_ipd(2), A2, tipd_A2);
   VitalWireDelay (A_ipd(3), A3, tipd_A3);
   VitalWireDelay (A_ipd(4), A4, tipd_A4);
   VitalWireDelay (A_ipd(5), A5, tipd_A5);
   VitalWireDelay (A_ipd(6), A6, tipd_A6);
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
   VitalWireDelay (DI1_ipd(0), DI11, tipd_DI11);
   VitalWireDelay (DI1_ipd(1), DI12, tipd_DI12);
   VitalWireDelay (DI1_ipd(2), DI13, tipd_DI13);
   VitalWireDelay (DI1_ipd(3), DI14, tipd_DI14);
   VitalWireDelay (DI1_ipd(4), DI15, tipd_DI15);
   VitalWireDelay (DI1_ipd(5), DI16, tipd_DI16);
   VitalWireDelay (DI1_ipd(6), DI17, tipd_DI17);
   VitalWireDelay (DI1_ipd(7), DI18, tipd_DI18);
   VitalWireDelay (DI1_ipd(8), DI19, tipd_DI19);
   VitalWireDelay (DI1_ipd(9), DI20, tipd_DI20);
   VitalWireDelay (DI1_ipd(10), DI21, tipd_DI21);
   VitalWireDelay (DI2_ipd(0), DI22, tipd_DI22);
   VitalWireDelay (DI2_ipd(1), DI23, tipd_DI23);
   VitalWireDelay (DI2_ipd(2), DI24, tipd_DI24);
   VitalWireDelay (DI2_ipd(3), DI25, tipd_DI25);
   VitalWireDelay (DI2_ipd(4), DI26, tipd_DI26);
   VitalWireDelay (DI2_ipd(5), DI27, tipd_DI27);
   VitalWireDelay (DI2_ipd(6), DI28, tipd_DI28);
   VitalWireDelay (DI2_ipd(7), DI29, tipd_DI29);
   VitalWireDelay (DI2_ipd(8), DI30, tipd_DI30);
   VitalWireDelay (DI2_ipd(9), DI31, tipd_DI31);
   VitalWireDelay (DI2_ipd(10), DI32, tipd_DI32);
   VitalWireDelay (DI3_ipd(0), DI33, tipd_DI33);
   VitalWireDelay (DI3_ipd(1), DI34, tipd_DI34);
   VitalWireDelay (DI3_ipd(2), DI35, tipd_DI35);
   VitalWireDelay (DI3_ipd(3), DI36, tipd_DI36);
   VitalWireDelay (DI3_ipd(4), DI37, tipd_DI37);
   VitalWireDelay (DI3_ipd(5), DI38, tipd_DI38);
   VitalWireDelay (DI3_ipd(6), DI39, tipd_DI39);
   VitalWireDelay (DI3_ipd(7), DI40, tipd_DI40);
   VitalWireDelay (DI3_ipd(8), DI41, tipd_DI41);
   VitalWireDelay (DI3_ipd(9), DI42, tipd_DI42);
   VitalWireDelay (DI3_ipd(10), DI43, tipd_DI43);

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
   VitalBUF (DO11, DO1_int(0));
   VitalBUF (DO12, DO1_int(1));
   VitalBUF (DO13, DO1_int(2));
   VitalBUF (DO14, DO1_int(3));
   VitalBUF (DO15, DO1_int(4));
   VitalBUF (DO16, DO1_int(5));
   VitalBUF (DO17, DO1_int(6));
   VitalBUF (DO18, DO1_int(7));
   VitalBUF (DO19, DO1_int(8));
   VitalBUF (DO20, DO1_int(9));
   VitalBUF (DO21, DO1_int(10));
   VitalBUF (DO22, DO2_int(0));
   VitalBUF (DO23, DO2_int(1));
   VitalBUF (DO24, DO2_int(2));
   VitalBUF (DO25, DO2_int(3));
   VitalBUF (DO26, DO2_int(4));
   VitalBUF (DO27, DO2_int(5));
   VitalBUF (DO28, DO2_int(6));
   VitalBUF (DO29, DO2_int(7));
   VitalBUF (DO30, DO2_int(8));
   VitalBUF (DO31, DO2_int(9));
   VitalBUF (DO32, DO2_int(10));
   VitalBUF (DO33, DO3_int(0));
   VitalBUF (DO34, DO3_int(1));
   VitalBUF (DO35, DO3_int(2));
   VitalBUF (DO36, DO3_int(3));
   VitalBUF (DO37, DO3_int(4));
   VitalBUF (DO38, DO3_int(5));
   VitalBUF (DO39, DO3_int(6));
   VitalBUF (DO40, DO3_int(7));
   VitalBUF (DO41, DO3_int(8));
   VitalBUF (DO42, DO3_int(9));
   VitalBUF (DO43, DO3_int(10));

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
                            CK_ipd)

   -- timing check results
   VARIABLE Tviol_A0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A3_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A4_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A5_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A6_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB0_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB1_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB2_CK_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB3_CK_posedge  : STD_ULOGIC := '0';
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
   VARIABLE Tmkr_WEB0_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB1_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB2_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB3_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;
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
   VARIABLE Tmkr_CSB_CK_posedge   : VitalTimingDataType := VitalTimingDataInit;



   VARIABLE DO0_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore0  : memoryArray;
   VARIABLE DO1_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore1  : memoryArray;
   VARIABLE DO2_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore2  : memoryArray;
   VARIABLE DO3_zd : std_logic_vector(Bits-1 downto 0) := (others => 'X');
   VARIABLE memoryCore3  : memoryArray;

   VARIABLE ck_change   : std_logic_vector(1 downto 0);
   VARIABLE web0_cs      : std_logic_vector(1 downto 0);
   VARIABLE web1_cs      : std_logic_vector(1 downto 0);
   VARIABLE web2_cs      : std_logic_vector(1 downto 0);
   VARIABLE web3_cs      : std_logic_vector(1 downto 0);

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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_1_CK_posedge,
          TimingData              => Tmkr_DI0_1_CK_posedge,
          TestSignal              => DI1_ipd(0),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_1_CK_posedge,
          TimingData              => Tmkr_DI1_1_CK_posedge,
          TestSignal              => DI1_ipd(1),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_1_CK_posedge,
          TimingData              => Tmkr_DI2_1_CK_posedge,
          TestSignal              => DI1_ipd(2),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_1_CK_posedge,
          TimingData              => Tmkr_DI3_1_CK_posedge,
          TestSignal              => DI1_ipd(3),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_1_CK_posedge,
          TimingData              => Tmkr_DI4_1_CK_posedge,
          TestSignal              => DI1_ipd(4),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_1_CK_posedge,
          TimingData              => Tmkr_DI5_1_CK_posedge,
          TestSignal              => DI1_ipd(5),
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_1_CK_posedge,
          TimingData              => Tmkr_DI6_1_CK_posedge,
          TestSignal              => DI1_ipd(6),
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_1_CK_posedge,
          TimingData              => Tmkr_DI7_1_CK_posedge,
          TestSignal              => DI1_ipd(7),
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_1_CK_posedge,
          TimingData              => Tmkr_DI8_1_CK_posedge,
          TestSignal              => DI1_ipd(8),
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI9_1_CK_posedge,
          TimingData              => Tmkr_DI9_1_CK_posedge,
          TestSignal              => DI1_ipd(9),
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI10_1_CK_posedge,
          TimingData              => Tmkr_DI10_1_CK_posedge,
          TestSignal              => DI1_ipd(10),
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_2_CK_posedge,
          TimingData              => Tmkr_DI0_2_CK_posedge,
          TestSignal              => DI2_ipd(0),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_2_CK_posedge,
          TimingData              => Tmkr_DI1_2_CK_posedge,
          TestSignal              => DI2_ipd(1),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_2_CK_posedge,
          TimingData              => Tmkr_DI2_2_CK_posedge,
          TestSignal              => DI2_ipd(2),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_2_CK_posedge,
          TimingData              => Tmkr_DI3_2_CK_posedge,
          TestSignal              => DI2_ipd(3),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_2_CK_posedge,
          TimingData              => Tmkr_DI4_2_CK_posedge,
          TestSignal              => DI2_ipd(4),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_2_CK_posedge,
          TimingData              => Tmkr_DI5_2_CK_posedge,
          TestSignal              => DI2_ipd(5),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_2_CK_posedge,
          TimingData              => Tmkr_DI6_2_CK_posedge,
          TestSignal              => DI2_ipd(6),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_2_CK_posedge,
          TimingData              => Tmkr_DI7_2_CK_posedge,
          TestSignal              => DI2_ipd(7),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_2_CK_posedge,
          TimingData              => Tmkr_DI8_2_CK_posedge,
          TestSignal              => DI2_ipd(8),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI9_2_CK_posedge,
          TimingData              => Tmkr_DI9_2_CK_posedge,
          TestSignal              => DI2_ipd(9),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI10_2_CK_posedge,
          TimingData              => Tmkr_DI10_2_CK_posedge,
          TestSignal              => DI2_ipd(10),
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_3_CK_posedge,
          TimingData              => Tmkr_DI0_3_CK_posedge,
          TestSignal              => DI3_ipd(0),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_3_CK_posedge,
          TimingData              => Tmkr_DI1_3_CK_posedge,
          TestSignal              => DI3_ipd(1),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_3_CK_posedge,
          TimingData              => Tmkr_DI2_3_CK_posedge,
          TestSignal              => DI3_ipd(2),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_3_CK_posedge,
          TimingData              => Tmkr_DI3_3_CK_posedge,
          TestSignal              => DI3_ipd(3),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_3_CK_posedge,
          TimingData              => Tmkr_DI4_3_CK_posedge,
          TestSignal              => DI3_ipd(4),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_3_CK_posedge,
          TimingData              => Tmkr_DI5_3_CK_posedge,
          TestSignal              => DI3_ipd(5),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_3_CK_posedge,
          TimingData              => Tmkr_DI6_3_CK_posedge,
          TestSignal              => DI3_ipd(6),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_3_CK_posedge,
          TimingData              => Tmkr_DI7_3_CK_posedge,
          TestSignal              => DI3_ipd(7),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_3_CK_posedge,
          TimingData              => Tmkr_DI8_3_CK_posedge,
          TestSignal              => DI3_ipd(8),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI9_3_CK_posedge,
          TimingData              => Tmkr_DI9_3_CK_posedge,
          TestSignal              => DI3_ipd(9),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI10_3_CK_posedge,
          TimingData              => Tmkr_DI10_3_CK_posedge,
          TestSignal              => DI3_ipd(10),
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
                           NOW /= 0 ns AND CSB_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
          HeaderMsg               => InstancePath & "/SYKB110_128X11X4CM2",
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
                                tpd_CK_DO11_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(1), DO1_zd(1),
                                tpd_CK_DO12_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(2), DO1_zd(2),
                                tpd_CK_DO13_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(3), DO1_zd(3),
                                tpd_CK_DO14_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(4), DO1_zd(4),
                                tpd_CK_DO15_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(5), DO1_zd(5),
                                tpd_CK_DO16_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(6), DO1_zd(6),
                                tpd_CK_DO17_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(7), DO1_zd(7),
                                tpd_CK_DO18_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(8), DO1_zd(8),
                                tpd_CK_DO19_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(9), DO1_zd(9),
                                tpd_CK_DO20_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(10), DO1_zd(10),
                                tpd_CK_DO21_NODELAY1_EQ_0_AN_read1_posedge,
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
                                tpd_CK_DO11_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(1), DO1_zd(1),
                                tpd_CK_DO12_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(2), DO1_zd(2),
                                tpd_CK_DO13_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(3), DO1_zd(3),
                                tpd_CK_DO14_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(4), DO1_zd(4),
                                tpd_CK_DO15_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(5), DO1_zd(5),
                                tpd_CK_DO16_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(6), DO1_zd(6),
                                tpd_CK_DO17_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(7), DO1_zd(7),
                                tpd_CK_DO18_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(8), DO1_zd(8),
                                tpd_CK_DO19_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(9), DO1_zd(9),
                                tpd_CK_DO20_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(10), DO1_zd(10),
                                tpd_CK_DO21_NODELAY1_EQ_0_AN_write1_posedge,
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
                                tpd_CK_DO22_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(1), DO2_zd(1),
                                tpd_CK_DO23_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(2), DO2_zd(2),
                                tpd_CK_DO24_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(3), DO2_zd(3),
                                tpd_CK_DO25_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(4), DO2_zd(4),
                                tpd_CK_DO26_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(5), DO2_zd(5),
                                tpd_CK_DO27_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(6), DO2_zd(6),
                                tpd_CK_DO28_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(7), DO2_zd(7),
                                tpd_CK_DO29_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(8), DO2_zd(8),
                                tpd_CK_DO30_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(9), DO2_zd(9),
                                tpd_CK_DO31_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(10), DO2_zd(10),
                                tpd_CK_DO32_NODELAY2_EQ_0_AN_read2_posedge,
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
                                tpd_CK_DO22_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(1), DO2_zd(1),
                                tpd_CK_DO23_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(2), DO2_zd(2),
                                tpd_CK_DO24_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(3), DO2_zd(3),
                                tpd_CK_DO25_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(4), DO2_zd(4),
                                tpd_CK_DO26_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(5), DO2_zd(5),
                                tpd_CK_DO27_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(6), DO2_zd(6),
                                tpd_CK_DO28_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(7), DO2_zd(7),
                                tpd_CK_DO29_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(8), DO2_zd(8),
                                tpd_CK_DO30_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(9), DO2_zd(9),
                                tpd_CK_DO31_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(10), DO2_zd(10),
                                tpd_CK_DO32_NODELAY2_EQ_0_AN_write2_posedge,
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
                                tpd_CK_DO33_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(1), DO3_zd(1),
                                tpd_CK_DO34_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(2), DO3_zd(2),
                                tpd_CK_DO35_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(3), DO3_zd(3),
                                tpd_CK_DO36_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(4), DO3_zd(4),
                                tpd_CK_DO37_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(5), DO3_zd(5),
                                tpd_CK_DO38_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(6), DO3_zd(6),
                                tpd_CK_DO39_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(7), DO3_zd(7),
                                tpd_CK_DO40_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(8), DO3_zd(8),
                                tpd_CK_DO41_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(9), DO3_zd(9),
                                tpd_CK_DO42_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(10), DO3_zd(10),
                                tpd_CK_DO43_NODELAY3_EQ_0_AN_read3_posedge,
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
                                tpd_CK_DO33_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(1), DO3_zd(1),
                                tpd_CK_DO34_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(2), DO3_zd(2),
                                tpd_CK_DO35_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(3), DO3_zd(3),
                                tpd_CK_DO36_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(4), DO3_zd(4),
                                tpd_CK_DO37_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(5), DO3_zd(5),
                                tpd_CK_DO38_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(6), DO3_zd(6),
                                tpd_CK_DO39_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(7), DO3_zd(7),
                                tpd_CK_DO40_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(8), DO3_zd(8),
                                tpd_CK_DO41_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(9), DO3_zd(9),
                                tpd_CK_DO42_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(10), DO3_zd(10),
                                tpd_CK_DO43_NODELAY3_EQ_0_AN_write3_posedge,
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
           Tviol_WEB0_CK_posedge  = 'X' or
           Tviol_WEB1_CK_posedge  = 'X' or
           Tviol_WEB2_CK_posedge  = 'X' or
           Tviol_WEB3_CK_posedge  = 'X' or
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
                                tpd_CK_DO11_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(1), DO1_zd(1),
                                tpd_CK_DO12_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(2), DO1_zd(2),
                                tpd_CK_DO13_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(3), DO1_zd(3),
                                tpd_CK_DO14_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(4), DO1_zd(4),
                                tpd_CK_DO15_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(5), DO1_zd(5),
                                tpd_CK_DO16_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(6), DO1_zd(6),
                                tpd_CK_DO17_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(7), DO1_zd(7),
                                tpd_CK_DO18_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(8), DO1_zd(8),
                                tpd_CK_DO19_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(9), DO1_zd(9),
                                tpd_CK_DO20_NODELAY1_EQ_0_AN_read1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO1_int(10), DO1_zd(10),
                                tpd_CK_DO21_NODELAY1_EQ_0_AN_read1_posedge,
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
                                tpd_CK_DO11_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(1), DO1_zd(1),
                                tpd_CK_DO12_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(2), DO1_zd(2),
                                tpd_CK_DO13_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(3), DO1_zd(3),
                                tpd_CK_DO14_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(4), DO1_zd(4),
                                tpd_CK_DO15_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(5), DO1_zd(5),
                                tpd_CK_DO16_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(6), DO1_zd(6),
                                tpd_CK_DO17_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(7), DO1_zd(7),
                                tpd_CK_DO18_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(8), DO1_zd(8),
                                tpd_CK_DO19_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(9), DO1_zd(9),
                                tpd_CK_DO20_NODELAY1_EQ_0_AN_write1_posedge,
                                last_A,A_i,last_WEB1,WEB1_i,last_DI1,DI1_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO1_int(10), DO1_zd(10),
                                tpd_CK_DO21_NODELAY1_EQ_0_AN_write1_posedge,
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
                                tpd_CK_DO22_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(1), DO2_zd(1),
                                tpd_CK_DO23_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(2), DO2_zd(2),
                                tpd_CK_DO24_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(3), DO2_zd(3),
                                tpd_CK_DO25_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(4), DO2_zd(4),
                                tpd_CK_DO26_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(5), DO2_zd(5),
                                tpd_CK_DO27_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(6), DO2_zd(6),
                                tpd_CK_DO28_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(7), DO2_zd(7),
                                tpd_CK_DO29_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(8), DO2_zd(8),
                                tpd_CK_DO30_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(9), DO2_zd(9),
                                tpd_CK_DO31_NODELAY2_EQ_0_AN_read2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO2_int(10), DO2_zd(10),
                                tpd_CK_DO32_NODELAY2_EQ_0_AN_read2_posedge,
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
                                tpd_CK_DO22_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(1), DO2_zd(1),
                                tpd_CK_DO23_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(2), DO2_zd(2),
                                tpd_CK_DO24_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(3), DO2_zd(3),
                                tpd_CK_DO25_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(4), DO2_zd(4),
                                tpd_CK_DO26_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(5), DO2_zd(5),
                                tpd_CK_DO27_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(6), DO2_zd(6),
                                tpd_CK_DO28_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(7), DO2_zd(7),
                                tpd_CK_DO29_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(8), DO2_zd(8),
                                tpd_CK_DO30_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(9), DO2_zd(9),
                                tpd_CK_DO31_NODELAY2_EQ_0_AN_write2_posedge,
                                last_A,A_i,last_WEB2,WEB2_i,last_DI2,DI2_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO2_int(10), DO2_zd(10),
                                tpd_CK_DO32_NODELAY2_EQ_0_AN_write2_posedge,
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
                                tpd_CK_DO33_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(1), DO3_zd(1),
                                tpd_CK_DO34_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(2), DO3_zd(2),
                                tpd_CK_DO35_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(3), DO3_zd(3),
                                tpd_CK_DO36_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(4), DO3_zd(4),
                                tpd_CK_DO37_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(5), DO3_zd(5),
                                tpd_CK_DO38_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(6), DO3_zd(6),
                                tpd_CK_DO39_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(7), DO3_zd(7),
                                tpd_CK_DO40_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(8), DO3_zd(8),
                                tpd_CK_DO41_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(9), DO3_zd(9),
                                tpd_CK_DO42_NODELAY3_EQ_0_AN_read3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,NO_SER_TOH);
                             ScheduleOutputDelayTOH(DO3_int(10), DO3_zd(10),
                                tpd_CK_DO43_NODELAY3_EQ_0_AN_read3_posedge,
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
                                tpd_CK_DO33_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(1), DO3_zd(1),
                                tpd_CK_DO34_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(2), DO3_zd(2),
                                tpd_CK_DO35_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(3), DO3_zd(3),
                                tpd_CK_DO36_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(4), DO3_zd(4),
                                tpd_CK_DO37_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(5), DO3_zd(5),
                                tpd_CK_DO38_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(6), DO3_zd(6),
                                tpd_CK_DO39_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(7), DO3_zd(7),
                                tpd_CK_DO40_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(8), DO3_zd(8),
                                tpd_CK_DO41_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(9), DO3_zd(9),
                                tpd_CK_DO42_NODELAY3_EQ_0_AN_write3_posedge,
                                last_A,A_i,last_WEB3,WEB3_i,last_DI3,DI3_i,NO_SER_TOH);
                             ScheduleOutputDelayTWDX(DO3_int(10), DO3_zd(10),
                                tpd_CK_DO43_NODELAY3_EQ_0_AN_write3_posedge,
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

                -- end memory_function

         end if;
       end if;

   end PROCESS;


end behavior;


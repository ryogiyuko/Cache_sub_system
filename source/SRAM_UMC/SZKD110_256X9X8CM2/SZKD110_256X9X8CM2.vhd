-- |-----------------------------------------------------------------------|
-- ________________________________________________________________________________________________
-- 
-- 
--             Synchronous Two-Port Register File Compiler
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
--        IP Name            :  FSR0K_D_SZ                
--        IP Version         :  1.7.0                     
--        IP Release Status  :  Active                    
--        Word               :  256                       
--        Bit                :  9                         
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
--        Date               :  2024/09/10 14:56:28       
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
entity SZKD110_256X9X8CM2 is
   generic(
      SYN_CS:      integer  := 1;
      NO_SER_TOH:  integer  := 1;
      AddressSize: integer  := 8;
      Bits:        integer  := 9;
      Words:       integer  := 256;
      Bytes:       integer  := 8;
      AspectRatio: integer  := 2;
      Tr2w:        time     := 2.559 ns;
      Tw2r:        time     := 2.554 ns;
      TOH:         time     := 1.790 ns;

      TimingChecksOn: Boolean := True;
      InstancePath: STRING := "*";
      Xon: Boolean := True;
      MsgOn: Boolean := True;

      tpd_CKA_DO0_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO1_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO2_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO3_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO4_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO5_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO6_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO7_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO8_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO9_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO10_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO11_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO12_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO13_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO14_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO15_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO16_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO17_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO18_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO19_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO20_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO21_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO22_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO23_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO24_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO25_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO26_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO27_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO28_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO29_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO30_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO31_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO32_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO33_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO34_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO35_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO36_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO37_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO38_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO39_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO40_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO41_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO42_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO43_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO44_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO45_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO46_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO47_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO48_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO49_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO50_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO51_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO52_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO53_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO54_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO55_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO56_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO57_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO58_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO59_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO60_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO61_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO62_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO63_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO64_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO65_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO66_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO67_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO68_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO69_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO70_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);
      tpd_CKA_DO71_posedge : VitalDelayType01 :=  (1.870 ns, 1.870 ns);

      tsetup_A0_CKA_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A0_CKA_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A1_CKA_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A1_CKA_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A2_CKA_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A2_CKA_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A3_CKA_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A3_CKA_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A4_CKA_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A4_CKA_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A5_CKA_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A5_CKA_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A6_CKA_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A6_CKA_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A7_CKA_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_A7_CKA_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B0_CKB_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B0_CKB_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B1_CKB_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B1_CKB_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B2_CKB_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B2_CKB_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B3_CKB_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B3_CKB_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B4_CKB_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B4_CKB_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B5_CKB_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B5_CKB_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B6_CKB_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B6_CKB_negedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B7_CKB_posedge_posedge    :  VitalDelayType := 0.467 ns;
      tsetup_B7_CKB_negedge_posedge    :  VitalDelayType := 0.467 ns;
      thold_A0_CKA_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A0_CKA_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A1_CKA_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A1_CKA_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A2_CKA_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A2_CKA_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A3_CKA_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A3_CKA_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A4_CKA_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A4_CKA_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A5_CKA_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A5_CKA_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A6_CKA_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A6_CKA_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A7_CKA_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_A7_CKA_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B0_CKB_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B0_CKB_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B1_CKB_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B1_CKB_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B2_CKB_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B2_CKB_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B3_CKB_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B3_CKB_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B4_CKB_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B4_CKB_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B5_CKB_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B5_CKB_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B6_CKB_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B6_CKB_negedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B7_CKB_posedge_posedge     :  VitalDelayType := 0.222 ns;
      thold_B7_CKB_negedge_posedge     :  VitalDelayType := 0.222 ns;
      tsetup_DI0_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI0_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI1_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI1_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI2_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI2_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI3_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI3_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI4_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI4_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI5_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI5_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI6_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI6_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI7_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI7_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI8_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI8_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI9_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI9_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI10_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI10_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI11_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI11_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI12_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI12_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI13_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI13_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI14_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI14_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI15_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI15_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI16_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI16_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI17_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI17_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI18_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI18_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI19_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI19_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI20_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI20_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI21_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI21_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI22_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI22_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI23_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI23_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI24_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI24_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI25_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI25_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI26_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI26_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI27_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI27_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI28_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI28_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI29_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI29_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI30_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI30_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI31_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI31_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI32_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI32_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI33_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI33_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI34_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI34_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI35_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI35_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI36_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI36_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI37_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI37_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI38_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI38_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI39_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI39_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI40_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI40_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI41_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI41_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI42_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI42_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI43_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI43_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI44_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI44_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI45_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI45_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI46_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI46_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI47_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI47_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI48_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI48_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI49_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI49_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI50_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI50_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI51_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI51_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI52_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI52_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI53_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI53_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI54_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI54_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI55_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI55_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI56_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI56_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI57_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI57_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI58_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI58_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI59_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI59_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI60_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI60_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI61_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI61_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI62_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI62_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI63_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI63_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI64_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI64_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI65_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI65_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI66_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI66_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI67_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI67_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI68_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI68_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI69_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI69_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI70_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI70_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI71_CKB_posedge_posedge    :  VitalDelayType := 0.234 ns;
      tsetup_DI71_CKB_negedge_posedge    :  VitalDelayType := 0.234 ns;
      thold_DI0_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI0_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI1_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI1_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI2_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI2_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI3_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI3_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI4_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI4_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI5_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI5_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI6_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI6_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI7_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI7_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI8_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI8_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI9_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI9_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI10_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI10_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI11_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI11_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI12_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI12_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI13_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI13_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI14_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI14_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI15_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI15_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI16_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI16_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI17_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI17_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI18_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI18_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI19_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI19_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI20_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI20_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI21_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI21_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI22_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI22_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI23_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI23_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI24_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI24_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI25_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI25_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI26_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI26_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI27_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI27_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI28_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI28_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI29_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI29_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI30_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI30_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI31_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI31_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI32_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI32_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI33_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI33_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI34_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI34_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI35_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI35_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI36_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI36_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI37_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI37_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI38_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI38_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI39_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI39_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI40_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI40_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI41_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI41_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI42_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI42_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI43_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI43_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI44_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI44_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI45_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI45_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI46_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI46_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI47_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI47_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI48_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI48_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI49_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI49_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI50_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI50_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI51_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI51_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI52_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI52_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI53_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI53_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI54_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI54_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI55_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI55_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI56_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI56_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI57_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI57_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI58_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI58_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI59_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI59_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI60_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI60_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI61_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI61_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI62_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI62_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI63_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI63_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI64_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI64_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI65_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI65_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI66_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI66_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI67_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI67_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI68_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI68_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI69_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI69_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI70_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI70_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI71_CKB_posedge_posedge     :  VitalDelayType := 0.148 ns;
      thold_DI71_CKB_negedge_posedge     :  VitalDelayType := 0.148 ns;
      tsetup_WEB0_CKB_posedge_posedge   :  VitalDelayType := 0.483 ns;
      tsetup_WEB0_CKB_negedge_posedge   :  VitalDelayType := 0.483 ns;
      thold_WEB0_CKB_posedge_posedge    :  VitalDelayType := 0.048 ns;
      thold_WEB0_CKB_negedge_posedge    :  VitalDelayType := 0.048 ns;
      tsetup_WEB1_CKB_posedge_posedge   :  VitalDelayType := 0.483 ns;
      tsetup_WEB1_CKB_negedge_posedge   :  VitalDelayType := 0.483 ns;
      thold_WEB1_CKB_posedge_posedge    :  VitalDelayType := 0.048 ns;
      thold_WEB1_CKB_negedge_posedge    :  VitalDelayType := 0.048 ns;
      tsetup_WEB2_CKB_posedge_posedge   :  VitalDelayType := 0.483 ns;
      tsetup_WEB2_CKB_negedge_posedge   :  VitalDelayType := 0.483 ns;
      thold_WEB2_CKB_posedge_posedge    :  VitalDelayType := 0.048 ns;
      thold_WEB2_CKB_negedge_posedge    :  VitalDelayType := 0.048 ns;
      tsetup_WEB3_CKB_posedge_posedge   :  VitalDelayType := 0.483 ns;
      tsetup_WEB3_CKB_negedge_posedge   :  VitalDelayType := 0.483 ns;
      thold_WEB3_CKB_posedge_posedge    :  VitalDelayType := 0.048 ns;
      thold_WEB3_CKB_negedge_posedge    :  VitalDelayType := 0.048 ns;
      tsetup_WEB4_CKB_posedge_posedge   :  VitalDelayType := 0.483 ns;
      tsetup_WEB4_CKB_negedge_posedge   :  VitalDelayType := 0.483 ns;
      thold_WEB4_CKB_posedge_posedge    :  VitalDelayType := 0.048 ns;
      thold_WEB4_CKB_negedge_posedge    :  VitalDelayType := 0.048 ns;
      tsetup_WEB5_CKB_posedge_posedge   :  VitalDelayType := 0.483 ns;
      tsetup_WEB5_CKB_negedge_posedge   :  VitalDelayType := 0.483 ns;
      thold_WEB5_CKB_posedge_posedge    :  VitalDelayType := 0.048 ns;
      thold_WEB5_CKB_negedge_posedge    :  VitalDelayType := 0.048 ns;
      tsetup_WEB6_CKB_posedge_posedge   :  VitalDelayType := 0.483 ns;
      tsetup_WEB6_CKB_negedge_posedge   :  VitalDelayType := 0.483 ns;
      thold_WEB6_CKB_posedge_posedge    :  VitalDelayType := 0.048 ns;
      thold_WEB6_CKB_negedge_posedge    :  VitalDelayType := 0.048 ns;
      tsetup_WEB7_CKB_posedge_posedge   :  VitalDelayType := 0.483 ns;
      tsetup_WEB7_CKB_negedge_posedge   :  VitalDelayType := 0.483 ns;
      thold_WEB7_CKB_posedge_posedge    :  VitalDelayType := 0.048 ns;
      thold_WEB7_CKB_negedge_posedge    :  VitalDelayType := 0.048 ns;
      tsetup_CSAN_CKA_posedge_posedge    :  VitalDelayType := 0.702 ns;
      tsetup_CSAN_CKA_negedge_posedge    :  VitalDelayType := 0.702 ns;
      tsetup_CSBN_CKB_posedge_posedge    :  VitalDelayType := 0.702 ns;
      tsetup_CSBN_CKB_negedge_posedge    :  VitalDelayType := 0.702 ns;
      thold_CSAN_CKA_posedge_posedge     :  VitalDelayType := 0.129 ns;
      thold_CSAN_CKA_negedge_posedge     :  VitalDelayType := 0.129 ns;
      thold_CSBN_CKB_posedge_posedge     :  VitalDelayType := 0.129 ns;
      thold_CSBN_CKB_negedge_posedge     :  VitalDelayType := 0.129 ns;

      
      tsetup_CKA_CKB_posedge_CKA_CKB_SKEW_posedge     :  VitalDelayType := 0.000 ns;
      tsetup_CKB_CKA_posedge_CKB_CKA_SKEW_posedge     :  VitalDelayType := 0.000 ns;

      tperiod_CKA                       :  VitalDelayType := 2.559 ns;
      tperiod_CKB                       :  VitalDelayType := 2.559 ns;


      tpw_CKA_posedge                   :  VitalDelayType := 0.281 ns;
      tpw_CKB_posedge                   :  VitalDelayType := 0.281 ns;
      tpw_CKA_negedge                   :  VitalDelayType := 0.619 ns;
      tpw_CKB_negedge                   :  VitalDelayType := 0.619 ns;
      tipd_A0                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A1                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A2                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A3                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A4                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A5                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A6                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A7                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_B0                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_B1                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_B2                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_B3                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_B4                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_B5                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_B6                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_B7                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
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
      tipd_WEB0                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB1                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB2                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB3                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB4                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB5                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB6                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WEB7                     :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CSAN                        :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CSBN                        :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CKA                        :  VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CKB                        :  VitalDelayType01 := (0.000 ns, 0.000 ns)
      );

   port(
      A0                            :   IN   std_logic;
      A1                            :   IN   std_logic;
      A2                            :   IN   std_logic;
      A3                            :   IN   std_logic;
      A4                            :   IN   std_logic;
      A5                            :   IN   std_logic;
      A6                            :   IN   std_logic;
      A7                            :   IN   std_logic;
      B0                            :   IN   std_logic;
      B1                            :   IN   std_logic;
      B2                            :   IN   std_logic;
      B3                            :   IN   std_logic;
      B4                            :   IN   std_logic;
      B5                            :   IN   std_logic;
      B6                            :   IN   std_logic;
      B7                            :   IN   std_logic;
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
      WEB0                       :   IN   std_logic;
      WEB1                       :   IN   std_logic;
      WEB2                       :   IN   std_logic;
      WEB3                       :   IN   std_logic;
      WEB4                       :   IN   std_logic;
      WEB5                       :   IN   std_logic;
      WEB6                       :   IN   std_logic;
      WEB7                       :   IN   std_logic;
      CKA                            :   IN   std_logic;
      CKB                            :   IN   std_logic;
      CSAN                            :   IN   std_logic;
      CSBN                            :   IN   std_logic
      );

attribute VITAL_LEVEL0 of SZKD110_256X9X8CM2 : entity is TRUE;

end SZKD110_256X9X8CM2;

-- architecture body --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Primitives.all;
use IEEE.VITAL_Timing.all;

architecture behavior of SZKD110_256X9X8CM2 is
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

   PROCEDURE ScheduleOutputDelay (
       SIGNAL   OutSignal        : OUT std_logic;
       VARIABLE Data             : IN  std_logic;
       CONSTANT Delay            : IN  VitalDelayType01 := VitalDefDelay01;
       VARIABLE Previous_A       : IN  std_logic_vector(AddressSize-1 downto 0);
       VARIABLE Current_A        : IN  std_logic_vector(AddressSize-1 downto 0);
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
            OutSignal <= TRANSPORT Data AFTER Maximum(Delay(tr10), Delay(tr01));
         end if;
      end if;
   END ScheduleOutputDelay;

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

   SIGNAL CSAN_ipd        : std_logic := 'X';
   SIGNAL CSBN_ipd        : std_logic := 'X';
   SIGNAL CKA_ipd         : std_logic := 'X';
   SIGNAL CKB_ipd         : std_logic := 'X';
   SIGNAL A_ipd          : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   SIGNAL B_ipd          : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
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
   VitalWireDelay (CKA_ipd, CKA, tipd_CKA);
   VitalWireDelay (CKB_ipd, CKB, tipd_CKB);
   VitalWireDelay (CSAN_ipd, CSAN, tipd_CSAN);
   VitalWireDelay (CSBN_ipd, CSBN, tipd_CSBN);
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
   VitalWireDelay (B_ipd(0), B0, tipd_B0);
   VitalWireDelay (B_ipd(1), B1, tipd_B1);
   VitalWireDelay (B_ipd(2), B2, tipd_B2);
   VitalWireDelay (B_ipd(3), B3, tipd_B3);
   VitalWireDelay (B_ipd(4), B4, tipd_B4);
   VitalWireDelay (B_ipd(5), B5, tipd_B5);
   VitalWireDelay (B_ipd(6), B6, tipd_B6);
   VitalWireDelay (B_ipd(7), B7, tipd_B7);
   VitalWireDelay (DI0_ipd(0), DI0, tipd_DI0);
   VitalWireDelay (DI0_ipd(1), DI1, tipd_DI1);
   VitalWireDelay (DI0_ipd(2), DI2, tipd_DI2);
   VitalWireDelay (DI0_ipd(3), DI3, tipd_DI3);
   VitalWireDelay (DI0_ipd(4), DI4, tipd_DI4);
   VitalWireDelay (DI0_ipd(5), DI5, tipd_DI5);
   VitalWireDelay (DI0_ipd(6), DI6, tipd_DI6);
   VitalWireDelay (DI0_ipd(7), DI7, tipd_DI7);
   VitalWireDelay (DI0_ipd(8), DI8, tipd_DI8);
   VitalWireDelay (DI1_ipd(0), DI9, tipd_DI9);
   VitalWireDelay (DI1_ipd(1), DI10, tipd_DI10);
   VitalWireDelay (DI1_ipd(2), DI11, tipd_DI11);
   VitalWireDelay (DI1_ipd(3), DI12, tipd_DI12);
   VitalWireDelay (DI1_ipd(4), DI13, tipd_DI13);
   VitalWireDelay (DI1_ipd(5), DI14, tipd_DI14);
   VitalWireDelay (DI1_ipd(6), DI15, tipd_DI15);
   VitalWireDelay (DI1_ipd(7), DI16, tipd_DI16);
   VitalWireDelay (DI1_ipd(8), DI17, tipd_DI17);
   VitalWireDelay (DI2_ipd(0), DI18, tipd_DI18);
   VitalWireDelay (DI2_ipd(1), DI19, tipd_DI19);
   VitalWireDelay (DI2_ipd(2), DI20, tipd_DI20);
   VitalWireDelay (DI2_ipd(3), DI21, tipd_DI21);
   VitalWireDelay (DI2_ipd(4), DI22, tipd_DI22);
   VitalWireDelay (DI2_ipd(5), DI23, tipd_DI23);
   VitalWireDelay (DI2_ipd(6), DI24, tipd_DI24);
   VitalWireDelay (DI2_ipd(7), DI25, tipd_DI25);
   VitalWireDelay (DI2_ipd(8), DI26, tipd_DI26);
   VitalWireDelay (DI3_ipd(0), DI27, tipd_DI27);
   VitalWireDelay (DI3_ipd(1), DI28, tipd_DI28);
   VitalWireDelay (DI3_ipd(2), DI29, tipd_DI29);
   VitalWireDelay (DI3_ipd(3), DI30, tipd_DI30);
   VitalWireDelay (DI3_ipd(4), DI31, tipd_DI31);
   VitalWireDelay (DI3_ipd(5), DI32, tipd_DI32);
   VitalWireDelay (DI3_ipd(6), DI33, tipd_DI33);
   VitalWireDelay (DI3_ipd(7), DI34, tipd_DI34);
   VitalWireDelay (DI3_ipd(8), DI35, tipd_DI35);
   VitalWireDelay (DI4_ipd(0), DI36, tipd_DI36);
   VitalWireDelay (DI4_ipd(1), DI37, tipd_DI37);
   VitalWireDelay (DI4_ipd(2), DI38, tipd_DI38);
   VitalWireDelay (DI4_ipd(3), DI39, tipd_DI39);
   VitalWireDelay (DI4_ipd(4), DI40, tipd_DI40);
   VitalWireDelay (DI4_ipd(5), DI41, tipd_DI41);
   VitalWireDelay (DI4_ipd(6), DI42, tipd_DI42);
   VitalWireDelay (DI4_ipd(7), DI43, tipd_DI43);
   VitalWireDelay (DI4_ipd(8), DI44, tipd_DI44);
   VitalWireDelay (DI5_ipd(0), DI45, tipd_DI45);
   VitalWireDelay (DI5_ipd(1), DI46, tipd_DI46);
   VitalWireDelay (DI5_ipd(2), DI47, tipd_DI47);
   VitalWireDelay (DI5_ipd(3), DI48, tipd_DI48);
   VitalWireDelay (DI5_ipd(4), DI49, tipd_DI49);
   VitalWireDelay (DI5_ipd(5), DI50, tipd_DI50);
   VitalWireDelay (DI5_ipd(6), DI51, tipd_DI51);
   VitalWireDelay (DI5_ipd(7), DI52, tipd_DI52);
   VitalWireDelay (DI5_ipd(8), DI53, tipd_DI53);
   VitalWireDelay (DI6_ipd(0), DI54, tipd_DI54);
   VitalWireDelay (DI6_ipd(1), DI55, tipd_DI55);
   VitalWireDelay (DI6_ipd(2), DI56, tipd_DI56);
   VitalWireDelay (DI6_ipd(3), DI57, tipd_DI57);
   VitalWireDelay (DI6_ipd(4), DI58, tipd_DI58);
   VitalWireDelay (DI6_ipd(5), DI59, tipd_DI59);
   VitalWireDelay (DI6_ipd(6), DI60, tipd_DI60);
   VitalWireDelay (DI6_ipd(7), DI61, tipd_DI61);
   VitalWireDelay (DI6_ipd(8), DI62, tipd_DI62);
   VitalWireDelay (DI7_ipd(0), DI63, tipd_DI63);
   VitalWireDelay (DI7_ipd(1), DI64, tipd_DI64);
   VitalWireDelay (DI7_ipd(2), DI65, tipd_DI65);
   VitalWireDelay (DI7_ipd(3), DI66, tipd_DI66);
   VitalWireDelay (DI7_ipd(4), DI67, tipd_DI67);
   VitalWireDelay (DI7_ipd(5), DI68, tipd_DI68);
   VitalWireDelay (DI7_ipd(6), DI69, tipd_DI69);
   VitalWireDelay (DI7_ipd(7), DI70, tipd_DI70);
   VitalWireDelay (DI7_ipd(8), DI71, tipd_DI71);


   end block;

   VitalBUF    (q      => DO0,
                a      => DO0_int(0)
               );
   VitalBUF    (q      => DO1,
                a      => DO0_int(1)
               );
   VitalBUF    (q      => DO2,
                a      => DO0_int(2)
               );
   VitalBUF    (q      => DO3,
                a      => DO0_int(3)
               );
   VitalBUF    (q      => DO4,
                a      => DO0_int(4)
               );
   VitalBUF    (q      => DO5,
                a      => DO0_int(5)
               );
   VitalBUF    (q      => DO6,
                a      => DO0_int(6)
               );
   VitalBUF    (q      => DO7,
                a      => DO0_int(7)
               );
   VitalBUF    (q      => DO8,
                a      => DO0_int(8)
               );
   VitalBUF    (q      => DO9,
                a      => DO1_int(0)
               );
   VitalBUF    (q      => DO10,
                a      => DO1_int(1)
               );
   VitalBUF    (q      => DO11,
                a      => DO1_int(2)
               );
   VitalBUF    (q      => DO12,
                a      => DO1_int(3)
               );
   VitalBUF    (q      => DO13,
                a      => DO1_int(4)
               );
   VitalBUF    (q      => DO14,
                a      => DO1_int(5)
               );
   VitalBUF    (q      => DO15,
                a      => DO1_int(6)
               );
   VitalBUF    (q      => DO16,
                a      => DO1_int(7)
               );
   VitalBUF    (q      => DO17,
                a      => DO1_int(8)
               );
   VitalBUF    (q      => DO18,
                a      => DO2_int(0)
               );
   VitalBUF    (q      => DO19,
                a      => DO2_int(1)
               );
   VitalBUF    (q      => DO20,
                a      => DO2_int(2)
               );
   VitalBUF    (q      => DO21,
                a      => DO2_int(3)
               );
   VitalBUF    (q      => DO22,
                a      => DO2_int(4)
               );
   VitalBUF    (q      => DO23,
                a      => DO2_int(5)
               );
   VitalBUF    (q      => DO24,
                a      => DO2_int(6)
               );
   VitalBUF    (q      => DO25,
                a      => DO2_int(7)
               );
   VitalBUF    (q      => DO26,
                a      => DO2_int(8)
               );
   VitalBUF    (q      => DO27,
                a      => DO3_int(0)
               );
   VitalBUF    (q      => DO28,
                a      => DO3_int(1)
               );
   VitalBUF    (q      => DO29,
                a      => DO3_int(2)
               );
   VitalBUF    (q      => DO30,
                a      => DO3_int(3)
               );
   VitalBUF    (q      => DO31,
                a      => DO3_int(4)
               );
   VitalBUF    (q      => DO32,
                a      => DO3_int(5)
               );
   VitalBUF    (q      => DO33,
                a      => DO3_int(6)
               );
   VitalBUF    (q      => DO34,
                a      => DO3_int(7)
               );
   VitalBUF    (q      => DO35,
                a      => DO3_int(8)
               );
   VitalBUF    (q      => DO36,
                a      => DO4_int(0)
               );
   VitalBUF    (q      => DO37,
                a      => DO4_int(1)
               );
   VitalBUF    (q      => DO38,
                a      => DO4_int(2)
               );
   VitalBUF    (q      => DO39,
                a      => DO4_int(3)
               );
   VitalBUF    (q      => DO40,
                a      => DO4_int(4)
               );
   VitalBUF    (q      => DO41,
                a      => DO4_int(5)
               );
   VitalBUF    (q      => DO42,
                a      => DO4_int(6)
               );
   VitalBUF    (q      => DO43,
                a      => DO4_int(7)
               );
   VitalBUF    (q      => DO44,
                a      => DO4_int(8)
               );
   VitalBUF    (q      => DO45,
                a      => DO5_int(0)
               );
   VitalBUF    (q      => DO46,
                a      => DO5_int(1)
               );
   VitalBUF    (q      => DO47,
                a      => DO5_int(2)
               );
   VitalBUF    (q      => DO48,
                a      => DO5_int(3)
               );
   VitalBUF    (q      => DO49,
                a      => DO5_int(4)
               );
   VitalBUF    (q      => DO50,
                a      => DO5_int(5)
               );
   VitalBUF    (q      => DO51,
                a      => DO5_int(6)
               );
   VitalBUF    (q      => DO52,
                a      => DO5_int(7)
               );
   VitalBUF    (q      => DO53,
                a      => DO5_int(8)
               );
   VitalBUF    (q      => DO54,
                a      => DO6_int(0)
               );
   VitalBUF    (q      => DO55,
                a      => DO6_int(1)
               );
   VitalBUF    (q      => DO56,
                a      => DO6_int(2)
               );
   VitalBUF    (q      => DO57,
                a      => DO6_int(3)
               );
   VitalBUF    (q      => DO58,
                a      => DO6_int(4)
               );
   VitalBUF    (q      => DO59,
                a      => DO6_int(5)
               );
   VitalBUF    (q      => DO60,
                a      => DO6_int(6)
               );
   VitalBUF    (q      => DO61,
                a      => DO6_int(7)
               );
   VitalBUF    (q      => DO62,
                a      => DO6_int(8)
               );
   VitalBUF    (q      => DO63,
                a      => DO7_int(0)
               );
   VitalBUF    (q      => DO64,
                a      => DO7_int(1)
               );
   VitalBUF    (q      => DO65,
                a      => DO7_int(2)
               );
   VitalBUF    (q      => DO66,
                a      => DO7_int(3)
               );
   VitalBUF    (q      => DO67,
                a      => DO7_int(4)
               );
   VitalBUF    (q      => DO68,
                a      => DO7_int(5)
               );
   VitalBUF    (q      => DO69,
                a      => DO7_int(6)
               );
   VitalBUF    (q      => DO70,
                a      => DO7_int(7)
               );
   VitalBUF    (q      => DO71,
                a      => DO7_int(8)
               );

   --------------------
   --  BEHAVIOR SECTION
   --------------------
   VITALBehavior : PROCESS (CSAN_ipd, 
                            CSBN_ipd,
                            A_ipd,
                            B_ipd,
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
                            CKA_ipd,
                            CKB_ipd)

   -- timing check results
   VARIABLE Tviol_A0_CKA_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A1_CKA_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A2_CKA_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A3_CKA_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A4_CKA_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A5_CKA_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A6_CKA_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_A7_CKA_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_B0_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_B1_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_B2_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_B3_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_B4_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_B5_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_B6_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_B7_CKB_posedge  : STD_ULOGIC := '0';

   VARIABLE Tviol_WEB0_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB1_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB2_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB3_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB4_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB5_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB6_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_WEB7_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_0_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_0_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_0_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_0_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_0_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_0_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_0_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_0_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_0_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_1_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_1_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_1_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_1_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_1_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_1_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_1_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_1_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_1_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_2_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_2_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_2_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_2_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_2_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_2_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_2_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_2_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_2_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_3_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_3_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_3_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_3_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_3_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_3_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_3_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_3_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_3_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_4_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_4_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_4_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_4_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_4_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_4_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_4_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_4_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_4_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_5_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_5_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_5_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_5_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_5_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_5_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_5_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_5_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_5_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_6_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_6_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_6_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_6_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_6_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_6_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_6_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_6_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_6_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI0_7_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI1_7_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI2_7_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI3_7_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI4_7_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI5_7_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI6_7_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI7_7_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_DI8_7_CKB_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_CSAN_CKA_posedge  : STD_ULOGIC := '0';
   VARIABLE Tviol_CSBN_CKB_posedge  : STD_ULOGIC := '0';



   VARIABLE Pviol_CKA    : STD_ULOGIC := '0';
   VARIABLE Pviol_CKB    : STD_ULOGIC := '0';
   VARIABLE Pdata_CKA    : VitalPeriodDataType := VitalPeriodDataInit;
   VARIABLE Pdata_CKB    : VitalPeriodDataType := VitalPeriodDataInit;

   VARIABLE Tmkr_A0_CKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A1_CKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A2_CKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A3_CKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A4_CKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A5_CKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A6_CKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_A7_CKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_B0_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_B1_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_B2_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_B3_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_B4_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_B5_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_B6_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_B7_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;

   VARIABLE Tmkr_WEB0_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB1_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB2_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB3_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB4_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB5_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB6_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_WEB7_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_0_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_0_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_0_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_0_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_0_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_0_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_0_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_0_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_0_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_1_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_1_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_1_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_1_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_1_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_1_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_1_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_1_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_1_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_2_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_2_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_2_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_2_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_2_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_2_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_2_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_2_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_2_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_3_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_3_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_3_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_3_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_3_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_3_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_3_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_3_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_3_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_4_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_4_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_4_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_4_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_4_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_4_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_4_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_4_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_4_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_5_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_5_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_5_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_5_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_5_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_5_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_5_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_5_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_5_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_6_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_6_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_6_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_6_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_6_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_6_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_6_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_6_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_6_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI0_7_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI1_7_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI2_7_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI3_7_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI4_7_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI5_7_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI6_7_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI7_7_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_DI8_7_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_CSAN_CKA_posedge   : VitalTimingDataType := VitalTimingDataInit;
   VARIABLE Tmkr_CSBN_CKB_posedge   : VitalTimingDataType := VitalTimingDataInit;
   



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

   VARIABLE cka_change   : std_logic_vector(1 downto 0);
   VARIABLE ckb_change   : std_logic_vector(1 downto 0);
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
   VARIABLE Latch_B        : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
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
   VARIABLE Latch_CSAN       : std_logic := 'X';
   VARIABLE Latch_CSBN       : std_logic := 'X';


   -- internal latch data
   VARIABLE A_i            : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE B_i            : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
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
   VARIABLE CSAN_i           : std_logic := 'X';
   VARIABLE CSBN_i           : std_logic := 'X';
   


   VARIABLE last_A         : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');

   VARIABLE LastClkAEdge    : std_logic := 'X';
   VARIABLE LastClkBEdge    : std_logic := 'X';

   VARIABLE flag_A: integer   := True_flg;
   VARIABLE flag_B: integer   := True_flg;
   VARIABLE flag_CSAN: integer   := True_flg;
   VARIABLE flag_CSBN: integer   := True_flg;

   VARIABLE LastCycleRAddress  : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE Last_tc_ClkA_PosEdge     : time := 0 ns;
   VARIABLE LastCycleWAddress_WEB0  : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE Last_tc_ClkB_PosEdge_WEB0 : time := 0 ns;
   VARIABLE LastCycleWAddress_WEB1  : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE Last_tc_ClkB_PosEdge_WEB1 : time := 0 ns;
   VARIABLE LastCycleWAddress_WEB2  : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE Last_tc_ClkB_PosEdge_WEB2 : time := 0 ns;
   VARIABLE LastCycleWAddress_WEB3  : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE Last_tc_ClkB_PosEdge_WEB3 : time := 0 ns;
   VARIABLE LastCycleWAddress_WEB4  : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE Last_tc_ClkB_PosEdge_WEB4 : time := 0 ns;
   VARIABLE LastCycleWAddress_WEB5  : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE Last_tc_ClkB_PosEdge_WEB5 : time := 0 ns;
   VARIABLE LastCycleWAddress_WEB6  : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE Last_tc_ClkB_PosEdge_WEB6 : time := 0 ns;
   VARIABLE LastCycleWAddress_WEB7  : std_logic_vector(AddressSize-1 downto 0) := (others => 'X');
   VARIABLE Last_tc_ClkB_PosEdge_WEB7 : time := 0 ns;


   begin

   ------------------------
   --  Timing Check Section
   ------------------------
   if (TimingChecksOn) then
         VitalSetupHoldCheck (
          Violation               => Tviol_A0_CKA_posedge,
          TimingData              => Tmkr_A0_CKA_posedge,
          TestSignal              => A_ipd(0),
          TestSignalName          => "A0",
          TestDelay               => 0 ns,
          RefSignal               => CKA_ipd,
          RefSignalName           => "CKA",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A0_CKA_posedge_posedge,
          SetupLow                => tsetup_A0_CKA_negedge_posedge,
          HoldHigh                => thold_A0_CKA_negedge_posedge,
          HoldLow                 => thold_A0_CKA_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSAN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A1_CKA_posedge,
          TimingData              => Tmkr_A1_CKA_posedge,
          TestSignal              => A_ipd(1),
          TestSignalName          => "A1",
          TestDelay               => 0 ns,
          RefSignal               => CKA_ipd,
          RefSignalName           => "CKA",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A1_CKA_posedge_posedge,
          SetupLow                => tsetup_A1_CKA_negedge_posedge,
          HoldHigh                => thold_A1_CKA_negedge_posedge,
          HoldLow                 => thold_A1_CKA_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSAN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A2_CKA_posedge,
          TimingData              => Tmkr_A2_CKA_posedge,
          TestSignal              => A_ipd(2),
          TestSignalName          => "A2",
          TestDelay               => 0 ns,
          RefSignal               => CKA_ipd,
          RefSignalName           => "CKA",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A2_CKA_posedge_posedge,
          SetupLow                => tsetup_A2_CKA_negedge_posedge,
          HoldHigh                => thold_A2_CKA_negedge_posedge,
          HoldLow                 => thold_A2_CKA_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSAN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A3_CKA_posedge,
          TimingData              => Tmkr_A3_CKA_posedge,
          TestSignal              => A_ipd(3),
          TestSignalName          => "A3",
          TestDelay               => 0 ns,
          RefSignal               => CKA_ipd,
          RefSignalName           => "CKA",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A3_CKA_posedge_posedge,
          SetupLow                => tsetup_A3_CKA_negedge_posedge,
          HoldHigh                => thold_A3_CKA_negedge_posedge,
          HoldLow                 => thold_A3_CKA_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSAN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A4_CKA_posedge,
          TimingData              => Tmkr_A4_CKA_posedge,
          TestSignal              => A_ipd(4),
          TestSignalName          => "A4",
          TestDelay               => 0 ns,
          RefSignal               => CKA_ipd,
          RefSignalName           => "CKA",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A4_CKA_posedge_posedge,
          SetupLow                => tsetup_A4_CKA_negedge_posedge,
          HoldHigh                => thold_A4_CKA_negedge_posedge,
          HoldLow                 => thold_A4_CKA_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSAN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A5_CKA_posedge,
          TimingData              => Tmkr_A5_CKA_posedge,
          TestSignal              => A_ipd(5),
          TestSignalName          => "A5",
          TestDelay               => 0 ns,
          RefSignal               => CKA_ipd,
          RefSignalName           => "CKA",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A5_CKA_posedge_posedge,
          SetupLow                => tsetup_A5_CKA_negedge_posedge,
          HoldHigh                => thold_A5_CKA_negedge_posedge,
          HoldLow                 => thold_A5_CKA_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSAN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A6_CKA_posedge,
          TimingData              => Tmkr_A6_CKA_posedge,
          TestSignal              => A_ipd(6),
          TestSignalName          => "A6",
          TestDelay               => 0 ns,
          RefSignal               => CKA_ipd,
          RefSignalName           => "CKA",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A6_CKA_posedge_posedge,
          SetupLow                => tsetup_A6_CKA_negedge_posedge,
          HoldHigh                => thold_A6_CKA_negedge_posedge,
          HoldLow                 => thold_A6_CKA_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSAN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_A7_CKA_posedge,
          TimingData              => Tmkr_A7_CKA_posedge,
          TestSignal              => A_ipd(7),
          TestSignalName          => "A7",
          TestDelay               => 0 ns,
          RefSignal               => CKA_ipd,
          RefSignalName           => "CKA",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_A7_CKA_posedge_posedge,
          SetupLow                => tsetup_A7_CKA_negedge_posedge,
          HoldHigh                => thold_A7_CKA_negedge_posedge,
          HoldLow                 => thold_A7_CKA_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSAN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);

         VitalSetupHoldCheck (
          Violation               => Tviol_B0_CKB_posedge,
          TimingData              => Tmkr_B0_CKB_posedge,
          TestSignal              => B_ipd(0),
          TestSignalName          => "B0",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_B0_CKB_posedge_posedge,
          SetupLow                => tsetup_B0_CKB_negedge_posedge,
          HoldHigh                => thold_B0_CKB_negedge_posedge,
          HoldLow                 => thold_B0_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_B1_CKB_posedge,
          TimingData              => Tmkr_B1_CKB_posedge,
          TestSignal              => B_ipd(1),
          TestSignalName          => "B1",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_B1_CKB_posedge_posedge,
          SetupLow                => tsetup_B1_CKB_negedge_posedge,
          HoldHigh                => thold_B1_CKB_negedge_posedge,
          HoldLow                 => thold_B1_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_B2_CKB_posedge,
          TimingData              => Tmkr_B2_CKB_posedge,
          TestSignal              => B_ipd(2),
          TestSignalName          => "B2",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_B2_CKB_posedge_posedge,
          SetupLow                => tsetup_B2_CKB_negedge_posedge,
          HoldHigh                => thold_B2_CKB_negedge_posedge,
          HoldLow                 => thold_B2_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_B3_CKB_posedge,
          TimingData              => Tmkr_B3_CKB_posedge,
          TestSignal              => B_ipd(3),
          TestSignalName          => "B3",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_B3_CKB_posedge_posedge,
          SetupLow                => tsetup_B3_CKB_negedge_posedge,
          HoldHigh                => thold_B3_CKB_negedge_posedge,
          HoldLow                 => thold_B3_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_B4_CKB_posedge,
          TimingData              => Tmkr_B4_CKB_posedge,
          TestSignal              => B_ipd(4),
          TestSignalName          => "B4",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_B4_CKB_posedge_posedge,
          SetupLow                => tsetup_B4_CKB_negedge_posedge,
          HoldHigh                => thold_B4_CKB_negedge_posedge,
          HoldLow                 => thold_B4_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_B5_CKB_posedge,
          TimingData              => Tmkr_B5_CKB_posedge,
          TestSignal              => B_ipd(5),
          TestSignalName          => "B5",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_B5_CKB_posedge_posedge,
          SetupLow                => tsetup_B5_CKB_negedge_posedge,
          HoldHigh                => thold_B5_CKB_negedge_posedge,
          HoldLow                 => thold_B5_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_B6_CKB_posedge,
          TimingData              => Tmkr_B6_CKB_posedge,
          TestSignal              => B_ipd(6),
          TestSignalName          => "B6",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_B6_CKB_posedge_posedge,
          SetupLow                => tsetup_B6_CKB_negedge_posedge,
          HoldHigh                => thold_B6_CKB_negedge_posedge,
          HoldLow                 => thold_B6_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_B7_CKB_posedge,
          TimingData              => Tmkr_B7_CKB_posedge,
          TestSignal              => B_ipd(7),
          TestSignalName          => "B7",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_B7_CKB_posedge_posedge,
          SetupLow                => tsetup_B7_CKB_negedge_posedge,
          HoldHigh                => thold_B7_CKB_negedge_posedge,
          HoldLow                 => thold_B7_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);



         VitalSetupHoldCheck (
          Violation               => Tviol_WEB0_CKB_posedge,
          TimingData              => Tmkr_WEB0_CKB_posedge,
          TestSignal              => WEB0_ipd,
          TestSignalName          => "WEB0",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB0_CKB_posedge_posedge,
          SetupLow                => tsetup_WEB0_CKB_negedge_posedge,
          HoldHigh                => thold_WEB0_CKB_negedge_posedge,
          HoldLow                 => thold_WEB0_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB1_CKB_posedge,
          TimingData              => Tmkr_WEB1_CKB_posedge,
          TestSignal              => WEB1_ipd,
          TestSignalName          => "WEB1",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB1_CKB_posedge_posedge,
          SetupLow                => tsetup_WEB1_CKB_negedge_posedge,
          HoldHigh                => thold_WEB1_CKB_negedge_posedge,
          HoldLow                 => thold_WEB1_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB2_CKB_posedge,
          TimingData              => Tmkr_WEB2_CKB_posedge,
          TestSignal              => WEB2_ipd,
          TestSignalName          => "WEB2",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB2_CKB_posedge_posedge,
          SetupLow                => tsetup_WEB2_CKB_negedge_posedge,
          HoldHigh                => thold_WEB2_CKB_negedge_posedge,
          HoldLow                 => thold_WEB2_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB3_CKB_posedge,
          TimingData              => Tmkr_WEB3_CKB_posedge,
          TestSignal              => WEB3_ipd,
          TestSignalName          => "WEB3",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB3_CKB_posedge_posedge,
          SetupLow                => tsetup_WEB3_CKB_negedge_posedge,
          HoldHigh                => thold_WEB3_CKB_negedge_posedge,
          HoldLow                 => thold_WEB3_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB4_CKB_posedge,
          TimingData              => Tmkr_WEB4_CKB_posedge,
          TestSignal              => WEB4_ipd,
          TestSignalName          => "WEB4",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB4_CKB_posedge_posedge,
          SetupLow                => tsetup_WEB4_CKB_negedge_posedge,
          HoldHigh                => thold_WEB4_CKB_negedge_posedge,
          HoldLow                 => thold_WEB4_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB5_CKB_posedge,
          TimingData              => Tmkr_WEB5_CKB_posedge,
          TestSignal              => WEB5_ipd,
          TestSignalName          => "WEB5",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB5_CKB_posedge_posedge,
          SetupLow                => tsetup_WEB5_CKB_negedge_posedge,
          HoldHigh                => thold_WEB5_CKB_negedge_posedge,
          HoldLow                 => thold_WEB5_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB6_CKB_posedge,
          TimingData              => Tmkr_WEB6_CKB_posedge,
          TestSignal              => WEB6_ipd,
          TestSignalName          => "WEB6",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB6_CKB_posedge_posedge,
          SetupLow                => tsetup_WEB6_CKB_negedge_posedge,
          HoldHigh                => thold_WEB6_CKB_negedge_posedge,
          HoldLow                 => thold_WEB6_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_WEB7_CKB_posedge,
          TimingData              => Tmkr_WEB7_CKB_posedge,
          TestSignal              => WEB7_ipd,
          TestSignalName          => "WEB7",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_WEB7_CKB_posedge_posedge,
          SetupLow                => tsetup_WEB7_CKB_negedge_posedge,
          HoldHigh                => thold_WEB7_CKB_negedge_posedge,
          HoldLow                 => thold_WEB7_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);

         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_0_CKB_posedge,
          TimingData              => Tmkr_DI0_0_CKB_posedge,
          TestSignal              => DI0_ipd(0),
          TestSignalName          => "DI0",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI0_CKB_posedge_posedge,
          SetupLow                => tsetup_DI0_CKB_negedge_posedge,
          HoldHigh                => thold_DI0_CKB_negedge_posedge,
          HoldLow                 => thold_DI0_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_0_CKB_posedge,
          TimingData              => Tmkr_DI1_0_CKB_posedge,
          TestSignal              => DI0_ipd(1),
          TestSignalName          => "DI1",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI1_CKB_posedge_posedge,
          SetupLow                => tsetup_DI1_CKB_negedge_posedge,
          HoldHigh                => thold_DI1_CKB_negedge_posedge,
          HoldLow                 => thold_DI1_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_0_CKB_posedge,
          TimingData              => Tmkr_DI2_0_CKB_posedge,
          TestSignal              => DI0_ipd(2),
          TestSignalName          => "DI2",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI2_CKB_posedge_posedge,
          SetupLow                => tsetup_DI2_CKB_negedge_posedge,
          HoldHigh                => thold_DI2_CKB_negedge_posedge,
          HoldLow                 => thold_DI2_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_0_CKB_posedge,
          TimingData              => Tmkr_DI3_0_CKB_posedge,
          TestSignal              => DI0_ipd(3),
          TestSignalName          => "DI3",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI3_CKB_posedge_posedge,
          SetupLow                => tsetup_DI3_CKB_negedge_posedge,
          HoldHigh                => thold_DI3_CKB_negedge_posedge,
          HoldLow                 => thold_DI3_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_0_CKB_posedge,
          TimingData              => Tmkr_DI4_0_CKB_posedge,
          TestSignal              => DI0_ipd(4),
          TestSignalName          => "DI4",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI4_CKB_posedge_posedge,
          SetupLow                => tsetup_DI4_CKB_negedge_posedge,
          HoldHigh                => thold_DI4_CKB_negedge_posedge,
          HoldLow                 => thold_DI4_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_0_CKB_posedge,
          TimingData              => Tmkr_DI5_0_CKB_posedge,
          TestSignal              => DI0_ipd(5),
          TestSignalName          => "DI5",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI5_CKB_posedge_posedge,
          SetupLow                => tsetup_DI5_CKB_negedge_posedge,
          HoldHigh                => thold_DI5_CKB_negedge_posedge,
          HoldLow                 => thold_DI5_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_0_CKB_posedge,
          TimingData              => Tmkr_DI6_0_CKB_posedge,
          TestSignal              => DI0_ipd(6),
          TestSignalName          => "DI6",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI6_CKB_posedge_posedge,
          SetupLow                => tsetup_DI6_CKB_negedge_posedge,
          HoldHigh                => thold_DI6_CKB_negedge_posedge,
          HoldLow                 => thold_DI6_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_0_CKB_posedge,
          TimingData              => Tmkr_DI7_0_CKB_posedge,
          TestSignal              => DI0_ipd(7),
          TestSignalName          => "DI7",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI7_CKB_posedge_posedge,
          SetupLow                => tsetup_DI7_CKB_negedge_posedge,
          HoldHigh                => thold_DI7_CKB_negedge_posedge,
          HoldLow                 => thold_DI7_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_0_CKB_posedge,
          TimingData              => Tmkr_DI8_0_CKB_posedge,
          TestSignal              => DI0_ipd(8),
          TestSignalName          => "DI8",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI8_CKB_posedge_posedge,
          SetupLow                => tsetup_DI8_CKB_negedge_posedge,
          HoldHigh                => thold_DI8_CKB_negedge_posedge,
          HoldLow                 => thold_DI8_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB0_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_1_CKB_posedge,
          TimingData              => Tmkr_DI0_1_CKB_posedge,
          TestSignal              => DI1_ipd(0),
          TestSignalName          => "DI9",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI9_CKB_posedge_posedge,
          SetupLow                => tsetup_DI9_CKB_negedge_posedge,
          HoldHigh                => thold_DI9_CKB_negedge_posedge,
          HoldLow                 => thold_DI9_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_1_CKB_posedge,
          TimingData              => Tmkr_DI1_1_CKB_posedge,
          TestSignal              => DI1_ipd(1),
          TestSignalName          => "DI10",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI10_CKB_posedge_posedge,
          SetupLow                => tsetup_DI10_CKB_negedge_posedge,
          HoldHigh                => thold_DI10_CKB_negedge_posedge,
          HoldLow                 => thold_DI10_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_1_CKB_posedge,
          TimingData              => Tmkr_DI2_1_CKB_posedge,
          TestSignal              => DI1_ipd(2),
          TestSignalName          => "DI11",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI11_CKB_posedge_posedge,
          SetupLow                => tsetup_DI11_CKB_negedge_posedge,
          HoldHigh                => thold_DI11_CKB_negedge_posedge,
          HoldLow                 => thold_DI11_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_1_CKB_posedge,
          TimingData              => Tmkr_DI3_1_CKB_posedge,
          TestSignal              => DI1_ipd(3),
          TestSignalName          => "DI12",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI12_CKB_posedge_posedge,
          SetupLow                => tsetup_DI12_CKB_negedge_posedge,
          HoldHigh                => thold_DI12_CKB_negedge_posedge,
          HoldLow                 => thold_DI12_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_1_CKB_posedge,
          TimingData              => Tmkr_DI4_1_CKB_posedge,
          TestSignal              => DI1_ipd(4),
          TestSignalName          => "DI13",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI13_CKB_posedge_posedge,
          SetupLow                => tsetup_DI13_CKB_negedge_posedge,
          HoldHigh                => thold_DI13_CKB_negedge_posedge,
          HoldLow                 => thold_DI13_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_1_CKB_posedge,
          TimingData              => Tmkr_DI5_1_CKB_posedge,
          TestSignal              => DI1_ipd(5),
          TestSignalName          => "DI14",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI14_CKB_posedge_posedge,
          SetupLow                => tsetup_DI14_CKB_negedge_posedge,
          HoldHigh                => thold_DI14_CKB_negedge_posedge,
          HoldLow                 => thold_DI14_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_1_CKB_posedge,
          TimingData              => Tmkr_DI6_1_CKB_posedge,
          TestSignal              => DI1_ipd(6),
          TestSignalName          => "DI15",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI15_CKB_posedge_posedge,
          SetupLow                => tsetup_DI15_CKB_negedge_posedge,
          HoldHigh                => thold_DI15_CKB_negedge_posedge,
          HoldLow                 => thold_DI15_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_1_CKB_posedge,
          TimingData              => Tmkr_DI7_1_CKB_posedge,
          TestSignal              => DI1_ipd(7),
          TestSignalName          => "DI16",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI16_CKB_posedge_posedge,
          SetupLow                => tsetup_DI16_CKB_negedge_posedge,
          HoldHigh                => thold_DI16_CKB_negedge_posedge,
          HoldLow                 => thold_DI16_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_1_CKB_posedge,
          TimingData              => Tmkr_DI8_1_CKB_posedge,
          TestSignal              => DI1_ipd(8),
          TestSignalName          => "DI17",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI17_CKB_posedge_posedge,
          SetupLow                => tsetup_DI17_CKB_negedge_posedge,
          HoldHigh                => thold_DI17_CKB_negedge_posedge,
          HoldLow                 => thold_DI17_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB1_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_2_CKB_posedge,
          TimingData              => Tmkr_DI0_2_CKB_posedge,
          TestSignal              => DI2_ipd(0),
          TestSignalName          => "DI18",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI18_CKB_posedge_posedge,
          SetupLow                => tsetup_DI18_CKB_negedge_posedge,
          HoldHigh                => thold_DI18_CKB_negedge_posedge,
          HoldLow                 => thold_DI18_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_2_CKB_posedge,
          TimingData              => Tmkr_DI1_2_CKB_posedge,
          TestSignal              => DI2_ipd(1),
          TestSignalName          => "DI19",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI19_CKB_posedge_posedge,
          SetupLow                => tsetup_DI19_CKB_negedge_posedge,
          HoldHigh                => thold_DI19_CKB_negedge_posedge,
          HoldLow                 => thold_DI19_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_2_CKB_posedge,
          TimingData              => Tmkr_DI2_2_CKB_posedge,
          TestSignal              => DI2_ipd(2),
          TestSignalName          => "DI20",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI20_CKB_posedge_posedge,
          SetupLow                => tsetup_DI20_CKB_negedge_posedge,
          HoldHigh                => thold_DI20_CKB_negedge_posedge,
          HoldLow                 => thold_DI20_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_2_CKB_posedge,
          TimingData              => Tmkr_DI3_2_CKB_posedge,
          TestSignal              => DI2_ipd(3),
          TestSignalName          => "DI21",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI21_CKB_posedge_posedge,
          SetupLow                => tsetup_DI21_CKB_negedge_posedge,
          HoldHigh                => thold_DI21_CKB_negedge_posedge,
          HoldLow                 => thold_DI21_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_2_CKB_posedge,
          TimingData              => Tmkr_DI4_2_CKB_posedge,
          TestSignal              => DI2_ipd(4),
          TestSignalName          => "DI22",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI22_CKB_posedge_posedge,
          SetupLow                => tsetup_DI22_CKB_negedge_posedge,
          HoldHigh                => thold_DI22_CKB_negedge_posedge,
          HoldLow                 => thold_DI22_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_2_CKB_posedge,
          TimingData              => Tmkr_DI5_2_CKB_posedge,
          TestSignal              => DI2_ipd(5),
          TestSignalName          => "DI23",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI23_CKB_posedge_posedge,
          SetupLow                => tsetup_DI23_CKB_negedge_posedge,
          HoldHigh                => thold_DI23_CKB_negedge_posedge,
          HoldLow                 => thold_DI23_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_2_CKB_posedge,
          TimingData              => Tmkr_DI6_2_CKB_posedge,
          TestSignal              => DI2_ipd(6),
          TestSignalName          => "DI24",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI24_CKB_posedge_posedge,
          SetupLow                => tsetup_DI24_CKB_negedge_posedge,
          HoldHigh                => thold_DI24_CKB_negedge_posedge,
          HoldLow                 => thold_DI24_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_2_CKB_posedge,
          TimingData              => Tmkr_DI7_2_CKB_posedge,
          TestSignal              => DI2_ipd(7),
          TestSignalName          => "DI25",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI25_CKB_posedge_posedge,
          SetupLow                => tsetup_DI25_CKB_negedge_posedge,
          HoldHigh                => thold_DI25_CKB_negedge_posedge,
          HoldLow                 => thold_DI25_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_2_CKB_posedge,
          TimingData              => Tmkr_DI8_2_CKB_posedge,
          TestSignal              => DI2_ipd(8),
          TestSignalName          => "DI26",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI26_CKB_posedge_posedge,
          SetupLow                => tsetup_DI26_CKB_negedge_posedge,
          HoldHigh                => thold_DI26_CKB_negedge_posedge,
          HoldLow                 => thold_DI26_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB2_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_3_CKB_posedge,
          TimingData              => Tmkr_DI0_3_CKB_posedge,
          TestSignal              => DI3_ipd(0),
          TestSignalName          => "DI27",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI27_CKB_posedge_posedge,
          SetupLow                => tsetup_DI27_CKB_negedge_posedge,
          HoldHigh                => thold_DI27_CKB_negedge_posedge,
          HoldLow                 => thold_DI27_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_3_CKB_posedge,
          TimingData              => Tmkr_DI1_3_CKB_posedge,
          TestSignal              => DI3_ipd(1),
          TestSignalName          => "DI28",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI28_CKB_posedge_posedge,
          SetupLow                => tsetup_DI28_CKB_negedge_posedge,
          HoldHigh                => thold_DI28_CKB_negedge_posedge,
          HoldLow                 => thold_DI28_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_3_CKB_posedge,
          TimingData              => Tmkr_DI2_3_CKB_posedge,
          TestSignal              => DI3_ipd(2),
          TestSignalName          => "DI29",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI29_CKB_posedge_posedge,
          SetupLow                => tsetup_DI29_CKB_negedge_posedge,
          HoldHigh                => thold_DI29_CKB_negedge_posedge,
          HoldLow                 => thold_DI29_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_3_CKB_posedge,
          TimingData              => Tmkr_DI3_3_CKB_posedge,
          TestSignal              => DI3_ipd(3),
          TestSignalName          => "DI30",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI30_CKB_posedge_posedge,
          SetupLow                => tsetup_DI30_CKB_negedge_posedge,
          HoldHigh                => thold_DI30_CKB_negedge_posedge,
          HoldLow                 => thold_DI30_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_3_CKB_posedge,
          TimingData              => Tmkr_DI4_3_CKB_posedge,
          TestSignal              => DI3_ipd(4),
          TestSignalName          => "DI31",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI31_CKB_posedge_posedge,
          SetupLow                => tsetup_DI31_CKB_negedge_posedge,
          HoldHigh                => thold_DI31_CKB_negedge_posedge,
          HoldLow                 => thold_DI31_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_3_CKB_posedge,
          TimingData              => Tmkr_DI5_3_CKB_posedge,
          TestSignal              => DI3_ipd(5),
          TestSignalName          => "DI32",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI32_CKB_posedge_posedge,
          SetupLow                => tsetup_DI32_CKB_negedge_posedge,
          HoldHigh                => thold_DI32_CKB_negedge_posedge,
          HoldLow                 => thold_DI32_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_3_CKB_posedge,
          TimingData              => Tmkr_DI6_3_CKB_posedge,
          TestSignal              => DI3_ipd(6),
          TestSignalName          => "DI33",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI33_CKB_posedge_posedge,
          SetupLow                => tsetup_DI33_CKB_negedge_posedge,
          HoldHigh                => thold_DI33_CKB_negedge_posedge,
          HoldLow                 => thold_DI33_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_3_CKB_posedge,
          TimingData              => Tmkr_DI7_3_CKB_posedge,
          TestSignal              => DI3_ipd(7),
          TestSignalName          => "DI34",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI34_CKB_posedge_posedge,
          SetupLow                => tsetup_DI34_CKB_negedge_posedge,
          HoldHigh                => thold_DI34_CKB_negedge_posedge,
          HoldLow                 => thold_DI34_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_3_CKB_posedge,
          TimingData              => Tmkr_DI8_3_CKB_posedge,
          TestSignal              => DI3_ipd(8),
          TestSignalName          => "DI35",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI35_CKB_posedge_posedge,
          SetupLow                => tsetup_DI35_CKB_negedge_posedge,
          HoldHigh                => thold_DI35_CKB_negedge_posedge,
          HoldLow                 => thold_DI35_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB3_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_4_CKB_posedge,
          TimingData              => Tmkr_DI0_4_CKB_posedge,
          TestSignal              => DI4_ipd(0),
          TestSignalName          => "DI36",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI36_CKB_posedge_posedge,
          SetupLow                => tsetup_DI36_CKB_negedge_posedge,
          HoldHigh                => thold_DI36_CKB_negedge_posedge,
          HoldLow                 => thold_DI36_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_4_CKB_posedge,
          TimingData              => Tmkr_DI1_4_CKB_posedge,
          TestSignal              => DI4_ipd(1),
          TestSignalName          => "DI37",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI37_CKB_posedge_posedge,
          SetupLow                => tsetup_DI37_CKB_negedge_posedge,
          HoldHigh                => thold_DI37_CKB_negedge_posedge,
          HoldLow                 => thold_DI37_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_4_CKB_posedge,
          TimingData              => Tmkr_DI2_4_CKB_posedge,
          TestSignal              => DI4_ipd(2),
          TestSignalName          => "DI38",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI38_CKB_posedge_posedge,
          SetupLow                => tsetup_DI38_CKB_negedge_posedge,
          HoldHigh                => thold_DI38_CKB_negedge_posedge,
          HoldLow                 => thold_DI38_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_4_CKB_posedge,
          TimingData              => Tmkr_DI3_4_CKB_posedge,
          TestSignal              => DI4_ipd(3),
          TestSignalName          => "DI39",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI39_CKB_posedge_posedge,
          SetupLow                => tsetup_DI39_CKB_negedge_posedge,
          HoldHigh                => thold_DI39_CKB_negedge_posedge,
          HoldLow                 => thold_DI39_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_4_CKB_posedge,
          TimingData              => Tmkr_DI4_4_CKB_posedge,
          TestSignal              => DI4_ipd(4),
          TestSignalName          => "DI40",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI40_CKB_posedge_posedge,
          SetupLow                => tsetup_DI40_CKB_negedge_posedge,
          HoldHigh                => thold_DI40_CKB_negedge_posedge,
          HoldLow                 => thold_DI40_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_4_CKB_posedge,
          TimingData              => Tmkr_DI5_4_CKB_posedge,
          TestSignal              => DI4_ipd(5),
          TestSignalName          => "DI41",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI41_CKB_posedge_posedge,
          SetupLow                => tsetup_DI41_CKB_negedge_posedge,
          HoldHigh                => thold_DI41_CKB_negedge_posedge,
          HoldLow                 => thold_DI41_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_4_CKB_posedge,
          TimingData              => Tmkr_DI6_4_CKB_posedge,
          TestSignal              => DI4_ipd(6),
          TestSignalName          => "DI42",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI42_CKB_posedge_posedge,
          SetupLow                => tsetup_DI42_CKB_negedge_posedge,
          HoldHigh                => thold_DI42_CKB_negedge_posedge,
          HoldLow                 => thold_DI42_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_4_CKB_posedge,
          TimingData              => Tmkr_DI7_4_CKB_posedge,
          TestSignal              => DI4_ipd(7),
          TestSignalName          => "DI43",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI43_CKB_posedge_posedge,
          SetupLow                => tsetup_DI43_CKB_negedge_posedge,
          HoldHigh                => thold_DI43_CKB_negedge_posedge,
          HoldLow                 => thold_DI43_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_4_CKB_posedge,
          TimingData              => Tmkr_DI8_4_CKB_posedge,
          TestSignal              => DI4_ipd(8),
          TestSignalName          => "DI44",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI44_CKB_posedge_posedge,
          SetupLow                => tsetup_DI44_CKB_negedge_posedge,
          HoldHigh                => thold_DI44_CKB_negedge_posedge,
          HoldLow                 => thold_DI44_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB4_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_5_CKB_posedge,
          TimingData              => Tmkr_DI0_5_CKB_posedge,
          TestSignal              => DI5_ipd(0),
          TestSignalName          => "DI45",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI45_CKB_posedge_posedge,
          SetupLow                => tsetup_DI45_CKB_negedge_posedge,
          HoldHigh                => thold_DI45_CKB_negedge_posedge,
          HoldLow                 => thold_DI45_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_5_CKB_posedge,
          TimingData              => Tmkr_DI1_5_CKB_posedge,
          TestSignal              => DI5_ipd(1),
          TestSignalName          => "DI46",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI46_CKB_posedge_posedge,
          SetupLow                => tsetup_DI46_CKB_negedge_posedge,
          HoldHigh                => thold_DI46_CKB_negedge_posedge,
          HoldLow                 => thold_DI46_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_5_CKB_posedge,
          TimingData              => Tmkr_DI2_5_CKB_posedge,
          TestSignal              => DI5_ipd(2),
          TestSignalName          => "DI47",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI47_CKB_posedge_posedge,
          SetupLow                => tsetup_DI47_CKB_negedge_posedge,
          HoldHigh                => thold_DI47_CKB_negedge_posedge,
          HoldLow                 => thold_DI47_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_5_CKB_posedge,
          TimingData              => Tmkr_DI3_5_CKB_posedge,
          TestSignal              => DI5_ipd(3),
          TestSignalName          => "DI48",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI48_CKB_posedge_posedge,
          SetupLow                => tsetup_DI48_CKB_negedge_posedge,
          HoldHigh                => thold_DI48_CKB_negedge_posedge,
          HoldLow                 => thold_DI48_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_5_CKB_posedge,
          TimingData              => Tmkr_DI4_5_CKB_posedge,
          TestSignal              => DI5_ipd(4),
          TestSignalName          => "DI49",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI49_CKB_posedge_posedge,
          SetupLow                => tsetup_DI49_CKB_negedge_posedge,
          HoldHigh                => thold_DI49_CKB_negedge_posedge,
          HoldLow                 => thold_DI49_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_5_CKB_posedge,
          TimingData              => Tmkr_DI5_5_CKB_posedge,
          TestSignal              => DI5_ipd(5),
          TestSignalName          => "DI50",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI50_CKB_posedge_posedge,
          SetupLow                => tsetup_DI50_CKB_negedge_posedge,
          HoldHigh                => thold_DI50_CKB_negedge_posedge,
          HoldLow                 => thold_DI50_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_5_CKB_posedge,
          TimingData              => Tmkr_DI6_5_CKB_posedge,
          TestSignal              => DI5_ipd(6),
          TestSignalName          => "DI51",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI51_CKB_posedge_posedge,
          SetupLow                => tsetup_DI51_CKB_negedge_posedge,
          HoldHigh                => thold_DI51_CKB_negedge_posedge,
          HoldLow                 => thold_DI51_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_5_CKB_posedge,
          TimingData              => Tmkr_DI7_5_CKB_posedge,
          TestSignal              => DI5_ipd(7),
          TestSignalName          => "DI52",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI52_CKB_posedge_posedge,
          SetupLow                => tsetup_DI52_CKB_negedge_posedge,
          HoldHigh                => thold_DI52_CKB_negedge_posedge,
          HoldLow                 => thold_DI52_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_5_CKB_posedge,
          TimingData              => Tmkr_DI8_5_CKB_posedge,
          TestSignal              => DI5_ipd(8),
          TestSignalName          => "DI53",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI53_CKB_posedge_posedge,
          SetupLow                => tsetup_DI53_CKB_negedge_posedge,
          HoldHigh                => thold_DI53_CKB_negedge_posedge,
          HoldLow                 => thold_DI53_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB5_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_6_CKB_posedge,
          TimingData              => Tmkr_DI0_6_CKB_posedge,
          TestSignal              => DI6_ipd(0),
          TestSignalName          => "DI54",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI54_CKB_posedge_posedge,
          SetupLow                => tsetup_DI54_CKB_negedge_posedge,
          HoldHigh                => thold_DI54_CKB_negedge_posedge,
          HoldLow                 => thold_DI54_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_6_CKB_posedge,
          TimingData              => Tmkr_DI1_6_CKB_posedge,
          TestSignal              => DI6_ipd(1),
          TestSignalName          => "DI55",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI55_CKB_posedge_posedge,
          SetupLow                => tsetup_DI55_CKB_negedge_posedge,
          HoldHigh                => thold_DI55_CKB_negedge_posedge,
          HoldLow                 => thold_DI55_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_6_CKB_posedge,
          TimingData              => Tmkr_DI2_6_CKB_posedge,
          TestSignal              => DI6_ipd(2),
          TestSignalName          => "DI56",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI56_CKB_posedge_posedge,
          SetupLow                => tsetup_DI56_CKB_negedge_posedge,
          HoldHigh                => thold_DI56_CKB_negedge_posedge,
          HoldLow                 => thold_DI56_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_6_CKB_posedge,
          TimingData              => Tmkr_DI3_6_CKB_posedge,
          TestSignal              => DI6_ipd(3),
          TestSignalName          => "DI57",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI57_CKB_posedge_posedge,
          SetupLow                => tsetup_DI57_CKB_negedge_posedge,
          HoldHigh                => thold_DI57_CKB_negedge_posedge,
          HoldLow                 => thold_DI57_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_6_CKB_posedge,
          TimingData              => Tmkr_DI4_6_CKB_posedge,
          TestSignal              => DI6_ipd(4),
          TestSignalName          => "DI58",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI58_CKB_posedge_posedge,
          SetupLow                => tsetup_DI58_CKB_negedge_posedge,
          HoldHigh                => thold_DI58_CKB_negedge_posedge,
          HoldLow                 => thold_DI58_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_6_CKB_posedge,
          TimingData              => Tmkr_DI5_6_CKB_posedge,
          TestSignal              => DI6_ipd(5),
          TestSignalName          => "DI59",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI59_CKB_posedge_posedge,
          SetupLow                => tsetup_DI59_CKB_negedge_posedge,
          HoldHigh                => thold_DI59_CKB_negedge_posedge,
          HoldLow                 => thold_DI59_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_6_CKB_posedge,
          TimingData              => Tmkr_DI6_6_CKB_posedge,
          TestSignal              => DI6_ipd(6),
          TestSignalName          => "DI60",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI60_CKB_posedge_posedge,
          SetupLow                => tsetup_DI60_CKB_negedge_posedge,
          HoldHigh                => thold_DI60_CKB_negedge_posedge,
          HoldLow                 => thold_DI60_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_6_CKB_posedge,
          TimingData              => Tmkr_DI7_6_CKB_posedge,
          TestSignal              => DI6_ipd(7),
          TestSignalName          => "DI61",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI61_CKB_posedge_posedge,
          SetupLow                => tsetup_DI61_CKB_negedge_posedge,
          HoldHigh                => thold_DI61_CKB_negedge_posedge,
          HoldLow                 => thold_DI61_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_6_CKB_posedge,
          TimingData              => Tmkr_DI8_6_CKB_posedge,
          TestSignal              => DI6_ipd(8),
          TestSignalName          => "DI62",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI62_CKB_posedge_posedge,
          SetupLow                => tsetup_DI62_CKB_negedge_posedge,
          HoldHigh                => thold_DI62_CKB_negedge_posedge,
          HoldLow                 => thold_DI62_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB6_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI0_7_CKB_posedge,
          TimingData              => Tmkr_DI0_7_CKB_posedge,
          TestSignal              => DI7_ipd(0),
          TestSignalName          => "DI63",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI63_CKB_posedge_posedge,
          SetupLow                => tsetup_DI63_CKB_negedge_posedge,
          HoldHigh                => thold_DI63_CKB_negedge_posedge,
          HoldLow                 => thold_DI63_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI1_7_CKB_posedge,
          TimingData              => Tmkr_DI1_7_CKB_posedge,
          TestSignal              => DI7_ipd(1),
          TestSignalName          => "DI64",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI64_CKB_posedge_posedge,
          SetupLow                => tsetup_DI64_CKB_negedge_posedge,
          HoldHigh                => thold_DI64_CKB_negedge_posedge,
          HoldLow                 => thold_DI64_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI2_7_CKB_posedge,
          TimingData              => Tmkr_DI2_7_CKB_posedge,
          TestSignal              => DI7_ipd(2),
          TestSignalName          => "DI65",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI65_CKB_posedge_posedge,
          SetupLow                => tsetup_DI65_CKB_negedge_posedge,
          HoldHigh                => thold_DI65_CKB_negedge_posedge,
          HoldLow                 => thold_DI65_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI3_7_CKB_posedge,
          TimingData              => Tmkr_DI3_7_CKB_posedge,
          TestSignal              => DI7_ipd(3),
          TestSignalName          => "DI66",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI66_CKB_posedge_posedge,
          SetupLow                => tsetup_DI66_CKB_negedge_posedge,
          HoldHigh                => thold_DI66_CKB_negedge_posedge,
          HoldLow                 => thold_DI66_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI4_7_CKB_posedge,
          TimingData              => Tmkr_DI4_7_CKB_posedge,
          TestSignal              => DI7_ipd(4),
          TestSignalName          => "DI67",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI67_CKB_posedge_posedge,
          SetupLow                => tsetup_DI67_CKB_negedge_posedge,
          HoldHigh                => thold_DI67_CKB_negedge_posedge,
          HoldLow                 => thold_DI67_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI5_7_CKB_posedge,
          TimingData              => Tmkr_DI5_7_CKB_posedge,
          TestSignal              => DI7_ipd(5),
          TestSignalName          => "DI68",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI68_CKB_posedge_posedge,
          SetupLow                => tsetup_DI68_CKB_negedge_posedge,
          HoldHigh                => thold_DI68_CKB_negedge_posedge,
          HoldLow                 => thold_DI68_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI6_7_CKB_posedge,
          TimingData              => Tmkr_DI6_7_CKB_posedge,
          TestSignal              => DI7_ipd(6),
          TestSignalName          => "DI69",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI69_CKB_posedge_posedge,
          SetupLow                => tsetup_DI69_CKB_negedge_posedge,
          HoldHigh                => thold_DI69_CKB_negedge_posedge,
          HoldLow                 => thold_DI69_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI7_7_CKB_posedge,
          TimingData              => Tmkr_DI7_7_CKB_posedge,
          TestSignal              => DI7_ipd(7),
          TestSignalName          => "DI70",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI70_CKB_posedge_posedge,
          SetupLow                => tsetup_DI70_CKB_negedge_posedge,
          HoldHigh                => thold_DI70_CKB_negedge_posedge,
          HoldLow                 => thold_DI70_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);
         VitalSetupHoldCheck (
          Violation               => Tviol_DI8_7_CKB_posedge,
          TimingData              => Tmkr_DI8_7_CKB_posedge,
          TestSignal              => DI7_ipd(8),
          TestSignalName          => "DI71",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_DI71_CKB_posedge_posedge,
          SetupLow                => tsetup_DI71_CKB_negedge_posedge,
          HoldHigh                => thold_DI71_CKB_negedge_posedge,
          HoldLow                 => thold_DI71_CKB_posedge_posedge,
          CheckEnabled            =>
                           NOW /= 0 ns AND CSBN_ipd = '0' AND WEB7_ipd /= '1',
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);




         VitalSetupHoldCheck (
          Violation               => Tviol_CSAN_CKA_posedge,
          TimingData              => Tmkr_CSAN_CKA_posedge,
          TestSignal              => CSAN_ipd,
          TestSignalName          => "CSAN",
          TestDelay               => 0 ns,
          RefSignal               => CKA_ipd,
          RefSignalName           => "CKA",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_CSAN_CKA_posedge_posedge,
          SetupLow                => tsetup_CSAN_CKA_negedge_posedge,
          HoldHigh                => thold_CSAN_CKA_negedge_posedge,
          HoldLow                 => thold_CSAN_CKA_posedge_posedge,
          CheckEnabled            => NOW /= 0 ns,
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);

         VitalSetupHoldCheck (
          Violation               => Tviol_CSBN_CKB_posedge,
          TimingData              => Tmkr_CSBN_CKB_posedge,
          TestSignal              => CSBN_ipd,
          TestSignalName          => "CSBN",
          TestDelay               => 0 ns,
          RefSignal               => CKB_ipd,
          RefSignalName           => "CKB",
          RefDelay                => 0 ns,
          SetupHigh               => tsetup_CSBN_CKB_posedge_posedge,
          SetupLow                => tsetup_CSBN_CKB_negedge_posedge,
          HoldHigh                => thold_CSBN_CKB_negedge_posedge,
          HoldLow                 => thold_CSBN_CKB_posedge_posedge,
          CheckEnabled            => NOW /= 0 ns,
          RefTransition           => 'R',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);

         VitalPeriodPulseCheck (
          Violation               => Pviol_CKA,
          PeriodData              => Pdata_CKA,
          TestSignal              => CKA_ipd,
          TestSignalName          => "CKA",
          TestDelay               => 0 ns,
          Period                  => tperiod_CKA,
          PulseWidthHigh          => tpw_CKA_posedge,
          PulseWidthLow           => tpw_CKA_negedge,
          CheckEnabled            => 
                           NOW /= 0 ns AND CSAN_ipd = '0',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);

         VitalPeriodPulseCheck (
          Violation               => Pviol_CKB,
          PeriodData              => Pdata_CKB,
          TestSignal              => CKB_ipd,
          TestSignalName          => "CKB",
          TestDelay               => 0 ns,
          Period                  => tperiod_CKB,
          PulseWidthHigh          => tpw_CKB_posedge,
          PulseWidthLow           => tpw_CKB_negedge,
          CheckEnabled            => 
                           NOW /= 0 ns AND CSBN_ipd = '0',
          HeaderMsg               => InstancePath & "/SZKD110_256X9X8CM2",
          Xon                     => Xon,
          MsgOn                   => MsgOn,
          MsgSeverity             => WARNING);

   end if;

   -------------------------
   --  Functionality Section
   -------------------------
       if (CSAN_ipd = '1' and CSAN_ipd'event) then
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


       if (CKA_ipd'event) then
         cka_change := LastClkAEdge&CKA_ipd;
         case cka_change is
            when "01"   =>
                if (CS_monitor(CSAN_ipd,flag_CSAN) = True_flg) then
                   -- Reduce error message --
                   flag_CSAN := True_flg;
                else
                   flag_CSAN := False_flg;
                end if;

                Latch_A    := A_ipd;
                Latch_CSAN  := CSAN_ipd;

                -- read_memory_function
                A_i    := Latch_A;
                CSAN_i  := Latch_CSAN;


                case CSAN_i is
                   when '0' =>
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           if ((A_i = LastCycleWAddress_WEB0) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB0) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO0_zd := (OTHERS => 'X');
                              DO0_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO0_zd := memoryCore0(to_integer(A_i));

                           ScheduleOutputDelay(DO0_int(0), DO0_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(1), DO0_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(2), DO0_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(3), DO0_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(4), DO0_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(5), DO0_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(6), DO0_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(7), DO0_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(8), DO0_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB1) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB1) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO1_zd := (OTHERS => 'X');
                              DO1_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO1_zd := memoryCore1(to_integer(A_i));

                           ScheduleOutputDelay(DO1_int(0), DO1_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(1), DO1_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(2), DO1_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(3), DO1_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(4), DO1_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(5), DO1_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(6), DO1_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(7), DO1_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(8), DO1_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB2) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB2) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO2_zd := (OTHERS => 'X');
                              DO2_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO2_zd := memoryCore2(to_integer(A_i));

                           ScheduleOutputDelay(DO2_int(0), DO2_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(1), DO2_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(2), DO2_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(3), DO2_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(4), DO2_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(5), DO2_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(6), DO2_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(7), DO2_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(8), DO2_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB3) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB3) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO3_zd := (OTHERS => 'X');
                              DO3_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO3_zd := memoryCore3(to_integer(A_i));

                           ScheduleOutputDelay(DO3_int(0), DO3_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(1), DO3_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(2), DO3_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(3), DO3_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(4), DO3_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(5), DO3_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(6), DO3_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(7), DO3_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(8), DO3_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB4) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB4) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO4_zd := (OTHERS => 'X');
                              DO4_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO4_zd := memoryCore4(to_integer(A_i));

                           ScheduleOutputDelay(DO4_int(0), DO4_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(1), DO4_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(2), DO4_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(3), DO4_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(4), DO4_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(5), DO4_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(6), DO4_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(7), DO4_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(8), DO4_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB5) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB5) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO5_zd := (OTHERS => 'X');
                              DO5_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO5_zd := memoryCore5(to_integer(A_i));

                           ScheduleOutputDelay(DO5_int(0), DO5_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(1), DO5_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(2), DO5_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(3), DO5_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(4), DO5_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(5), DO5_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(6), DO5_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(7), DO5_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(8), DO5_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB6) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB6) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO6_zd := (OTHERS => 'X');
                              DO6_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO6_zd := memoryCore6(to_integer(A_i));

                           ScheduleOutputDelay(DO6_int(0), DO6_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(1), DO6_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(2), DO6_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(3), DO6_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(4), DO6_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(5), DO6_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(6), DO6_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(7), DO6_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(8), DO6_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB7) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB7) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO7_zd := (OTHERS => 'X');
                              DO7_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO7_zd := memoryCore7(to_integer(A_i));

                           ScheduleOutputDelay(DO7_int(0), DO7_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(1), DO7_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(2), DO7_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(3), DO7_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(4), DO7_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(5), DO7_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(6), DO7_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(7), DO7_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(8), DO7_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;

                           LastCycleRAddress := A_i;
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO0_zd := (OTHERS => 'X');
                           DO0_int <= TRANSPORT (OTHERS => 'X');
                           DO1_zd := (OTHERS => 'X');
                           DO1_int <= TRANSPORT (OTHERS => 'X');
                           DO2_zd := (OTHERS => 'X');
                           DO2_int <= TRANSPORT (OTHERS => 'X');
                           DO3_zd := (OTHERS => 'X');
                           DO3_int <= TRANSPORT (OTHERS => 'X');
                           DO4_zd := (OTHERS => 'X');
                           DO4_int <= TRANSPORT (OTHERS => 'X');
                           DO5_zd := (OTHERS => 'X');
                           DO5_int <= TRANSPORT (OTHERS => 'X');
                           DO6_zd := (OTHERS => 'X');
                           DO6_int <= TRANSPORT (OTHERS => 'X');
                           DO7_zd := (OTHERS => 'X');
                           DO7_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when '1' =>  -- do nothing
                   when others =>
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
                end case;
                -- end read_memory_function
                last_A := A_ipd;

                if (CSAN_i = '0') then
                   Last_tc_ClkA_PosEdge := NOW;
                end if;

            when "10"   => -- do nothing
            when others => if (NOW /= 0 ns) then
                              assert FALSE report "** MEM_Error: Abnormal transition occurred." severity WARNING;
                           end if;
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
         end case;
         LastClkAEdge := CKA_ipd;
       end if;

       if (CKB_ipd'event) then
         ckb_change := LastClkBEdge&CKB_ipd;
         case ckb_change is
            when "01"   =>
                if (CS_monitor(CSBN_ipd,flag_CSBN) = True_flg) then
                   -- Reduce error message --
                   flag_CSBN := True_flg;
                else
                   flag_CSBN := False_flg;
                end if;

                Latch_B    := B_ipd;
                Latch_CSBN  := CSBN_ipd;
                Latch_DI0   := DI0_ipd;
                Latch_WEB0  := WEB0_ipd;
                Latch_DI1   := DI1_ipd;
                Latch_WEB1  := WEB1_ipd;
                Latch_DI2   := DI2_ipd;
                Latch_WEB2  := WEB2_ipd;
                Latch_DI3   := DI3_ipd;
                Latch_WEB3  := WEB3_ipd;
                Latch_DI4   := DI4_ipd;
                Latch_WEB4  := WEB4_ipd;
                Latch_DI5   := DI5_ipd;
                Latch_WEB5  := WEB5_ipd;
                Latch_DI6   := DI6_ipd;
                Latch_WEB6  := WEB6_ipd;
                Latch_DI7   := DI7_ipd;
                Latch_WEB7  := WEB7_ipd;

                -- write_memory_function
                B_i   := Latch_B;
                CSBN_i := Latch_CSBN;
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



                -- write byte0
                web0_cs    := WEB0_i&CSBN_i;
                case web0_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore0(to_integer(B_i)) := DI0_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO0_zd := (OTHERS => 'X');
                              DO0_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore0(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB0 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore0(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore0(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte1
                web1_cs    := WEB1_i&CSBN_i;
                case web1_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore1(to_integer(B_i)) := DI1_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO1_zd := (OTHERS => 'X');
                              DO1_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore1(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB1 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore1(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore1(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte2
                web2_cs    := WEB2_i&CSBN_i;
                case web2_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore2(to_integer(B_i)) := DI2_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO2_zd := (OTHERS => 'X');
                              DO2_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore2(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB2 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore2(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore2(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte3
                web3_cs    := WEB3_i&CSBN_i;
                case web3_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore3(to_integer(B_i)) := DI3_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO3_zd := (OTHERS => 'X');
                              DO3_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore3(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB3 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore3(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore3(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte4
                web4_cs    := WEB4_i&CSBN_i;
                case web4_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore4(to_integer(B_i)) := DI4_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO4_zd := (OTHERS => 'X');
                              DO4_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore4(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB4 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore4(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore4(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte5
                web5_cs    := WEB5_i&CSBN_i;
                case web5_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore5(to_integer(B_i)) := DI5_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO5_zd := (OTHERS => 'X');
                              DO5_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore5(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB5 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore5(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore5(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte6
                web6_cs    := WEB6_i&CSBN_i;
                case web6_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore6(to_integer(B_i)) := DI6_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO6_zd := (OTHERS => 'X');
                              DO6_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore6(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB6 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore6(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore6(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte7
                web7_cs    := WEB7_i&CSBN_i;
                case web7_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore7(to_integer(B_i)) := DI7_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO7_zd := (OTHERS => 'X');
                              DO7_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore7(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB7 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore7(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore7(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;
                -- end write_memory_function

                if ((CSBN_i = '0') and (WEB0_i = '0')) then
                   Last_tc_ClkB_PosEdge_WEB0 := NOW;
                end if;
                if ((CSBN_i = '0') and (WEB1_i = '0')) then
                   Last_tc_ClkB_PosEdge_WEB1 := NOW;
                end if;
                if ((CSBN_i = '0') and (WEB2_i = '0')) then
                   Last_tc_ClkB_PosEdge_WEB2 := NOW;
                end if;
                if ((CSBN_i = '0') and (WEB3_i = '0')) then
                   Last_tc_ClkB_PosEdge_WEB3 := NOW;
                end if;
                if ((CSBN_i = '0') and (WEB4_i = '0')) then
                   Last_tc_ClkB_PosEdge_WEB4 := NOW;
                end if;
                if ((CSBN_i = '0') and (WEB5_i = '0')) then
                   Last_tc_ClkB_PosEdge_WEB5 := NOW;
                end if;
                if ((CSBN_i = '0') and (WEB6_i = '0')) then
                   Last_tc_ClkB_PosEdge_WEB6 := NOW;
                end if;
                if ((CSBN_i = '0') and (WEB7_i = '0')) then
                   Last_tc_ClkB_PosEdge_WEB7 := NOW;
                end if;

            when "10"   => -- do nothing
            when others => if (NOW /= 0 ns) then
                              assert FALSE report "** MEM_Error: Abnormal transition occurred." severity WARNING;
                           end if;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore0(i) := (OTHERS => 'X');
                              memoryCore1(i) := (OTHERS => 'X');
                              memoryCore2(i) := (OTHERS => 'X');
                              memoryCore3(i) := (OTHERS => 'X');
                              memoryCore4(i) := (OTHERS => 'X');
                              memoryCore5(i) := (OTHERS => 'X');
                              memoryCore6(i) := (OTHERS => 'X');
                              memoryCore7(i) := (OTHERS => 'X');
                           END LOOP;
         end case;
         LastClkBEdge := CKB_ipd;
       end if;


       if (
           Tviol_A0_CKA_posedge     = 'X' or
           Tviol_A1_CKA_posedge     = 'X' or
           Tviol_A2_CKA_posedge     = 'X' or
           Tviol_A3_CKA_posedge     = 'X' or
           Tviol_A4_CKA_posedge     = 'X' or
           Tviol_A5_CKA_posedge     = 'X' or
           Tviol_A6_CKA_posedge     = 'X' or
           Tviol_A7_CKA_posedge     = 'X' or
           Tviol_B0_CKB_posedge     = 'X' or
           Tviol_B1_CKB_posedge     = 'X' or
           Tviol_B2_CKB_posedge     = 'X' or
           Tviol_B3_CKB_posedge     = 'X' or
           Tviol_B4_CKB_posedge     = 'X' or
           Tviol_B5_CKB_posedge     = 'X' or
           Tviol_B6_CKB_posedge     = 'X' or
           Tviol_B7_CKB_posedge     = 'X' or
           Tviol_WEB0_CKB_posedge  = 'X' or
           Tviol_WEB1_CKB_posedge  = 'X' or
           Tviol_WEB2_CKB_posedge  = 'X' or
           Tviol_WEB3_CKB_posedge  = 'X' or
           Tviol_WEB4_CKB_posedge  = 'X' or
           Tviol_WEB5_CKB_posedge  = 'X' or
           Tviol_WEB6_CKB_posedge  = 'X' or
           Tviol_WEB7_CKB_posedge  = 'X' or
           Tviol_DI0_0_CKB_posedge   = 'X' or 
           Tviol_DI1_0_CKB_posedge   = 'X' or 
           Tviol_DI2_0_CKB_posedge   = 'X' or 
           Tviol_DI3_0_CKB_posedge   = 'X' or 
           Tviol_DI4_0_CKB_posedge   = 'X' or 
           Tviol_DI5_0_CKB_posedge   = 'X' or 
           Tviol_DI6_0_CKB_posedge   = 'X' or 
           Tviol_DI7_0_CKB_posedge   = 'X' or 
           Tviol_DI8_0_CKB_posedge   = 'X' or 
           Tviol_DI0_1_CKB_posedge   = 'X' or 
           Tviol_DI1_1_CKB_posedge   = 'X' or 
           Tviol_DI2_1_CKB_posedge   = 'X' or 
           Tviol_DI3_1_CKB_posedge   = 'X' or 
           Tviol_DI4_1_CKB_posedge   = 'X' or 
           Tviol_DI5_1_CKB_posedge   = 'X' or 
           Tviol_DI6_1_CKB_posedge   = 'X' or 
           Tviol_DI7_1_CKB_posedge   = 'X' or 
           Tviol_DI8_1_CKB_posedge   = 'X' or 
           Tviol_DI0_2_CKB_posedge   = 'X' or 
           Tviol_DI1_2_CKB_posedge   = 'X' or 
           Tviol_DI2_2_CKB_posedge   = 'X' or 
           Tviol_DI3_2_CKB_posedge   = 'X' or 
           Tviol_DI4_2_CKB_posedge   = 'X' or 
           Tviol_DI5_2_CKB_posedge   = 'X' or 
           Tviol_DI6_2_CKB_posedge   = 'X' or 
           Tviol_DI7_2_CKB_posedge   = 'X' or 
           Tviol_DI8_2_CKB_posedge   = 'X' or 
           Tviol_DI0_3_CKB_posedge   = 'X' or 
           Tviol_DI1_3_CKB_posedge   = 'X' or 
           Tviol_DI2_3_CKB_posedge   = 'X' or 
           Tviol_DI3_3_CKB_posedge   = 'X' or 
           Tviol_DI4_3_CKB_posedge   = 'X' or 
           Tviol_DI5_3_CKB_posedge   = 'X' or 
           Tviol_DI6_3_CKB_posedge   = 'X' or 
           Tviol_DI7_3_CKB_posedge   = 'X' or 
           Tviol_DI8_3_CKB_posedge   = 'X' or 
           Tviol_DI0_4_CKB_posedge   = 'X' or 
           Tviol_DI1_4_CKB_posedge   = 'X' or 
           Tviol_DI2_4_CKB_posedge   = 'X' or 
           Tviol_DI3_4_CKB_posedge   = 'X' or 
           Tviol_DI4_4_CKB_posedge   = 'X' or 
           Tviol_DI5_4_CKB_posedge   = 'X' or 
           Tviol_DI6_4_CKB_posedge   = 'X' or 
           Tviol_DI7_4_CKB_posedge   = 'X' or 
           Tviol_DI8_4_CKB_posedge   = 'X' or 
           Tviol_DI0_5_CKB_posedge   = 'X' or 
           Tviol_DI1_5_CKB_posedge   = 'X' or 
           Tviol_DI2_5_CKB_posedge   = 'X' or 
           Tviol_DI3_5_CKB_posedge   = 'X' or 
           Tviol_DI4_5_CKB_posedge   = 'X' or 
           Tviol_DI5_5_CKB_posedge   = 'X' or 
           Tviol_DI6_5_CKB_posedge   = 'X' or 
           Tviol_DI7_5_CKB_posedge   = 'X' or 
           Tviol_DI8_5_CKB_posedge   = 'X' or 
           Tviol_DI0_6_CKB_posedge   = 'X' or 
           Tviol_DI1_6_CKB_posedge   = 'X' or 
           Tviol_DI2_6_CKB_posedge   = 'X' or 
           Tviol_DI3_6_CKB_posedge   = 'X' or 
           Tviol_DI4_6_CKB_posedge   = 'X' or 
           Tviol_DI5_6_CKB_posedge   = 'X' or 
           Tviol_DI6_6_CKB_posedge   = 'X' or 
           Tviol_DI7_6_CKB_posedge   = 'X' or 
           Tviol_DI8_6_CKB_posedge   = 'X' or 
           Tviol_DI0_7_CKB_posedge   = 'X' or 
           Tviol_DI1_7_CKB_posedge   = 'X' or 
           Tviol_DI2_7_CKB_posedge   = 'X' or 
           Tviol_DI3_7_CKB_posedge   = 'X' or 
           Tviol_DI4_7_CKB_posedge   = 'X' or 
           Tviol_DI5_7_CKB_posedge   = 'X' or 
           Tviol_DI6_7_CKB_posedge   = 'X' or 
           Tviol_DI7_7_CKB_posedge   = 'X' or 
           Tviol_DI8_7_CKB_posedge   = 'X' or 
           Tviol_CSAN_CKA_posedge    = 'X' or
           Tviol_CSBN_CKB_posedge    = 'X' or
           Pviol_CKA               = 'X' or
           Pviol_CKB               = 'X'
          ) then

         if (Pviol_CKA = 'X') then
            if (CSAN_ipd /= '1') then
               DO0_zd := (OTHERS => 'X');
               DO0_int <= TRANSPORT (OTHERS => 'X');
               DO1_zd := (OTHERS => 'X');
               DO1_int <= TRANSPORT (OTHERS => 'X');
               DO2_zd := (OTHERS => 'X');
               DO2_int <= TRANSPORT (OTHERS => 'X');
               DO3_zd := (OTHERS => 'X');
               DO3_int <= TRANSPORT (OTHERS => 'X');
               DO4_zd := (OTHERS => 'X');
               DO4_int <= TRANSPORT (OTHERS => 'X');
               DO5_zd := (OTHERS => 'X');
               DO5_int <= TRANSPORT (OTHERS => 'X');
               DO6_zd := (OTHERS => 'X');
               DO6_int <= TRANSPORT (OTHERS => 'X');
               DO7_zd := (OTHERS => 'X');
               DO7_int <= TRANSPORT (OTHERS => 'X');
            end if;
         else
              if (Tviol_A0_CKA_posedge = 'X') then
                 Latch_A(0) := 'X';
              else
                 Latch_A(0) := Latch_A(0);
              end if;
              if (Tviol_A1_CKA_posedge = 'X') then
                 Latch_A(1) := 'X';
              else
                 Latch_A(1) := Latch_A(1);
              end if;
              if (Tviol_A2_CKA_posedge = 'X') then
                 Latch_A(2) := 'X';
              else
                 Latch_A(2) := Latch_A(2);
              end if;
              if (Tviol_A3_CKA_posedge = 'X') then
                 Latch_A(3) := 'X';
              else
                 Latch_A(3) := Latch_A(3);
              end if;
              if (Tviol_A4_CKA_posedge = 'X') then
                 Latch_A(4) := 'X';
              else
                 Latch_A(4) := Latch_A(4);
              end if;
              if (Tviol_A5_CKA_posedge = 'X') then
                 Latch_A(5) := 'X';
              else
                 Latch_A(5) := Latch_A(5);
              end if;
              if (Tviol_A6_CKA_posedge = 'X') then
                 Latch_A(6) := 'X';
              else
                 Latch_A(6) := Latch_A(6);
              end if;
              if (Tviol_A7_CKA_posedge = 'X') then
                 Latch_A(7) := 'X';
              else
                 Latch_A(7) := Latch_A(7);
              end if;


            if (Tviol_CSAN_CKA_posedge = 'X') then
               Latch_CSAN := 'X';
            else
               Latch_CSAN := Latch_CSAN;
            end if;

                -- read_memory_function
                A_i    := Latch_A;
                CSAN_i  := Latch_CSAN;


                case CSAN_i is
                   when '0' =>
                       -------- Reduce error message --------------------------
                       if (AddressRangeCheck(A_i,flag_A) = True_flg) then
                           if ((A_i = LastCycleWAddress_WEB0) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB0) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO0_zd := (OTHERS => 'X');
                              DO0_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO0_zd := memoryCore0(to_integer(A_i));

                           ScheduleOutputDelay(DO0_int(0), DO0_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(1), DO0_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(2), DO0_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(3), DO0_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(4), DO0_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(5), DO0_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(6), DO0_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(7), DO0_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO0_int(8), DO0_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB1) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB1) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO1_zd := (OTHERS => 'X');
                              DO1_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO1_zd := memoryCore1(to_integer(A_i));

                           ScheduleOutputDelay(DO1_int(0), DO1_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(1), DO1_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(2), DO1_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(3), DO1_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(4), DO1_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(5), DO1_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(6), DO1_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(7), DO1_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO1_int(8), DO1_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB2) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB2) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO2_zd := (OTHERS => 'X');
                              DO2_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO2_zd := memoryCore2(to_integer(A_i));

                           ScheduleOutputDelay(DO2_int(0), DO2_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(1), DO2_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(2), DO2_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(3), DO2_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(4), DO2_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(5), DO2_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(6), DO2_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(7), DO2_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO2_int(8), DO2_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB3) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB3) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO3_zd := (OTHERS => 'X');
                              DO3_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO3_zd := memoryCore3(to_integer(A_i));

                           ScheduleOutputDelay(DO3_int(0), DO3_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(1), DO3_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(2), DO3_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(3), DO3_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(4), DO3_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(5), DO3_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(6), DO3_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(7), DO3_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO3_int(8), DO3_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB4) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB4) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO4_zd := (OTHERS => 'X');
                              DO4_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO4_zd := memoryCore4(to_integer(A_i));

                           ScheduleOutputDelay(DO4_int(0), DO4_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(1), DO4_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(2), DO4_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(3), DO4_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(4), DO4_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(5), DO4_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(6), DO4_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(7), DO4_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO4_int(8), DO4_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB5) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB5) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO5_zd := (OTHERS => 'X');
                              DO5_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO5_zd := memoryCore5(to_integer(A_i));

                           ScheduleOutputDelay(DO5_int(0), DO5_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(1), DO5_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(2), DO5_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(3), DO5_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(4), DO5_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(5), DO5_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(6), DO5_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(7), DO5_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO5_int(8), DO5_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB6) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB6) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO6_zd := (OTHERS => 'X');
                              DO6_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO6_zd := memoryCore6(to_integer(A_i));

                           ScheduleOutputDelay(DO6_int(0), DO6_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(1), DO6_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(2), DO6_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(3), DO6_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(4), DO6_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(5), DO6_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(6), DO6_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(7), DO6_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO6_int(8), DO6_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;
                           if ((A_i = LastCycleWAddress_WEB7) and
                               ((NOW-Last_tc_ClkB_PosEdge_WEB7) < Tw2r)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO7_zd := (OTHERS => 'X');
                              DO7_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           else
                              -- Reduce error message --
                              flag_A := True_flg;
                              --------------------------
                              DO7_zd := memoryCore7(to_integer(A_i));

                           ScheduleOutputDelay(DO7_int(0), DO7_zd(0),
                              tpd_CKA_DO0_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(1), DO7_zd(1),
                              tpd_CKA_DO1_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(2), DO7_zd(2),
                              tpd_CKA_DO2_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(3), DO7_zd(3),
                              tpd_CKA_DO3_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(4), DO7_zd(4),
                              tpd_CKA_DO4_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(5), DO7_zd(5),
                              tpd_CKA_DO5_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(6), DO7_zd(6),
                              tpd_CKA_DO6_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(7), DO7_zd(7),
                              tpd_CKA_DO7_posedge,last_A,A_i,NO_SER_TOH);
                           ScheduleOutputDelay(DO7_int(8), DO7_zd(8),
                              tpd_CKA_DO8_posedge,last_A,A_i,NO_SER_TOH);

                           end if;

                           LastCycleRAddress := A_i;
                       else
                           -- Reduce error message --
                           flag_A := False_flg;
                           --------------------------
                           DO0_zd := (OTHERS => 'X');
                           DO0_int <= TRANSPORT (OTHERS => 'X');
                           DO1_zd := (OTHERS => 'X');
                           DO1_int <= TRANSPORT (OTHERS => 'X');
                           DO2_zd := (OTHERS => 'X');
                           DO2_int <= TRANSPORT (OTHERS => 'X');
                           DO3_zd := (OTHERS => 'X');
                           DO3_int <= TRANSPORT (OTHERS => 'X');
                           DO4_zd := (OTHERS => 'X');
                           DO4_int <= TRANSPORT (OTHERS => 'X');
                           DO5_zd := (OTHERS => 'X');
                           DO5_int <= TRANSPORT (OTHERS => 'X');
                           DO6_zd := (OTHERS => 'X');
                           DO6_int <= TRANSPORT (OTHERS => 'X');
                           DO7_zd := (OTHERS => 'X');
                           DO7_int <= TRANSPORT (OTHERS => 'X');
                       end if;

                   when '1' =>  -- do nothing
                   when others =>
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
                end case;
                -- end read_memory_function

         end if;


         if (Pviol_CKB = 'X') then
            if (CSBN_ipd /= '1') then
               if (WEB0_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore0(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               if (WEB1_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore1(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               if (WEB2_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore2(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               if (WEB3_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore3(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               if (WEB4_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore4(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               if (WEB5_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore5(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               if (WEB6_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore6(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
               if (WEB7_ipd /= '1') then
                  FOR i IN Words-1 downto 0 LOOP
                     memoryCore7(i) := (OTHERS => 'X');
                  END LOOP;
               end if;
            end if;
         else
              if (Tviol_B0_CKB_posedge = 'X') then
                 Latch_B(0) := 'X';
              else
                 Latch_B(0) := Latch_B(0);
              end if;
              if (Tviol_B1_CKB_posedge = 'X') then
                 Latch_B(1) := 'X';
              else
                 Latch_B(1) := Latch_B(1);
              end if;
              if (Tviol_B2_CKB_posedge = 'X') then
                 Latch_B(2) := 'X';
              else
                 Latch_B(2) := Latch_B(2);
              end if;
              if (Tviol_B3_CKB_posedge = 'X') then
                 Latch_B(3) := 'X';
              else
                 Latch_B(3) := Latch_B(3);
              end if;
              if (Tviol_B4_CKB_posedge = 'X') then
                 Latch_B(4) := 'X';
              else
                 Latch_B(4) := Latch_B(4);
              end if;
              if (Tviol_B5_CKB_posedge = 'X') then
                 Latch_B(5) := 'X';
              else
                 Latch_B(5) := Latch_B(5);
              end if;
              if (Tviol_B6_CKB_posedge = 'X') then
                 Latch_B(6) := 'X';
              else
                 Latch_B(6) := Latch_B(6);
              end if;
              if (Tviol_B7_CKB_posedge = 'X') then
                 Latch_B(7) := 'X';
              else
                 Latch_B(7) := Latch_B(7);
              end if;

              if (Tviol_DI0_0_CKB_posedge = 'X') then
                 Latch_DI0(0) := 'X';
              else
                 Latch_DI0(0) := Latch_DI0(0);
              end if;
              if (Tviol_DI1_0_CKB_posedge = 'X') then
                 Latch_DI0(1) := 'X';
              else
                 Latch_DI0(1) := Latch_DI0(1);
              end if;
              if (Tviol_DI2_0_CKB_posedge = 'X') then
                 Latch_DI0(2) := 'X';
              else
                 Latch_DI0(2) := Latch_DI0(2);
              end if;
              if (Tviol_DI3_0_CKB_posedge = 'X') then
                 Latch_DI0(3) := 'X';
              else
                 Latch_DI0(3) := Latch_DI0(3);
              end if;
              if (Tviol_DI4_0_CKB_posedge = 'X') then
                 Latch_DI0(4) := 'X';
              else
                 Latch_DI0(4) := Latch_DI0(4);
              end if;
              if (Tviol_DI5_0_CKB_posedge = 'X') then
                 Latch_DI0(5) := 'X';
              else
                 Latch_DI0(5) := Latch_DI0(5);
              end if;
              if (Tviol_DI6_0_CKB_posedge = 'X') then
                 Latch_DI0(6) := 'X';
              else
                 Latch_DI0(6) := Latch_DI0(6);
              end if;
              if (Tviol_DI7_0_CKB_posedge = 'X') then
                 Latch_DI0(7) := 'X';
              else
                 Latch_DI0(7) := Latch_DI0(7);
              end if;
              if (Tviol_DI8_0_CKB_posedge = 'X') then
                 Latch_DI0(8) := 'X';
              else
                 Latch_DI0(8) := Latch_DI0(8);
              end if;
              if (Tviol_DI0_1_CKB_posedge = 'X') then
                 Latch_DI1(0) := 'X';
              else
                 Latch_DI1(0) := Latch_DI1(0);
              end if;
              if (Tviol_DI1_1_CKB_posedge = 'X') then
                 Latch_DI1(1) := 'X';
              else
                 Latch_DI1(1) := Latch_DI1(1);
              end if;
              if (Tviol_DI2_1_CKB_posedge = 'X') then
                 Latch_DI1(2) := 'X';
              else
                 Latch_DI1(2) := Latch_DI1(2);
              end if;
              if (Tviol_DI3_1_CKB_posedge = 'X') then
                 Latch_DI1(3) := 'X';
              else
                 Latch_DI1(3) := Latch_DI1(3);
              end if;
              if (Tviol_DI4_1_CKB_posedge = 'X') then
                 Latch_DI1(4) := 'X';
              else
                 Latch_DI1(4) := Latch_DI1(4);
              end if;
              if (Tviol_DI5_1_CKB_posedge = 'X') then
                 Latch_DI1(5) := 'X';
              else
                 Latch_DI1(5) := Latch_DI1(5);
              end if;
              if (Tviol_DI6_1_CKB_posedge = 'X') then
                 Latch_DI1(6) := 'X';
              else
                 Latch_DI1(6) := Latch_DI1(6);
              end if;
              if (Tviol_DI7_1_CKB_posedge = 'X') then
                 Latch_DI1(7) := 'X';
              else
                 Latch_DI1(7) := Latch_DI1(7);
              end if;
              if (Tviol_DI8_1_CKB_posedge = 'X') then
                 Latch_DI1(8) := 'X';
              else
                 Latch_DI1(8) := Latch_DI1(8);
              end if;
              if (Tviol_DI0_2_CKB_posedge = 'X') then
                 Latch_DI2(0) := 'X';
              else
                 Latch_DI2(0) := Latch_DI2(0);
              end if;
              if (Tviol_DI1_2_CKB_posedge = 'X') then
                 Latch_DI2(1) := 'X';
              else
                 Latch_DI2(1) := Latch_DI2(1);
              end if;
              if (Tviol_DI2_2_CKB_posedge = 'X') then
                 Latch_DI2(2) := 'X';
              else
                 Latch_DI2(2) := Latch_DI2(2);
              end if;
              if (Tviol_DI3_2_CKB_posedge = 'X') then
                 Latch_DI2(3) := 'X';
              else
                 Latch_DI2(3) := Latch_DI2(3);
              end if;
              if (Tviol_DI4_2_CKB_posedge = 'X') then
                 Latch_DI2(4) := 'X';
              else
                 Latch_DI2(4) := Latch_DI2(4);
              end if;
              if (Tviol_DI5_2_CKB_posedge = 'X') then
                 Latch_DI2(5) := 'X';
              else
                 Latch_DI2(5) := Latch_DI2(5);
              end if;
              if (Tviol_DI6_2_CKB_posedge = 'X') then
                 Latch_DI2(6) := 'X';
              else
                 Latch_DI2(6) := Latch_DI2(6);
              end if;
              if (Tviol_DI7_2_CKB_posedge = 'X') then
                 Latch_DI2(7) := 'X';
              else
                 Latch_DI2(7) := Latch_DI2(7);
              end if;
              if (Tviol_DI8_2_CKB_posedge = 'X') then
                 Latch_DI2(8) := 'X';
              else
                 Latch_DI2(8) := Latch_DI2(8);
              end if;
              if (Tviol_DI0_3_CKB_posedge = 'X') then
                 Latch_DI3(0) := 'X';
              else
                 Latch_DI3(0) := Latch_DI3(0);
              end if;
              if (Tviol_DI1_3_CKB_posedge = 'X') then
                 Latch_DI3(1) := 'X';
              else
                 Latch_DI3(1) := Latch_DI3(1);
              end if;
              if (Tviol_DI2_3_CKB_posedge = 'X') then
                 Latch_DI3(2) := 'X';
              else
                 Latch_DI3(2) := Latch_DI3(2);
              end if;
              if (Tviol_DI3_3_CKB_posedge = 'X') then
                 Latch_DI3(3) := 'X';
              else
                 Latch_DI3(3) := Latch_DI3(3);
              end if;
              if (Tviol_DI4_3_CKB_posedge = 'X') then
                 Latch_DI3(4) := 'X';
              else
                 Latch_DI3(4) := Latch_DI3(4);
              end if;
              if (Tviol_DI5_3_CKB_posedge = 'X') then
                 Latch_DI3(5) := 'X';
              else
                 Latch_DI3(5) := Latch_DI3(5);
              end if;
              if (Tviol_DI6_3_CKB_posedge = 'X') then
                 Latch_DI3(6) := 'X';
              else
                 Latch_DI3(6) := Latch_DI3(6);
              end if;
              if (Tviol_DI7_3_CKB_posedge = 'X') then
                 Latch_DI3(7) := 'X';
              else
                 Latch_DI3(7) := Latch_DI3(7);
              end if;
              if (Tviol_DI8_3_CKB_posedge = 'X') then
                 Latch_DI3(8) := 'X';
              else
                 Latch_DI3(8) := Latch_DI3(8);
              end if;
              if (Tviol_DI0_4_CKB_posedge = 'X') then
                 Latch_DI4(0) := 'X';
              else
                 Latch_DI4(0) := Latch_DI4(0);
              end if;
              if (Tviol_DI1_4_CKB_posedge = 'X') then
                 Latch_DI4(1) := 'X';
              else
                 Latch_DI4(1) := Latch_DI4(1);
              end if;
              if (Tviol_DI2_4_CKB_posedge = 'X') then
                 Latch_DI4(2) := 'X';
              else
                 Latch_DI4(2) := Latch_DI4(2);
              end if;
              if (Tviol_DI3_4_CKB_posedge = 'X') then
                 Latch_DI4(3) := 'X';
              else
                 Latch_DI4(3) := Latch_DI4(3);
              end if;
              if (Tviol_DI4_4_CKB_posedge = 'X') then
                 Latch_DI4(4) := 'X';
              else
                 Latch_DI4(4) := Latch_DI4(4);
              end if;
              if (Tviol_DI5_4_CKB_posedge = 'X') then
                 Latch_DI4(5) := 'X';
              else
                 Latch_DI4(5) := Latch_DI4(5);
              end if;
              if (Tviol_DI6_4_CKB_posedge = 'X') then
                 Latch_DI4(6) := 'X';
              else
                 Latch_DI4(6) := Latch_DI4(6);
              end if;
              if (Tviol_DI7_4_CKB_posedge = 'X') then
                 Latch_DI4(7) := 'X';
              else
                 Latch_DI4(7) := Latch_DI4(7);
              end if;
              if (Tviol_DI8_4_CKB_posedge = 'X') then
                 Latch_DI4(8) := 'X';
              else
                 Latch_DI4(8) := Latch_DI4(8);
              end if;
              if (Tviol_DI0_5_CKB_posedge = 'X') then
                 Latch_DI5(0) := 'X';
              else
                 Latch_DI5(0) := Latch_DI5(0);
              end if;
              if (Tviol_DI1_5_CKB_posedge = 'X') then
                 Latch_DI5(1) := 'X';
              else
                 Latch_DI5(1) := Latch_DI5(1);
              end if;
              if (Tviol_DI2_5_CKB_posedge = 'X') then
                 Latch_DI5(2) := 'X';
              else
                 Latch_DI5(2) := Latch_DI5(2);
              end if;
              if (Tviol_DI3_5_CKB_posedge = 'X') then
                 Latch_DI5(3) := 'X';
              else
                 Latch_DI5(3) := Latch_DI5(3);
              end if;
              if (Tviol_DI4_5_CKB_posedge = 'X') then
                 Latch_DI5(4) := 'X';
              else
                 Latch_DI5(4) := Latch_DI5(4);
              end if;
              if (Tviol_DI5_5_CKB_posedge = 'X') then
                 Latch_DI5(5) := 'X';
              else
                 Latch_DI5(5) := Latch_DI5(5);
              end if;
              if (Tviol_DI6_5_CKB_posedge = 'X') then
                 Latch_DI5(6) := 'X';
              else
                 Latch_DI5(6) := Latch_DI5(6);
              end if;
              if (Tviol_DI7_5_CKB_posedge = 'X') then
                 Latch_DI5(7) := 'X';
              else
                 Latch_DI5(7) := Latch_DI5(7);
              end if;
              if (Tviol_DI8_5_CKB_posedge = 'X') then
                 Latch_DI5(8) := 'X';
              else
                 Latch_DI5(8) := Latch_DI5(8);
              end if;
              if (Tviol_DI0_6_CKB_posedge = 'X') then
                 Latch_DI6(0) := 'X';
              else
                 Latch_DI6(0) := Latch_DI6(0);
              end if;
              if (Tviol_DI1_6_CKB_posedge = 'X') then
                 Latch_DI6(1) := 'X';
              else
                 Latch_DI6(1) := Latch_DI6(1);
              end if;
              if (Tviol_DI2_6_CKB_posedge = 'X') then
                 Latch_DI6(2) := 'X';
              else
                 Latch_DI6(2) := Latch_DI6(2);
              end if;
              if (Tviol_DI3_6_CKB_posedge = 'X') then
                 Latch_DI6(3) := 'X';
              else
                 Latch_DI6(3) := Latch_DI6(3);
              end if;
              if (Tviol_DI4_6_CKB_posedge = 'X') then
                 Latch_DI6(4) := 'X';
              else
                 Latch_DI6(4) := Latch_DI6(4);
              end if;
              if (Tviol_DI5_6_CKB_posedge = 'X') then
                 Latch_DI6(5) := 'X';
              else
                 Latch_DI6(5) := Latch_DI6(5);
              end if;
              if (Tviol_DI6_6_CKB_posedge = 'X') then
                 Latch_DI6(6) := 'X';
              else
                 Latch_DI6(6) := Latch_DI6(6);
              end if;
              if (Tviol_DI7_6_CKB_posedge = 'X') then
                 Latch_DI6(7) := 'X';
              else
                 Latch_DI6(7) := Latch_DI6(7);
              end if;
              if (Tviol_DI8_6_CKB_posedge = 'X') then
                 Latch_DI6(8) := 'X';
              else
                 Latch_DI6(8) := Latch_DI6(8);
              end if;
              if (Tviol_DI0_7_CKB_posedge = 'X') then
                 Latch_DI7(0) := 'X';
              else
                 Latch_DI7(0) := Latch_DI7(0);
              end if;
              if (Tviol_DI1_7_CKB_posedge = 'X') then
                 Latch_DI7(1) := 'X';
              else
                 Latch_DI7(1) := Latch_DI7(1);
              end if;
              if (Tviol_DI2_7_CKB_posedge = 'X') then
                 Latch_DI7(2) := 'X';
              else
                 Latch_DI7(2) := Latch_DI7(2);
              end if;
              if (Tviol_DI3_7_CKB_posedge = 'X') then
                 Latch_DI7(3) := 'X';
              else
                 Latch_DI7(3) := Latch_DI7(3);
              end if;
              if (Tviol_DI4_7_CKB_posedge = 'X') then
                 Latch_DI7(4) := 'X';
              else
                 Latch_DI7(4) := Latch_DI7(4);
              end if;
              if (Tviol_DI5_7_CKB_posedge = 'X') then
                 Latch_DI7(5) := 'X';
              else
                 Latch_DI7(5) := Latch_DI7(5);
              end if;
              if (Tviol_DI6_7_CKB_posedge = 'X') then
                 Latch_DI7(6) := 'X';
              else
                 Latch_DI7(6) := Latch_DI7(6);
              end if;
              if (Tviol_DI7_7_CKB_posedge = 'X') then
                 Latch_DI7(7) := 'X';
              else
                 Latch_DI7(7) := Latch_DI7(7);
              end if;
              if (Tviol_DI8_7_CKB_posedge = 'X') then
                 Latch_DI7(8) := 'X';
              else
                 Latch_DI7(8) := Latch_DI7(8);
              end if;


            if (Tviol_WEB0_CKB_posedge = 'X') then
               Latch_WEB0 := 'X';
            else
               Latch_WEB0 := Latch_WEB0;
            end if;
            if (Tviol_WEB1_CKB_posedge = 'X') then
               Latch_WEB1 := 'X';
            else
               Latch_WEB1 := Latch_WEB1;
            end if;
            if (Tviol_WEB2_CKB_posedge = 'X') then
               Latch_WEB2 := 'X';
            else
               Latch_WEB2 := Latch_WEB2;
            end if;
            if (Tviol_WEB3_CKB_posedge = 'X') then
               Latch_WEB3 := 'X';
            else
               Latch_WEB3 := Latch_WEB3;
            end if;
            if (Tviol_WEB4_CKB_posedge = 'X') then
               Latch_WEB4 := 'X';
            else
               Latch_WEB4 := Latch_WEB4;
            end if;
            if (Tviol_WEB5_CKB_posedge = 'X') then
               Latch_WEB5 := 'X';
            else
               Latch_WEB5 := Latch_WEB5;
            end if;
            if (Tviol_WEB6_CKB_posedge = 'X') then
               Latch_WEB6 := 'X';
            else
               Latch_WEB6 := Latch_WEB6;
            end if;
            if (Tviol_WEB7_CKB_posedge = 'X') then
               Latch_WEB7 := 'X';
            else
               Latch_WEB7 := Latch_WEB7;
            end if;

            if (Tviol_CSBN_CKB_posedge = 'X') then
               Latch_CSBN := 'X';
            else
               Latch_CSBN := Latch_CSBN;
            end if;
	    

            -- write_memory_function
                -- write_memory_function
                B_i   := Latch_B;
                CSBN_i := Latch_CSBN;
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




                -- write byte0
                web0_cs    := WEB0_i&CSBN_i;
                case web0_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore0(to_integer(B_i)) := DI0_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO0_zd := (OTHERS => 'X');
                              DO0_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore0(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB0 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore0(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore0(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte1
                web1_cs    := WEB1_i&CSBN_i;
                case web1_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore1(to_integer(B_i)) := DI1_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO1_zd := (OTHERS => 'X');
                              DO1_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore1(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB1 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore1(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore1(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte2
                web2_cs    := WEB2_i&CSBN_i;
                case web2_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore2(to_integer(B_i)) := DI2_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO2_zd := (OTHERS => 'X');
                              DO2_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore2(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB2 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore2(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore2(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte3
                web3_cs    := WEB3_i&CSBN_i;
                case web3_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore3(to_integer(B_i)) := DI3_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO3_zd := (OTHERS => 'X');
                              DO3_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore3(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB3 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore3(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore3(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte4
                web4_cs    := WEB4_i&CSBN_i;
                case web4_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore4(to_integer(B_i)) := DI4_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO4_zd := (OTHERS => 'X');
                              DO4_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore4(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB4 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore4(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore4(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte5
                web5_cs    := WEB5_i&CSBN_i;
                case web5_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore5(to_integer(B_i)) := DI5_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO5_zd := (OTHERS => 'X');
                              DO5_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore5(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB5 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore5(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore5(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte6
                web6_cs    := WEB6_i&CSBN_i;
                case web6_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore6(to_integer(B_i)) := DI6_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO6_zd := (OTHERS => 'X');
                              DO6_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore6(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB6 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore6(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore6(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;

                -- write byte7
                web7_cs    := WEB7_i&CSBN_i;
                case web7_cs is
                   when "00" =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore7(to_integer(B_i)) := DI7_i;
                           -- Reduce error message --
                           flag_B := True_flg;
                           if ((B_i = LastCycleRAddress) and
                               ((NOW-Last_tc_ClkA_PosEdge) < Tr2w)) then
                              -- read and write the same address
                              assert FALSE report "** MEM_Warning: Read and Write the same address." severity WARNING;
                              DO7_zd := (OTHERS => 'X');
                              DO7_int <= TRANSPORT (OTHERS => 'X') AFTER TOH;
                           end if;
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           -- Reduce error message --
                           flag_B := False_flg;
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore7(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                       LastCycleWAddress_WEB7 := B_i;

                   when "11" |
                        "10" |
                        "1X" |
                        "1U" |
                        "1Z" |
                        "01" |
                        "X1" |
                        "U1" |
                        "Z1"   => -- do nothing
                   when others =>
                       if (AddressRangeCheck(B_i,flag_B) = True_flg) then
                           memoryCore7(to_integer(B_i)) := (OTHERS => 'X');
                       elsif (AddressRangeCheck(B_i,flag_B) = Range_flg) then
                           -- Reduce error message --
                           flag_B := False_flg;
                           -- do nothing
                       else
                           FOR i IN Words-1 downto 0 LOOP
                              memoryCore7(i) := (OTHERS => 'X');
                           END LOOP;
                       end if;
                end case;
                -- end write_memory_function
            -- end  write_memory_function
         end if;
       end if;

   end PROCESS;

end behavior;

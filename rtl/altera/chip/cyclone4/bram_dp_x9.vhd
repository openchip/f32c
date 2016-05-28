-- megafunction wizard: %RAM: 2-PORT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altsyncram 

-- ============================================================
-- File Name: bram_dp_x9.vhd
-- Megafunction Name(s):
-- 			altsyncram
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 14.1.0 Build 186 12/03/2014 SJ Web Edition
-- ************************************************************


--Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, the Altera Quartus II License Agreement,
--the Altera MegaCore Function License Agreement, or other 
--applicable license agreement, including, without limitation, 
--that your use is for the sole purpose of programming logic 
--devices manufactured by Altera and sold by Altera or its 
--authorized distributors.  Please refer to the applicable 
--agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY bram_dp_x9 IS
    PORT (
	clk_a, clk_b: in std_logic;
	ce_a, ce_b: in std_logic;
	we_a, we_b: in std_logic;
	addr_a, addr_b: in std_logic_vector(10 downto 0);
	data_in_a, data_in_b: in std_logic_vector(8 downto 0);
	data_out_a, data_out_b: out std_logic_vector(8 downto 0)
    );
END bram_dp_x9;

ARCHITECTURE SYN OF bram_dp_x9 IS
    SIGNAL sub_wire0: STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL sub_wire1: STD_LOGIC_VECTOR (8 DOWNTO 0);
BEGIN
    data_out_a <= sub_wire0(8 DOWNTO 0);
    data_out_b <= sub_wire1(8 DOWNTO 0);

    altsyncram_component : altsyncram
    GENERIC MAP (
	address_reg_b => "CLOCK1",
	clock_enable_input_a => "NORMAL",
	clock_enable_input_b => "NORMAL",
	clock_enable_output_a => "BYPASS",
	clock_enable_output_b => "BYPASS",
	indata_reg_b => "CLOCK1",
	intended_device_family => "Cyclone IV E",
	lpm_type => "altsyncram",
	maximum_depth => 2048,
	operation_mode => "BIDIR_DUAL_PORT",
	outdata_aclr_a => "NONE",
	outdata_aclr_b => "NONE",
	outdata_reg_a => "UNREGISTERED",
	outdata_reg_b => "UNREGISTERED",
	power_up_uninitialized => "FALSE",
	ram_block_type => "M9K",
	read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
	read_during_write_mode_port_b => "NEW_DATA_NO_NBE_READ",
	widthad_a => 11,
	widthad_b => 11,
	width_a => 9,
	width_b => 9,
	width_byteena_a => 1,
	width_byteena_b => 1,
	wrcontrol_wraddress_reg_b => "CLOCK1"
    )
    PORT MAP (
	address_a => addr_a,
	address_b => addr_b,
	clock0 => clk_a,
	clock1 => clk_b,
	clocken0 => ce_a,
	clocken1 => ce_b,
	data_a => data_in_a,
	data_b => data_in_b,
	wren_a => we_a,
	wren_b => we_b,
	q_a => sub_wire0,
	q_b => sub_wire1
    );
END SYN;

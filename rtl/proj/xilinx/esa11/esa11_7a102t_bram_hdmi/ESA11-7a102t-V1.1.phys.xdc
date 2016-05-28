# Generated by makeXDC.ulp developed by Sven Raiser, Tuebingen, Germany
#
# Board:     Y:/__ESA11/ESA11-7a102t/PCBcart 2015_11_11/ESA11-7a102t-V1.1.brd
# Part Name: FPGA
# Part pkg:  BGA484
# Created:   03.01.2016 20:19:53
# Edited: 2016-01-03, by emu

set_property CFGBVS VCCO [current_design]
#where value1 is either VCCO or GND

set_property CONFIG_VOLTAGE 3.3 [current_design]
#where value2 is the voltage provided to configuration bank 0

#
#	System Clock, Reset
#
set_property -dict {PACKAGE_PIN T4 IOSTANDARD LVDS_25} [get_ports i_100MHz_N]
set_property -dict {PACKAGE_PIN R4 IOSTANDARD LVDS_25} [get_ports i_100MHz_P]
#set_property -dict {PACKAGE_PIN W2 IOSTANDARD LVTTL DRIVE 4} [get_ports RESET_N]

#
#	LEDs
#
#set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVTTL DRIVE 4} [get_ports LED1]
#set_property -dict {PACKAGE_PIN W1 IOSTANDARD LVTTL DRIVE 4} [get_ports LED2]
#set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVTTL DRIVE 4} [get_ports LED3]

#
#	UARTs
#
#set_property -dict {PACKAGE_PIN AB7 IOSTANDARD LVTTL DRIVE 4} [get_ports UART1_CTS_N]
#set_property -dict {PACKAGE_PIN AB6 IOSTANDARD LVTTL DRIVE 4} [get_ports UART1_RTS_N]
set_property -dict {PACKAGE_PIN AB8 IOSTANDARD LVTTL DRIVE 4} [get_ports UART1_RXD]
set_property -dict {PACKAGE_PIN AA8 IOSTANDARD LVTTL DRIVE 4} [get_ports UART1_TXD]
#set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVTTL DRIVE 4} [get_ports UART2_CTS_N]
#set_property -dict {PACKAGE_PIN Y8 IOSTANDARD LVTTL DRIVE 4} [get_ports UART2_RTS_N]
#set_property -dict {PACKAGE_PIN W9 IOSTANDARD LVTTL DRIVE 4} [get_ports UART2_RXD]
#set_property -dict {PACKAGE_PIN V9 IOSTANDARD LVTTL DRIVE 4} [get_ports UART2_TXD]

#
#	VGA
#
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVTTL DRIVE 4} [get_ports VGA_BLANK_N]
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_BLUE[0]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_BLUE[1]}]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_BLUE[2]}]
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_BLUE[3]}]
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_BLUE[4]}]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_BLUE[5]}]
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_BLUE[6]}]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_BLUE[7]}]
set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVTTL DRIVE 4} [get_ports VGA_CLOCK_P]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_GREEN[0]}]
set_property -dict {PACKAGE_PIN AB20 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_GREEN[1]}]
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_GREEN[2]}]
set_property -dict {PACKAGE_PIN AA19 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_GREEN[3]}]
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_GREEN[4]}]
set_property -dict {PACKAGE_PIN AB18 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_GREEN[5]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_GREEN[6]}]
set_property -dict {PACKAGE_PIN AA18 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_GREEN[7]}]
set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVTTL DRIVE 4} [get_ports VGA_HSYNC]
set_property -dict {PACKAGE_PIN W22 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_RED[0]}]
set_property -dict {PACKAGE_PIN W21 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_RED[1]}]
set_property -dict {PACKAGE_PIN Y22 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_RED[2]}]
set_property -dict {PACKAGE_PIN Y21 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_RED[3]}]
set_property -dict {PACKAGE_PIN AB22 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_RED[4]}]
set_property -dict {PACKAGE_PIN AA21 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_RED[5]}]
set_property -dict {PACKAGE_PIN AB21 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_RED[6]}]
set_property -dict {PACKAGE_PIN AA20 IOSTANDARD LVTTL DRIVE 4} [get_ports {VGA_RED[7]}]
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVTTL DRIVE 4} [get_ports VGA_SYNC_N]
set_property -dict {PACKAGE_PIN T20 IOSTANDARD LVTTL DRIVE 4} [get_ports VGA_VSYNC]

#
#	PS/2
#
set_property -dict {PACKAGE_PIN N13 IOSTANDARD LVTTL DRIVE 4} [get_ports PS2_A_CLK]
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVTTL DRIVE 4} [get_ports PS2_A_DATA]
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVTTL DRIVE 4} [get_ports PS2_B_CLK]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVTTL DRIVE 4} [get_ports PS2_B_DATA]

#
#	EXPMODs
#
#set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD1[1]}]
#set_property -dict {PACKAGE_PIN Y6 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD1[2]}]
#set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD1[3]}]
#set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD1[4]}]
#set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD1[5]}]
#set_property -dict {PACKAGE_PIN U6 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD1[6]}]
#set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD1[7]}]
#set_property -dict {PACKAGE_PIN T6 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD1[8]}]
#set_property -dict {PACKAGE_PIN W4 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD2[1]}]
#set_property -dict {PACKAGE_PIN AA4 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD2[2]}]
#set_property -dict {PACKAGE_PIN AB3 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD2[3]}]
#set_property -dict {PACKAGE_PIN AB5 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD2[4]}]
#set_property -dict {PACKAGE_PIN AA3 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD2[5]}]
#set_property -dict {PACKAGE_PIN AA5 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD2[6]}]
#set_property -dict {PACKAGE_PIN AB2 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD2[7]}]
#set_property -dict {PACKAGE_PIN Y4 IOSTANDARD LVTTL DRIVE 4} [get_ports {EXPMOD2[8]}]

#
#	SD-Flash on FPGA
#
#set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_SD_CDET_N]
set_property -dict {PACKAGE_PIN C13 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_SD_CMD]
set_property -dict {PACKAGE_PIN C14 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_SD_D0]
#set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_SD_D1]
#set_property -dict {PACKAGE_PIN E13 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_SD_D2]
set_property -dict {PACKAGE_PIN E14 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_SD_D3]
set_property -dict {PACKAGE_PIN B13 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_SD_SCLK]

#
#	Digital Video
#
set_property -dict {PACKAGE_PIN T18 IOSTANDARD TMDS_33} [get_ports VID_CLK_N]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD TMDS_33} [get_ports VID_CLK_P]
set_property -dict {PACKAGE_PIN R19 IOSTANDARD TMDS_33} [get_ports VID_D_N[0]]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD TMDS_33} [get_ports VID_D_P[0]]
set_property -dict {PACKAGE_PIN U21 IOSTANDARD TMDS_33} [get_ports VID_D_N[1]]
set_property -dict {PACKAGE_PIN T21 IOSTANDARD TMDS_33} [get_ports VID_D_P[1]]
set_property -dict {PACKAGE_PIN V22 IOSTANDARD TMDS_33} [get_ports VID_D_N[2]]
set_property -dict {PACKAGE_PIN U22 IOSTANDARD TMDS_33} [get_ports VID_D_P[2]]
#set_property -dict {PACKAGE_PIN R17 IOSTANDARD TMDS_33 DRIVE 4} [get_ports VID_RSCL]
#set_property -dict {PACKAGE_PIN U20 IOSTANDARD TMDS_33 DRIVE 4} [get_ports VID_RSDA]

#
#	Ethernet PHY DP83848
#
#set_property -dict {PACKAGE_PIN W12 IOSTANDARD LVTTL DRIVE 4} [get_ports ETH1_COL]
#set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVTTL DRIVE 4} [get_ports ETH1_CRS]
#set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVTTL DRIVE 4} [get_ports ETH1_MDC]
#set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVTTL DRIVE 4} [get_ports ETH1_MDIO]
#set_property -dict {PACKAGE_PIN W11 IOSTANDARD LVTTL DRIVE 4} [get_ports ETH1_REF_CLK]
#set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVTTL DRIVE 4} [get_ports ETH1_RST_N]
#set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVTTL DRIVE 4} [get_ports {ETH1_RXD[0]}]
#set_property -dict {PACKAGE_PIN Y12 IOSTANDARD LVTTL DRIVE 4} [get_ports {ETH1_RXD[1]}]
#set_property -dict {PACKAGE_PIN AB12 IOSTANDARD LVTTL DRIVE 4} [get_ports {ETH1_RXD[2]}]
#set_property -dict {PACKAGE_PIN AA11 IOSTANDARD LVTTL DRIVE 4} [get_ports {ETH1_RXD[3]}]
#set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVTTL DRIVE 4} [get_ports ETH1_RX_CLK]
#set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVTTL DRIVE 4} [get_ports ETH1_RX_DV]
#set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVTTL DRIVE 4} [get_ports ETH1_RX_ERR]
#set_property -dict {PACKAGE_PIN AA9 IOSTANDARD LVTTL DRIVE 4} [get_ports {ETH1_TXD[0]}]
#set_property -dict {PACKAGE_PIN AB10 IOSTANDARD LVTTL DRIVE 4} [get_ports {ETH1_TXD[1]}]
#set_property -dict {PACKAGE_PIN AA10 IOSTANDARD LVTTL DRIVE 4} [get_ports {ETH1_TXD[2]}]
#set_property -dict {PACKAGE_PIN AB11 IOSTANDARD LVTTL DRIVE 4} [get_ports {ETH1_TXD[3]}]
#set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVTTL DRIVE 4} [get_ports ETH1_TX_CLK]
#set_property -dict {PACKAGE_PIN W10 IOSTANDARD LVTTL DRIVE 4} [get_ports ETH1_TX_EN]

#
#	PWM Audio
#
#set_property -dict {PACKAGE_PIN W20 IOSTANDARD LVTTL DRIVE 4} [get_ports AUDIO_L]
#set_property -dict {PACKAGE_PIN V20 IOSTANDARD LVTTL DRIVE 4} [get_ports AUDIO_R]

#
#	DisplayPort
#

#set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVTTL DRIVE 4} [get_ports DP_135MHZ_N]
#set_property -dict {PACKAGE_PIN F6 IOSTANDARD LVTTL DRIVE 4} [get_ports DP_135MHZ_P]
#set_property -dict {PACKAGE_PIN K14 IOSTANDARD LVTTL DRIVE 4} [get_ports DP_AUX_N]
#set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVTTL DRIVE 4} [get_ports DP_AUX_P]
#set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVTTL DRIVE 4} [get_ports DP_HPD]
#set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVTTL DRIVE 4} [get_ports LANE0_N]
#set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVTTL DRIVE 4} [get_ports LANE0_P]
#set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVTTL DRIVE 4} [get_ports LANE1_N]
#set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVTTL DRIVE 4} [get_ports LANE1_P]

#
#	USB Type C Connector
#
#set_property -dict {PACKAGE_PIN E10 IOSTANDARD LVTTL DRIVE 4} [get_ports USBC_135MHZ_N]
#set_property -dict {PACKAGE_PIN F10 IOSTANDARD LVTTL DRIVE 4} [get_ports USBC_135MHZ_P]
#set_property -dict {PACKAGE_PIN A10 IOSTANDARD LVTTL DRIVE 4} [get_ports USBC_RX1_N]
#set_property -dict {PACKAGE_PIN B10 IOSTANDARD LVTTL DRIVE 4} [get_ports USBC_RX1_P]
#set_property -dict {PACKAGE_PIN C9 IOSTANDARD LVTTL DRIVE 4} [get_ports USBC_RX2_N]
#set_property -dict {PACKAGE_PIN D9 IOSTANDARD LVTTL DRIVE 4} [get_ports USBC_RX2_P]
#set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVTTL DRIVE 4} [get_ports USBC_TX1_N]
#set_property -dict {PACKAGE_PIN B6 IOSTANDARD LVTTL DRIVE 4} [get_ports USBC_TX1_P]
#set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVTTL DRIVE 4} [get_ports USBC_TX2_N]
#set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVTTL DRIVE 4} [get_ports USBC_TX2_P]

#
#	USB Phy USB3340
#
#set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVTTL DRIVE 4} [get_ports USB_CLK]
#set_property -dict {PACKAGE_PIN AB17 IOSTANDARD LVTTL DRIVE 4} [get_ports {USB_D[0]}]
#set_property -dict {PACKAGE_PIN AA16 IOSTANDARD LVTTL DRIVE 4} [get_ports {USB_D[1]}]
#set_property -dict {PACKAGE_PIN AB16 IOSTANDARD LVTTL DRIVE 4} [get_ports {USB_D[2]}]
#set_property -dict {PACKAGE_PIN AA15 IOSTANDARD LVTTL DRIVE 4} [get_ports {USB_D[3]}]
#set_property -dict {PACKAGE_PIN AB15 IOSTANDARD LVTTL DRIVE 4} [get_ports {USB_D[4]}]
#set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVTTL DRIVE 4} [get_ports {USB_D[5]}]
#set_property -dict {PACKAGE_PIN AA14 IOSTANDARD LVTTL DRIVE 4} [get_ports {USB_D[6]}]
#set_property -dict {PACKAGE_PIN AB13 IOSTANDARD LVTTL DRIVE 4} [get_ports {USB_D[7]}]
#set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVTTL DRIVE 4} [get_ports USB_DIR]
#set_property -dict {PACKAGE_PIN Y13 IOSTANDARD LVTTL DRIVE 4} [get_ports USB_NXT]
#set_property -dict {PACKAGE_PIN AA13 IOSTANDARD LVTTL DRIVE 4} [get_ports USB_OC]
#set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVTTL DRIVE 4} [get_ports USB_RESET]
#set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVTTL DRIVE 4} [get_ports USB_STP]

#
#	USB on SPI MAX3421
#
#set_property -dict {PACKAGE_PIN Y3 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_USB2/3_INT]
#set_property -dict {PACKAGE_PIN Y7 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_USB2/3_MISO]
#set_property -dict {PACKAGE_PIN W7 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_USB2/3_MOSI]
#set_property -dict {PACKAGE_PIN V7 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_USB2/3_RESET_N]
#set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_USB2/3_SCLK]
#set_property -dict {PACKAGE_PIN AA6 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_USB2/3_SS_N]

#
#	Atmel MCU Communication
#
#set_property -dict {PACKAGE_PIN Y1 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_CCLK/CONF_DCLK]
#set_property -dict {PACKAGE_PIN L12 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_CCLK_INTERNAL]
#set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_CSO]
#set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_D02]
#set_property -dict {PACKAGE_PIN R21 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_D03]
#set_property -dict {PACKAGE_PIN G11 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_DONE/CONF_DONE]
#set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_INIT/CONF_NCONFIG]

#set_property -dict {PACKAGE_PIN AA1 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_MISO/CONF_DATA0]
#set_property -dict {PACKAGE_PIN R22 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_MISO_INTERNAL]
#set_property -dict {PACKAGE_PIN P22 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_MOSI]
#set_property -dict {PACKAGE_PIN N12 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_PROG/CONF_NSTATUS]

#set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVTTL DRIVE 4} [get_ports MCU_SD_CMD/MOSI]
#set_property -dict {PACKAGE_PIN V3 IOSTANDARD LVTTL DRIVE 4} [get_ports MCU_SD_D0/MISO]
#set_property -dict {PACKAGE_PIN AB1 IOSTANDARD LVTTL DRIVE 4} [get_ports MCU_SD_D3/SS1]
#set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVTTL DRIVE 4} [get_ports MCU_SD_SCLK//SCK]
#set_property -dict {PACKAGE_PIN F8 IOSTANDARD LVTTL DRIVE 4} [get_ports N$118]


#set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVTTL DRIVE 4} [get_ports SS2/FPGA]
#set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVTTL DRIVE 4} [get_ports SS3/OSD]
#set_property -dict {PACKAGE_PIN Y2 IOSTANDARD LVTTL DRIVE 4} [get_ports SS4/SD_DIRECT]



#
#	Other, never used, but ...
#
#set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_TCK]
#set_property -dict {PACKAGE_PIN R13 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_TDI]
#set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_TDO]
#set_property -dict {PACKAGE_PIN T13 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_TMS]
#set_property -dict {PACKAGE_PIN U10 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_M1]
#set_property -dict {PACKAGE_PIN U9 IOSTANDARD LVTTL DRIVE 4} [get_ports FPGA_M2]

#set_property -dict {PACKAGE_PIN N3 IOSTANDARD LVTTL DRIVE 4} [get_ports VREF_DDR]
#set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVTTL DRIVE 4} [get_ports VREF_DDR]

#
#	Other constraints ........................................................
#

create_clock -name {clk100}  [get_ports {i_100MHz_P}] -period {10.000}  -add 
#
#   eof
#
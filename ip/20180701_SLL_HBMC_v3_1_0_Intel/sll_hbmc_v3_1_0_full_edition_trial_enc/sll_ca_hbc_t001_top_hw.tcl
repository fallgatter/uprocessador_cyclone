# ************************************************************************
# *
# * SYNAPTIC LABORATORIES CONFIDENTIAL
# * ----------------------------------
# *
# *  (c) 2017 Synaptic Laboratories Limited
# *  All Rights Reserved.
# *
# * NOTICE:  All information contained herein is, and remains
# * the property of Synaptic Laboratories Limited and its suppliers,
# * if any.  The intellectual and technical concepts contained
# * herein are proprietary to Synaptic Laboratories Limited
# * and its suppliers and may be covered by U.S. and Foreign Patents,
# * patents in process, and are protected by trade secret or copyright law.
# * Dissemination of this information or reproduction of this material
# * is strictly forbidden unless prior written permission is obtained
# * from Synaptic Laboratories Limited
# *
# * Modification of this file is strictly forbidden unless prior written
# * permission is obtained from Synaptic Laboratories Limited
#
#########################################################################################################################

#
# DO NOT MODIFY
#

#
# Hyperbus_Controller "S/Labs Hyperbus Controller"
#  20175.02.10.15:04:00
#

#
# request TCL package from ACDS 15.0
#
package require -exact qsys 15.0
package require fileutil

#---------------------------------------------------------
#set initial parameters
#---------------------------------------------------------
set eval_board    alt_c10_dev2  ;# ebv_max10_dev1, _dev2, _dev3, alt_c10_dev2, custom_board

#---------------------------------------------------------
# source include file for procedures used in this script
#---------------------------------------------------------
source ./sll_ca_hbc_t001_top_hw_proc.tcl

#---------------------------------------------------------
# module S/Labs HyperBus Controller
#---------------------------------------------------------
set_module_property NAME          sll_hyperbus_controller_top
set_module_property DISPLAY_NAME "S/Labs HyperBus Memory Controller (HBMC) Full Features"   ;
set_module_property DESCRIPTION  "\
    S/Labs HyperBus Memory Controller (HBMC) provisions a single\
        HyperBus memory channel with support for up to 2 HyperBus memory devices."  ;
set_module_property AUTHOR       "Synaptic Laboratories Limited (S/Labs)"
set_module_property GROUP        "Synaptic Labs/Memory/HyperBus"

set_module_property VERSION 3.1.0  ;

# Indicates whether you can edit the IP component in the Component Editor.
#
set_module_property EDITABLE true

# An IP component which is marked as internal does not appear in the IP Catalog.
# This feature allows you to hide the sub-IP- components of a larger composed IP component.
#
set_module_property INTERNAL false

# A path to an icon to display in the IP component's parameter editor.
#
# set_module_property ICON_PATH

# For composed IP components created using a _hw.tcl file that include children that are
# memory-mapped slaves, specifies whether the children's addresses are visible to downstream software tools.
# When true, the children's address are not visible. When false, the children's addresses are visible.
#
set_module_property OPAQUE_ADDRESS_MAP true

# If true, this IP component is implemented by HDL provided by the IP component.
# If false, the IP component will create exported interfaces allowing the implementation to be connected in the parent.
#
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true

# A list of device family supported by this IP component.
#
# set_module_property SUPPORTED_DEVICE_FAMILIES

#
set_module_property   REPORT_HIERARCHY            false
set_module_property   REPORT_TO_TALKBACK          false
set_module_property   ALLOW_GREYBOX_GENERATION    false

#----------------------------------------------------
# file sets
#----------------------------------------------------
add_fileset           QUARTUS_SYNTH     QUARTUS_SYNTH                       synth_fileset_callback
set_fileset_property  QUARTUS_SYNTH     TOP_LEVEL                           sll_hyperbus_controller_top
set_fileset_property  QUARTUS_SYNTH     ENABLE_RELATIVE_INCLUDE_PATHS       false
set_fileset_property  QUARTUS_SYNTH     ENABLE_FILE_OVERWRITE_MODE          true

add_fileset           SIM_VERILOG       SIM_VERILOG                         sim_fileset_callback
set_fileset_property  SIM_VERILOG       TOP_LEVEL                           sll_hyperbus_controller_top
set_fileset_property  SIM_VERILOG       ENABLE_RELATIVE_INCLUDE_PATHS       false
set_fileset_property  SIM_VERILOG       ENABLE_FILE_OVERWRITE_MODE          true

add_fileset           SIM_VHDL       SIM_VHDL                               sim_fileset_callback
set_fileset_property  SIM_VHDL       TOP_LEVEL                              sll_hyperbus_controller_top
set_fileset_property  SIM_VHDL       ENABLE_RELATIVE_INCLUDE_PATHS          false
set_fileset_property  SIM_VHDL       ENABLE_FILE_OVERWRITE_MODE             true

#######################################################################################################################
# Information Tab
#######################################################################################################################
#

add_display_item        ""          "Info"                                          GROUP tab

add_display_item        "Info"      "Synaptic Laboratories Limited (S/Labs)"        GROUP ""

add_display_item        "Info"      "License And Confidentiality Agreement"         GROUP ""
add_display_item        "Info"      "S/Labs HyperBus Memory Controller (HBMC) IP"   GROUP ""
add_display_item        "Info"      "Installation of License Key"                   GROUP ""
add_display_item        "Info"      "Copyright Notice"                              GROUP ""

add_display_item        "Synaptic Laboratories Limited (S/Labs)"                    GUI_INFO_LOGO       ICON  "sll_logo.png"

add_display_item    "License And Confidentiality Agreement"   GUI_INFO_LICENSE                             TEXT    "<html>\
    <p><b>By Using S/Labs HyperBus Memory Controller (HBMC) IP,  <br/>\
    You acknowledge that You have read the accompanying  <br/>\
    License and Confidentiality Agreement, understand it, <br/>
    accept it and agree to be bound by all its Terms.</b></p></html>"

add_display_item        "S/Labs HyperBus Memory Controller (HBMC) IP"                 GUI_INFO_ABOUT      TEXT  "<html>\
    <p>Synaptic Laboratories Ltd (S/Labs) HyperBus Memory Controller (HBMC) provisions a <br/>\
    single HyperBus memory channel with support for up to 2 HyperBus memory devices.</p>\
    <p><br/>You can instantiate multiple instances of S/Labs HBMC IP in your design.</p>\
    <p><br/>This version of S/Labs HBMC IP supports both HyperRAM and HyperFlash devices.</p>\
    <p><br/>Visit <a href=\"www.synaptic-labs.com\">www.synaptic-labs.com</a> to access free documentation, free reference designs and <br/>\
    to download the latest version of this IP.</p></html>"

add_display_item    "Installation of License Key"   GUI_INFO_INSTALL_KEY                             TEXT    "<html>\
    <p>The accompanying License Credential with embedded License Key provides a description <br/>\
    of the License Type, Target Application, Supported Device/s, and what capabilities   <br/>\
    have been enabled/disabled under Your License. The full terms and conditions contained<br/>\
    in the License Credential with embedded License Key are included by reference into the<br/>\
    License and Confidentiality Agreement. <br/>\
    <p><br/>Your License Credential with embedded License Key is typically found:  <br/>\
    (a) in the HBMC IP folder; or (b) as an attachment sent to you by e-mail.</p>\
    <p><br/>That License Key must be installed (copied and pasted) in Quartus Prime to synthesise designs<br/>\
    using this HBMC IP. If required, search ''Intel FPGA Software Installation and Licensing Quick Start'' <br/>\
    on the Internet to find instructions on how to install License Keys into Quartus Prime.</p></html>"

add_display_item    "Copyright Notice"   GUI_INFO_COPYRIGHT                             TEXT    "<html>\
    <p><b>(c) 2018 Synaptic Laboratories Limited. All Rights Reserved. </b></p>\
    <p><br/>The intellectual and technical concepts contained herein are the proprietary property of<br/>
    Synaptic Laboratories Limited and its suppliers and may be covered by U.S. and <br/>
    Foreign Patents, patents in process, and are protected by confidentiality agreements, <br/>
    trade secret or copyright law. Reproduction of this material is strictly forbidden unless <br/>
    prior written permission is obtained from Synaptic Laboratories Limited. </p></html>"

#######################################################################################################################
# Master Configuration Tab
#######################################################################################################################
#
add_display_item ""                                         "Master Configuration"                              GROUP tab

add_display_item "Master Configuration"                     "HyperBus Channel Configuration"                    GROUP ""
add_display_item "Master Configuration"                     "HyperBus IO Configuration"                         GROUP ""
add_display_item "Master Configuration"                     "HyperBus RWDS Configuration"                       GROUP ""
add_display_item "Master Configuration"                     "Avalon Target Interface Configuration"             GROUP ""
add_display_item "Master Configuration"                     "Derived Parameters"                                GROUP COLLAPSED

add_display_item "HyperBus Channel Configuration"           GUI_FPGA_DEV_BOARD                    PARAMETER "" ;# FPGA board
add_display_item "HyperBus Channel Configuration"           NUM_CHIPSELECTS                       PARAMETER "" ;# Number of Chip Select
add_display_item "HyperBus Channel Configuration"           GUI_NUM_CHIPSELECTS                   PARAMETER "" ;# Number of Chip Select

add_display_item "HyperBus IO Configuration"                GUI_DQIN_MODE                         PARAMETER "" ;# FPGA board
add_display_item "HyperBus RWDS Configuration"              GUI_DUAL_RWDS_PIN                     PARAMETER "" ;# FPGA board

add_display_item "Avalon Target Interface Configuration"    GUI_INCLUDE_REG_AVALON                PARAMETER "" ;# Include register Avalon port


proc_add_parameter     GUI_FPGA_DEV_BOARD String ${eval_board} "" false "HyperBus Channel Configuration"
set_parameter_property GUI_FPGA_DEV_BOARD DISPLAY_NAME  "FPGA board type"

set_parameter_property GUI_FPGA_DEV_BOARD ALLOWED_RANGES \
     {"ebv_max10_dev1:Devboards - HyperMAX 10M25 (HyperFlash and HyperRAM)" \
      "ebv_max10_dev2:Devboards - HyperMAX 10M25 (HyperRAM)" \
      "ebv_max10_dev3:Devboards - HyperMAX 10M25 (HyperFlash)" \
      "devboards_hypermax50_dev1:Devboards - HyperMAX 10M50 (HyperFlash and HyperRAM)" \
      "devboards_hypermax50_dev2:Devboards - HyperMAX 10M50 (HyperRAM)" \
      "devboards_hypermax50_dev3:Devboards - HyperMAX 10M50 (HyperFlash)" \
      "alt_c10_dev2:Intel - Cyclone 10 LP Evaluation Kit (HyperRAM)" \
      "custom_board: Custom - Proprietary board (Manual memory configuration)"
     }

set_parameter_property GUI_FPGA_DEV_BOARD DESCRIPTION "
    S/Labs has ported our HBMC to provide improved support for several\
    commercial off the shelf (COTS) FPGA Development Boards.\
    Please select the board type and memory configuration for this project."


###==========================================================
### Start Backwards compatability v2.12
###
proc_add_parameter          NUM_CHIPSELECTS         INTEGER 2 "" false "HyperBus Channel Configuration"
set_parameter_property      NUM_CHIPSELECTS         DISPLAY_NAME  "Number of HyperBus chip selects"
set_parameter_property      NUM_CHIPSELECTS         ALLOWED_RANGES {1 2}
set_parameter_property      NUM_CHIPSELECTS         ENABLED        false
set_parameter_property      NUM_CHIPSELECTS         DESCRIPTION \
    "The number of chip selects signals driven by this HBMC is always 2.\
    Chip selects wih no devices will be constantly driven by the HBMC as inactive to ensure correct operation."

###
### End Backwards compatability
###==========================================================


proc_add_parameter          GUI_NUM_CHIPSELECTS         INTEGER 2 "" true "HyperBus Channel Configuration"
set_parameter_property      GUI_NUM_CHIPSELECTS         DISPLAY_NAME  "Number of HyperBus chip selects"
set_parameter_property      GUI_NUM_CHIPSELECTS         ALLOWED_RANGES {1 2}
set_parameter_property      GUI_NUM_CHIPSELECTS         DESCRIPTION \
    "The number of chip selects signals driven by this HBMC is always 2.\
     Chip selects wih no devices will be constantly driven by the HBMC as inactive to ensure correct operation."
set_parameter_property      GUI_NUM_CHIPSELECTS         ENABLED        false

proc_add_parameter      GUI_DUAL_RWDS_PIN BOOLEAN false "" false  "HyperBus RWDS Configuration"
set_parameter_property  GUI_DUAL_RWDS_PIN DISPLAY_NAME   "Select RWDS Pin configuration"
set_parameter_property  GUI_DUAL_RWDS_PIN ALLOWED_RANGES {"false: Single RWDS signal port" }


proc_add_parameter      GUI_DQIN_MODE INTEGER 8 "" false  "HyperBus IO Configuration"
set_parameter_property  GUI_DQIN_MODE DISPLAY_NAME   "Select DQIN Pin configuration"
set_parameter_property  GUI_DQIN_MODE ALLOWED_RANGES {8}
set_parameter_property  GUI_DQIN_MODE ALLOWED_RANGES {"8 : Direct connection" }
set_parameter_property  GUI_DQIN_MODE      ENABLED        true


###==========================================================
### Start Backwards compatability v2.12
###
proc_add_parameter          GUI_INCLUDE_REG_AVALON      INTEGER false "" false "Avalon Target Interface Configuration"
set_parameter_property      GUI_INCLUDE_REG_AVALON      DISPLAY_NAME  "Avalon control port"
set_parameter_property      GUI_INCLUDE_REG_AVALON      ALLOWED_RANGES {"0:Disabled"}
set_parameter_property      GUI_INCLUDE_REG_AVALON      DESCRIPTION   "\
      Add an Avalon Target Interface to provide access to the configuration registers of this HMBC instance.\
    This capability is currently disabled.\
    Please contact S/Labs if you need to enable this capability to provide greater run-time control of the HBMC configuration."
set_parameter_property  GUI_INCLUDE_REG_AVALON      VISIBLE        true

###
### End Backwards compatability
###==========================================================

#-------------------------------------------------------------------------------
# CLOCK and PLL configuration Tab
#-------------------------------------------------------------------------------
add_display_item ""                                     "Clock and PLL Configuration"           GROUP tab

add_display_item "Clock and PLL Configuration"          "Clock Configuration"                   GROUP ""
add_display_item "Clock and PLL Configuration"          "Selected Configuration - Bandwidth"    GROUP ""
add_display_item "Clock and PLL Configuration"          "Selected Configuration - Clocks"       GROUP ""
add_display_item "Clock and PLL Configuration"          "Clock Introspection Report"            GROUP ""
add_display_item "Clock and PLL Configuration"          "About the PLL Integrated In This HBMC Instance"      GROUP ""


add_display_item "Clock Configuration"                  GUI_INTEGRATED_PLL_ENABLED          PARAMETER ""
add_display_item "Clock Configuration"                  GUI_INPUT_FREQ_IN_MHZ_SC            PARAMETER ""
add_display_item "Clock Configuration"                  GUI_SINGLE_CLK_OP                   PARAMETER "" ;# Single Clock operation
add_display_item "Clock Configuration"                  GUI_IAVS0_AUTO_CLOCK_RATE           PARAMETER "" ;# MUST BE DISPLAYED UNDER THE GUI_SINGLE_CLK_OP
add_display_item "Clock Configuration"                  GUI_HBUS0_AUTO_CLOCK_RATE           PARAMETER "" ;# MUST BE DISPLAYED UNDER THE GUI_SINGLE_CLK_OP

###==========================================================
### Start Backwards compatability v2.12
###
add_display_item "Clock Configuration"                  HYPERBUS_FREQ_IN_MHZ                PARAMETER ""  ;# MANUAL VARIABLE
add_display_item "Clock Configuration"                  IAVS_FREQ_OUT_IN_MHZ                PARAMETER ""  ;# MANUAL VARIABLE
###
### End Backwards compatability
###==========================================================

add_display_item "Selected Configuration - Clocks"      GUI_HYPERBUS_FREQ_IN_MHZ_SC         PARAMETER ""
add_display_item "Selected Configuration - Clocks"      GUI_AV_OUT_FREQ_IN_MHZ_SC           PARAMETER ""

#Select between External and INternal  PLL
proc_add_parameter     GUI_INTEGRATED_PLL_ENABLED INTEGER 1 "" false "Clock Configuration"
set_parameter_property GUI_INTEGRATED_PLL_ENABLED ALLOWED_RANGES   {"0:External PLL" "1:Internal PLL" }
set_parameter_property GUI_INTEGRATED_PLL_ENABLED DISPLAY_NAME  "PLL Configuration"
set_parameter_property GUI_INTEGRATED_PLL_ENABLED VISIBLE        true
set_parameter_property GUI_INTEGRATED_PLL_ENABLED ENABLED        true
set_parameter_property GUI_INTEGRATED_PLL_ENABLED DESCRIPTION   "Select between Integrated(internal) or external PLL implementation"


## INTEGRATED CLOCK -> CONTROLLED PY HBMC Instantiation.
proc_add_parameter     GUI_INPUT_FREQ_IN_MHZ_SC INTEGER 50 megahertz false "Clock Configuration"
set_parameter_property GUI_INPUT_FREQ_IN_MHZ_SC DISPLAY_NAME  "Input clock (in_clk) frequency"
set_parameter_property GUI_INPUT_FREQ_IN_MHZ_SC ALLOWED_RANGES {20 25 50}  ;# Fix the setting for now.
set_parameter_property GUI_INPUT_FREQ_IN_MHZ_SC VISIBLE        true
set_parameter_property GUI_INPUT_FREQ_IN_MHZ_SC ENABLED        false
set_parameter_property GUI_INPUT_FREQ_IN_MHZ_SC DESCRIPTION   "\
    This field indicates the frequency of the  in_clk  signal.\
    This value must be set manually by the user for custom/proprietary boards. \
    The  in_clk  signal is normally connected directly to a FPGA pin driven by an external clock source.\
    The HMBC supplies the  in_clk  signal as input to the PLL instantiated within this HBMC instantiation.\
    Please contact S/Labs if you require support for other clock speeds."

## NO INTEGRATED CLOCK -> CLOCK INTROSPECTION

proc_add_parameter      GUI_IAVS0_AUTO_CLOCK_RATE       LONG 0 hertz true   "Clock Configuration"
set_parameter_property  GUI_IAVS0_AUTO_CLOCK_RATE       DISPLAY_NAME        "i_iavs0_clk frequency is"
set_parameter_property  GUI_IAVS0_AUTO_CLOCK_RATE       VISIBLE             false
set_parameter_property  GUI_IAVS0_AUTO_CLOCK_RATE       SYSTEM_INFO_TYPE    CLOCK_RATE
set_parameter_property  GUI_IAVS0_AUTO_CLOCK_RATE       SYSTEM_INFO_ARG     i_iavs0_clk

proc_add_parameter      GUI_HBUS0_AUTO_CLOCK_RATE       LONG 0 hertz true   "Clock Configuration"
set_parameter_property  GUI_HBUS0_AUTO_CLOCK_RATE       DISPLAY_NAME        "i_hbus_clk_0 frequency is"
set_parameter_property  GUI_HBUS0_AUTO_CLOCK_RATE       VISIBLE             false
set_parameter_property  GUI_HBUS0_AUTO_CLOCK_RATE       SYSTEM_INFO_TYPE    CLOCK_RATE
set_parameter_property  GUI_HBUS0_AUTO_CLOCK_RATE       SYSTEM_INFO_ARG     i_hbus_clk_0

###
# Open Cores only supports  single clock
#
proc_add_parameter     GUI_SINGLE_CLK_OP BOOLEAN false "" false  "Clock Configuration"
set_parameter_property GUI_SINGLE_CLK_OP ALLOWED_RANGES {"true:One clock-One clock for all the Avalon ports and the HyperBus channel" \
                                                         "false:Two clocks-One clock for all the Avalon ports. One clock for the HyperBus channel" }

set_parameter_property GUI_SINGLE_CLK_OP DISPLAY_NAME  "Avalon and HyperBus clock configuration"
set_parameter_property GUI_SINGLE_CLK_OP DESCRIPTION   "\
    The 'One clock for all the Avalon ports and the HyperBus channel' configuration has the lowest circuit area and is well suited for severely resource constrained designs.\
    The 'One clock for all the Avalon ports. One clock for the HyperBus channel' configuration employs a dual clock configuration. \
    In this configuration, S/Labs HBMC implements low-area, high-bandwidth, clock-crossing logic between the Avalon bus target and HyperBus Memory channel."

##


# This variable is used to set the HyperBus frequency.
#
proc_add_parameter      HYPERBUS_FREQ_IN_MHZ   INTEGER   150   megahertz   false   "Clock Configuration"
set_parameter_property  HYPERBUS_FREQ_IN_MHZ   DISPLAY_NAME                        "HyperBus channel clock frequency"
set_parameter_property  HYPERBUS_FREQ_IN_MHZ   DESCRIPTION    "\
  This is the clock frequency used to drive the HyperBus memory channel.\
  The wire-speed bandwidth of the 8-bit wide Double Data Rate (DDR) HyperBus memory channel is: 2xMHz bytes per second."

# THIS VARIABLE SETS THE AVALON SHARED BUS SPEED, AND CAN SOMETIMES SET THE HYPERBUS FREQUENCY
#
proc_add_parameter      IAVS_FREQ_OUT_IN_MHZ   INTEGER   100   megahertz   false   "Clock Configuration"
set_parameter_property  IAVS_FREQ_OUT_IN_MHZ   DISPLAY_NAME                        "Shared Avalon clock frequency"
set_parameter_property  IAVS_FREQ_OUT_IN_MHZ   DESCRIPTION                         "\
  This is the clock frequency used to drive all the Avalon ports."



###
### End Backwards compatability
###==========================================================


## CLOCKS REPORT
#
proc_add_parameter     GUI_AV_OUT_FREQ_IN_MHZ_SC INTEGER 100 megahertz true "Selected Configuration - Clocks"
set_parameter_property GUI_AV_OUT_FREQ_IN_MHZ_SC DISPLAY_NAME   "Avalon output clock (av_out_clk) frequency"
set_parameter_property GUI_AV_OUT_FREQ_IN_MHZ_SC VISIBLE        true
set_parameter_property GUI_AV_OUT_FREQ_IN_MHZ_SC ENABLED            false
set_parameter_property GUI_AV_OUT_FREQ_IN_MHZ_SC DESCRIPTION        "\
    This is the clock frequency that the PLL in this HBMC instance generates for the clock source o_av_out_clk.\
    The o_av_out_clk is used to drive the avalon bus. It must also be connected to the i_iavs0_clk clock sink."


proc_add_parameter     GUI_HYPERBUS_FREQ_IN_MHZ_SC INTEGER 100 megahertz true "Selected Configuration - Clocks"
set_parameter_property GUI_HYPERBUS_FREQ_IN_MHZ_SC DISPLAY_NAME     "HyperBus channel clock frequency"
set_parameter_property GUI_HYPERBUS_FREQ_IN_MHZ_SC VISIBLE          true
set_parameter_property GUI_HYPERBUS_FREQ_IN_MHZ_SC ENABLED          false
set_parameter_property GUI_HYPERBUS_FREQ_IN_MHZ_SC DESCRIPTION      "\
    This is the clock frequency used to drive just the HyperBus memory channel.\
    The peak sustainable bandwidth of the 8-bit wide Double Data Rate (DDR)\
    HyperBus memory channel is: 2xMHz bytes per second."


#-------------------------------------------------------------------------------
#IAVS0 configuration
#-------------------------------------------------------------------------------
proc_add_iavs_config IAVS0


#-------------------------------------------------------------------------------
# Add Hyperbus devices
#-------------------------------------------------------------------------------

for {set dev 0} {$dev < 2} {incr dev} {

    # Instantiate Manual Configuration
    #   The Value of the Manual configuration will be loaded into the AUTO configuration as required.
    #
    add_display_item "HyperBus Channel Configuration"  GUI_DEV${dev}_TYPE_MAN  PARAMETER ""

    proc_add_parameter     GUI_DEV${dev}_TYPE_MAN String "none" "" false "HyperBus Channel Configuration"
    set_parameter_property GUI_DEV${dev}_TYPE_MAN DISPLAY_NAME  "HyperBus device on chip select ${dev}"
    set_parameter_property GUI_DEV${dev}_TYPE_MAN DESCRIPTION   \
        "Select the specific type of HyperBus device connected to this chip select signal."
    set_parameter_property GUI_DEV${dev}_TYPE_MAN ENABLED        true

    set_parameter_property GUI_DEV${dev}_TYPE_MAN ALLOWED_RANGES \
     {"none:none"\
     "s26ks128s:S26KS128S (Cypress) HyperFlash 166 MHz 128 Mbit"\
      "s26ks256s:S26KS512S (Cypress) HyperFlash 166 MHz 256 Mbit"\
      "s26ks512s:S26KS512S (Cypress) HyperFlash 166 MHz 512 Mbit"\
      "s27ks0641:S27KS0641 (Cypress) HyperRAM 166 MHz 64 Mbit"\
      "is26ks128s:IS26KS128S (ISSI) HyperFlash 166 MHz 128 Mbit"\
      "is26ks256s:IS26KS256S (ISSI) HyperFlash 166 MHz 256 Mbit"\
      "is26ks512s:IS26KS512S (ISSI) HyperFlash 166 MHz 512 Mbit"\
      "is66wvh8m8:IS66WVH8M8 (ISSI) HyperRAM 166 MHz 64 Mbit"\
      "is66wvh16m8:S70KS1281 (Cypress) / IS66WVH16M8 (ISSI) HyperRAM 166 MHz 128 Mbit"\
    }

    # Instantiate AUTO Configuration
    #
    add_display_item "HyperBus Channel Configuration"  GUI_DEV${dev}_TYPE PARAMETER ""

    proc_add_parameter     GUI_DEV${dev}_TYPE String "none" "" true "HyperBus Channel Configuration"
    set_parameter_property GUI_DEV${dev}_TYPE DISPLAY_NAME  "HyperBus device on chip select ${dev}"
    set_parameter_property GUI_DEV${dev}_TYPE DESCRIPTION   \
        "Enables the specific type of HyperBus device connected to this chip select for this known COTS board."
    set_parameter_property GUI_DEV${dev}_TYPE ENABLED        false
    set_parameter_property GUI_DEV${dev}_TYPE VISIBLE        true
     set_parameter_property GUI_DEV${dev}_TYPE ALLOWED_RANGES \
      {"none:none"\
      "s26ks128s:S26KS128S (Cypress) HyperFlash 166 MHz 128 Mbit"\
      "s26ks256s:S26KS512S (Cypress) HyperFlash 166 MHz 256 Mbit"\
      "s26ks512s:S26KS512S (Cypress) HyperFlash 166 MHz 512 Mbit"\
      "s27ks0641:S27KS0641 (Cypress) HyperRAM 166 MHz 64 Mbit"\
      "is26ks128s:IS26KS128S (ISSI) HyperFlash 166 MHz 128 Mbit"\
      "is26ks256s:IS26KS256S (ISSI) HyperFlash 166 MHz 256 Mbit"\
      "is26ks512s:IS26KS512S (ISSI) HyperFlash 166 MHz 512 Mbit"\
      "is66wvh8m8:IS66WVH8M8 (ISSI) HyperRAM 166 MHz 64 Mbit"\
    "is66wvh16m8:S70KS1281 (Cypress) / IS66WVH16M8 (ISSI) HyperRAM 166 MHz 128 Mbit"\
    }

    # Create and populate the 'Device X Info' tab.
    #
    set tacc_default 6
    proc_add_dev_info $dev 0 ${tacc_default}

}

#-------------------------------------------------------------------------------
# DETECT DEVICE FAMILY
#----------------------------------------------------------------------------

add_parameter           DEVICE_FAMILY   STRING "Unknown"
set_parameter_property  DEVICE_FAMILY   VISIBLE false
set_parameter_property  DEVICE_FAMILY   SYSTEM_INFO {DEVICE_FAMILY}


#######################################################################################################################
#######################################################################################################################
##
##  HDL PARAMETERS
##
#######################################################################################################################
#######################################################################################################################

proc_add_hdl_parameter  g_iavs0_addr_width          INTEGER      18
proc_add_hdl_parameter  g_iavs0_data_width          INTEGER      32
proc_add_hdl_parameter  g_iavs0_av_numsymbols       INTEGER       4
proc_add_hdl_parameter  g_iavs0_burstcount_width    INTEGER       1
proc_add_hdl_parameter  g_iavs0_linewrap_burst      INTEGER       0
proc_add_hdl_parameter  g_iavs0_register_rdata      INTEGER       0
proc_add_hdl_parameter  g_iavs0_register_wdata      INTEGER       0
proc_add_hdl_parameter  g_include_reg_avalon        INTEGER       0
proc_add_hdl_parameter  g_include_internal_pll      INTEGER       1

proc_add_hdl_parameter  g_input_clk_freq_in_mhz     INTEGER       0         ;# make no initial assumptions.
proc_add_hdl_parameter  g_hyperbus_freq_in_mhz      INTEGER       0         ;# make no initial assumptions.
proc_add_hdl_parameter  g_iavs_freq_in_mhz          INTEGER       0         ;# make no initial assumptions.

proc_add_hdl_parameter  g_same_iavs_hyperbus_clk    INTEGER       0         ;# make no initial assumptions.

proc_add_hdl_parameter  g_config_rd_buffer_as_sram  INTEGER       1         ;
proc_add_hdl_parameter  g_config_wr_buffer_as_sram  INTEGER       1         ;

proc_add_hdl_parameter  g_device_family             STRING        "MAX 10"

proc_add_hdl_parameter  g_num_chipselect            INTEGER             0   ;# make no initial assumptions.
proc_add_hdl_parameter  g_dev0_config               STD_LOGIC_VECTOR    0
proc_add_hdl_parameter  g_dev1_config               STD_LOGIC_VECTOR    0
proc_add_hdl_parameter  g_dev0_timing               STD_LOGIC_VECTOR    0
proc_add_hdl_parameter  g_dev1_timing               STD_LOGIC_VECTOR    0

proc_add_hdl_parameter  g_include_dual_rwds_pin     INTEGER             0
proc_add_hdl_parameter  g_dqin_rdata_width          INTEGER             8

set_parameter_property  g_dev0_config               WIDTH               32
set_parameter_property  g_dev1_config               WIDTH               32
set_parameter_property  g_dev0_timing               WIDTH               32
set_parameter_property  g_dev1_timing               WIDTH               32


#######################################################################################################################
#######################################################################################################################
#conduits
#######################################################################################################################
#######################################################################################################################


#
#clock and reset connections
#
add_interface in_clk         clock end
add_interface i_ext_rstn     reset end
add_interface o_av_out_clk   clock start
add_interface o_av_out_rstn  reset start
add_interface i_hbus_clk_0   clock end
add_interface i_hbus_clk_90  clock end
add_interface i_hbus_clk_180 clock end


#
# connection point clock
#
add_interface           i_iavs0_clk clock end
set_interface_property  i_iavs0_clk clockRate 0
set_interface_property  i_iavs0_clk ENABLED true
set_interface_property  i_iavs0_clk EXPORT_OF ""
set_interface_property  i_iavs0_clk PORT_NAME_MAP ""
set_interface_property  i_iavs0_clk CMSIS_SVD_VARIABLES ""
set_interface_property  i_iavs0_clk SVD_ADDRESS_GROUP ""

add_interface_port      i_iavs0_clk i_iavs0_clk clk Input 1


#
# connection point i_iavs0_rstn
#
add_interface           i_iavs0_rstn reset end
set_interface_property  i_iavs0_rstn associatedClock i_iavs0_clk
set_interface_property  i_iavs0_rstn synchronousEdges DEASSERT
set_interface_property  i_iavs0_rstn ENABLED true
set_interface_property  i_iavs0_rstn EXPORT_OF ""
set_interface_property  i_iavs0_rstn PORT_NAME_MAP ""
set_interface_property  i_iavs0_rstn CMSIS_SVD_VARIABLES ""
set_interface_property  i_iavs0_rstn SVD_ADDRESS_GROUP ""

add_interface_port      i_iavs0_rstn i_iavs0_rstn reset_n Input 1


#
# connection point iavs_s0
#

proc_add_avalon_slave  iavs0  1
set_interface_property iavs0 associatedClock            i_iavs0_clk
set_interface_property iavs0 associatedReset            i_iavs0_rstn
set_interface_property iavs0 bridgesToMaster            ""
set_interface_property iavs0 linewrapBursts             false ; # This value is typically zero for our IP.
set_interface_property iavs0 burstOnBurstBoundariesOnly true  ; # This is typically true, unless we have special burst support logic in our slave that supports non-aligned bursts


#
# connection point iavs_reg
#
add_interface             iavs_reg  avalon                            end
set_interface_property    iavs_reg  addressUnits                      WORDS
set_interface_property    iavs_reg  associatedClock                   i_iavs0_clk
set_interface_property    iavs_reg  associatedReset                   i_iavs0_rstn
set_interface_property    iavs_reg  bitsPerSymbol                     8
set_interface_property    iavs_reg  bridgedAddressOffset              0
set_interface_property    iavs_reg  bridgesToMaster                   ""
set_interface_property    iavs_reg  burstOnBurstBoundariesOnly        true  ; # This is typically true, unless we have special burst support logic in our slave that supports non-aligned bursts
set_interface_property    iavs_reg  burstcountUnits                   WORDS
set_interface_property    iavs_reg  alwaysBurstMaxBurst               {0}
set_interface_property    iavs_reg  constantBurstBehavior             {0}  ; # This should be true for our IP and implementation. Our IP should not rely on the burst-length being held throughout a write burst transaction.
set_interface_property    iavs_reg  holdTime                          {0}
set_interface_property    iavs_reg  readLatency                       {0}  ; # This value is always zero for pipelined interfaces.
set_interface_property    iavs_reg  readWaitTime                      {1}
set_interface_property    iavs_reg  setupTime                         {0}
set_interface_property    iavs_reg  writeLatency                      {0}
set_interface_property    iavs_reg  writeWaitStates                   {0}
set_interface_property    iavs_reg  writeWaitTime                     {0}
set_interface_property    iavs_reg  maximumPendingReadTransactions    {0}  ; # This value is always 1, unless we have an advanced IP that is literally processing 2 or more read transactions concurrently within its pipeline.
set_interface_property    iavs_reg  maximumPendingWriteTransactions   {0}    ; # This value is only used with Avalon Response codes to Write operations.  Typically, this value is 0 in our IP.
set_interface_property    iavs_reg  explicitAddressSpan               0
set_interface_property    iavs_reg  linewrapBursts                    false  ; # This value is typically zero for our IP.
set_interface_property    iavs_reg  timingUnits                       Cycles

add_interface_port        iavs_reg  i_iavsr_addr            address         Input   3
add_interface_port        iavs_reg  i_iavsr_do_wr           write           Input   1
add_interface_port        iavs_reg  i_iavsr_do_rd           read            Input   1
add_interface_port        iavs_reg  i_iavsr_wdata           writedata       Input   g_iavs0_data_width
add_interface_port        iavs_reg  o_iavsr_rdata           readdata        Output  g_iavs0_data_width

set_interface_assignment  iavs_reg  embeddedsw.configuration.isFlash              0
set_interface_assignment  iavs_reg  embeddedsw.configuration.isMemoryDevice       0
set_interface_assignment  iavs_reg  embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment  iavs_reg  embeddedsw.configuration.isPrintableDevice    0

#
# connection point Conduit
#
add_interface Conduit_IO conduit end


#######################################################################################################################
#######################################################################################################################
##
##  VALIDATION is called before ELABORATION
##
#######################################################################################################################
#######################################################################################################################
#  set systemTime [clock seconds]
#  send_message INFO  "VALIDATION_CALLBACK Triggered [clock format $systemTime -format %H:%M:%S]"
#  send_message ERROR "text"

set_module_property VALIDATION_CALLBACK validate

proc validate {} {

    #Setting data width
    set v_iavs0_gui_data_width  [ get_parameter_value GUI_IAVS0_DATA_WIDTH]

    #++++++++++++++++++++++++++++++
    # Check the word width of the IAVS memory access port.
    #+++++++++++++++
    #
    if {$v_iavs0_gui_data_width != 32} {
        send_message error  "\
            The word width of IAVS0 is currently set to $v_iavs0_gui_data_width.\
            In this case, this value should be set to 32."
    }


    # 2017  - For version 2.12
    #       - Probably Remove in next major release of IP.
    #
    if { [get_parameter_value GUI_FPGA_DEV_BOARD] == "alt_c10_dev1" } {
        send_message Error "HBMC Version Upgrade - Manual Intervention Required: Please set the value of the 'FPGA Development Board' field to 'Devboards - HyperMAX 25K/50K LE (HyperRAM)'."
    }

    # 2017  - For version 2.12
    #       - The number of chipselects is now always 2.
    #
    if { [get_parameter_value GUI_FPGA_DEV_BOARD]     == "none" &&
         [get_parameter_value NUM_CHIPSELECTS   ]     == 1 } {
        send_message Error "HBMC Version Upgrade - Manual Intervention Required: Please set the value of the 'Number of HyperBus chip selects' to 2."
        set_parameter_property NUM_CHIPSELECTS  ENABLED        true
    } else {
        set_parameter_property NUM_CHIPSELECTS  ENABLED        false
    }


    # 2017  - For version 2.12
    #       - Avalon transaction repsonses are not supported.
    #
    if { [get_parameter_value GUI_IAVS0_USE_RESPONSE] } {
        send_message Error "HBMC Version Upgrade - Manual Intervention Required: Please untick the 'Use Avalon transaction responses' field on the IAVS0 tab."
        set_parameter_property GUI_IAVS0_USE_RESPONSE      ENABLED        true
    } else {
        set_parameter_property GUI_IAVS0_USE_RESPONSE      ENABLED        false
    }

    #
    # END ERROR MESSAGES THAT REQUIRE MANUAL INTERVENTION ON UPGRADE BETWEEN VERSIONS
    #
    #####################################################################################

}


#######################################################################################################################
#######################################################################################################################
##
##  ELABORATION
##
#######################################################################################################################
#######################################################################################################################

set_module_property ELABORATION_CALLBACK elaborate
proc elaborate {} {

    #++++++++++++++++++++++++++++++
    # Turn on some information messages to assist debugging the code flow / settings.
    #++++++++++++++++++++++++++++++
    #
    set v_debug 0

    #++++++++++++++++++++++++++++++
    # Dual Pin for RWDS signal
    #++++++++++++++++++++++++++++++
    set_parameter_value g_include_dual_rwds_pin 0 ; #[get_parameter_value  GUI_DUAL_RWDS_PIN]

    #++++++++++++++++++++++++++++++
    # DQIN Pin Mode
    #++++++++++++++++++++++++++++++
    set_parameter_value g_dqin_rdata_width [get_parameter_value  GUI_DQIN_MODE]

    #++++++++++++++++++++++++++++++
    # Set FPGA board parameters for COTS boards
    #++++++++++++++++++++++++++++++
      # - Number of Chipselects.
      # - Device Mapping.
      # - Input Clock Frequency
    #
    set v_dev_board_type [get_parameter_value  GUI_FPGA_DEV_BOARD]

    #++++++++++++++++++++++++++++++
      # Set board specific parameters
    #++++++++++++++++++++++++++++++
    #
    proc_set_dev_board_params $v_dev_board_type

    #++++++++++++++++++++++++++++++
    # Set Device family
    #++++++++++++++++++++++++++++++
    #
    set_parameter_value g_device_family [ get_parameter_value DEVICE_FAMILY ]

    #++++++++++++++++++++++++++++++
    # Auto detect IAVSx clocks
    #++++++++++++++++++++++++++++++
    set v_auto_iavs0_clock_rate   [get_parameter_value GUI_IAVS0_AUTO_CLOCK_RATE]
    set v_iavs0_frequency_mhz     [expr $v_auto_iavs0_clock_rate/1000000]

    set_parameter_value g_iavs_freq_in_mhz  $v_iavs0_frequency_mhz

 #++++++++++++++++++++++++++++++
    # Integrated VS External PLL
    #++++++++++++++++++++++++++++++
     set v_include_internal_pll     [get_parameter_value GUI_INTEGRATED_PLL_ENABLED]
     set_parameter_value g_include_internal_pll $v_include_internal_pll

     if {$v_include_internal_pll == 1} {
        set_parameter_property  HYPERBUS_FREQ_IN_MHZ   ALLOWED_RANGES {50 75 100 125 150} ;# 165 not supported due to PLL limitations
        set_parameter_property  IAVS_FREQ_OUT_IN_MHZ   ALLOWED_RANGES {50 75 100 125 150}   ;# 165 not supported due to PLL limitations

         #----------------------------
         #set Input PLL reference clock
         #----------------------------
         set_parameter_property GUI_INPUT_FREQ_IN_MHZ_SC VISIBLE    true
         set_parameter_property GUI_INPUT_FREQ_IN_MHZ_SC ENABLED    true
         send_message Info "The input clock frequency (in_clk) must be manually configured by the user when using proprietary board."

         set_parameter_value g_input_clk_freq_in_mhz             [ get_parameter_value GUI_INPUT_FREQ_IN_MHZ_SC    ]

         #++++++++++++++++++++++++++++++
         # Set HBUS clocks
         #++++++++++++++++++++++++++++++
         set_parameter_property GUI_HBUS0_AUTO_CLOCK_RATE    ENABLED    false

         set v_hyperbus_frequency_mhz [ get_parameter_value HYPERBUS_FREQ_IN_MHZ]

         set_parameter_value g_hyperbus_freq_in_mhz       $v_hyperbus_frequency_mhz
         set_parameter_value GUI_HYPERBUS_FREQ_IN_MHZ_SC  $v_hyperbus_frequency_mhz

         #----------------------------
         #IAVS Output Clock
         #----------------------------
         set_parameter_property GUI_AV_OUT_FREQ_IN_MHZ_SC    VISIBLE     true
         set_parameter_property HYPERBUS_FREQ_IN_MHZ         VISIBLE     true
         set_parameter_property IAVS_FREQ_OUT_IN_MHZ         VISIBLE     false

        #++++++++++++++++++++++++++++++
        # What method has the user selected to configure this clock?
        #++++++++++++++++++++++++++++++
        if { [get_parameter_value GUI_SINGLE_CLK_OP]} {

            #++++++++++++++++++++++++++++++
            # One Clock: One clock for all the Avalon ports AND the HyperBus channel
            #++++++++++++++++++++++++++++++
            set_parameter_value     GUI_AV_OUT_FREQ_IN_MHZ_SC         [ get_parameter_value HYPERBUS_FREQ_IN_MHZ ]
            set_parameter_value     GUI_HYPERBUS_FREQ_IN_MHZ_SC       [ get_parameter_value HYPERBUS_FREQ_IN_MHZ ]
        } else {

            #++++++++++++++++++++++++++++++
            # Two Clocks: One clock for all the Avalon ports. One clock for the HyperBus channel
            #++++++++++++++++++++++++++++++
            set_parameter_property  IAVS_FREQ_OUT_IN_MHZ          VISIBLE     true

            set_parameter_value     GUI_AV_OUT_FREQ_IN_MHZ_SC         [ get_parameter_value  IAVS_FREQ_OUT_IN_MHZ ]
            set_parameter_value     GUI_HYPERBUS_FREQ_IN_MHZ_SC       [ get_parameter_value  HYPERBUS_FREQ_IN_MHZ ]
        }

        # Check the IAVS0 port has the right clock speed
        #
        set v_cmp_iavs_frequency_mhz [get_parameter_value GUI_AV_OUT_FREQ_IN_MHZ_SC]

        if {$v_iavs0_frequency_mhz != $v_cmp_iavs_frequency_mhz} {
            send_message error  "The IAVS0 port clock frequency is not set to the clock clock frequency. \
                                 Please connect i_iavs0_clk to o_av_out_clk"
        } else {
            send_message warning  "S/Labs HBMC: Please ignore the 'Module dependency loop' warning in the above line.\
                                  That message will always be generated by Qsys when using the PLL integrated in S/Labs HBMC. "
        }

     } else {
        set_parameter_property  HYPERBUS_FREQ_IN_MHZ   ALLOWED_RANGES 20:160 ;# 165 not supported due to PLL limitations
        set_parameter_property  IAVS_FREQ_OUT_IN_MHZ   ALLOWED_RANGES 20:150 ;# 165 not supported due to PLL limitations

         #----------------------------
         #set Input PLL reference clock
         #----------------------------
         set_parameter_property GUI_INPUT_FREQ_IN_MHZ_SC VISIBLE    false
         set_parameter_property GUI_INPUT_FREQ_IN_MHZ_SC ENABLED    false
         set_parameter_value g_input_clk_freq_in_mhz  50 ;#Not USED

         #++++++++++++++++++++++++++++++
         # Auto detect HBUS clocks
         #++++++++++++++++++++++++++++++
         set_parameter_property GUI_HBUS0_AUTO_CLOCK_RATE    ENABLED    true

         set v_auto_hbus0_clock_rate   [get_parameter_value GUI_HBUS0_AUTO_CLOCK_RATE]
         set v_hyperbus_frequency_mhz  [expr $v_auto_hbus0_clock_rate/1000000]

         set_parameter_value g_hyperbus_freq_in_mhz       $v_hyperbus_frequency_mhz
         set_parameter_value GUI_HYPERBUS_FREQ_IN_MHZ_SC  $v_hyperbus_frequency_mhz

         #----------------------------
         #IAVS Output Clock
         #----------------------------
         set_parameter_property GUI_AV_OUT_FREQ_IN_MHZ_SC    VISIBLE    true
         set_parameter_property HYPERBUS_FREQ_IN_MHZ         VISIBLE    false
         set_parameter_property IAVS_FREQ_OUT_IN_MHZ         VISIBLE    false

         set_parameter_value    GUI_AV_OUT_FREQ_IN_MHZ_SC    $v_iavs0_frequency_mhz

         #----------------------------
         #Check Clock frequency
         #----------------------------
         if { [get_parameter_value GUI_SINGLE_CLK_OP]} {
            if {$v_iavs0_frequency_mhz != $v_hyperbus_frequency_mhz} {
                send_message error  "For Single Clock operation, The IAVS0 port clock port needs to be connected to the Hyperbus Channel clock source (i_hbus_clk_0" )
            }
         } else {
            if {($v_iavs0_frequency_mhz == $v_hyperbus_frequency_mhz) && ($v_iavs0_frequency_mhz != 0) } {
                send_message Warning  "It is recommended to use Single Clock operation, since The IAVS0 clock port and Hyperbus Channel clock source (i_hbus_clk_0 have the same frequency" )
            }
         }

     }

     #++++++++++++++++++++++++++++++
    # Move the values reported in the GUI into variables and HDL generics
    #++++++++++++++++++++++++++++++

    # This logic assumes there are <= 2 clocks in the design.
    # This code MUST be upgraded if there are more clocks.
    #
    if { $v_iavs0_frequency_mhz == $v_hyperbus_frequency_mhz } {
        set_parameter_value g_same_iavs_hyperbus_clk            1
    } else {
        set_parameter_value g_same_iavs_hyperbus_clk            0
    }

    #++++++++++++++++++++++++++++++
    # Detect Number of chipselects
    #++++++++++++++++++++++++++++++
    set                 v_num_chipselect        [get_parameter_value GUI_NUM_CHIPSELECTS]
    set_parameter_value g_num_chipselect        $v_num_chipselect

    if { $v_debug } {
      send_message Info "elaborate : v_num_chipselect : $v_num_chipselect"
    }

    #++++++++++++++++++++++++++++++
    # Adjust interfaces
    #++++++++++++++++++++++++++++++

    set_interface_property     Conduit_IO          ENABLED true
    proc_Add_Hyperbus_Conduit_IO  $v_num_chipselect $v_include_internal_pll

    #++++++++++++++++++++++++++++++
    # Device parameters
    #++++++++++++++++++++++++++++++

    if { $v_debug } {
      send_message Info "elaborate : Start Device Parameter Configuration"
    }

    set v_larger_dev_size                   0
    set v_total_dev_size_mb                 0
    set v_hyperflash_detected               2       ;# 0:in CS0, 1:IN CS1, 2:NONE DETECTED
    set_parameter_value g_dev0_timing       0
    set_parameter_value g_dev1_timing       0
    set_parameter_value g_dev0_config       0
    set_parameter_value g_dev1_config       0

    if { $v_dev_board_type == "custom_board" } {
        set_parameter_property         NUM_CHIPSELECTS       VISIBLE     true  ;# Backwards compatability
        set_parameter_property     GUI_NUM_CHIPSELECTS       VISIBLE     false
    } else {
        set_parameter_property         NUM_CHIPSELECTS       VISIBLE     false  ;# Backwards compatability
        set_parameter_property     GUI_NUM_CHIPSELECTS       VISIBLE     true
    }

    for {set dev 0} {$dev < 2} {incr dev} {

        # Hide all the relevant fields, then selectively turn them on.
        #
        set_display_item_property   "Device ${dev} Info"            VISIBLE   true

        set_parameter_property  GUI_DEV${dev}_SIZE                  VISIBLE   false

        set_display_item_property   "Device ${dev} Configuration"   VISIBLE   false
        set_display_item_property   "Device ${dev} Timings"         VISIBLE   false

        set_parameter_property  GUI_DEV${dev}_USE_DEFAULT           VISIBLE   false
        set_parameter_property  GUI_DEV${dev}_MIN_TACC              VISIBLE   false
        set_parameter_property  GUI_DEV${dev}_TYPE_MAN              VISIBLE   false
        set_parameter_property  GUI_DEV${dev}_TYPE                  VISIBLE   false

        set_parameter_property  GUI_DEV${dev}_DRIVE_STRENGTH_MAN    VISIBLE   false
        set_parameter_property  GUI_DEV${dev}_INIT_LATENCY_MAN      VISIBLE   false
        set_parameter_property  GUI_DEV${dev}_FIXED_LATENCY_MAN     VISIBLE   false
        set_parameter_property  GUI_DEV${dev}_BURST_LENGTH_MAN      VISIBLE   false

        set_parameter_property  GUI_DEV${dev}_DRIVE_STRENGTH        VISIBLE   false
        set_parameter_property  GUI_DEV${dev}_INIT_LATENCY          VISIBLE   false
        set_parameter_property  GUI_DEV${dev}_FIXED_LATENCY         VISIBLE   false
        set_parameter_property  GUI_DEV${dev}_BURST_LENGTH          VISIBLE   false


        # Do we populate this device tab?
        #
        if {$dev <  $v_num_chipselect } {

            if { $v_debug } {
                send_message Info "elaborate : Start Device Parameter Configuration Device $dev"
            }

            set_display_item_property "Device ${dev} Info"          VISIBLE     true


            if { $v_dev_board_type == "custom_board" } {
                set_parameter_property     GUI_DEV${dev}_TYPE_MAN   VISIBLE     true
            } else {
                set_parameter_property     GUI_DEV${dev}_TYPE       VISIBLE     true
            }
            set v_dev_name              [get_parameter_value GUI_DEV${dev}_TYPE]
            set v_dev_type              [proc_get_dev_params "type"  ${v_dev_name}  ${v_hyperbus_frequency_mhz}]
            set v_dev_size              [proc_get_dev_params "size"  ${v_dev_name}  ${v_hyperbus_frequency_mhz}]
            set v_dev_size              [expr $v_dev_size/8]

            set v_total_dev_size_mb     [expr $v_total_dev_size_mb + $v_dev_size]

            if { $v_dev_size > $v_larger_dev_size } {
                set v_larger_dev_size $v_dev_size
            }

            if { $v_debug } {
              send_message Info "elaborate : v_dev_name = $v_dev_name"
              send_message Info "elaborate : v_dev_type = $v_dev_type"
              send_message Info "elaborate : v_dev_size = $v_dev_size"
            }

            if {$v_dev_name == "none" } {

               if { $v_debug } {
                  send_message Info "elaborate : v_dev_name ($v_dev_name) == \"none\""
               }
               # No Configuration.
               set v_dev_init_cmd     0
               set v_dev_init_cr_die1 0

               set_parameter_value     g_dev${dev}_timing                  0
               set_parameter_value     g_dev${dev}_config                  0
               set                     v_dev_timing                        0

               # Update Device and Device Size on the GUI
               proc_set_device_info $dev $v_dev_name $v_dev_timing  $v_hyperbus_frequency_mhz
            } else {

               # Target HyperBus device is present
               #
               if { $v_debug } {
                   send_message Info "elaborate : v_dev_name ($v_dev_name) != \"none\""
               }

               set_parameter_property      GUI_DEV${dev}_SIZE               VISIBLE   true
               set_parameter_property      GUI_DEV${dev}_MIN_TACC           VISIBLE   true

               set_display_item_property   "Device ${dev} Configuration"    VISIBLE   true

               set_parameter_property      GUI_DEV${dev}_USE_DEFAULT        VISIBLE   true

               set_display_item_property   "Device ${dev} Timings"          VISIBLE   true

               if {[get_parameter_value GUI_DEV${dev}_USE_DEFAULT]} {
                   if { $v_debug } {
                       send_message Info "elaborate : GUI_DEV${dev}_USE_DEFAULT == 1"
                   }

                   set v_dev_init_cmd     0
                   set v_dev_init_cr_die1 0

                   set_parameter_property GUI_DEV${dev}_DRIVE_STRENGTH         VISIBLE   true
                   set_parameter_property GUI_DEV${dev}_INIT_LATENCY           VISIBLE   true
                   set_parameter_property GUI_DEV${dev}_FIXED_LATENCY          VISIBLE   true
                   set_parameter_property GUI_DEV${dev}_BURST_LENGTH           VISIBLE   true

                   set_parameter_property GUI_DEV${dev}_FIXED_LATENCY          ENABLED   false
                   set_parameter_value    GUI_DEV${dev}_FIXED_LATENCY          1

                   # Avoid error messages for manual settings that are ignored.
                   set_parameter_property GUI_DEV${dev}_INIT_LATENCY_MAN   ALLOWED_RANGES {3,4,5,6,7,8,9,10,11,12,13,14,15,16}

                   #check whether device is flash
                   if {$v_dev_type == 0} {
                       # HyperFlash
                       set v_hyperflash_detected $dev

                       set_parameter_property GUI_DEV${dev}_INIT_LATENCY       ALLOWED_RANGES {5,6,7,8,9,10,11,12,13,14,15,16}
                       set_parameter_value    GUI_DEV${dev}_INIT_LATENCY       16
                   } else {
                       #HyperRAM
                       set_parameter_property GUI_DEV${dev}_INIT_LATENCY       ALLOWED_RANGES {3,4,5,6,7}
                       set_parameter_value    GUI_DEV${dev}_INIT_LATENCY       6
                   }

               } else {

                   if { $v_debug } {
                       send_message Info "elaborate : GUI_DEV${dev}_USE_DEFAULT == 0"
                   }

                   set v_dev_init_cmd     1

                   if {$v_dev_name== "is66wvh16m8"} {
                       set v_dev_init_cr_die1 1  ;#Init Command for Multidie HyperRAM packages
                   } else {
                       set v_dev_init_cr_die1 0
                   }

                   set_parameter_property GUI_DEV${dev}_DRIVE_STRENGTH_MAN  VISIBLE   true
                   set_parameter_property GUI_DEV${dev}_INIT_LATENCY_MAN    VISIBLE   true
                   set_parameter_property GUI_DEV${dev}_BURST_LENGTH_MAN    VISIBLE   true

                   #check whether device is flash
                   if {$v_dev_type == 0} {
                       # HyperFlash
                       set v_hyperflash_detected $dev
                       set_parameter_property GUI_DEV${dev}_INIT_LATENCY_MAN   ALLOWED_RANGES {5,6,7,8,9,10,11,12,13,14,15,16}

                       # Always report a fixed latency, to help educate the user about the constant time behaviour of HyperFlash.
                       #
                       set_parameter_property GUI_DEV${dev}_FIXED_LATENCY_MAN  VISIBLE   false

                       set_parameter_property GUI_DEV${dev}_FIXED_LATENCY      VISIBLE   true
                       set_parameter_value    GUI_DEV${dev}_FIXED_LATENCY          1
                   } else {
                       # HyperRAM
                       set_parameter_property GUI_DEV${dev}_INIT_LATENCY_MAN   ALLOWED_RANGES {3,4,5,6,7}

                      if {${v_dev_name} == "is66wvh16m8"} {
                       set_parameter_property GUI_DEV${dev}_FIXED_LATENCY_MAN  VISIBLE   false

                       set_parameter_property GUI_DEV${dev}_FIXED_LATENCY      VISIBLE   true
                       set_parameter_value    GUI_DEV${dev}_FIXED_LATENCY          1
                      } else {
                       set_parameter_property GUI_DEV${dev}_FIXED_LATENCY_MAN  VISIBLE   false

                       set_parameter_property GUI_DEV${dev}_FIXED_LATENCY      VISIBLE   true
                       set_parameter_value    GUI_DEV${dev}_FIXED_LATENCY          1

#                       set_parameter_value    GUI_DEV${dev}_FIXED_LATENCY  [get_parameter_value GUI_DEV${dev}_FIXED_LATENCY_MAN]
                      }
                   }

                   set_parameter_value GUI_DEV${dev}_DRIVE_STRENGTH [get_parameter_value GUI_DEV${dev}_DRIVE_STRENGTH_MAN]
                   set_parameter_value GUI_DEV${dev}_INIT_LATENCY   [get_parameter_value GUI_DEV${dev}_INIT_LATENCY_MAN]
                   set_parameter_value GUI_DEV${dev}_BURST_LENGTH   [get_parameter_value GUI_DEV${dev}_BURST_LENGTH_MAN]
               }

               #setting minimum timing for current Device
               set_parameter_value     GUI_DEV${dev}_MIN_TACC [proc_get_dev_params "min_tacc" ${v_dev_name} ${v_hyperbus_frequency_mhz}]

               #get timing info
               set v_dev_timing        [proc_get_dev_params "timing"       ${v_dev_name} ${v_hyperbus_frequency_mhz}]

               #device configuration
               set dev_strength        [get_parameter_value GUI_DEV${dev}_DRIVE_STRENGTH]
               set dev_tacc            [get_parameter_value GUI_DEV${dev}_INIT_LATENCY  ]
               set dev_fixed_lat       [get_parameter_value GUI_DEV${dev}_FIXED_LATENCY ]
               set dev_burst_len       [get_parameter_value GUI_DEV${dev}_BURST_LENGTH  ]
               set v_dev_timing        [expr $v_dev_timing | ($dev_tacc<<16)]

               #display information
               proc_set_device_info $dev $v_dev_name $v_dev_timing  $v_hyperbus_frequency_mhz

               #get size and
               if { $v_dev_size == 0 } {
                   set v_dev_size_log2  0  ;# Avoid number to large error.
               } else {
                   set v_dev_size_log2  [ expr int( ceil( log($v_dev_size) / log(2) ) )]
               }

               #generate latency as defined by the protocol
               set dev_latency      [proc_gen_dev_latency $dev_tacc]

               #concatinate to for dev_config
               set v_dev_config     [expr (($v_dev_type         <<       0)  | \
                                           ($v_dev_size_log2    <<       4)  | \
                                           ($v_dev_init_cmd     <<      12)  | \
                                           ($v_dev_init_cr_die1 <<      13)  | \
                                           (1                   <<  (16+15)) | \
                                           ($dev_strength       <<  (16+12)) | \
                                           (15                  <<  (16+ 8)) | \
                                           ($dev_latency        <<  (16+ 4)) | \
                                           ($dev_fixed_lat      <<  (16+ 3)) | \
                                           (1                   <<  (16+ 2)) | \
                                           ($dev_burst_len      <<  (16+ 0)))]

               set_parameter_value         g_dev${dev}_timing       $v_dev_timing
               set_parameter_value         g_dev${dev}_config       $v_dev_config

               # Sanity check this configuration.
               #
               set dev_tacc            [get_parameter_value GUI_DEV${dev}_INIT_LATENCY ]
               set dev_min_tacc        [get_parameter_value GUI_DEV${dev}_MIN_TACC     ]

               if {$dev_tacc < $dev_min_tacc} {
                   send_message error  "\
                     Device ${dev} : Selected 'Initial Latency' value is smaller than the minimum\
                     latency permitted for the current frequency of the HyperBus channel: ${dev_min_tacc}"
               }
            }
        }
    }

    # Configure the IAVS port based on the HB memory devices selected.
    #
    if { $v_larger_dev_size == 0 } {

        # This error message has to be put in the validate
        send_message Error "Please ensure that there is at least one HyperBus target device configured for this HBMC instantiation."

    } else {

        #
        #address is word aligned
        #
        if {$v_hyperflash_detected != 2} {
            proc_gen_embeddedsw_params iavs0 $v_hyperflash_detected
        }

        # Process the data related items
        #
        set v_iavs0_gui_data_width                   [ get_parameter_value GUI_IAVS0_DATA_WIDTH]
        set v_iavs0_gui_av_numsymbols                [ expr $v_iavs0_gui_data_width/8]
        set v_iavs0_gui_av_numsymbols_log2           [ expr int( ceil( log($v_iavs0_gui_av_numsymbols) / log(2) ) )]

        #address is word aligned
#        set v_max_addr_width [ expr int((ceil( log($v_larger_dev_size) / log(2) )) + 19)]

        set v_dev_size_in_bytes [ expr  $v_total_dev_size_mb * 1024 *1024]
        set v_max_addr_width [ expr { [log2ceil $v_dev_size_in_bytes] - [ log2ceil $v_iavs0_gui_av_numsymbols] } ]

        set v_iavs0_addr_width                       $v_max_addr_width
        set v_iavs0_gui_burstcount                   [ get_parameter_value GUI_IAVS0_MAX_BURST_IN_WORDS]
        set v_iavs0_gui_burstcount_width             [ expr int( (ceil( log($v_iavs0_gui_burstcount) / log(2) )) + 1)]

        set_parameter_value GUI_IAVS0_ADDR_WIDTH     $v_iavs0_addr_width

        #-----------------------------------------------------------------------
        #set address Span
        #-----------------------------------------------------------------------
        set_interface_property iavs0  explicitAddressSpan   [expr (($v_total_dev_size_mb)*1024*1024)]

        #-----------------------------------------------------------------------
        #Setting linewrapBursts and burstOnBurstBoundariesOnly
        #-----------------------------------------------------------------------
        if {$v_iavs0_gui_burstcount > 1} {
            set_parameter_property GUI_IAVS0_BURST_ON_BURST_BOUNDARIES_AUTO  VISIBLE  true
            set_parameter_property GUI_IAVS0_BURST_ON_BURST_BOUNDARIES_ONLY  VISIBLE  false

            #linewrap only for burst 8
            if {$v_iavs0_gui_burstcount == 8} {
               set_parameter_property GUI_IAVS0_LINEWRAP_BURST                  VISIBLE  true
            } else {
               set_parameter_property GUI_IAVS0_LINEWRAP_BURST                  VISIBLE  false
            }

            #linewrap burst only for Burst 8
            if {[get_parameter_value GUI_IAVS0_LINEWRAP_BURST] && ($v_iavs0_gui_burstcount == 8)} {
                set_interface_property iavs0 linewrapBursts                      true;
                set_parameter_value    g_iavs0_linewrap_burst                    1
                set_parameter_value    GUI_IAVS0_BURST_ON_BURST_BOUNDARIES_AUTO  false  ; #
                set_interface_property iavs0 burstOnBurstBoundariesOnly          false  ; # This is typically true, unless we have special burst support logic in our slave that supports non-aligned bursts
            } else {
                set_parameter_property GUI_IAVS0_BURST_ON_BURST_BOUNDARIES_AUTO  VISIBLE  false
                set_parameter_property GUI_IAVS0_BURST_ON_BURST_BOUNDARIES_ONLY  VISIBLE  true

                set_interface_property iavs0 linewrapBursts                      false;
                set_parameter_value    g_iavs0_linewrap_burst                    0

                if {[get_parameter_value GUI_IAVS0_BURST_ON_BURST_BOUNDARIES_ONLY] } {
                    if {$v_iavs0_gui_burstcount == 8} {
                       set_parameter_value    g_iavs0_linewrap_burst                    1
                    } else {
                       set_parameter_value    g_iavs0_linewrap_burst                    0
                    }
                    set_interface_property iavs0 burstOnBurstBoundariesOnly         true; # This is typically true, unless we have special burst support logic in our slave that supports non-aligned bursts
                } else {
                    set_interface_property iavs0 burstOnBurstBoundariesOnly         false; # This is typically true, unless we have special burst support logic in our slave that supports non-aligned bursts
                }
            }
        } else {
            set_parameter_property GUI_IAVS0_LINEWRAP_BURST                  VISIBLE  false
            set_parameter_property GUI_IAVS0_BURST_ON_BURST_BOUNDARIES_ONLY  VISIBLE  false
            set_parameter_property GUI_IAVS0_BURST_ON_BURST_BOUNDARIES_AUTO  VISIBLE  false

            set_interface_property iavs0 linewrapBursts             false ; # This value is typically zero for our IP.
            set_interface_property iavs0 burstOnBurstBoundariesOnly true  ; # This is typically true, unless we have special burst support logic in our slave that supports non-aligned bursts
            set_parameter_value    g_iavs0_linewrap_burst           0
        }

        set_parameter_property      GUI_IAVS0_WRITE_MODE    VISIBLE true

        if {[get_parameter_value GUI_IAVS0_WRITE_MODE]} {
            proc_add_avalon_conduit iavs0                   AV_READ_WRITE 2
            set_parameter_value     GUI_IAVS0_PORT_MODE     "Read/Write"
            set_parameter_property  GUI_IAVS0_BYTEENABLE    VISIBLE true
            set iavs0_write_port    1
        } else {
            proc_add_avalon_conduit iavs0                   AV_READ_ONLY  2
            set_parameter_value     GUI_IAVS0_PORT_MODE     "Read only"
            set_parameter_property  GUI_IAVS0_BYTEENABLE    VISIBLE false

            set iavs0_write_port    0
        }
        set_interface_property    iavs0                  addressGroup {1}

        #-----------------------------------------------------------------------
        # Disable i_iavs0_byteenable
        #-----------------------------------------------------------------------
        if {$iavs0_write_port==1} {
            if {[get_parameter_value GUI_IAVS0_BYTEENABLE]  } {
                set_port_property i_iavs0_byteenable TERMINATION false
            } else {
                set_port_property i_iavs0_byteenable TERMINATION true
                set_port_property i_iavs0_byteenable TERMINATION_VALUE 0xFFFFFFFFFFFFFF
            }
        }

        #----------------------------------------------------------------------------------------
        #add termination value if response is not used
        #----------------------------------------------------------------------------------------
        if {[get_parameter_value GUI_IAVS0_USE_RESPONSE]} {
            set_port_property  o_iavs0_resp TERMINATION    false
        } else {
            set_port_property  o_iavs0_resp TERMINATION    true
        }

        #-----------------------------------------------------------------------
        #Disable burst count signals
        #-----------------------------------------------------------------------
        if {$v_iavs0_gui_burstcount > 1} {
            set_port_property i_iavs0_burstcount               TERMINATION false
        } else {
            set_port_property i_iavs0_burstcount               TERMINATION true
            set_port_property i_iavs0_burstcount               TERMINATION_VALUE 1
        }

        #-----------------------------------------------------------------------
        #Disable Avalon register interface signals
        #-----------------------------------------------------------------------
        set_interface_property    iavs_reg  ENABLED false

        #-----------------------------------------------------------------------
        #Read/write buffer configuration
        #-----------------------------------------------------------------------
        set_parameter_value g_config_wr_buffer_as_sram 1
        set_parameter_value g_config_rd_buffer_as_sram 1

        #
        # Process HDL generics
        #
        set_parameter_value g_iavs0_register_rdata    [get_parameter_value GUI_IAVS0_REG_RDATA]
        set_parameter_value g_iavs0_register_wdata    [get_parameter_value GUI_IAVS0_REG_WDATA]
        set_parameter_value g_iavs0_addr_width        $v_iavs0_addr_width
        set_parameter_value g_iavs0_data_width        $v_iavs0_gui_data_width
        set_parameter_value g_iavs0_av_numsymbols     $v_iavs0_gui_av_numsymbols
        set_parameter_value g_iavs0_burstcount_width  $v_iavs0_gui_burstcount_width

        set_parameter_value g_include_reg_avalon      0

    }

}



#-----------------------------------------------------------------------------
# fileset_callback --
#-----------------------------------------------------------------------------
proc synth_fileset_callback { NAME } {

   # Creating SDC file
   #

   # Create the file in a temporary location
   if {[catch {create_temp_file temp.txt} temp_file]} {
      send_message error "create_temp_file $temp_file failed!"
   }
   send_message info "create_temp_file $temp_file"
   set OutputDirName  [ file dirname $temp_file  ]
   set SdcOutFileName [file join ${OutputDirName} ${NAME}.sdc]

   set hbus_clk_freq      [get_parameter_value GUI_HYPERBUS_FREQ_IN_MHZ_SC]
   set dqs_clk_freq_in_ns [expr 1/ ($hbus_clk_freq * 1e6) * 1e9]

   set single_clock_mode  [get_parameter_value GUI_SINGLE_CLK_OP]

   set internal_pll       [get_parameter_value GUI_INTEGRATED_PLL_ENABLED]

   set rwds_clk_pin_name "HB*rwds"

   set device_family     [ get_parameter_value DEVICE_FAMILY ]


   file copy -force sll_ca_hbc_t001_top.sdc ${SdcOutFileName}

   #replace dqs_clk_freq_in_ns with actual clock frequency
   set replacementCmd [list string map [list dqs_clk_freq_in_ns ${dqs_clk_freq_in_ns}]]
   fileutil::updateInPlace  ${SdcOutFileName} $replacementCmd

   #replace single_clock_mode variable with chosen parameter
   set replacementCmd [list string map [list single_clock_mode ${single_clock_mode}]]
   fileutil::updateInPlace  ${SdcOutFileName} $replacementCmd

   #replace single_clock_mode variable with chosen parameter
   set replacementCmd [list string map [list internal_pll ${internal_pll}]]
   fileutil::updateInPlace  ${SdcOutFileName} $replacementCmd

   #replace device_family variable with chosen parameter
   set replacementCmd [list string map [list device_family ${device_family}]]
   fileutil::updateInPlace  ${SdcOutFileName} $replacementCmd

   #replace rwds_clk_pin_name variable with chosen parameter
   set replacementCmd [list string map [list rwds_clk_pin_name ${rwds_clk_pin_name}]]
   fileutil::updateInPlace  ${SdcOutFileName} $replacementCmd

   add_fileset_file sll_ca_hbc_t001_top.sdc SDC PATH $SdcOutFileName

   #
   # Create a list of verilog files.
   #
   add_fileset_file altera_gpio_lite.sv             VERILOG PATH altera_gpio_lite.sv
   add_fileset_file sll_ca_hbc_t001_top_enc.v       VERILOG PATH  sll_ca_hbc_t001_top_enc.v
   add_fileset_file sll_hyperbus_controller_top.ocp OTHER   PATH  sll_hyperbus_controller_top.ocp



}


#-----------------------------------------------------------------------------
# fileset_callback --
#-----------------------------------------------------------------------------
proc sim_fileset_callback { NAME } {
    #
    # Create a list of verilog files.
    #
   add_fileset_file altera_gpio_lite.sv             VERILOG PATH altera_gpio_lite.sv

}


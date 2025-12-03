
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
#######################################################################################################################
#functions used by tcl script
#######################################################################################################################

#-------------------------------------------------------------------------------
#log2ceil
#-------------------------------------------------------------------------------
proc log2ceil {num} {

    set val 0
    set i 1
    while {$i < $num} {
        set val [expr $val + 1]
        set i [expr 1 << $val]
    }

    return $val;
}

#-------------------------------------------------------------------------------
#select hyperbus device based on the development board
#-------------------------------------------------------------------------------
proc proc_set_dev_board_params {dev_board_type} {

    switch $dev_board_type {
        "ebv_max10_dev1" {                                                      ;# devboards HyperMax 25 
            set_parameter_value  GUI_NUM_CHIPSELECTS 2
            set_parameter_value  GUI_DEV0_TYPE "s26ks512s"
            set_parameter_value  GUI_DEV1_TYPE "is66wvh8m8"
        }
        "ebv_max10_dev2" {                                                      ;# devboards HyperMax 25 
            set_parameter_value  GUI_NUM_CHIPSELECTS 2
            set_parameter_value  GUI_DEV0_TYPE "none"
            set_parameter_value  GUI_DEV1_TYPE "is66wvh8m8"
        }
        "ebv_max10_dev3" {                                                      ;# devboards HyperMax 25 
            set_parameter_value  GUI_NUM_CHIPSELECTS 2
            set_parameter_value  GUI_DEV0_TYPE "s26ks512s"
            set_parameter_value  GUI_DEV1_TYPE "none"
        }
        "devboards_hypermax50_dev1" {                                           ;# devboards HyperMax 50
            set_parameter_value  GUI_NUM_CHIPSELECTS 2
            set_parameter_value  GUI_DEV0_TYPE "is26ks512s"
            set_parameter_value  GUI_DEV1_TYPE "is66wvh16m8"
        }
        "devboards_hypermax50_dev2" {                                           ;# devboards HyperMax 50
            set_parameter_value  GUI_NUM_CHIPSELECTS 2
            set_parameter_value  GUI_DEV0_TYPE "none"
            set_parameter_value  GUI_DEV1_TYPE "is66wvh16m8"
        }
        "devboards_hypermax50_dev3" {                                           ;# devboards HyperMax 50
            set_parameter_value  GUI_NUM_CHIPSELECTS 2
            set_parameter_value  GUI_DEV0_TYPE "is26ks512s"
            set_parameter_value  GUI_DEV1_TYPE "none"
        }
        "alt_c10_dev2" {                                                         ;# intel_c10_lp_dev2
            set_parameter_value  GUI_NUM_CHIPSELECTS 2
            set_parameter_value  GUI_DEV0_TYPE "none"
            set_parameter_value  GUI_DEV1_TYPE "is66wvh16m8"          
        }
        "custom_board" {
            set_parameter_value  GUI_NUM_CHIPSELECTS    [get_parameter_value NUM_CHIPSELECTS]   ;# => GUI_NUM_CHIPSELECTS_MAN            
            set_parameter_value  GUI_DEV0_TYPE          [get_parameter_value GUI_DEV0_TYPE_MAN]
            set_parameter_value  GUI_DEV1_TYPE          [get_parameter_value GUI_DEV1_TYPE_MAN]
        }
        default    {
            send_message Error "proc_set_dev_board_params: Development board not recognised $dev_board_type"
        }
    } 
    
    # Simple debug messages to check that these paramters are really being set. 
    #
    if { 0 } {
      set v_gui_num_chipselects [get_parameter_value GUI_NUM_CHIPSELECTS]
      set v_gui_dev0_type [get_parameter_value GUI_DEV0_TYPE]
      set v_gui_dev1_type [get_parameter_value GUI_DEV1_TYPE]
      send_message Info "proc_set_dev_board_params : gui_num_chipselects : $v_gui_num_chipselects"
      send_message Info "proc_set_dev_board_params : gui_dev0_type : $v_gui_dev0_type"
      send_message Info "proc_set_dev_board_params : gui_dev1_type : $v_gui_dev1_type"
    }
}


#-------------------------------------------------------------------------------
#get device configs
#-------------------------------------------------------------------------------
proc proc_get_dev_params {param_type device_name clock_speed_mhz} {

    #
    # List structure:         Name Size_in_mega_bits Page_size Sector_size Type Tcshi Tcss Tcsh Trwr Tacc
    #
    # Timings are in nano seconds
    #
    set LIST_1_s26ks128s    {"S26KS128S (Cypress) HyperFlash 166 MHz 128 Mbit"    128 512 262144 0 6  3  0  0 96} ; #HyperFlash parameters
    set LIST_1_s26ks256s    {"S26KS256S (Cypress) HyperFlash 166 MHz 256 Mbit"    256 512 262144 0 6  3  0  0 96} ; #HyperFlash parameters
    set LIST_1_s26ks512s    {"S26KS512S (Cypress) HyperFlash 166 MHz 512 Mbit"    512 512 262144 0 6  3  0  0 96} ; #HyperFlash parameters
    set LIST_1_is26ks128s   {"IS26KS128S (ISSI) HyperFlash 166 MHz 128 Mbit"      128 512 262144 0 6  3  0  0 96} ; #HyperFlash parameters
    set LIST_1_is26ks256s   {"IS26KS256S (ISSI) HyperFlash 166 MHz 256 Mbit"      256 512 262144 0 6  3  0  0 96} ; #HyperFlash parameters
    set LIST_1_is26ks512s   {"IS26KS512S (ISSI) HyperFlash 166 MHz 512 Mbit"      512 512 262144 0 6  3  0  0 96} ; #HyperFlash parameters
    set LIST_1_s27ks0641    {"S27KS0641 (Cypress) HyperRAM 166 MHz 64 Mbit"       64   0      0  1 6 10  6  44 36} ; #HyperRam   parameters
    set LIST_1_is66wvh8m8   {"IS66WVH8M8 (ISSI) HyperRAM 166 MHz 64 Mbit"         64   0      0  1 6 10  6  44 36} ; #HyperRam   parameters
    set LIST_1_is66wvh16m8  {"S70KS1281 (Cypress) / IS66WVH16M8 (ISSI) HyperRAM 166 MHz" 128 0 0 1 6 10  6  44 36} ; #HyperRam   parameters
    set LIST_empty          {"No device connected and/or configured for use"      0    0       0 1 0  0  0  0  0} ; #Empty list - Set as HyperRAM type to avoid invoking flash specific functionality.

    #
    # Select relevant list
    #
    switch $device_name {
        "s26ks128s"    {set current_list $LIST_1_s26ks128s   }
        "s26ks256s"    {set current_list $LIST_1_s26ks256s   }
        "s26ks512s"    {set current_list $LIST_1_s26ks512s   }
        "s27ks0641"    {set current_list $LIST_1_s27ks0641   }
        "is26ks128s"   {set current_list $LIST_1_is26ks128s  }
        "is26ks256s"   {set current_list $LIST_1_is26ks256s  }
        "is26ks512s"   {set current_list $LIST_1_is26ks512s  }
        "is66wvh8m8"   {set current_list $LIST_1_is66wvh8m8  }
        "is66wvh16m8"  {set current_list $LIST_1_is66wvh16m8 }
        default        {set current_list $LIST_empty         }
    }

    #is this a HyperRAM device?
    set dev_is_hyperram  [lindex $current_list 4]

    #
    # Get size paramters
    #
    if {$param_type == "name" } {                    ;# get name information
        set dev_params [lindex $current_list 0]
        
    } elseif {$param_type == "size"} {               ;# get size information
        set dev_params [lindex $current_list 1]

    } elseif {$param_type == "page_size"} {          ;# get page size
        set dev_params [lindex $current_list 2]
        
    } elseif {$param_type == "sector_size"} {        ;# get number of sectors
        set dev_params [lindex $current_list 3]
        
    } elseif {$param_type == "type"} {               ;# get device type
        set dev_params [lindex $current_list 4]
        
    } elseif {$param_type == "min_tacc"} {           ;# get minimum Tacc
        set v_tim_param        [lindex $current_list 9]
        set v_tim_param_cycles [proc_get_timing ${v_tim_param} ${clock_speed_mhz}]

        #check for minumum tacc
        if        {$dev_is_hyperram==1 && $v_tim_param_cycles < 3} { #minimum tacc for HyperRAM
          set v_tim_param_cycles  3
        } elseif  {$dev_is_hyperram==0 && $v_tim_param_cycles < 5} { #minimum tacc for HyperFlash
          set v_tim_param_cycles  5
        }

        set dev_params         $v_tim_param_cycles
        
    } elseif {$param_type == "timing"} {             ;# get timing information
        set dev_params 0
        #loop over timing parameter list
        for {set tim_param_num 5} {$tim_param_num < 9} {incr tim_param_num} {
            set v_tim_param        [lindex $current_list $tim_param_num]
            set v_tim_param_cycles [proc_get_timing ${v_tim_param} ${clock_speed_mhz}]
            set dev_params         [expr ${dev_params} | (${v_tim_param_cycles}<< (${tim_param_num}-5)*4)]
        }
    } else {
        send_message Error "proc_get_dev_params : Wrong selection $param_type"
        set dev_params 0
    }

    return ${dev_params}
}

#-------------------------------------------------------------------------------
#proc get timing cycles (round up to next integer)
#-------------------------------------------------------------------------------
proc proc_get_timing {v_tim_param clock_speed_mhz} {
     set v_tim_param_cycles [expr ${v_tim_param} * ${clock_speed_mhz}]

       if {[expr fmod($v_tim_param_cycles, 1000)] != 0 } {
          set v_tim_param_cycles [expr ($v_tim_param_cycles/1000) + 1]
       } else {
          set v_tim_param_cycles [expr ($v_tim_param_cycles)/1000]
       }
   return ${v_tim_param_cycles}
}   


#-------------------------------------------------------------------------
#generate initial latency as defined by the Hyperbus protocol
#-------------------------------------------------------------------------
proc proc_gen_dev_latency {initial_lat} {

    # HyperBus Letency as supported by the protocl: 0000 - 5 Clocks
    # HyperBus Letency as supported by the protocl: 0001 - 6 Clocks
    # HyperBus Letency as supported by the protocl: 0010 - 7 Clocks
    # HyperBus Letency as supported by the protocl: 0011 - 8 Clocks
    # HyperBus Letency as supported by the protocl: 0100 - 9 Clocks
    # HyperBus Letency as supported by the protocl: 0101 - 10 Clocks
    # HyperBus Letency as supported by the protocl: 0110 - 11 Clocks
    # HyperBus Letency as supported by the protocl: 0111 - 12 Clocks
    # HyperBus Letency as supported by the protocl: 1000 - 13 Clocks
    # HyperBus Letency as supported by the protocl: 1001 - 14 Clocks
    # HyperBus Letency as supported by the protocl: 1010 - 15 Clocks
    # HyperBus Letency as supported by the protocl: 1011 - 16 Clocks
    # HyperBus Letency as supported by the protocl: 1100 - Reserved
    # HyperBus Letency as supported by the protocl: 1101 - Reserved
    # HyperBus Letency as supported by the protocl: 1110 - 3 Clock Latency
    # HyperBus Letency as supported by the protocl: 1111 - 4 Clock Latency

    if {$initial_lat > 4 } {
        return  [expr $initial_lat - 5]
    } else {
        return  [expr $initial_lat + 11]
    }
}


#-------------------------------------------------------------------------------
#set display group
#-------------------------------------------------------------------------------
proc proc_set_display_group {NAME GROUP EXPERIMENTAL DISPLAY_NAME args} {
    add_display_item        $GROUP  $NAME               parameter
    set_parameter_property  $NAME   "DISPLAY_NAME"      "$DISPLAY_NAME"
    set display_message     "$args"
    # only show those settings in debug mode
    if { "$EXPERIMENTAL" == "1" } {
        set_parameter_property  $NAME   "STATUS"        "EXPERIMENTAL"
        set_parameter_property  $NAME   "VISIBLE"       false
    } else {
        set_parameter_property  $NAME   "VISIBLE"       true
    }

    if { [ expr { "DES_$args" != "DES_" } ] } {
        set_parameter_property  $NAME   "DESCRIPTION"   "[ join $display_message ]"
    }
}


#-------------------------------------------------------------------------------
#function : add parameter
#-------------------------------------------------------------------------------
proc proc_add_parameter {NAME TYPE DEFAULT UNITS IS_DERIVED GROUP} {
    add_parameter          $NAME  $TYPE
    set_parameter_property $NAME AFFECTS_ELABORATION    true                       ;# Set AFFECTS_ELABORATION to false for parameters that do not affect the external interface of the module.
    set_parameter_property $NAME AFFECTS_VALIDATION     true                       ;# The AFFECTS_VALIDATION property marks whether a parameter's value is used to set derived parameters, and whether the value affects validation messages.
    set_parameter_property $NAME AFFECTS_GENERATION     true                       ;# Set AFFECTS_GENERATION to false if the value of a parameter does not change the results of fileset generation.
    set_parameter_property $NAME HDL_PARAMETER          false                      ;# When true, the parameter must be passed to the HDL IP component description. The default value is false.
    set_parameter_property $NAME DERIVED                $IS_DERIVED                ;# When true, indicates that the parameter value can only be set by the IP component, and cannot be set by the user.
    set_parameter_property $NAME ENABLED                true                       ;# When false, the parameter is disabled, meaning that it is displayed, but greyed out, indicating that it is not editable on the parameter editor.
    set_parameter_property $NAME DEFAULT_VALUE          $DEFAULT
    set_parameter_property $NAME NEW_INSTANCE_VALUE     $DEFAULT
    set_parameter_property $NAME UNITS                  $UNITS                     ;# This is the GUI label that appears to the right of the parameter.
}


#-------------------------------------------------------------------------------
#function : add hdl parameter
#-------------------------------------------------------------------------------
proc proc_add_hdl_parameter {NAME TYPE DEFAULT} {
    add_parameter          $NAME  $TYPE
    set_parameter_property $NAME  AFFECTS_GENERATION    false                      ;# Set AFFECTS_GENERATION to false if the value of a parameter does not change the results of fileset generation.
    set_parameter_property $NAME  AFFECTS_ELABORATION   false                      ;# Set AFFECTS_ELABORATION to false for parameters that do not affect the external interface of the module.
    set_parameter_property $NAME  AFFECTS_VALIDATION    false                      ;# The AFFECTS_VALIDATION property marks whether a parameter's value is used to set derived parameters, and whether the value affects validation messages.
    set_parameter_property $NAME  HDL_PARAMETER         true                       ;# When true, the parameter must be passed to the HDL IP component description. The default value is false.
    set_parameter_property $NAME  DERIVED               true                       ;# When true, indicates that the parameter value can only be set by the IP component, and cannot be set by the user.
    set_parameter_property $NAME  DEFAULT_VALUE         $DEFAULT
    set_parameter_property $NAME  NEW_INSTANCE_VALUE    $DEFAULT
    set_parameter_property $NAME  VISIBLE               true                       ;# Indicates whether or not to display the parameter in the parameterization GUI.
    set_parameter_property $NAME  ENABLED               false                      ;# When false, the parameter is disabled, meaning that it is displayed, but greyed out, indicating that it is not editable on the parameter editor.
    set_parameter_property $NAME  GROUP                 "Derived Parameters"       ;# Controls the layout of parameters in GUI
    set_parameter_property $NAME  DISPLAY_NAME          $NAME
}

#-------------------------------------------------------------------------------
#function : add avalon slave
#-------------------------------------------------------------------------------

proc proc_add_avalon_slave {NAME IS_MEM} {
    add_interface             $NAME  avalon                slave
    set_interface_property    $NAME  addressUnits          WORDS
    set_interface_property    $NAME  bitsPerSymbol         8
    set_interface_property    $NAME  bridgedAddressOffset  0
    set_interface_property    $NAME  burstcountUnits       WORDS
    set_interface_property    $NAME  alwaysBurstMaxBurst   {0}
    set_interface_property    $NAME  constantBurstBehavior {0}
    set_interface_property    $NAME  holdTime              {0}
    set_interface_property    $NAME  setupTime             {0}
    set_interface_property    $NAME  writeLatency          {0}
    set_interface_property    $NAME  explicitAddressSpan   0
    set_interface_property    $NAME  timingUnits           Cycles
    set_interface_property    $NAME  isMemoryDevice        $IS_MEM

    set_interface_property    $NAME  EXPORT_OF             ""
    set_interface_property    $NAME  PORT_NAME_MAP         ""
    set_interface_property    $NAME  CMSIS_SVD_VARIABLES   ""
    set_interface_property    $NAME  SVD_ADDRESS_GROUP     ""
}

# +-------------------------------------
# | Add settings needed by Nios tools
# +-------------------------------------
proc proc_gen_embeddedsw_params {NAME dev } {

    # Tells us component is a flash but not a EPCS device
    set_module_assignment embeddedsw.memoryInfo.IS_FLASH         1

    # This assignment indicates Nios tools should create a Flash initialization file
    set_module_assignment embeddedsw.memoryInfo.HAS_BYTE_LANE    0

    # These assignments tells tools to create byte_addressed .hex (syntehsis) and .dat (simulation) files
    set_module_assignment embeddedsw.memoryInfo.GENERATE_HEX     1
    set_module_assignment embeddedsw.memoryInfo.USE_BYTE_ADDRESSING_FOR_HEX 1
    set_module_assignment embeddedsw.memoryInfo.GENERATE_DAT_SYM 1
    set_module_assignment embeddedsw.memoryInfo.GENERATE_FLASH   1

    # Width of memory
    set_module_assignment embeddedsw.memoryInfo.MEM_INIT_DATA_WIDTH 32

    # Output directories for programming files
    set_module_assignment embeddedsw.memoryInfo.DAT_SYM_INSTALL_DIR {SIM_DIR}
    set_module_assignment embeddedsw.memoryInfo.FLASH_INSTALL_DIR   {APP_DIR}
    set_module_assignment embeddedsw.memoryInfo.HEX_INSTALL_DIR     {QPF_DIR}

    # Interface assignments that indicate the slave is a non-volatile flash memory

    # Module assignments related to names of simulation files
    #set_module_assignment postgeneration.simulation.init_file.param_name {INIT_FILENAME}
    #set_module_assignment postgeneration.simulation.init_file.type {MEM_INIT}

    # interface assignments for embedded software
    set_interface_assignment $NAME embeddedsw.configuration.isFlash              1
    set_interface_assignment $NAME embeddedsw.configuration.isMemoryDevice       1
    set_interface_assignment $NAME embeddedsw.configuration.isNonVolatileStorage 1
    set_interface_assignment $NAME embeddedsw.configuration.isPrintableDevice    0


    #get device name
    set v_dev_name [get_parameter_value GUI_DEV${dev}_TYPE]

    #string name of flash
    set_module_assignment embeddedsw.CMacro.FLASH_TYPE        [proc_get_dev_params "name"  ${v_dev_name} 100]

    # 64 Megabyte Flash.
    set v_sector_size_in_bytes [proc_get_dev_params "sector_size" ${v_dev_name} 100]
    set v_dev_size_in_mb       [proc_get_dev_params "size"        ${v_dev_name} 100]
    set v_dev_size_in_bytes    [expr  ($v_dev_size_in_mb *1024*1024)/8]
    set v_num_of_sectors       [expr $v_dev_size_in_bytes/$v_sector_size_in_bytes]

    set_module_assignment embeddedsw.CMacro.SIZE              $v_dev_size_in_bytes

    #page size in bytes
    set_module_assignment embeddedsw.CMacro.PAGE_SIZE         [proc_get_dev_params "page_size"  ${v_dev_name} 100]

    #sector and subsector size in bytes
    set_module_assignment embeddedsw.CMacro.SECTOR_SIZE       $v_sector_size_in_bytes
    set_module_assignment embeddedsw.CMacro.NUMBER_OF_SECTORS $v_num_of_sectors

}



#-------------------------------------------------------------------------------
#procedure : proc_add_avalon_conduit
#-------------------------------------------------------------------------------

proc proc_add_avalon_conduit {NAME SLAVE_TYPE PendReads} {

        add_interface_port     $NAME  i_${NAME}_addr            address         Input   g_${NAME}_addr_width
        add_interface_port     $NAME  i_${NAME}_burstcount      burstcount      Input   g_${NAME}_burstcount_width
        add_interface_port     $NAME  o_${NAME}_wait_request    waitrequest     Output  1


    if {$SLAVE_TYPE != "AV_READ_ONLY"} {
        add_interface_port     $NAME  i_${NAME}_do_wr           write           Input   1
        add_interface_port     $NAME  i_${NAME}_byteenable      byteenable      Input   g_${NAME}_av_numsymbols
        add_interface_port     $NAME  i_${NAME}_wdata           writedata       Input   g_${NAME}_data_width

        set_interface_property $NAME  writeWaitStates                    {0}
        set_interface_property $NAME  writeWaitTime                      {0}
        set_interface_property $NAME  maximumPendingWriteTransactions    {0}    ; # This value is only used with Avalon Response codes to Write operations.  Typically, this value is 0 in our IP.
    }

    if {$SLAVE_TYPE != "AV_WRITE_ONLY"} {
        add_interface_port     $NAME  i_${NAME}_do_rd           read            Input   1
        add_interface_port     $NAME  o_${NAME}_rdata           readdata        Output  g_${NAME}_data_width
        add_interface_port     $NAME  o_${NAME}_rdata_valid     readdatavalid   Output  1
        add_interface_port     $NAME  o_${NAME}_resp            response        Output  2

        set_interface_property $NAME  maximumPendingReadTransactions     $PendReads  ; # This value is always 1, unless we have an advanced IP that is literally processing 2 or more read transactions concurrently within its pipeline.
        set_interface_property $NAME  readLatency                        {0}  ; # This value is always zero for pipelined interfaces.
        set_interface_property $NAME  readWaitTime                       {0}
    }
}

#-------------------------------------------------------------------------------
#function : Device information Menu
#-------------------------------------------------------------------------------
proc proc_add_dev_info {dev eval_mode tacc_default } {
    add_display_item "" "Device ${dev} Info" GROUP tab

    add_display_item "Device ${dev} Info" "Device ${dev} Parameters" GROUP ""
    add_display_item "Device ${dev} Info" "Device ${dev} Configuration" GROUP ""
    add_display_item "Device ${dev} Info" "Device ${dev} Timings" GROUP ""

    add_display_item "Device ${dev} Parameters"      GUI_DEV${dev}_NAME        PARAMETER ""
    add_display_item "Device ${dev} Parameters"      GUI_DEV${dev}_SIZE        PARAMETER ""
    add_display_item "Device ${dev} Parameters"      GUI_DEV${dev}_MIN_TACC    PARAMETER ""

    add_display_item "Device ${dev} Configuration"   GUI_DEV${dev}_USE_DEFAULT PARAMETER ""

    add_display_item "Device ${dev} Configuration"   GUI_DEV${dev}_DRIVE_STRENGTH       PARAMETER ""
    add_display_item "Device ${dev} Configuration"   GUI_DEV${dev}_DRIVE_STRENGTH_MAN  PARAMETER ""

    add_display_item "Device ${dev} Configuration"   GUI_DEV${dev}_INIT_LATENCY         PARAMETER ""
    add_display_item "Device ${dev} Configuration"   GUI_DEV${dev}_INIT_LATENCY_MAN    PARAMETER ""

    add_display_item "Device ${dev} Configuration"   GUI_DEV${dev}_FIXED_LATENCY        PARAMETER ""
    add_display_item "Device ${dev} Configuration"   GUI_DEV${dev}_FIXED_LATENCY_MAN   PARAMETER ""

    add_display_item "Device ${dev} Configuration"   GUI_DEV${dev}_BURST_LENGTH         PARAMETER ""
    add_display_item "Device ${dev} Configuration"   GUI_DEV${dev}_BURST_LENGTH_MAN    PARAMETER ""

    add_display_item "Device ${dev} Timings"         GUI_DEV${dev}_T_ACC    PARAMETER ""
    add_display_item "Device ${dev} Timings"         GUI_DEV${dev}_T_RWR    PARAMETER ""
    add_display_item "Device ${dev} Timings"         GUI_DEV${dev}_T_CSHI   PARAMETER ""
    add_display_item "Device ${dev} Timings"         GUI_DEV${dev}_T_CSS    PARAMETER ""
    add_display_item "Device ${dev} Timings"         GUI_DEV${dev}_T_CSH    PARAMETER ""

    #----------------------------------------------------------
    # Factory default settings configuration
    #----------------------------------------------------------
    
    proc_add_parameter     GUI_DEV${dev}_USE_DEFAULT    BOOLEAN true "" false  "Device ${dev} Configuration"
    set_parameter_property GUI_DEV${dev}_USE_DEFAULT    DISPLAY_NAME "Use factory default settings for this HyperBus device" ;
    set_parameter_property GUI_DEV${dev}_USE_DEFAULT    DESCRIPTION  \
        "Using factory default settings results in the smallest area HyperBus Memory Controller. \
        Overriding the factory default settings adds combinatorial logic which issues write memory transfer requests to program the HyperBus device at power on / reset, and\
        can result in improved performance in some applications.\
        Enabling 'variable access latency' on HyperRAM devices can result in better average case performance of memory.\
        Real-time systems may perfer to employ 'fixed initial latency' on HypeRAM devices to facilitate improved time-analysability.\
        Designs with low HyperBus clock speeds may reduce the number of clock cycles for the 'initial latency value'\
        to improve memory access performance to HyperRAM and HyperFLash devices."
        
    #----------------------------------------------------------
    # CR register 
    #----------------------------------------------------------

    proc_add_parameter     GUI_DEV${dev}_DRIVE_STRENGTH_MAN Integer 0 "" false  "Device ${dev} Configuration"
    set_parameter_property GUI_DEV${dev}_DRIVE_STRENGTH_MAN DISPLAY_NAME "Output driver drive strength" ;
    set_parameter_property GUI_DEV${dev}_DRIVE_STRENGTH_MAN DESCRIPTION  "Please refer to the HyperBus specifications for more details about the output driver drive strength configuration field (xVCR14 - xVCR12)."
    set_parameter_property GUI_DEV${dev}_DRIVE_STRENGTH_MAN ALLOWED_RANGES {0,1,2,3,4,5,6,7}
    set_parameter_property GUI_DEV${dev}_DRIVE_STRENGTH_MAN ENABLED  true

    proc_add_parameter     GUI_DEV${dev}_DRIVE_STRENGTH     Integer 0 "" true  "Device ${dev} Configuration"
    set_parameter_property GUI_DEV${dev}_DRIVE_STRENGTH     DISPLAY_NAME "Output driver drive strength" ;
    set_parameter_property GUI_DEV${dev}_DRIVE_STRENGTH     DESCRIPTION  "Please refer to the HyperBus specifications for more details about the output driver drive strength configuration field (xVCR14 - xVCR12)."
    set_parameter_property GUI_DEV${dev}_DRIVE_STRENGTH     ALLOWED_RANGES {0,1,2,3,4,5,6,7}
    set_parameter_property GUI_DEV${dev}_DRIVE_STRENGTH     ENABLED  true


    proc_add_parameter     GUI_DEV${dev}_INIT_LATENCY_MAN   Integer $tacc_default Cycles false  "Device ${dev} Configuration"
    set_parameter_property GUI_DEV${dev}_INIT_LATENCY_MAN   DISPLAY_NAME "Inital access latency" ;
    set_parameter_property GUI_DEV${dev}_INIT_LATENCY_MAN   DESCRIPTION  "\
        Reducing the initial access latency (Tacc) value can: (a) reduce memory access times; and (b) increase the effective average case memory bandwidth.\
        The minimum initial access latency (Tacc) value is determined by the device and the clock speed of the HyperBus channel.\
        Please refer to the HyperBus specifications for more details."
    set_parameter_property GUI_DEV${dev}_INIT_LATENCY_MAN   ENABLED  true
    set_parameter_property GUI_DEV${dev}_INIT_LATENCY_MAN   ALLOWED_RANGES {3,4,5,6,7,8,9,10,11,12,13,14,15,16}

    proc_add_parameter     GUI_DEV${dev}_INIT_LATENCY       Integer 16 Cycles true  "Device ${dev} Configuration"
    set_parameter_property GUI_DEV${dev}_INIT_LATENCY       DISPLAY_NAME "Inital access latency" ;
    set_parameter_property GUI_DEV${dev}_INIT_LATENCY       DESCRIPTION  \
        "Reducing the initial access latency (Tacc) value can: (a) reduce memory access times; and (b) increase the effective average case memory bandwidth.\
        The minimum initial access latency (Tacc) value is determined by the device and the clock speed of the HyperBus channel.\
        Please refer to the HyperBus specifications for more details."
   set_parameter_property GUI_DEV${dev}_INIT_LATENCY        ENABLED  true

                                                     
    proc_add_parameter     GUI_DEV${dev}_FIXED_LATENCY_MAN  Integer 1 "" false  "Device ${dev} Configuration"
    set_parameter_property GUI_DEV${dev}_FIXED_LATENCY_MAN  DISPLAY_NAME "Memory access behaviour" ;
    set_parameter_property GUI_DEV${dev}_FIXED_LATENCY_MAN  DESCRIPTION  \
        "'Fixed initial access latency' results in constant worst-case memory access latencies, but with lower average case performance.\
        'Variable initial access latency' results in best-effort memory access latencies, with higher average case performance.\
        HyperFlash only supports fixed initial access latencies.  HyperRAM supports both fixed and variable initial access latencies.\
        Please refer to the HyperBus specifications for more details."
    set_parameter_property GUI_DEV${dev}_FIXED_LATENCY_MAN  ALLOWED_RANGES {"0:Variable initial access latency" "1:Fixed initial access latency"}
    set_parameter_property GUI_DEV${dev}_FIXED_LATENCY_MAN  ENABLED  true

    proc_add_parameter     GUI_DEV${dev}_FIXED_LATENCY      Integer 1 "" true  "Device ${dev} Configuration"
    set_parameter_property GUI_DEV${dev}_FIXED_LATENCY      DISPLAY_NAME "Memory access behaviour" ;
    set_parameter_property GUI_DEV${dev}_FIXED_LATENCY      DESCRIPTION  \
        "'Fixed initial access latency' results in constant worst-case memory access latencies, but with lower average case performance.\
        'Variable initial access latency' results in best-effort memory access latencies, with higher average case performance.\
        HyperFlash only supports fixed initial access latencies.  HyperRAM supports both fixed and variable initial access latencies.\
        Please refer to the HyperBus specifications for more details."
    set_parameter_property GUI_DEV${dev}_FIXED_LATENCY      ALLOWED_RANGES {"0:Variable initial access latency" "1:Fixed initial access latency"}
    set_parameter_property GUI_DEV${dev}_FIXED_LATENCY      ENABLED  true


    proc_add_parameter     GUI_DEV${dev}_BURST_LENGTH_MAN   Integer 3 "" false  "Device ${dev} Configuration"
    set_parameter_property GUI_DEV${dev}_BURST_LENGTH_MAN   DISPLAY_NAME    "Burst length" ;
    set_parameter_property GUI_DEV${dev}_BURST_LENGTH_MAN   DESCRIPTION     "Please refer to the HyperBus specifications for more details about the burst length configuration field (xVCR.1 - xVCR.0)."
    set_parameter_property GUI_DEV${dev}_BURST_LENGTH_MAN   ALLOWED_RANGES  {"0:128 bytes" "1:64 bytes" "2:16 bytes" "3:32 bytes"}
    set_parameter_property GUI_DEV${dev}_BURST_LENGTH_MAN   ENABLED         false

    proc_add_parameter     GUI_DEV${dev}_BURST_LENGTH       Integer 3 "" true  "Device ${dev} Configuration"
    set_parameter_property GUI_DEV${dev}_BURST_LENGTH       DISPLAY_NAME    "Burst length" ;
    set_parameter_property GUI_DEV${dev}_BURST_LENGTH       DESCRIPTION     "Please refer to the HyperBus specifications for more details about the burst length configuration field (xVCR.1 - xVCR.0)."
    set_parameter_property GUI_DEV${dev}_BURST_LENGTH       ALLOWED_RANGES  {"0:128 bytes" "1:64 bytes" "2:16 bytes" "3:32 bytes"}
    set_parameter_property GUI_DEV${dev}_BURST_LENGTH       ENABLED         false

    #----------------------------------------------------------
    #Hyperbus device info
    #----------------------------------------------------------
    proc_add_parameter     GUI_DEV${dev}_NAME           String "No device configured" "" true  "Device ${dev} Parameters"
    set_parameter_property GUI_DEV${dev}_NAME           DISPLAY_NAME "Device" ;
    set_parameter_property GUI_DEV${dev}_NAME           DESCRIPTION  \
        "The current configuration of the HyperBus Memory controller for this chip select.\
        A HyperBus device may be physically connected to this chip select, but not configured by the HBMC instance.\
        In which case the HBMC will never issue memory transfer requests to the HyperBus device connected to this chip select."

    proc_add_parameter     GUI_DEV${dev}_SIZE           Integer 0 Megabytes true  "Device ${dev} Parameters"
    set_parameter_property GUI_DEV${dev}_SIZE           DISPLAY_NAME "Device storage capacity" ;
    set_parameter_property GUI_DEV${dev}_SIZE           DESCRIPTION  "Storage capacity of the configured device"

    proc_add_parameter     GUI_DEV${dev}_MIN_TACC       Integer 16 Cycles true  "Device ${dev} Timings"
    set_parameter_property GUI_DEV${dev}_MIN_TACC       DISPLAY_NAME "Minimum initial latency" ;
    set_parameter_property GUI_DEV${dev}_MIN_TACC       DESCRIPTION  "This field calculates the Minimum Initial Latency (Tacc) with regard to the current frequency that the HyperBus memory channel is currently configured for."
    set_parameter_property GUI_DEV${dev}_MIN_TACC       ENABLED  false;

        
    if {${eval_mode}} {
    set_parameter_property GUI_DEV${dev}_USE_DEFAULT    ENABLED  false;
    } else {
    set_parameter_property GUI_DEV${dev}_USE_DEFAULT    ENABLED  true;
    }

    #----------------------------------------------------------
    #Hyperbus device timing
    #----------------------------------------------------------

    add_display_item "Device ${dev} Parameters"  GUI_DEV${dev} PARAMETER ""

    proc_add_parameter     GUI_DEV${dev}_T_ACC          Integer 0 Cycles true  "Device ${dev} Timings"
    set_parameter_property GUI_DEV${dev}_T_ACC          DISPLAY_NAME "Tacc" ;
    set_parameter_property GUI_DEV${dev}_T_ACC          DESCRIPTION  "Initial Latency. Please refer to the HyperBus specifications for more details."

    proc_add_parameter     GUI_DEV${dev}_T_RWR          Integer 0 Cycles true  "Device ${dev} Timings"
    set_parameter_property GUI_DEV${dev}_T_RWR          DISPLAY_NAME "Trwr" ;
    set_parameter_property GUI_DEV${dev}_T_RWR          DESCRIPTION  "Read write recovery. Please refer to the HyperBus specifications for more details."

    proc_add_parameter     GUI_DEV${dev}_T_CSHI         Integer 0 Cycles true  "Device ${dev} Timings"
    set_parameter_property GUI_DEV${dev}_T_CSHI         DISPLAY_NAME "Tcshi" ;
    set_parameter_property GUI_DEV${dev}_T_CSHI         DESCRIPTION  "Tcshi. Please refer to the HyperBus specifications for more details."

    proc_add_parameter     GUI_DEV${dev}_T_CSS          Integer 0 Cycles true  "Device ${dev} Timings"
    set_parameter_property GUI_DEV${dev}_T_CSS          DISPLAY_NAME "Tcss" ;
    set_parameter_property GUI_DEV${dev}_T_CSS          DESCRIPTION  "Tcss. Please refer to the HyperBus specifications for more details."

    proc_add_parameter     GUI_DEV${dev}_T_CSH          Integer 0 Cycles true  "Device ${dev} Timings"
    set_parameter_property GUI_DEV${dev}_T_CSH          DISPLAY_NAME "Tcsh" ;
    set_parameter_property GUI_DEV${dev}_T_CSH          DESCRIPTION  "Tcsh. Please refer to the HyperBus specifications for more details."

}

#-------------------------------------------------------------------------------
#function : Device Timing Menu
#-------------------------------------------------------------------------------

proc proc_set_device_info {dev dev_name dev_timing clock_frequency_mhz} {

    set v_dev_size_in_mb    [proc_get_dev_params "size"  ${dev_name} ${clock_frequency_mhz}]

    set_parameter_value     GUI_DEV${dev}_NAME     [proc_get_dev_params "name"  ${dev_name} ${clock_frequency_mhz}]
    set_parameter_value     GUI_DEV${dev}_SIZE     [expr $v_dev_size_in_mb/8]

    set_parameter_value     GUI_DEV${dev}_T_CSHI   [expr ($dev_timing >> 0 ) & 0xf]
    set_parameter_value     GUI_DEV${dev}_T_CSS    [expr ($dev_timing >> 4 ) & 0xf]
    set_parameter_value     GUI_DEV${dev}_T_CSH    [expr ($dev_timing >> 8 ) & 0xf]
    set_parameter_value     GUI_DEV${dev}_T_RWR    [expr ($dev_timing >> 12) & 0xf]
    set_parameter_value     GUI_DEV${dev}_T_ACC    [expr ($dev_timing >> 16) & 0x1f]

}

#-------------------------------------------------------------------------------
#function : IAVS0 configuration Menu
#-------------------------------------------------------------------------------
proc proc_add_iavs_config {NAME } {
    add_display_item "" "${NAME} Configuration" GROUP tab


    add_display_item "${NAME} Configuration" "${NAME}: Ingress Avalon port stage" GROUP ""
    add_display_item "${NAME} Configuration" "${NAME}: Ingress Avalon address/data" GROUP ""
    add_display_item "${NAME} Configuration" "${NAME}: Burst converter and address decoder stage" GROUP ""
    add_display_item "${NAME} Configuration" "${NAME}: Ingress Avalon return stage" GROUP ""

    add_display_item "${NAME}: Ingress Avalon port stage"                 GUI_${NAME}_WRITE_MODE          PARAMETER ""
    add_display_item "${NAME}: Ingress Avalon port stage"                 GUI_${NAME}_BYTEENABLE          PARAMETER ""
    add_display_item "${NAME}: Ingress Avalon port stage"                 GUI_${NAME}_PORT_MODE           PARAMETER ""
    add_display_item "${NAME}: Ingress Avalon port stage"                 GUI_${NAME}_REG_WDATA           PARAMETER ""

    add_display_item "${NAME}: Ingress Avalon address/data"               GUI_${NAME}_ADDR_WIDTH          PARAMETER ""
    add_display_item "${NAME}: Ingress Avalon address/data"               GUI_${NAME}_ADDR_UNITS          PARAMETER ""
    add_display_item "${NAME}: Ingress Avalon address/data"               GUI_${NAME}_DATA_WIDTH          PARAMETER ""

    add_display_item "${NAME}: Burst converter and address decoder stage" GUI_${NAME}_MAX_BURST_IN_WORDS  PARAMETER ""
    add_display_item "${NAME}: Burst converter and address decoder stage" GUI_${NAME}_LINEWRAP_BURST      PARAMETER ""
    add_display_item "${NAME}: Burst converter and address decoder stage" GUI_${NAME}_BURST_ON_BURST_BOUNDARIES_ONLY PARAMETER ""
    add_display_item "${NAME}: Burst converter and address decoder stage" GUI_${NAME}_BURST_ON_BURST_BOUNDARIES_AUTO PARAMETER ""

    add_display_item "${NAME}: Ingress Avalon return stage"                GUI_${NAME}_REG_RDATA           PARAMETER ""
    add_display_item "${NAME}: Ingress Avalon return stage"                GUI_${NAME}_USE_RESPONSE        PARAMETER ""

    proc_add_parameter     GUI_${NAME}_WRITE_MODE BOOLEAN true "" false  "AV Configuration"
    set_parameter_property GUI_${NAME}_WRITE_MODE         DISPLAY_NAME "Enable Avalon  write  capability" ;
    set_parameter_property GUI_${NAME}_WRITE_MODE         DESCRIPTION  \
        "Enable the Avalon  write  signals on this slave interface."

    proc_add_parameter     GUI_${NAME}_BYTEENABLE BOOLEAN true "" false  "AV Configuration"
    set_parameter_property GUI_${NAME}_BYTEENABLE DISPLAY_NAME "Enable Avalon  byte-enable  capability" ;# This is the GUI label that appears to the left of this parameter.
    set_parameter_property GUI_${NAME}_BYTEENABLE DESCRIPTION \
        "Enable the Avalon  byte-enable  signals on this slave interface. \
        The Nios II instruction bus master does NOT employ byte-enable signals. \
        In contrast, the Nios II data bus master does employs byte-enable signals."

    proc_add_parameter     GUI_${NAME}_PORT_MODE String "Read/Write" "" true  "AV Configuration"
    set_parameter_property GUI_${NAME}_PORT_MODE DISPLAY_NAME "Access capabilities"  ;# This is the GUI label that appears to the left of this parameter.
    set_parameter_property GUI_${NAME}_PORT_MODE DESCRIPTION "Informs the developer if this ingress avalon slave port supports read and/or write capabilities"

    proc_add_parameter     GUI_${NAME}_REG_WDATA BOOLEAN false "" false  "AV Configuration"
    set_parameter_property GUI_${NAME}_REG_WDATA         DISPLAY_NAME "Register Avalon write data path (generally recommended for high clock speed designs)" ;
    set_parameter_property GUI_${NAME}_REG_WDATA         DESCRIPTION  \
        "When enabled, the value of the Avalon wdata signal is cached in a 32-bit wide register.\
        Registration of the write signal can improve place-and-route results and may enable higher clock speed designs.\
        Registration of the write signal does NOT reduce write memory transfer request performance.\
        Turn write registration off to reduce circuit area requirements.\
        High Avalon clock-speed designs typically enable registration of the  wdata  signal, where as lower-clock speed Avalon designs typically do not."

    proc_add_parameter     GUI_${NAME}_REG_RDATA BOOLEAN false "" false  "AV Configuration"
    set_parameter_property GUI_${NAME}_REG_RDATA         DISPLAY_NAME "Register Avalon read data path (sometimes used to increase top clock speeds)" ;
    set_parameter_property GUI_${NAME}_REG_RDATA         DESCRIPTION  \
       "When enabled, the Avalon  rdata  signal is driven by a 32-bit wide register.\
        Registration can improve place-and-route results and may enable higher clock speed designs.\
        Registration delays the read data on the  rdata  signal by 1 clock cycle.\
        Turn read registration off to reduce circuit area requirements and improve software performance.\
        Typically most designs will NOT need to register the  rdata  signal."

    proc_add_parameter     GUI_${NAME}_USE_RESPONSE BOOLEAN false "" false  "AV Configuration"
    set_parameter_property GUI_${NAME}_USE_RESPONSE         DISPLAY_NAME "Use Avalon transaction responses" ;
#    set_parameter_property GUI_${NAME}_USE_RESPONSE         DESCRIPTION  \
#        "When enabled, the Avalon response signal will be added to the slave interface on this port. If you do not know why you need this, do not enable this capability."
    set_parameter_property GUI_${NAME}_USE_RESPONSE         DESCRIPTION  \
        "Please contact S/Labs if you require the ability to enable the Avalon response signal to the slave interface on this port. The vast majority of projects do not require this capability."
    set_parameter_property GUI_${NAME}_USE_RESPONSE         ENABLED  false

    
    proc_add_parameter     GUI_${NAME}_MAX_BURST_IN_WORDS INTEGER 8 "" false  "AV Configuration"

    set_parameter_property GUI_${NAME}_MAX_BURST_IN_WORDS ALLOWED_RANGES {1,8,16,32,64,128}
    set_parameter_property GUI_${NAME}_MAX_BURST_IN_WORDS DISPLAY_NAME "maxBurstSize (in words)"  ;# This is the GUI label that appears to the left of this parameter.
    set_parameter_property GUI_${NAME}_MAX_BURST_IN_WORDS DESCRIPTION \
        "Select the maximum burst length of read and/or write burst memory transfer requests on this port in words. \
        For best performance and lowest circuit area implementations, the value of maxBurstSize must be set to the value of the largest maxBurstSize of all Avalon bus masters interfaces that are connected to this slave interface."

    proc_add_parameter     GUI_${NAME}_LINEWRAP_BURST    BOOLEAN true "" false "AV Configuration"
    set_parameter_property GUI_${NAME}_LINEWRAP_BURST    ALLOWED_RANGES {"0:false" "1:true"}
    set_parameter_property GUI_${NAME}_LINEWRAP_BURST    DISPLAY_NAME "linewrapBursts" ;# This is the GUI label that appears to the left of this parameter.
    set_parameter_property GUI_${NAME}_LINEWRAP_BURST    DESCRIPTION \
        "If one or more of the Altera Avalon bus master interfaces connected to this slave port employs linewrapBursts=true, then set the \
        linewrapBursts of this slave port to true.  If none of the Altera Avalon bus master interfaces connected to this slave port employ \
        linewrapBursts=true, then we recommend setting the value of linewrapBursts for this slave port to false. \
        In Nios II applications, the Nios II/f L1 instruction cache bus master employs linewrapBursts=true, where as the L1 data cache bus master employs linewrapBursts=false. \
        In contrast, the Nios II/e does not have any internal L1 caches.\
        For Nios II/e applications we strongly recommend S/Labs range of burst capable caches, including our CA-CMS-T003 product."

    proc_add_parameter     GUI_${NAME}_BURST_ON_BURST_BOUNDARIES_ONLY    BOOLEAN false "" false "AV Configuration"
    set_parameter_property GUI_${NAME}_BURST_ON_BURST_BOUNDARIES_ONLY    ALLOWED_RANGES {"0:false" "1:true"}
    set_parameter_property GUI_${NAME}_BURST_ON_BURST_BOUNDARIES_ONLY    DISPLAY_NAME "burstOnBurstBoundariesOnly" ;# This is the GUI label that appears to the left of this parameter.
    set_parameter_property GUI_${NAME}_BURST_ON_BURST_BOUNDARIES_ONLY    DESCRIPTION \
        "Set the value of burstOnBurstBoundariesOnly=true for the slave port when all bus master interfaces connected to this port set the value of their burstOnBurstBoundariesOnly=true. \
        Otherwise, set the value of burstOnBurstBoundariesOnly to false for the slave port.  Setting burstOnBurstBoundariesOnly=true results in lower-circuit area implementations.\
        If you do not know which value to use, set burstOnBurstBoundaries=false."

    proc_add_parameter     GUI_${NAME}_BURST_ON_BURST_BOUNDARIES_AUTO    BOOLEAN true "" true "AV Configuration"
    set_parameter_property GUI_${NAME}_BURST_ON_BURST_BOUNDARIES_AUTO    ALLOWED_RANGES {"0:false" "1:true"}
    set_parameter_property GUI_${NAME}_BURST_ON_BURST_BOUNDARIES_AUTO    DISPLAY_NAME "burstOnBurstBoundariesOnly" ;# This is the GUI label that appears to the left of this parameter.
    set_parameter_property GUI_${NAME}_BURST_ON_BURST_BOUNDARIES_AUTO    DESCRIPTION \
        "Set the value of burstOnBurstBoundariesOnly=true for the slave port when all bus master interfaces connected to this port set the value of their burstOnBurstBoundariesOnly=true. \
        Otherwise, set the value of burstOnBurstBoundariesOnly to false for the slave port.  Setting burstOnBurstBoundariesOnly=true results in lower-circuit area implementations."

    proc_add_parameter     GUI_${NAME}_DATA_WIDTH INTEGER 32 "bits" false  "AV Configuration"
    set_parameter_property GUI_${NAME}_DATA_WIDTH         ALLOWED_RANGES {32}
    set_parameter_property GUI_${NAME}_DATA_WIDTH         DISPLAY_NAME "Word width" ;# This is the GUI label that appears to the left of this parameter.
    set_parameter_property GUI_${NAME}_DATA_WIDTH         DESCRIPTION "The data-path width of this Avalon slave interface"

    proc_add_parameter     GUI_${NAME}_ADDR_WIDTH INTEGER 10 "bits" true "AV Configuration"
    set_parameter_property GUI_${NAME}_ADDR_WIDTH         DISPLAY_NAME "Address width" ;# This is the GUI label that appears to the left of this parameter.
    set_parameter_property GUI_${NAME}_ADDR_WIDTH         DESCRIPTION "The width of the  address signal  of this Avalon slave interface"

    proc_add_parameter     GUI_${NAME}_ADDR_UNITS String "Words" "" false "AV Configuration"
    set_parameter_property GUI_${NAME}_ADDR_UNITS         DISPLAY_NAME "Address units" ;# This is the GUI label that appears to the left of this parameter.
    set_parameter_property GUI_${NAME}_ADDR_UNITS         DESCRIPTION  "Address units"
    set_parameter_property GUI_${NAME}_ADDR_UNITS         ENABLED      false ;

}


#-------------------------------------------------------------------------------
# connection point Conduit
#-------------------------------------------------------------------------------
proc proc_Add_Hyperbus_Conduit_IO {v_num_chipselect pll_is_internal} {


  if {$pll_is_internal == 1} {
    set_interface_property     i_ext_rstn          ENABLED true
    set_interface_property     o_av_out_clk        ENABLED true
    set_interface_property     o_av_out_rstn       ENABLED true
    set_interface_property     in_clk              ENABLED true
    set_interface_property     i_hbus_clk_0        ENABLED false
    set_interface_property     i_hbus_clk_90       ENABLED false
    set_interface_property     i_hbus_clk_180      ENABLED false

    #-------------------------------------------------------------------------------
    # connection point clock
    #-------------------------------------------------------------------------------   
    set_interface_property in_clk   clockRate           [expr [get_parameter_value GUI_INPUT_FREQ_IN_MHZ_SC] * 1000 * 1000]
    set_interface_property in_clk   ENABLED             true
    set_interface_property in_clk   EXPORT_OF           ""
    set_interface_property in_clk   PORT_NAME_MAP       ""
    set_interface_property in_clk   CMSIS_SVD_VARIABLES ""
    set_interface_property in_clk   SVD_ADDRESS_GROUP   ""

    add_interface_port in_clk in_clk clk Input 1
  
    #-------------------------------------------------------------------------------
    # connection point i_ext_rstn
    #-------------------------------------------------------------------------------
    
    set_interface_property i_ext_rstn associatedClock     in_clk
    set_interface_property i_ext_rstn synchronousEdges    DEASSERT
    set_interface_property i_ext_rstn ENABLED             true
    set_interface_property i_ext_rstn EXPORT_OF           ""
    set_interface_property i_ext_rstn PORT_NAME_MAP       ""
    set_interface_property i_ext_rstn CMSIS_SVD_VARIABLES ""
    set_interface_property i_ext_rstn SVD_ADDRESS_GROUP   ""

    add_interface_port i_ext_rstn i_ext_rstn reset_n Input 1

    #-------------------------------------------------------------------------------
    # connection point avalon output clock (from Pll)
    #-------------------------------------------------------------------------------
    
    add_interface o_av_out_clk      clock start
    set_interface_property o_av_out_clk associatedDirectClock ""
    set_interface_property o_av_out_clk clockRate          [expr [get_parameter_value GUI_AV_OUT_FREQ_IN_MHZ_SC] * 1000 * 1000]
    set_interface_property o_av_out_clk clockRateKnown     true
    set_interface_property o_av_out_clk ENABLED            true
    set_interface_property o_av_out_clk EXPORT_OF           ""
    set_interface_property o_av_out_clk PORT_NAME_MAP       ""
    set_interface_property o_av_out_clk CMSIS_SVD_VARIABLES ""
    set_interface_property o_av_out_clk SVD_ADDRESS_GROUP   ""

    add_interface_port o_av_out_clk o_av_out_clk clk Output 1


    #-------------------------------------------------------------------------------
    # connection point o_av_out_rstn (external eset and pll locked
    #-------------------------------------------------------------------------------

    add_interface o_av_out_rstn reset start
    set_interface_property o_av_out_rstn associatedClock     o_av_out_clk
    set_interface_property o_av_out_rstn associatedDirectReset ""
    set_interface_property o_av_out_rstn associatedResetSinks "i_ext_rstn"
    set_interface_property o_av_out_rstn synchronousEdges    DEASSERT
    set_interface_property o_av_out_rstn ENABLED             true
    set_interface_property o_av_out_rstn EXPORT_OF           ""
    set_interface_property o_av_out_rstn PORT_NAME_MAP       ""
    set_interface_property o_av_out_rstn CMSIS_SVD_VARIABLES ""
    set_interface_property o_av_out_rstn SVD_ADDRESS_GROUP   ""

    add_interface_port o_av_out_rstn o_av_out_rstn reset_n Output 1

  } else {

    set_interface_property     i_ext_rstn          ENABLED false
    set_interface_property     o_av_out_clk        ENABLED false
    set_interface_property     o_av_out_rstn       ENABLED false
    set_interface_property     in_clk              ENABLED false
    
    set_interface_property     i_hbus_clk_0        ENABLED true
    set_interface_property     i_hbus_clk_90       ENABLED true
    set_interface_property     i_hbus_clk_180      ENABLED true


    #-------------------------------------------------------------------------------
    # connection point i_hbus_clk_0
    #-------------------------------------------------------------------------------
    set_interface_property  i_hbus_clk_0 clockRate 0
    set_interface_property  i_hbus_clk_0 ENABLED true
    set_interface_property  i_hbus_clk_0 EXPORT_OF ""
    set_interface_property  i_hbus_clk_0 PORT_NAME_MAP "" 
    set_interface_property  i_hbus_clk_0 CMSIS_SVD_VARIABLES ""
    set_interface_property  i_hbus_clk_0 SVD_ADDRESS_GROUP ""

    add_interface_port i_hbus_clk_0 i_hbus_clk_0 clk Input 1

    #-------------------------------------------------------------------------------
    # connection point i_hbus_clk_0
    #-------------------------------------------------------------------------------
    set_interface_property  i_hbus_clk_90 clockRate 0
    set_interface_property  i_hbus_clk_90 ENABLED true
    set_interface_property  i_hbus_clk_90 EXPORT_OF ""
    set_interface_property  i_hbus_clk_90 PORT_NAME_MAP ""
    set_interface_property  i_hbus_clk_90 CMSIS_SVD_VARIABLES ""
    set_interface_property  i_hbus_clk_90 SVD_ADDRESS_GROUP ""

    add_interface_port i_hbus_clk_90 i_hbus_clk_90 clk Input 1

    #-------------------------------------------------------------------------------
    # connection point i_hbus_clk_0
    #-------------------------------------------------------------------------------
    set_interface_property  i_hbus_clk_180 clockRate 0
    set_interface_property  i_hbus_clk_180 ENABLED true
    set_interface_property  i_hbus_clk_180 EXPORT_OF ""
    set_interface_property  i_hbus_clk_180 PORT_NAME_MAP ""
    set_interface_property  i_hbus_clk_180 CMSIS_SVD_VARIABLES ""
    set_interface_property  i_hbus_clk_180 SVD_ADDRESS_GROUP ""

    add_interface_port i_hbus_clk_180 i_hbus_clk_180 clk Input 1
   }
       
    
    #
    #Hyperbus Signal Interface
    set_interface_property Conduit_IO associatedClock     clock
    set_interface_property Conduit_IO associatedReset     ""
    set_interface_property Conduit_IO ENABLED             true
    set_interface_property Conduit_IO EXPORT_OF           ""
    set_interface_property Conduit_IO PORT_NAME_MAP       ""
    set_interface_property Conduit_IO CMSIS_SVD_VARIABLES ""
    set_interface_property Conduit_IO SVD_ADDRESS_GROUP   ""

    add_interface_port Conduit_IO HB_RSTn    HB_RSTn     Output 1
    add_interface_port Conduit_IO HB_CLK0    HB_CLK0     Output 1
    add_interface_port Conduit_IO HB_CLK0n   HB_CLK0n    Output 1
    add_interface_port Conduit_IO HB_CLK1    HB_CLK1     Output 1
    add_interface_port Conduit_IO HB_CLK1n   HB_CLK1n    Output 1
    add_interface_port Conduit_IO HB_CS0n    HB_CS0n     Output 1
    add_interface_port Conduit_IO HB_CS1n    HB_CS1n     Output 1
    add_interface_port Conduit_IO HB_WPn     HB_WPn      Output 1
    add_interface_port Conduit_IO HB_RWDS    HB_RWDS     Bidir  1
    add_interface_port Conduit_IO HB_dq      HB_dq       Bidir  8
    add_interface_port Conduit_IO HB_RSTOn   HB_RSTOn    Input  1
    add_interface_port Conduit_IO HB_INTn    HB_INTn     Input  1
}

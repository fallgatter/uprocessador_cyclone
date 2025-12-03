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



package require -exact qsys 15.0

proc createRange { min max } {
    for { set i $min } { $i < [expr $max + 1] } {incr i} { 
	lappend toReturn $i
    }
    return ${toReturn}
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

proc proc_add_iavs_port {NAME} {
#declare NOT bridge by default.
   set_interface_property $NAME bridgesToMaster                ""
   set_interface_property $NAME addressUnits                   WORDS
   set_interface_property $NAME associatedClock                clock
   set_interface_property $NAME associatedReset                reset
   set_interface_property $NAME bitsPerSymbol                  8
   set_interface_property $NAME burstOnBurstBoundariesOnly     false
   set_interface_property $NAME burstcountUnits                WORDS
   set_interface_property $NAME explicitAddressSpan            0
   set_interface_property $NAME linewrapBursts                 false
   set_interface_property $NAME maximumPendingReadTransactions 1
   set_interface_property $NAME readWaitTime                   0
   set_interface_property $NAME timingUnits                    Cycles
   
   add_interface_port $NAME avs_s0_address       address       Input  g_iavs0_addr_width
   add_interface_port $NAME avs_s0_read          read          Input  1
   add_interface_port $NAME avs_s0_readdata      readdata      Output g_iavs0_data_width
   add_interface_port $NAME avs_s0_write         write         Input  1
   add_interface_port $NAME avs_s0_writedata     writedata     Input  g_iavs0_data_width
   add_interface_port $NAME avs_s0_readdatavalid readdatavalid Output 1
   add_interface_port $NAME avs_s0_waitrequest   waitrequest   Output 1
   add_interface_port $NAME avs_s0_byteenable    byteenable    Input  g_iavs0_av_numsymbols
   add_interface_port $NAME avs_s0_burstcount    burstcount    Input  g_iavs0_burstcount_width
}

# +-----------------------------------
# | module direct_window_bridge
# | 
set_module_property DESCRIPTION "Creates a memory region bridge."
set_module_property NAME sll_memory_region_bridge
set_module_property VERSION 1.3
set_module_property GROUP "Synaptic Labs/Bridges and Adaptors/Memory Mapped"
set_module_property AUTHOR "Synaptic Labs"
set_module_property DISPLAY_NAME "Memory Region Bridge"
set_module_property EDITABLE false
set_module_property ELABORATION_CALLBACK elaborate
set_module_property HIDE_FROM_QUARTUS true
# | 
# +-----------------------------------

# +-----------------------------------
# |filesets
# |
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH generate_synth
set_fileset_property QUARTUS_SYNTH TOP_LEVEL sll_memory_region_bridge

add_fileset SIM_VERILOG SIM_VERILOG generate_sim_ver
set_fileset_property SIM_VERILOG TOP_LEVEL sll_memory_region_bridge

add_fileset SIM_VHDL SIM_VHDL generate_sim_ver
set_fileset_property SIM_VHDL TOP_LEVEL sll_memory_region_bridge
# | 
# +-----------------------------------

# +-----------------------------------
# | generate callbacks
# | 
proc generate_synth {output_name} {
        add_fileset_file sll_memory_region_bridge.v VERILOG PATH sll_memory_region_bridge.v
}

proc generate_sim_ver {output_name} {
        add_fileset_file sll_memory_region_bridge.v VERILOG PATH sll_memory_region_bridge.v
}


# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 

add_parameter GUI_MEMORY_REGION_0_SIZE INTEGER 8
set_parameter_property GUI_MEMORY_REGION_0_SIZE ALLOWED_RANGES "0 1 2 4 8 16 32 64 128 256 512 1024 2048 4096"
set_parameter_property GUI_MEMORY_REGION_0_SIZE DISPLAY_NAME "Memory Region Size"
set_parameter_property GUI_MEMORY_REGION_0_SIZE DESCRIPTION  "Memory region Size in Megabytes"
set_parameter_property GUI_MEMORY_REGION_0_SIZE DISPLAY_UNITS "megabytes"
set_parameter_property GUI_MEMORY_REGION_0_SIZE GROUP "Memory Region 0 Parameters"

add_parameter GUI_MEMORY_REGION_0_OFFSET INTEGER 0
set_parameter_property GUI_MEMORY_REGION_0_OFFSET WIDTH "0"
#set_parameter_property GUI_MEMORY_REGION_0_OFFSET ALLOWED_RANGES "0 1 2 4 8 16 32 64 128 256 512 1024 2048"
set_parameter_property GUI_MEMORY_REGION_0_OFFSET DISPLAY_NAME "Memory Region offset"
set_parameter_property GUI_MEMORY_REGION_0_OFFSET DESCRIPTION "Memory Region Offset"
set_parameter_property GUI_MEMORY_REGION_0_OFFSET DISPLAY_UNITS "megabytes"
set_parameter_property GUI_MEMORY_REGION_0_OFFSET GROUP "Memory Region 0 Parameters"

add_parameter GUI_MEMORY_REGION_0_TYPE BOOLEAN false
set_parameter_property GUI_MEMORY_REGION_0_TYPE    DISPLAY_NAME "Is Flash?" ;# This is the GUI label that appears to the left of this parameter.
set_parameter_property GUI_MEMORY_REGION_0_TYPE    DESCRIPTION  "set true for Flash Memory and false for Normal Memory"
set_parameter_property GUI_MEMORY_REGION_0_TYPE    GROUP "Memory Region 0 Parameters"

                                                                                               
add_parameter GUI_IAVS_BURSTCOUNT INTEGER 8
set_parameter_property GUI_IAVS_BURSTCOUNT DISPLAY_NAME "Burstcount Count"
set_parameter_property GUI_IAVS_BURSTCOUNT DESCRIPTION "Burst count in words of the slave and master burstcount port."
set_parameter_property GUI_IAVS_BURSTCOUNT ALLOWED_RANGES "1 2 4 8 16 32 64 128"
set_parameter_property GUI_IAVS_BURSTCOUNT GROUP "Bridge Slave Properties"

add_parameter GUI_IAVS_LINEWRAP_BURST BOOLEAN true
set_parameter_property GUI_IAVS_LINEWRAP_BURST    DISPLAY_NAME "linewrapBursts" ;# This is the GUI label that appears to the left of this parameter.
set_parameter_property GUI_IAVS_LINEWRAP_BURST    DESCRIPTION  "linewrapBursts"
set_parameter_property GUI_IAVS_LINEWRAP_BURST    ALLOWED_RANGES {"0:false" "1:true"}
set_parameter_property GUI_IAVS_LINEWRAP_BURST    GROUP "Bridge Slave Properties"

add_parameter GUI_IAVS_BURST_ON_BURST_BOUNDARIES_ONLY BOOLEAN false
set_parameter_property GUI_IAVS_BURST_ON_BURST_BOUNDARIES_ONLY DISPLAY_NAME "burstOnBurstBoundariesOnly" ;# This is the GUI label that appears to the left of this parameter.
set_parameter_property GUI_IAVS_BURST_ON_BURST_BOUNDARIES_ONLY DESCRIPTION  "burstOnBurstBoundariesOnly"
set_parameter_property GUI_IAVS_BURST_ON_BURST_BOUNDARIES_ONLY ALLOWED_RANGES {"0:false" "1:true"}
set_parameter_property GUI_IAVS_BURST_ON_BURST_BOUNDARIES_ONLY GROUP "Bridge Slave Properties"

add_parameter MAX_PENDING_READS INTEGER 2
set_parameter_property MAX_PENDING_READS DISPLAY_NAME "Maximum Pending Reads"
set_parameter_property MAX_PENDING_READS DESCRIPTION "Sets the bridge slave's maximumPendingReadTransactions property, in certain system configurations this value should be increased to improve performance."
set_parameter_property MAX_PENDING_READS ALLOWED_RANGES "1 2 4 8 16 32 64"
set_parameter_property MAX_PENDING_READS DISPLAY_UNITS "read pending"
set_parameter_property MAX_PENDING_READS GROUP "Bridge Slave Properties"

add_parameter GUI_EAVM_ADDR_WIDTH_DETECTED INTEGER                                           ;# Types For HDL: BOOLEAN, INTEGER (32-bit), NATURAL, POSITIVE, STD_LOGIC, STD_LOGIC_VECTOR, STRING. Types for non HDL: FLOAT, INTEGER_LIST, LONG (64-bit), STRING_LIST, TEXT
set_parameter_property GUI_EAVM_ADDR_WIDTH_DETECTED HDL_PARAMETER  false                     ;# When true, the parameter must be passed to the HDL IP component description. The default value is false.
set_parameter_property GUI_EAVM_ADDR_WIDTH_DETECTED VISIBLE        false                     ;# When true, indicates that the parameter value can only be set by the IP component, and cannot be set by the user.
set_parameter_property GUI_EAVM_ADDR_WIDTH_DETECTED DERIVED        true                      ;# When true, indicates that the parameter value can only be set by the IP component, and cannot be set by the user.
set_parameter_property GUI_EAVM_ADDR_WIDTH_DETECTED ALLOWED_RANGES 1:32
set_parameter_property GUI_EAVM_ADDR_WIDTH_DETECTED SYSTEM_INFO    { ADDRESS_WIDTH eavm0 }   ;# --- AUTO DETECT ---
set_parameter_property GUI_EAVM_ADDR_WIDTH_DETECTED WIDTH ""                                 ;# For a STD_LOGIC_VECTOR parameter, this indicates the width of the logic vector.

# | HDL parameters
# +-----------------------------------
proc_add_hdl_parameter g_iavs0_data_width       INTEGER 32
proc_add_hdl_parameter g_iavs0_av_numsymbols    INTEGER 4
proc_add_hdl_parameter g_iavs0_addr_width       INTEGER 16
proc_add_hdl_parameter g_eavm0_addr_width       INTEGER 16
proc_add_hdl_parameter g_iavs0_burstcount_width INTEGER 1
proc_add_hdl_parameter g_iavs0_address_offset   INTEGER 0
set_parameter_property g_iavs0_address_offset   DISPLAY_HINT  hexadecimal

# | 
# +-----------------------------------

# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clock
# | 
add_interface clock clock end
set_interface_property clock clockRate 0


add_interface_port clock clk clk Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point reset
# | 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT


add_interface_port reset reset reset Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point iavs
# | 
#add_interface iavs avalon end
#proc_add_iavs_port iavs
#
#add_interface iavs_flash avalon end
#proc_add_iavs_port iavs_flash

# | 
# +-----------------------------------

# +-----------------------------------
# | connection point eavm0
# | 
add_interface eavm0 avalon start
set_interface_property eavm0 addressUnits                   WORDS
set_interface_property eavm0 associatedClock                clock
set_interface_property eavm0 associatedReset                reset
set_interface_property eavm0 bitsPerSymbol                  8
set_interface_property eavm0 burstOnBurstBoundariesOnly     false
set_interface_property eavm0 burstcountUnits                WORDS
set_interface_property eavm0 doStreamReads                  false
set_interface_property eavm0 doStreamWrites                 false
set_interface_property eavm0 holdTime                       0
set_interface_property eavm0 linewrapBursts                 false
set_interface_property eavm0 maximumPendingReadTransactions 0
set_interface_property eavm0 readLatency                    0
set_interface_property eavm0 readWaitTime                   1
set_interface_property eavm0 setupTime                      0
set_interface_property eavm0 timingUnits                    Cycles
set_interface_property eavm0 writeWaitTime                  0


add_interface_port eavm0 avm_m0_address       address       Output g_eavm0_addr_width
add_interface_port eavm0 avm_m0_read          read          Output 1
add_interface_port eavm0 avm_m0_waitrequest   waitrequest   Input  1
add_interface_port eavm0 avm_m0_readdata      readdata      Input  g_iavs0_data_width
add_interface_port eavm0 avm_m0_write         write         Output        1
add_interface_port eavm0 avm_m0_writedata     writedata     Output g_iavs0_data_width
add_interface_port eavm0 avm_m0_readdatavalid readdatavalid Input  1
add_interface_port eavm0 avm_m0_byteenable    byteenable    Output g_iavs0_av_numsymbols
add_interface_port eavm0 avm_m0_burstcount    burstcount    Output g_iavs0_burstcount_width
# | 
# +-----------------------------------

set_module_property VALIDATION_CALLBACK validate

proc validate {} {

    #get maximum size allowed on the Master
    set v_addr_width       [ get_parameter_value GUI_EAVM_ADDR_WIDTH_DETECTED ]
    set v_master_max_size  [expr (1 << $v_addr_width) / (1024*1024)]
  
    #calulate maximum size of the regions size + region offset
    set v_mem_region_size_in_mbytes           [ get_parameter_value GUI_MEMORY_REGION_0_SIZE ]

    set v_mem_region_offset_in_mbytes         [ get_parameter_value GUI_MEMORY_REGION_0_OFFSET ]
    set v_mem_region_max_size                 [expr $v_mem_region_size_in_mbytes + $v_mem_region_offset_in_mbytes]
    
    #check whether region is within bounds
    if { $v_mem_region_max_size >  $v_master_max_size} {
       send_message Error "Memory Region + memory offset greater than maximum size allowed on the master ($v_master_max_size mb)"
    }
    
    
    #check offsets must be a multiple of the range of the memory area assigned to the slave i
    if { [expr $v_mem_region_offset_in_mbytes % $v_mem_region_size_in_mbytes] != 0} {
       send_message Error "memory region offset has to be multiple of v_mem_region_size "
    }
}


proc elaborate {}  {

    #check whether it is flash memor
    if { [get_parameter_value GUI_MEMORY_REGION_0_TYPE] } { 
       set iavs_port_name iavsf
    } else {
       set iavs_port_name iavs
    }

   add_interface $iavs_port_name avalon end
   proc_add_iavs_port $iavs_port_name

#   set burst count
    set v_burstcount_in_words                    [ get_parameter_value GUI_IAVS_BURSTCOUNT ]
    set_parameter_value g_iavs0_burstcount_width [expr int( ceil( log($v_burstcount_in_words) / log(2) ))+1 ]

  #setting eavm address width
     set v_addr_width       [ get_parameter_value GUI_EAVM_ADDR_WIDTH_DETECTED ]

#   set EAVM address width
    set_parameter_value g_eavm0_addr_width    [expr $v_addr_width - 2]

  #memory region parameters
    set v_mem_region_size_in_mbytes           [ get_parameter_value GUI_MEMORY_REGION_0_SIZE ]
    set v_mem_region_size_in_mbytes_log2      [ expr int( ceil( log($v_mem_region_size_in_mbytes) / log(2) ) )]
                                              
    set_parameter_value g_iavs0_addr_width    [ expr $v_mem_region_size_in_mbytes_log2 + 18]
  

  #linewrap and burst on burst boundaries
  if {[ get_parameter_value GUI_IAVS_BURSTCOUNT ] > 1} {
     set_parameter_property GUI_IAVS_BURST_ON_BURST_BOUNDARIES_ONLY VISIBLE true
     set_parameter_property GUI_IAVS_LINEWRAP_BURST                 VISIBLE true
     
    if { [ get_parameter_value GUI_IAVS_LINEWRAP_BURST ] } {
       set_interface_property $iavs_port_name burstOnBurstBoundariesOnly false
       set_interface_property $iavs_port_name linewrapBursts             true

       set_interface_property eavm0 burstOnBurstBoundariesOnly false
       set_interface_property eavm0 linewrapBursts             true
 
      set_parameter_property GUI_IAVS_BURST_ON_BURST_BOUNDARIES_ONLY VISIBLE false
    } else {
       set_interface_property $iavs_port_name burstOnBurstBoundariesOnly [ get_parameter_value GUI_IAVS_BURST_ON_BURST_BOUNDARIES_ONLY ]
       set_interface_property $iavs_port_name linewrapBursts             false

       set_interface_property eavm0 burstOnBurstBoundariesOnly [ get_parameter_value GUI_IAVS_BURST_ON_BURST_BOUNDARIES_ONLY ]
       set_interface_property eavm0 linewrapBursts             false
    }   
  } else {
     set_parameter_property GUI_IAVS_BURST_ON_BURST_BOUNDARIES_ONLY VISIBLE false
     set_parameter_property GUI_IAVS_LINEWRAP_BURST                 VISIBLE false

     set_interface_property $iavs_port_name burstOnBurstBoundariesOnly false
     set_interface_property $iavs_port_name linewrapBursts             false

     set_interface_property eavm0 burstOnBurstBoundariesOnly false
     set_interface_property eavm0 linewrapBursts             false
  }
  
   
                                               
  #setting offset                             
    set v_mem_region_offset_in_mbytes          [ get_parameter_value GUI_MEMORY_REGION_0_OFFSET ]
    set_parameter_value g_iavs0_address_offset [ expr $v_mem_region_offset_in_mbytes * 1024 * 1024]


#   Configure the bridge slave properties
#
    set_interface_property $iavs_port_name maximumPendingReadTransactions [ get_parameter_value MAX_PENDING_READS ]


#
#   Configure C macros for software developers
#
       
    #
    # this assignment allows this component to appear as a memory target in the Nios II linker script configuration GUI
    # it makes the memory map of our slave look like a valid linker target memory region
    
    #check whether it is flash memor
    if { [get_parameter_value GUI_MEMORY_REGION_0_TYPE] } { 
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
       # interface assignments for embedded software
       set_interface_assignment $iavs_port_name embeddedsw.configuration.isFlash              1
       set_interface_assignment $iavs_port_name embeddedsw.configuration.isMemoryDevice       1
       set_interface_assignment $iavs_port_name embeddedsw.configuration.isNonVolatileStorage 1
       set_interface_assignment $iavs_port_name embeddedsw.configuration.isPrintableDevice    0
            
       #string name of flash
       set_module_assignment embeddedsw.CMacro.FLASH_TYPE        FLASH_CFI
   
       set v_dev_size_in_bytes    [expr  ($v_mem_region_size_in_mbytes *1024*1024)]
       set_module_assignment embeddedsw.CMacro.SIZE              $v_dev_size_in_bytes

       #page size in bytes
       set_module_assignment embeddedsw.CMacro.PAGE_SIZE         512
            
       #sector and subsector size in bytes
       set_module_assignment embeddedsw.CMacro.SECTOR_SIZE       262144
       set_module_assignment embeddedsw.CMacro.NUMBER_OF_SECTORS [expr $v_dev_size_in_bytes/262144 ]   
    } else {
       set_interface_assignment $iavs_port_name embeddedsw.configuration.isMemoryDevice 1
    }
    
    #
    # this assignment allows the macros of components attached to our master to appear in the Nios II system.h header
    #set_interface_assignment $iavs_port_name embeddedsw.configuration.affectsTransactionsOnMasters "eavm0"

}


## Add documentation links for user guide and/or release notes

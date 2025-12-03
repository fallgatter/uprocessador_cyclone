##************************************************************************
## * 
## * SYNAPTIC LABORATORIES CONFIDENTIAL
## * ----------------------------------
## * 
## *  (c) 2017 Synaptic Laboratories Limited
## *  All Rights Reserved.
## * 
## * NOTICE:  All information contained herein is, and remains
## * the property of Synaptic Laboratories Limited and its suppliers,
## * if any.  The intellectual and technical concepts contained
## * herein are proprietary to Synaptic Laboratories Limited 
## * and its suppliers and may be covered by U.S. and Foreign Patents,
## * patents in process, and are protected by trade secret or copyright law.
## * Dissemination of this information or reproduction of this material
## * is strictly forbidden unless prior written permission is obtained
## * from Synaptic Laboratories Limited
## *
## * Modification of this file is strictly forbidden unless prior written 
## * permission is obtained from Synaptic Laboratories Limited
##
#############################################################################
#
# sll_memory_region_bridge_sw.tcl
#

# Create a new driver

create_driver sll_memory_region_bridge_driver

# Associate it with some hardware known as "sll_memory_region_bridge"
set_sw_property hw_class_name sll_memory_region_bridge

# The version of this driver
set_sw_property version 1.1

# This driver may be incompatible with versions of hardware less
# than specified below. Updates to hardware and device drivers
# rendering the driver incompatible with older versions of
# hardware are noted with this property assignment.
set_sw_property min_compatible_hw_version 1.1

# Initialize the driver in alt_sys_init()
set_sw_property auto_initialize true

# This driver only works when the following combinations of interfaces 
# are enabled and connected as a group of CSR interfaces.
set_sw_property csr_interfaces "iavsf"

# The SLL-HBC-T001 interrupt has an interrupt but it is not used in the driver. 
# These assignments are still required by the Nios II SBT
set_sw_property isr_preemption_supported true
set_sw_property supported_interrupt_apis "legacy_interrupt_api enhanced_interrupt_api"

# Location in generated BSP that above sources will be copied into
set_sw_property bsp_subdirectory drivers

# Header files 
add_sw_property include_source HAL/inc/sll_memory_region_bridge.h
add_sw_property include_source HAL/inc/sll_lld_S26KSxxxS_S26KLxxxS.h

# C/C++ source files
add_sw_property c_source HAL/src/sll_memory_region_bridge.c
add_sw_property c_source HAL/src/sll_lld_S26KSxxxS_S26KLxxxS.c

# This driver supports HAL & UCOSII BSP (OS) types
add_sw_property supported_bsp_type HAL 
###add_sw_property supported_bsp_type UCOSII

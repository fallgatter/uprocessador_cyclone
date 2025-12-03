/*
 * alt_sys_init.c - HAL initialization source
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'q_sys'
 * SOPC Builder design path: ../../q_sys.sopcinfo
 *
 * Generated: Mon Jul 07 15:57:52 BRT 2025
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#include "system.h"
#include "sys/alt_irq.h"
#include "sys/alt_sys_init.h"

#include <stddef.h>

/*
 * Device headers
 */

#include "altera_nios2_gen2_irq.h"
#include "altera_avalon_jtag_uart.h"
#include "altera_avalon_sysid_qsys.h"
#include "altera_avalon_timer.h"
#include "altera_epcq_controller2.h"
#include "altera_eth_tse.h"
#include "altera_msgdma.h"
#include "altera_remote_update.h"

/*
 * Allocate the device storage
 */

ALTERA_NIOS2_GEN2_IRQ_INSTANCE ( CPU, cpu);
ALTERA_AVALON_JTAG_UART_INSTANCE ( JTAG_UART, jtag_uart);
ALTERA_AVALON_SYSID_QSYS_INSTANCE ( SYSID, sysid);
ALTERA_AVALON_TIMER_INSTANCE ( SYS_CLK_TIMER, sys_clk_timer);
ALTERA_EPCQ_CONTROLLER2_AVL_MEM_AVL_CSR_INSTANCE ( EXT_EPCQ_FLASH, EXT_EPCQ_FLASH_AVL_MEM, EXT_EPCQ_FLASH_AVL_CSR, ext_epcq_flash);
ALTERA_ETH_TSE_INSTANCE ( ETH_TSE, eth_tse);
ALTERA_MSGDMA_CSR_PREFETCHER_CSR_INSTANCE ( MSGDMA_RX, MSGDMA_RX_CSR, MSGDMA_RX_PREFETCHER_CSR, msgdma_rx);
ALTERA_MSGDMA_CSR_PREFETCHER_CSR_INSTANCE ( MSGDMA_TX, MSGDMA_TX_CSR, MSGDMA_TX_PREFETCHER_CSR, msgdma_tx);
ALTERA_REMOTE_UPDATE_INSTANCE ( REMOTE_UPDATE, remote_update);

/*
 * Initialize the interrupt controller devices
 * and then enable interrupts in the CPU.
 * Called before alt_sys_init().
 * The "base" parameter is ignored and only
 * present for backwards-compatibility.
 */

void alt_irq_init ( const void* base )
{
    ALTERA_NIOS2_GEN2_IRQ_INIT ( CPU, cpu);
    alt_irq_cpu_enable_interrupts();
}

/*
 * Initialize the non-interrupt controller devices.
 * Called after alt_irq_init().
 */

void alt_sys_init( void )
{
    ALTERA_AVALON_TIMER_INIT ( SYS_CLK_TIMER, sys_clk_timer);
    ALTERA_AVALON_JTAG_UART_INIT ( JTAG_UART, jtag_uart);
    ALTERA_AVALON_SYSID_QSYS_INIT ( SYSID, sysid);
    ALTERA_EPCQ_CONTROLLER2_INIT ( EXT_EPCQ_FLASH, ext_epcq_flash);
    ALTERA_ETH_TSE_INIT ( ETH_TSE, eth_tse);
    ALTERA_MSGDMA_INIT ( MSGDMA_RX, msgdma_rx);
    ALTERA_MSGDMA_INIT ( MSGDMA_TX, msgdma_tx);
    ALTERA_REMOTE_UPDATE_INIT ( REMOTE_UPDATE, remote_update);
}

/*******************************************************************************
 System Interrupts File

  File Name:
    system_interrupt.c

  Summary:
    Raw ISR definitions.

  Description:
    This file contains a definitions of the raw ISRs required to support the
    interrupt sub-system.

  Summary:
    This file contains source code for the interrupt vector functions in the
    system.

  Description:
    This file contains source code for the interrupt vector functions in the
    system.  It implements the system and part specific vector "stub" functions
    from which the individual "Tasks" functions are called for any modules
    executing interrupt-driven in the MPLAB Harmony system.

  Remarks:
    This file requires access to the systemObjects global data structure that
    contains the object handles to all MPLAB Harmony module objects executing
    interrupt-driven in the system.  These handles are passed into the individual
    module "Tasks" functions to identify the instance of the module to maintain.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2011-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <xc.h>
#include <sys/attribs.h>
#include "app.h"
#include "system_definitions.h"
#include "globals.h"

// *****************************************************************************
// *****************************************************************************
// Section: System Interrupt Vector Functions
// *****************************************************************************
// *****************************************************************************


void __ISR(_TIMER_1_VECTOR, ipl1AUTO) IntHandlerDrvTmrInstance0(void)
{
    static uint16_t hb_cnt = 0, dsply_cnt = 10, input_cnt = 0;

    // Timer counter to set a flag that will cause the main loop to update
    // the heartbeat (status) LED.
    if (hb_cnt++ >= SYS_HB_MS / TMR0_TICK_MS)
    {
        hb_cnt = 0;
        hb_updt = true;
    }

    // Timer Counter to set a flag that will cause the main loop to scan the
    // inputs (pushbutton / dipswitch) used by the application.
    if (input_cnt++ >= INPUT_SCAN_MS / TMR0_TICK_MS)
    {
        input_cnt = 0;
        input_updt = true;
    }

    // Timer counter to set a flag that will cause the main loop to update the
    // OLED display.
    if (dsply_cnt++ >= DSPLY_UPDT_MS / TMR0_TICK_MS)
    {
        dsply_cnt = 0;
        dsply_updt = true;
    }

    // Timer counter to set a flag that will cause the display to be turned off
    // due to inactivity (not currently in use.)
    if (dsply_tmo_cnt++ >= DSPLY_TMO_MS / TMR0_TICK_MS)
    {
        dsply_tmo_cnt = DSPLY_TMO_MS / TMR0_TICK_MS;
    }

    // Clear the interrupt status flag.
    PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_TIMER_1);

}

/*******************************************************************************
 End of File
*/


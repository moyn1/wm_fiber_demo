/*******************************************************************************
  Board Support Package Implementation.

 Company:
    Microchip Technology Inc.

 File Name:
    bsp_sys_init.c

 Summary:
    Board Support Package implementation for the QuEST Wayside Mux development
    board (C Processor PIC32MZ EF).

 Description:
    This file contains the implementation of the Board Support Package for the
    QuEST Wayside Mux Development Board using a PIC32MZ2048ECM100.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2012 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND,
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

#include "bsp_config.h"

// *****************************************************************************
// *****************************************************************************
// *****************************************************************************
// Section: Interface Routines
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function: void BSP_Initialize(void)

  Summary:
    Performs the neccassary actions to initialize a board

  Description:
    This routine performs the neccassary actions to initialize a board

  Remarks:
    Refer to bsp_config.h for usage information.

*/

void BSP_Initialize(void)
{
    PLIB_PORTS_PinClear( PORTS_ID_0, PORT_CHANNEL_A, LED_1);
    PLIB_PORTS_PinClear( PORTS_ID_0, PORT_CHANNEL_A, LED_2);
    PLIB_PORTS_PinClear( PORTS_ID_0, PORT_CHANNEL_D, STATUS_GRN);
    PLIB_PORTS_PinClear( PORTS_ID_0, PORT_CHANNEL_D, STATUS_RED);
}

// *****************************************************************************
/* Function:
    void BSP_LEDStateSet(BSP_LED led, BSP_LED_STATE state);

  Summary:
    Controls the state of the LED.

  Description:
    This function allows the application to specify the state of the LED.

  Remarks:
    Refer to bsp_config.h for usage information.
*/

void BSP_LEDStateSet(BSP_LED led, BSP_LED_STATE state)
{
    /* Update the state of the LED */
	if (led == LED_1 || led == LED_2)
    {
        PLIB_PORTS_PinWrite(PORTS_ID_0, PORT_CHANNEL_A, led, state);
	}
	else
    {
        PLIB_PORTS_PinWrite(PORTS_ID_0, PORT_CHANNEL_D, led, state);
	}
}

// *****************************************************************************
/* Function:
    void BSP_LEDOn(BSP_LED led);

  Summary:
    Switches ON the specified LED.

  Description:
    This function switches ON the specified LED.

  Remarks:
    Refer to bsp_config.h for usage information.
*/

void BSP_LEDOn (BSP_LED led)
{
    /* Switch ON the LED */
	if (led == LED_1 || led == LED_2)
	{
		PLIB_PORTS_PinWrite(PORTS_ID_0, PORT_CHANNEL_A, led, 1);
	}
	else
	{
		PLIB_PORTS_PinWrite(PORTS_ID_0 , PORT_CHANNEL_D , led, 1);
	}
}

// *****************************************************************************
/* Function:
    void BSP_LEDOff(BSP_LED led);

  Summary:
    Switches OFF the specified LED.

  Description:
    This function switches OFF the specified LED.

  Remarks:
    Refer to bsp_config.h for usage information.
*/

void BSP_LEDOff(BSP_LED led)
{
    /* switch OFF the LED */
	if (led == LED_1 || led == LED_2)
	{
		PLIB_PORTS_PinWrite(PORTS_ID_0, PORT_CHANNEL_A, led, 0);
	}
	else
	{
		PLIB_PORTS_PinWrite(PORTS_ID_0 , PORT_CHANNEL_D , led, 0);
	}
}

// *****************************************************************************
/* Function:
    void BSP_LEDToggle(BSP_LED led);

  Summary:
    Toggles the state of the LED between BSP_LED_STATE_ON and BSP_LED_STATE_OFF.

  Description:
    This function toggles the state of the LED between BSP_LED_STATE_ON and
    BSP_LED_STATE_OFF.

  Remarks:
    Refer to bsp_config.h for usage information.
*/

void BSP_LEDToggle(BSP_LED led)
{
	if (led == LED_1 || led == LED_2)
	{
		PLIB_PORTS_PinToggle(PORTS_ID_0, PORT_CHANNEL_A, led);
	}
	else
	{
        PLIB_PORTS_PinToggle(PORTS_ID_0, PORT_CHANNEL_D, led);
	}
}

// *****************************************************************************
/* Function:
    BSP_LED_STATE BSP_LEDStateGet(BSP_LED led);

  Summary:
    Returns the present state of the LED.

  Description:
    This function returns the present state of the LED.

  Remarks:
    Refer to bsp_config.h for usage information.
*/

BSP_LED_STATE BSP_LEDStateGet(BSP_LED led)
{
	if (led == LED_1 || led == LED_2)
	{
        return(PLIB_PORTS_PinGetLatched(PORTS_ID_0, PORT_CHANNEL_A, led));
    }
    else
    {
        return(PLIB_PORTS_PinGetLatched(PORTS_ID_0, PORT_CHANNEL_D, led));
    }
}

// *****************************************************************************
/* Function:
    void BSP_SwitchStateGet(BSP_SWITCH switch);

  Summary:
    Returns the present state (pressed or not pressed) of the specified switch.

  Description:
    This function returns the present state (pressed or not pressed) of the
    specified switch.

  Remarks:
    Refer to bsp_config.h for usage information.
*/

BSP_SWITCH_STATE BSP_SwitchStateGet (BSP_SWITCH bspSwitch)
{
    if (bspSwitch == PBTN_1 || bspSwitch == PBTN_2)
	{
		return (PLIB_PORTS_PinGet(PORTS_ID_0, PORT_CHANNEL_A, bspSwitch-4));
	}
	else
	{
		return (PLIB_PORTS_PinGet(PORTS_ID_0, PORT_CHANNEL_E, bspSwitch));
	}
}

/*******************************************************************************
 End of File
*/

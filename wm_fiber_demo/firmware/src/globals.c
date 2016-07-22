/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    globals.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */
#include "globals.h"
#include "system_config.h"
#include "bsp_config.h"


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

/* ************************************************************************** */
/** Descriptive Data Item Name

  @Summary
    Brief one-line summary of the data item.

  @Description
    Full description, explaining the purpose and usage of data item.
    <p>
    Additional description in consecutive paragraphs separated by HTML
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.

  @Remarks
    Any additional remarks
 */
volatile bool hb_updt = true;
volatile bool input_updt = true;
volatile bool dsply_updt = true;
volatile uint32_t dsply_tmo_cnt = 0;

BSP_LED hb_color = STATUS_RED;


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */

/* ************************************************************************** */
// Just read the value of the free-running 32-bit core timer. This timer ticks
// once every 2 system clocks. (i.e., If the PIC32 is running at 200MHz, this
// timer will increment at a 100MHz rate, yielding a 10ns tick period.)
uint32_t ReadCoreTimer()
{
    volatile uint32_t timer;

    // get the count reg
    asm volatile("mfc0   %0, $9" : "=r"(timer));

    return (timer);
}

/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */

/* ************************************************************************** */
// Blocking microsecond delay by reading the PIC32 core timer until the desired
// time delta has passed. No other code will execute until the requested time
// delay has elapsed.
void UTIL_delay_us(uint32_t us)
{
    register uint32_t start_cnt;
    register uint32_t wait_cnt = us * (SYS_CLK_FREQ / 2000000);

    // Read the start time from the count register.
    start_cnt = ReadCoreTimer();

    // Keep reading timer while delta from start_cnt is less than wait_cnt.
    while (ReadCoreTimer() - start_cnt < wait_cnt);

}

// Blocking milisecond delay by reading the PIC32 core timer until the desired
// time delta has passed. No other code will execute until the requested time
// delay has elapsed.
void UTIL_delay_ms(uint16_t ms)
{
    register uint32_t start_cnt;
    register uint32_t wait_cnt = ms * (SYS_CLK_FREQ / 2000);

    // Read the start time from the count register.
    start_cnt = ReadCoreTimer();

    // Keep reading timer while delta from start_cnt is less than wait_cnt.
    while (ReadCoreTimer() - start_cnt < wait_cnt);
}

// Just blink the system 'heartbeat' status LED. Called from mainloop
// rather than updated in the ISR in order to give feedback that the main
// loop is executing.
void UTIL_system_heartbeat(void)
{
    if (hb_updt)
    {
        BSP_LEDToggle(hb_color);
        hb_updt = false;
    }
}

void UTIL_scan_inputs(void)
{
    static uint16_t pb1_cnt = 0;
    static BSP_SWITCH last_ds1 = SWITCH_OFF;
    BSP_LED new_color;
    bool ds_changed = false;
    if (input_updt)
    {
        // Example of reading a dipswitch (no debounce)
        // Check to see if the DS1 position has changed.
        if (BSP_SwitchStateGet(DS_1) == SWITCH_ON)
        {
            if (last_ds1 == SWITCH_OFF)
            {
                new_color = STATUS_GRN;
                ds_changed = true;
            }
            last_ds1 = SWITCH_ON;
        }
        else
        {
            if (last_ds1 == SWITCH_ON)
            {
                new_color = STATUS_RED;
                ds_changed = true;
            }
            last_ds1 = SWITCH_OFF;
        }

        // Update the LED color for the STATUS/HB LED.
        if (ds_changed)
        {
            bool led_was_on = false;
            if (BSP_LEDStateGet(hb_color) == LED_ON)
            {
                BSP_LEDOff(hb_color);
                led_was_on = true;
            }

            hb_color = new_color;

            if (led_was_on)
            {
                BSP_LEDOn(hb_color);
            }
        }

        // Example of reading a pushbutton (w/ debounce).
        // Change the hb led color on PB1 press.
        if (BSP_SwitchStateGet(PBTN_1) == BTN_PRESSED)
        {
            if (++pb1_cnt == DEBOUNCE_CNT)
            {
                BSP_LEDToggle(LED_1);
            }
        }
        else
        {
            pb1_cnt = 0;
        }

        // Example of reading a pushbutton (w/o debounce).
        // Change the hb led color on PB1 press.
        if (BSP_SwitchStateGet(PBTN_2) == BTN_PRESSED)
        {
            BSP_LEDToggle(LED_2);
        }

        input_updt = false;
    }
} // end UTIL_scan_inputs()


// Update the string buffers that make up the display message and
// send the strings to the OLED.
void UTIL_update_display(void)
{
    char hb_colstr[4];
    char led1_str[4], led2_str[4];

    if (dsply_updt)
    {
        sprintf(hb_colstr, (hb_color == STATUS_GRN) ? "GRN" : "RED");
        sprintf(led1_str, (BSP_LEDStateGet(LED_1) == LED_ON) ? "ON" : "OFF");
        sprintf(led2_str, (BSP_LEDStateGet(LED_2) == LED_ON) ? "ON" : "OFF");

        snprintf(disp_line[LINE1], MAX_OLED_BUFFER, "Status LED: %s", hb_colstr);
        snprintf(disp_line[LINE2], MAX_OLED_BUFFER, "LED1:%3s, LED2:%3s", led1_str, led2_str);

        OLED_write_line(LINE1 + 1, disp_line[LINE1]);
        OLED_write_line(LINE2 + 1, disp_line[LINE2]);
        dsply_updt = false;
    }
} // end UTIL_update_display())
/* *****************************************************************************
 End of File
 */

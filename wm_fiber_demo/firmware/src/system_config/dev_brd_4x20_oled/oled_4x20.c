/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

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
#include <stdio.h>
#include <string.h>

#include "system_config.h"
#include "globals.h"
#include "oled_4x20.h"
//#include "uart.h"
#include "driver/spi/static/drv_spi_static.h"


// OLED char buffer for Lines 1 & 2 (16 characters wide plus an extra for
// the null character that is appended by snprintf.)
char disp_line[NUM_OLED_LNS][MAX_OLED_BUFFER];

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */
#define BITREV(b)   ((uint8_t)(((b * 0x0802LU & 0x22110LU) | (b * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16))
#define LODATA(b)     (0xF0 & b)
#define HIDATA(b)     (0xF0 & b<<4)

                             // 11111 R/W D/C 0
#define CMD_START   ((uint8_t)0b11111000)
#define DATA_START  ((uint8_t)0b11111010)


// IS - Special Registers Enable Bit.
// RE - Extended Function Registers Enable Bit.
// SD - OLED Command Set Enable Bit.

// Fundamental Command Set (RE = 0)
#define CLR_DSPLY               (uint8_t)(0b00000001)
#define RTN_HOME                (uint8_t)(0b00000010)
#define ENTRY_MODE_SET_0(ID, S) (uint8_t)(0b00000100 | (ID<<1 & 0x02) | (S & 0x01))
#define DSPLY_CTRL(D,C,B)       (uint8_t)(0b00001000 | (D<<2 & 0x04) | (C<<1 & 0x02) | (B & 0x01))
#define CURS_DIS_SHIFT(DIS, R)  (uint8_t)(0b00010000 | (DIS<<3 & 0x8) | (R<<2 & 0x04))

#define FCN_SET_0(IS)           (uint8_t)(0b00101000 | (IS & 0x01))  // 0-0-1-x-N-DH-RE(0)-IS
#define SET_CGRAM_ADDR(ADR)     (uint8_t)(0b01000000 | (ADR & 0x3F))
#define SET_DDRAM_ADDR(ADR)     (uint8_t)(0b10000000 | (ADR & 0x7F))

// Fundamental Command Set (RE = 1)
#define ENTRY_MODE_SET_1(BDC, BDS)  (uint8_t)(0b00000100 | (BDC<<1 & 0x02) | (BDS & 0x01))
#define FCN_SET_1(BE,REV)           (uint8_t)(0b00101010 | (BE<<2 & 0x04) | (REV & 0x01))  // 0-0-1-x-N-BE-RE(1)-REV
#define EXT_FCN_SET                 (uint8_t)(0b00001001) // Sets for 4-line display (when N=1 is set by FCN_SET_RE#)
#define SET_SCROLL_CNT(CNT)         (uint8_t)(0b10000000 | (CNT & 0x3F))

// Special Register Commands (RE = 1, IS = 1)
#define SHIFT_SCROLL_ENBL(SHFT)     (uint8_t)(0b00011100 | (SHFT & 0x01))
#define SHIFT_SCROLL_LINE(LINE)     (uint8_t)(0b00010000 | (LINE & 0x0F))

// Extended Function Registers (RE = 1)
#define FCN_SEL_A           (uint8_t)(0b01110001)
#define FCN_SEL_B           (uint8_t)(0b01110010)
#define OLED_CMD_EN(SD)     (uint8_t)(0b01111000 | (SD & 0x01))

// OLED Command Set (RE = 1, SD = 1)
#define SET_CONTRAST    (uint8_t)(0b10000001)
#define SET_CLK_DIV     (uint8_t)(0b11010101)
#define SET_PHASE_LEN   (uint8_t)(0b11011001)
#define SET_SEG_PINS    (uint8_t)(0b11011010)
#define SET_VCOM_DESEL  (uint8_t)(0b11011011)
#define FCN_SEL_C       (uint8_t)(0b11011100)
#define FADE_DSPLY      (uint8_t)(0b00100011)

// Character/Display Address Defines.
#define CGRAM1_ADDR     0x00
#define CGRAM2_ADDR     0x08
#define CGRAM3_ADDR     0x10
#define CGRAM4_ADDR     0x18
#define CGRAM5_ADDR     0x20
#define CGRAM6_ADDR     0x28
#define CGRAM7_ADDR     0x30
#define CGRAM8_ADDR     0x38

#define DDRAM_LN1_ADDR  0x00
#define DDRAM_LN2_ADDR  0x20
#define DDRAM_LN3_ADDR  0x40
#define DDRAM_LN4_ADDR  0x60


// Local Function Prototypes
static void send_oled_command(uint8_t);
static void send_oled_data(uint8_t[], uint8_t);
static void create_custom_chars(void);

/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */
static void send_oled_command(uint8_t cmd)
{
    uint8_t tx_data[3] = {0};
    uint8_t rx_data[3] = {0};

    tx_data[0] = CMD_START;
    tx_data[1] = LODATA(BITREV(cmd));
    tx_data[2] = HIDATA(BITREV(cmd));

    DRV_SPI0_BufferAddWriteRead(&tx_data, &rx_data, 3);
    UTIL_delay_us(600);
}

static void send_oled_data(uint8_t data[], uint8_t len)
{
    uint8_t tx_data[(2*len) + 1];
    uint8_t rx_data[(2*len) + 1];
    uint8_t idx = 0;

    tx_data[0] = DATA_START;

    for (idx = 0; idx < len; idx++)
    {
        tx_data[(idx*2)+1] = LODATA(BITREV(data[idx]));
        tx_data[(idx*2)+2] = HIDATA(BITREV(data[idx]));
    }

    DRV_SPI0_BufferAddWriteRead(&tx_data, &rx_data, (2*len)+1);
    UTIL_delay_us(600);
}

// Custom characters must be created and written to the CGRAM locations
// reserved for this purpose (0x00 - 0x07) prior to being used for display.
// Create the custom characters in CGRAM.
#define LR_OPEN  0x00
#define LR_CLOSE 0x01
#define RL_OPEN  0x02
#define RL_CLOSE 0x03
static void create_custom_chars(void)
{
/*
    uint8_t data[32] = {0x03,   // ---...@@
                        0x06,   // ---..@@.
                        0x0C,   // ---.@@..
                        0x18,   // ---@@...
                        0x0C,   // ---.@@..
                        0x06,   // ---..@@.
                        0x03,   // ---...@@
                        0x00,   // --------

                        0x00,   // ---.....
                        0x00,   // ---.....
                        0x07,   // ---..@@@
                        0x1F,   // ---@@@@@
                        0x07,   // ---..@@@
                        0x00,   // ---.....
                        0x00,   // ---.....
                        0x00,   // --------

                        0x18,   // ---@@...
                        0x0C,   // ---.@@..
                        0x06,   // ---..@@.
                        0x03,   // ---...@@
                        0x06,   // ---..@@.
                        0x0C,   // ---.@@..
                        0x18,   // ---@@...
                        0x00,   // --------

                        0x00,   // ---.....
                        0x00,   // ---.....
                        0x1C,   // ---@@@..
                        0x1F,   // ---@@@@@
                        0x1C,   // ---@@@..
                        0x00,   // ---.....
                        0x00,   // ---.....
                        0x00};   // --------

    send_oled_command(SET_CGRAM_ADDR(CGRAM1_ADDR)); // Set CGRAM start address
    send_oled_data(data, 32);
*/

} // end create_custom_chars()


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */
void OLED_initialize(void)
{
    uint8_t data[1];

    // One time delay after initial power on.
    UTIL_delay_ms(5);

    // Function set - Fundamental command set.
    send_oled_command(FCN_SET_0(0));

    // Display OFF, Cursor OFF, Blink OFF.
    send_oled_command(DSPLY_CTRL(0,0,0));

    // Function Set - Extended command set.
    send_oled_command(FCN_SET_1(0,0));

    // OLED Command Set enable
    send_oled_command(OLED_CMD_EN(1));

    // Set Clock Divide ratio/oscillator frequency.
    send_oled_command(SET_CLK_DIV);
    send_oled_command(0x70);

    // OLED Command Set disable.
    send_oled_command(OLED_CMD_EN(0));

    // Extended function set (4-line display).
    send_oled_command(EXT_FCN_SET);

    // COM SEG direction.
    send_oled_command(ENTRY_MODE_SET_1(1,0));

    // Function selection B.
    send_oled_command(FCN_SEL_B);
    data[0] = 0x09;         // (0x08 = ROM_B CGROM table), 0x01 = (248/8 CGROM/CGRAM)
    send_oled_data(data, 1);

    // Function Set - Enable extended command set.
    send_oled_command(FCN_SET_1(0,0));

    // OLED Command Set enable.
    send_oled_command(OLED_CMD_EN(1));

    // Set SEG Pins HW config.
    send_oled_command(SET_SEG_PINS);
    send_oled_command(0x10);

    // Function Selection C.
    send_oled_command(FCN_SEL_C);
    send_oled_command(0x00);

    // Set Contrast Control.
    send_oled_command(SET_CONTRAST);
    send_oled_command(0x7F);

    // Set Phase length.
    send_oled_command(SET_PHASE_LEN);
    send_oled_command(0xF1);

    // Set VCOMH deselect level.
    send_oled_command(SET_VCOM_DESEL);
    send_oled_command(0x40);

    // OLED Command Set disable
    send_oled_command(OLED_CMD_EN(0));

    // Function Set - Fundamental command set.
    send_oled_command(FCN_SET_0(0));

    // Create custom characters in CGRAM.
    create_custom_chars();

    // Clear the display.
    send_oled_command(CLR_DSPLY);

    // Set DDRAM address to 0x00.
    send_oled_command(SET_DDRAM_ADDR(0));

    // Display ON. No Cursor. No Blink.
    send_oled_command(DSPLY_CTRL(1,0,0));
    UTIL_delay_ms(100);
} // end OLED_initialize())

void OLED_display_on(void)
{
    // Display ON. No Cursor. No Blink.
    send_oled_command(DSPLY_CTRL(1,0,0));
}

void OLED_display_off(void)
{
    // Display OFF.
    send_oled_command(DSPLY_CTRL(0,0,0));
}

void OLED_clear_display(void)
{
    send_oled_command(CLR_DSPLY);
}

// Write character arry data to the first line of the display.
void OLED_write_line(uint8_t line_no, char buf[])
{
    uint32_t addr = 0;
    uint8_t len = 0;

    switch (line_no)
    {
        case 1:
            addr = DDRAM_LN1_ADDR;
            break;

        case 2:
            addr = DDRAM_LN2_ADDR;
            break;

        case 3:
            addr = DDRAM_LN3_ADDR;
            break;

        case 4:
            addr = DDRAM_LN4_ADDR;
            break;

        default:
            break;
    }

    // Pad the buffer with spaces to remove any 'stale' characters.
    len = strlen(buf);
    if (len < 20)
    {
        for (len; len <= MAX_OLED_CHARS; len++)
        {
            buf[len] = ' ';
        }
    }

    send_oled_command(SET_DDRAM_ADDR(addr));
    send_oled_data(buf, MAX_OLED_CHARS); // Drive characters onto the display
} // end OLED_write_line()

void OLED_clear_line( uint8_t line )
{
    char buf[MAX_OLED_CHARS+1]; //16 spaces

    memset(buf, ' ', MAX_OLED_CHARS);

    if( line > 0 && line < 5 )
        OLED_write_line(line, buf);
}

void OLED_write_char(char data, uint8_t line, uint8_t pos)
{
    uint8_t odata[1] = {(uint8_t)data};

    if( pos < MAX_OLED_CHARS )   // 0-15
    {
        switch( line )
        {
            case 1:
                send_oled_command(SET_DDRAM_ADDR(DDRAM_LN1_ADDR + pos));
                break;

            case 2:
                send_oled_command(SET_DDRAM_ADDR(DDRAM_LN2_ADDR + pos));
                break;

            case 3:
                send_oled_command(SET_DDRAM_ADDR(DDRAM_LN3_ADDR + pos));
                break;

            case 4:
                send_oled_command(SET_DDRAM_ADDR(DDRAM_LN4_ADDR + pos));
                break;

            default:
                break;
        }

        send_oled_data(odata,1);
    }
} // end OLED_write_char()

// Animate the "wait" characters. A pair of characters from the built-in Font Table,
// "/" and "-", and a pair of custom characters, "\" and "|" make up the wait animation.
void OLED_animate_wait(void)
{
    uint32_t x, cur_pos;
    uint8_t data[1] = {'X'};

    // Set up cursor position.
    cur_pos = DDRAM_LN1_ADDR | 0x13;

    for(x = 0; x < 9; x++)
    {
        //Check for DS_1 ON and break from loop if ON.
        if (PLIB_PORTS_PinGet(PORTS_ID_0, PORT_CHANNEL_E, PORTS_BIT_POS_0))
        {
            OLED_clear_display();
            break;
        }

        // Set cursor position, end of second line.
        send_oled_command(SET_DDRAM_ADDR(cur_pos));
        data[0] = '/';
        send_oled_data(data, 1); // Write Data DDRAM
        UTIL_delay_ms(75);

        // Set cursor position, end of second line.
        send_oled_command(SET_DDRAM_ADDR(cur_pos));
        data[0] = '-';
        send_oled_data(data, 1);       // Write Data CGRAM
        UTIL_delay_ms(75);

        // Set cursor position, end of second line.
        send_oled_command(SET_DDRAM_ADDR(cur_pos));
        data[0] = '\\';
        send_oled_data(data, 1); // Write Data CGRAM
        UTIL_delay_ms(75);

        // Set cursor position, end of second line.
        send_oled_command(SET_DDRAM_ADDR(cur_pos));
        data[0] = '|';
        send_oled_data(data, 1);  // Write Data DDRAM
        UTIL_delay_ms(75);
    }

    // Set cursor position, end of second line.
    send_oled_command(SET_DDRAM_ADDR(cur_pos));
    data[0] = '*';
    send_oled_data(data, 1);  // Asterisk

} // end OLED_animate_wait())

// The display is cleared by the Cleaner.  A pair of custom characters that are
// repeated across the display clearing the displayed message and leaving behind
// blank characters.
void OLED_clean_display(void)
{
    int8_t pos;
    uint8_t data[1];

    for(pos = 0; pos < MAX_OLED_CHARS; pos++)
    {
        //Check for DS_1 ON and break from loop if ON.
        if (PLIB_PORTS_PinGet(PORTS_ID_0, PORT_CHANNEL_E, PORTS_BIT_POS_0))
        {
            break;
        }

        send_oled_command(SET_DDRAM_ADDR(DDRAM_LN1_ADDR + pos));
        data[0] = LR_OPEN;
        send_oled_data(data, 1);
        UTIL_delay_ms(50);

        send_oled_command(SET_DDRAM_ADDR(DDRAM_LN1_ADDR + pos));
        data[0] = LR_CLOSE;
        send_oled_data(data, 1);
        UTIL_delay_ms(50);

        send_oled_command(SET_DDRAM_ADDR(DDRAM_LN1_ADDR + pos));
        data[0] = ' ';
        send_oled_data(data, 1);
        UTIL_delay_ms(75);
    }

    for(pos = MAX_OLED_CHARS-1; pos >= 0; pos--)
    {
        //Check for DS_1 ON and break from loop if ON.
        if (PLIB_PORTS_PinGet(PORTS_ID_0, PORT_CHANNEL_E, PORTS_BIT_POS_0))
        {
            break;
        }

        send_oled_command(SET_DDRAM_ADDR(DDRAM_LN2_ADDR + pos));
        data[0] = RL_OPEN;
        send_oled_data(data, 1);
        UTIL_delay_ms(50);

        send_oled_command(SET_DDRAM_ADDR(DDRAM_LN2_ADDR + pos));
        data[0] = RL_CLOSE;
        send_oled_data(data, 1);
        UTIL_delay_ms(50);

        send_oled_command(SET_DDRAM_ADDR(DDRAM_LN2_ADDR + pos));
        data[0] = ' ';
        send_oled_data(data, 1);
        UTIL_delay_ms(75);
    }

} // end OLED_clean_display()


/*
void OLED_poll_rx_buffers(void)
{
    //data from proc a prints to line 1 and 2
    //data from proc b prints to line 3 and 4
    static uint8_t proc_a_line = 1;
    static uint8_t proc_a_pos  = 0;
    static uint8_t proc_b_line = 3;
    static uint8_t proc_b_pos  = 0;

    uint8_t data = 0;

//    if(time_to_update)
//    {
//        time_to_update = false;

    //proc a (uart 3)
    while( COMM_read_byte_from_uart(UART_3, &data) )
    {
        if( '\n' == data )
        {
            if(++proc_a_line > 2)
                proc_a_line = 1;
            OLED_clear_line(proc_a_line);
            proc_a_pos = 0;
        }
        else
        {
            OLED_write_char( data, proc_a_line, proc_a_pos );
            if(++proc_a_pos >= MAX_OLED_CHARS)
            {
                proc_a_pos = 0;
                if(++proc_a_line > 2)
                    proc_a_line = 1;
            }
        }
    }

    //proc b (uart 4)
    while( COMM_read_byte_from_uart(UART_4, &data) )
    {
        if( '\n' == data )
        {
            if(++proc_b_line > 4)
                proc_b_line = 3;
            OLED_clear_line(proc_b_line);
            proc_b_pos = 0;
        }
        else
        {
            OLED_write_char( data, proc_b_line, proc_b_pos );
            if(++proc_b_pos >= MAX_OLED_CHARS)
            {
                proc_b_pos = 0;
                if(++proc_b_line > 4)
                    proc_b_line = 3;
            }
        }
    }
//    }
}
*/

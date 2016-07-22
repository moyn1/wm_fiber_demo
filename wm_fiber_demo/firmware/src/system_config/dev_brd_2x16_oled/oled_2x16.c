/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    oled_2x16.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */
// Includes
#include <string.h>
#include "globals.h"
#include "oled_2x16.h"


// OLED char buffer for Lines 1 & 2 (16 characters wide plus an extra for
// the null character that is appended by snprintf.)
char disp_line[NUM_OLED_LNS][MAX_OLED_BUFFER];

// File Scope Defines
///////////////////////////////////////////////////////////////
// OLED 'SPI' bit bang defines
///////////////////////////////////////////////////////////////
// OLED chip select on port pin RD1 pin is OUT
#define OLED_CS(val) WRITE_PIN(OLED_CS_PORT, OLED_CS_PIN, val)
// Serial clock on port pin RG6 pin is OUT
#define OLED_SCLK(val) WRITE_PIN(OLED_SCLK_PORT, OLED_SCLK_PIN, val)
// Serial data out (data to OLED) on port pin RD14 pin is OUT
#define OLED_SDO(val) WRITE_PIN(OLED_SDO_PORT, OLED_SDO_PIN, val)
// Serial data in (data from OLED) on port pin RC13 pin is IN
#define OLED_SDI READ_PIN(OLED_SDI_PORT, OLED_SDI_PIN)


typedef enum {
    COMMAND = 0,
    DATA,
    MORE_DATA
} OLED_INST_T;


// Local Function Prototypes
static void serial_byte(uint8_t, OLED_INST_T);
void OLED_IF_write_other(uint8_t);
void Init_heart(void);

/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */
// OLED 10/8-bit SPI serial transaction.
 static void serial_byte(uint8_t data, OLED_INST_T inst)
{
    uint8_t bit_num = 0;

    // If necessary, first send RS & RW.
    if (inst != MORE_DATA)
    {
        // Clock out the RS bit.
        OLED_SCLK(0);
        if (inst == COMMAND)
        {
            OLED_SDO(0);
        }
        else // inst == DATA
        {
            OLED_SDO(1);
        }
        UTIL_delay_us(0);
        OLED_SCLK(1);
        UTIL_delay_us(0);

        // Also clock out the RW bit (always a 0
        // unless we decide to READ from OLED.)
        OLED_SCLK(0);
        OLED_SDO(0);
        UTIL_delay_us(0);
        OLED_SCLK(1);
        UTIL_delay_us(0);
    }

    // Now send the 8-bit data word.
    while (bit_num < 8)
    {
        OLED_SCLK(0);
        ((data << bit_num++) & 0x80) ? OLED_SDO(1) : OLED_SDO(0);
        UTIL_delay_us(0);
        OLED_SCLK(1);
        UTIL_delay_us(0);
    }

   return;
} // end serial_byte

/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */
void OLED_initialize()
{
    OLED_send_cmd(FONT_SET);     //Function Set
    OLED_send_cmd(DISP_OFF);     //Display OFF
    OLED_send_cmd(CLEAR_DISP);   //Display Clear
    UTIL_delay_us(DISP_CLR_TIME); // Additional delay to allow Display Clear to complete
    OLED_send_cmd(SET_INC_MODE); //Entry Mode Set
    OLED_send_cmd(RETURN_HOME);  //Home Command
    OLED_send_cmd(DISP_ON);      //Turn Display ON

    // Create 4 custom characters in CGRAM
    Init_back_slash();
    Init_vert_line();
    Init_clear_open();
    Init_clear_close();
    Init_heart();

    return;
}

void OLED_clear_display(void)
{
    OLED_send_cmd(CLEAR_DISP);   //Display Clear
    UTIL_delay_us(DISP_CLR_TIME);
}

// OLED command write
void OLED_send_cmd(uint8_t Command)
{
    // Enable the chip select.
    OLED_CS(0);

    // Send the command byte.
    serial_byte(Command, COMMAND);

    // Disable the chip select.
    OLED_CS(1);

    // Enforce time for command to execute.
    UTIL_delay_us(CMD_DELAY);

    return;
} // end OLED_send_cmd()

// OLED CGRAM/DDRAM data write
void OLED_send_data(uint8_t RAM_data[], uint8_t len)
{
    uint8_t i = 0;

    // Enable the chip select.
    OLED_CS(0);

    // Send the first data byte.
    serial_byte(RAM_data[i++], DATA);

    // Send any remaining data bytes.
    while (--len > 0)
    {
        serial_byte(RAM_data[i++], MORE_DATA);
    }

    // Disable the chip select.
    OLED_CS(1);

    // Enforce time for data write to execute.
    UTIL_delay_us(CMD_DELAY);

    return;
} // end OLED_send_data()

// Write character array data to the first line of the display.
void OLED_write_line(uint8_t num, char buf[])
{
    if (num = 0)
    {
        OLED_send_cmd(DDRAM_ADDR | DDRAM_LN1_PG1);    // Set DDRAM address to 0x00.
    }
    else
    {
        OLED_send_cmd(DDRAM_ADDR | DDRAM_LN2_PG1);    // Set DDRAM address to 0x40.
    }
    OLED_send_data(buf, strlen(buf)); // Drive characters onto the display

    return;
} // end OLED_write_line()


// Write character arry data to the first line of the display.
void OLED_write_char(char data, uint8_t line, uint8_t pos)
{
    if( line < 2 )   // 0 = line 1, 1 = line 2
    {
        if( pos < 16 )   // 0-15
        {
            if( line == 0 )
                OLED_send_cmd(DDRAM_ADDR | DDRAM_LN1_PG1 | pos );
            else
                OLED_send_cmd(DDRAM_ADDR | DDRAM_LN2_PG1 | pos );

            // Enable the chip select.
            OLED_CS(0);

            // Send the first data byte.
            serial_byte(data, DATA);

            // Disable the chip select.
            OLED_CS(1);

            // Enforce time for data write to execute.
            UTIL_delay_us(CMD_DELAY);
        }
    }

    return;
} // end OLED_write_char()


void OLED_write_other(uint8_t sel)
{
    char buf1[17] = {0x43, 0x68, 0x61, 0x64, 0x20, 0x04,
                     0x73, 0x20, 0x55, 0x6E, 0x69,
                     0x63,0x6F, 0x72, 0x6E, 0x73};
    char buf2[17] = {0x26, 0x20, 0x52, 0x61, 0x69, 0x6E,
                     0x62, 0x6F, 0x77, 0x73, 0x20,
                     0x2D, 0x20, 0x20, 0x20, 0x20};
    char buf3[4] = {0x20, 0x20, 0x20};
    char buf4[4] = {0x04, 0x04, 0x04};

    if (sel == 0)
    {
        OLED_send_cmd(DDRAM_ADDR | DDRAM_LN1_PG2);    // Set DDRAM address to 0x00.
        OLED_send_data(buf1, strlen(buf1)); // Drive characters onto the display
        OLED_send_cmd(DDRAM_ADDR | DDRAM_LN2_PG2);    // Set DDRAM address to 0x40.
        OLED_send_data(buf2, strlen(buf2)); // Drive characters onto the display
    }
    else if (sel == 1)
    {
        OLED_send_cmd(DDRAM_ADDR | DDRAM_LN2_PG2 + 0xD);    // Set DDRAM address to 0x40.
        OLED_send_data(buf3, strlen(buf3)); // Drive characters onto the display
    }
    else
    {
        OLED_send_cmd(DDRAM_ADDR | DDRAM_LN2_PG2 + 0xD);    // Set DDRAM address to 0x40.
        OLED_send_data(buf4, strlen(buf4)); // Drive characters onto the display
    }
    return;
}

// Animate the "wait" characters. A pair of characters from the built-in Font Table,
// "/" and "-", and a pair of custom characters, "\" and "|" make up the wait animation.
void OLED_animate_wait(void)
{
    unsigned int x,y;
    uint8_t data[1];

    y = DDRAM_ADDR | 0x0F;      // Cursor position, end of first line

    for(x = 0; x < 9; x++)
    {
        //Check for DS_1 ON and break from loop if ON.
        if (PLIB_PORTS_PinGet(PORTS_ID_0, PORT_CHANNEL_E, PORTS_BIT_POS_0))
        {
            OLED_send_cmd(CLEAR_DISP);  //Display Clear
            UTIL_delay_us(DISP_CLR_TIME); // Additional delay to allow Display Clear to complete
            break;
        }

        OLED_send_cmd(y);           // Reset cursor position, end of first line
        data[0] = FORWARD_SLASH;
        OLED_send_data(data, 1);    // Write Data DDRAM
        UTIL_delay_us(75000);

        OLED_send_cmd(y);           // Reset cursor position, end of first line
        data[0] = DASH;
        OLED_send_data(data, 1);    // Write Data CGRAM
        UTIL_delay_us(75000);

        OLED_send_cmd(y);           // Reset cursor position, end of first line
        data[0] = BACK_SLASH;
        OLED_send_data(data, 1);    // Write Data CGRAM
        UTIL_delay_us(75000);

        OLED_send_cmd(y);           // Reset cursor position, end of first line
        data[0] = VERT_LINE;
        OLED_send_data(data, 1);    // Write Data DDRAM
        UTIL_delay_us(75000);
    }

    OLED_send_cmd(y);           // Reset cursor position, end of first line
    data[0] = ASTERIX;
    OLED_send_data(data, 1);    // Asterisk

    return;
} // end OLED_animate_wait()

// The display is cleared by the Cleaner.  A pair of custom characters that are
// repeated across the display clearing the displayed message and leaving behind
// blank characters.
void OLED_clean_display(void)
{
    unsigned int x;
    uint8_t data[1];
    for(x = 0; x < MAX_OLED_CHARS; x++)
    {
        //Check for DS_1 ON and break from loop if ON.
        if (PLIB_PORTS_PinGet(PORTS_ID_0, PORT_CHANNEL_E, PORTS_BIT_POS_0))
        {
            break;
        }

        OLED_send_cmd((DDRAM_ADDR | DDRAM_LN1_PG1) + x); // Set cursor position, first character, first line
        data[0] = CLEAR_OPEN;
        OLED_send_data(data, 1);     // Write Data CGRAM
        UTIL_delay_us(50000);

        OLED_send_cmd((DDRAM_ADDR | DDRAM_LN1_PG1) + x); // Set cursor position, first character, first line
        data[0] = CLEAR_CLOSE;
        OLED_send_data(data, 1);    // Write Data CGRAM
        UTIL_delay_us(50000);


        OLED_send_cmd((DDRAM_ADDR | DDRAM_LN1_PG1) + x); // Set cursor position, first character, first line
        data[0] = SPACE;
        OLED_send_data(data, 1);          // Write Data DDRAM
        UTIL_delay_us(50000);
    }

    for(x = 0; x < MAX_OLED_CHARS; x++)
    {
        //Check for DS_1 ON and break from loop if ON.
        if (PLIB_PORTS_PinGet(PORTS_ID_0, PORT_CHANNEL_E, PORTS_BIT_POS_0))
        {
            break;
        }

        OLED_send_cmd((DDRAM_ADDR | DDRAM_LN2_PG1) + x); // Set cursor start position, first character, second line
        data[0] = CLEAR_OPEN;
        OLED_send_data(data, 1);     // Write Data CGRAM
        UTIL_delay_us(50000);

        OLED_send_cmd((DDRAM_ADDR | DDRAM_LN2_PG1) + x); // Set cursor start position, first character, second line
        data[0] = CLEAR_CLOSE;
        OLED_send_data(data, 1);    // Write Data CGRAM
        UTIL_delay_us(50000);
        OLED_send_cmd((DDRAM_ADDR | DDRAM_LN2_PG1) + x); // Set cursor start position, first character, second line
        data[0] = SPACE;
        OLED_send_data(data, 1);          // Write Data DDRAM
        UTIL_delay_us(50000);
    }

    return;
}

////////////////////////////////////////////////
// Custom character generation section.
//////////////////////////////////////////////

// Create the custom back slash character in CGRAM.
// DDRAM address in Font Table is 0x00.
// Address location increments automatically after each write to CGRAM.
void Init_back_slash(void)
{
    uint8_t data[8] = {0x00,  // ---.....
                       0x10,  // ---@....
                       0x08,  // ---.@...
                       0x04,  // ---..@..
                       0x02,  // ---...@.
                       0x01,  // ---....@
                       0x00,  // ---.....
                       0x00}; // --------

    OLED_send_cmd(CGRAM1_ADDR); // Set CGRAM start address
    OLED_send_data(data, 8);

    return;
}

// Create the custom vertical line character in CGRAM.
// DDRAM address in Font Table is 0x01.
// Address location increments automatically after each write to CGRAM.
void Init_vert_line(void)
{
    uint8_t data[8] = {0x00,  // ---.....
                       0x04,  // ---..@..
                       0x04,  // ---..@..
                       0x04,  // ---..@..
                       0x04,  // ---..@..
                       0x04,  // ---..@..
                       0x00,  // ---.....
                       0x00}; // --------

    OLED_send_cmd(CGRAM2_ADDR); // Set CGRAM start address
    OLED_send_data(data, 8);

    return;
}

// Create the custom clear character "open" graphic in CGRAM.
// DDRAM address in Font Table is 0x02.
// Address location increments automatically after each write to CGRAM.
void Init_clear_open(void)
{
    uint8_t data[8] = {0x03,  // ---...@@
                       0x06,  // ---..@@.
                       0x0C,  // ---.@@..
                       0x18,  // ---@@...
                       0x0C,  // ---.@@..
                       0x06,  // ---..@@.
                       0x03,  // ---...@@
                       0x00}; // --------

    OLED_send_cmd(CGRAM3_ADDR); // Set CGRAM start address
    OLED_send_data(data, 8);

    return;
}

// Create the custom clear character "close" graphic in CGRAM.
// DDRAM address in Font Table is 0x03.
// Address location increments automatically after each write to CGRAM.
void Init_clear_close(void)
{
    uint8_t data[8] = {0x00,  // ---.....
                       0x00,  // ---.....
                       0x07,  // ---..@@@
                       0x1F,  // ---@@@@@
                       0x07,  // ---..@@@
                       0x00,  // ---.....
                       0x00,  // ---.....
                       0x00}; // --------

    OLED_send_cmd(CGRAM4_ADDR); // Set CGRAM start address
    OLED_send_data(data, 8);

    return;
}

void Init_heart(void)
{
    uint8_t data[8] = {0x00,  // ---.....
                       0x0A,  // ---.@.@.
                       0x15,  // ---@.@.@
                       0x11,  // ---@...@
                       0x0A,  // ---.@.@.
                       0x04,  // ---..@..
                       0x00,  // ---.....
                       0x00}; // --------

    OLED_send_cmd(CGRAM5_ADDR); // Set CGRAM start address
    OLED_send_data(data, 8);

    return;
}
//////////////////////////////////////////////////////////
// End custom character generation section.
//////////////////////////////////////////////////////////

void OLED_clear_line( uint8_t line )
{
    char buf[] = "                "; //16 spaces

    OLED_write_line(line, buf);
}


// End of File

/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    oled_2x16.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _OLED_2X16_H    /* Guard against multiple inclusion */
#define _OLED_2X16_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */
#include <stdint.h>
#include <stdbool.h>
#include "peripheral/ports/plib_ports.h"


// dkh move to GPIO_IF
#define WRITE_PIN(port, pin, val) (*((SFR_TYPE *)(&LATA + ((port) * 0x40))) = \
        ((*((SFR_TYPE *)((&LATA + ((port) * 0x40))))) & ~(1<<(pin))) | (0x1&(val))<<(pin))
#define READ_PIN(port, pin) (((*((SFR_TYPE *)(&PORTA + ((port) * 0x40))))&(1<<(pin))) ? 1 : 0)


// OLED SPI Pin definitions
#define OLED_CS_PORT   PORT_CHANNEL_D
#define OLED_CS_PIN    PORTS_BIT_POS_1
#define OLED_SCLK_PORT PORT_CHANNEL_G
#define OLED_SCLK_PIN  PORTS_BIT_POS_6
#define OLED_SDO_PORT  PORT_CHANNEL_C
#define OLED_SDO_PIN   PORTS_BIT_POS_14
#define OLED_SDI_PORT  PORT_CHANNEL_C
#define OLED_SDI_PIN   PORTS_BIT_POS_13

// OLED Commands - 600 us completion time unless noted.
#define CLEAR_DISP       0x01 // Clears the entire display. DDRAM address remains unchanged. (2ms completion time.)
#define RETURN_HOME      0x02 // Sets DDRAM address to 0x00. Returns shifted display to original position.
#define SET_INC_MODE     0x06 // Sets DDRAM/CGRAM addr & cursor to increment after R/W (no display shift.)
#define SET_DEC_MODE     0x04 // Sets DDRAM/CGRAM addr & cursor to decrement after R/W (no display shift.)
#define SET_SHIFT_L_MODE 0x07 // Sets AUTO_INC_MODE and the Display shift left.
#define SET_SHIFT_R_MODE 0x05 // Sets AUTO_DEC_MODE and the Display shift right.
#define DISP_OFF         0x08 // Sets the display off.
#define DISP_ON          0x0C // Sets the display on, no cursor.
#define DISP_ON_CURS     0x0E // Sets the display on, with cursor.
#define DISP_ON_BLINK    0x0F // Sets the display on, with blinking cursor.
#define CURS_LEFT        0x10 // Moves the cursor to the left (DDRAM contents unchanged.)
#define CURS_RIGHT       0x14 // Moves the cursor to the right (DDRAM contents unchanged.)
#define SHIFT_LEFT       0x18 // Shifts the display & cursor to the left (DDRAM contents unchanged.)
#define SHIFT_RIGHT      0x1C // Shifts the display & cursor to the right (DDRAM contents unchanged.)
#define FONT_SET         0x38 // Sets the interface for 8-bit data and selects the English font table.
#define CGRAM1_ADDR      0x40
#define CGRAM2_ADDR      0x48
#define CGRAM3_ADDR      0x50
#define CGRAM4_ADDR      0x58
#define CGRAM5_ADDR      0x60
#define CGRAM6_ADDR      0x68
#define CGRAM7_ADDR      0x70
#define CGRAM8_ADDR      0x78
#define DDRAM_ADDR       0x80 // Command 'OR'd' with a 4-bit value for column sets the DDRAM address.
#define DDRAM_LN1_PG1    0x00
#define DDRAM_LN1_PG2    0x10
#define DDRAM_LN1_PG3    0x20
#define DDRAM_LN1_PG4    0x30
#define DDRAM_LN2_PG1    0x40
#define DDRAM_LN2_PG2    0x50
#define DDRAM_LN2_PG3    0x60
#define DDRAM_LN2_PG4    0x70

// Custom font CGRAM addresses
#define BACK_SLASH    0x00
#define VERT_LINE     0x01
#define CLEAR_OPEN    0x02
#define CLEAR_CLOSE   0x03

// Built-in font CGRAM addresses
#define SPACE         0x20
#define ASTERIX       0x2A
#define FORWARD_SLASH 0x2F
#define DASH          0x2D

#define CMD_DELAY      600
#define DISP_CLR_TIME  1400

#define LINE1          0
#define LINE2          1

// OLED Function prototypes
void OLED_initialize(void);
void OLED_clear_display(void);
void OLED_send_cmd(uint8_t);
void OLED_send_data(uint8_t[], uint8_t);
void OLED_write_line(uint8_t, char []);
void OLED_write_char(char data, uint8_t line, uint8_t pos);
void OLED_clear_line( uint8_t line );

void Init_back_slash(void);
void Init_vert_line(void);
void Init_clear_open(void);
void Init_clear_close(void);
void OLED_animate_wait(void);
void OLED_clean_display(void);


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Constants                                                         */
/* ************************************************************************** */
/* ************************************************************************** */
#define NUM_OLED_LNS    2
#define MAX_OLED_CHARS  16
#define MAX_OLED_BUFFER (MAX_OLED_CHARS+1)

extern char disp_line[NUM_OLED_LNS][MAX_OLED_BUFFER];

#endif /* _OLED_2X16_H */

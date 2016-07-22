/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    oled_420.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _OLED_420_H    /* Guard against multiple inclusion */
#define _OLED_420_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */
#include <stdint.h>


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Data Types                                                        */
/* ************************************************************************** */
/* ************************************************************************** */


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Constants                                                         */
/* ************************************************************************** */
/* ************************************************************************** */
#define NUM_OLED_LNS    4
#define MAX_OLED_CHARS  20
#define MAX_OLED_BUFFER (MAX_OLED_CHARS+1)

#define LINE1          0
#define LINE2          1

extern char disp_line[NUM_OLED_LNS][MAX_OLED_BUFFER];

// *****************************************************************************
// *****************************************************************************
// Section: Interface Functions
// *****************************************************************************
// *****************************************************************************
void OLED_initialize(void);
void OLED_display_on(void);
void OLED_display_off(void);
void OLED_clear_display(void);
void OLED_write_line(uint8_t, char[]);
void OLED_write_char(char data, uint8_t line, uint8_t pos);

void OLED_flag_update( void );
void OLED_poll_rx_buffers(void);
void OLED_clear_line( uint8_t line );


void OLED_animate_wait(void);
void OLED_clean_display(void);





    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _OLED_420_H */

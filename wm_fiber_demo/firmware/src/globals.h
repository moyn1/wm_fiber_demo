/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    globals.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _GLOBALS_H
#define _GLOBALS_H


#include <stdint.h>
#include <stdbool.h>
#include <xc.h>
#include "bsp_config.h"

// Global data declarations.
extern volatile bool hb_updt;
extern volatile bool input_updt;
extern volatile bool dsply_updt;

extern volatile uint32_t dsply_tmo_cnt;

extern BSP_LED hb_color;

// Widely used defined values.
#define SW_VER  "0.0.1"

#define TMR0_TICK_MS 1
#define SYS_HB_MS       500

#define INPUT_SCAN_MS   9
#define DEBOUNCE_CNT 4

#define DSPLY_UPDT_MS   150
//#define DSPLY_TMO_MS    120000 // 2 minute timeout
#define DSPLY_TMO_MS    300000 // 5 minute timeout


// Global Function Prototypes.
void UTIL_delay_us(uint32_t);
void UTIL_delay_ms(uint16_t);
void UTIL_system_heartbeat(void);
void UTIL_scan_inputs(void);
void UTIL_update_display(void);

#endif // _GLOBALS_H

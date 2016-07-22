#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-dev_brd_4x20_oled.mk)" "nbproject/Makefile-local-dev_brd_4x20_oled.mk"
include nbproject/Makefile-local-dev_brd_4x20_oled.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=dev_brd_4x20_oled
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/wm_fiber_demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/wm_fiber_demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static.c ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_mapping.c ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_tasks.c ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_sys_queue.c ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/dev_brd_4x20_oled/framework/system/clk/src/sys_clk_static.c ../src/system_config/dev_brd_4x20_oled/framework/system/ports/src/sys_ports_static.c ../src/system_config/dev_brd_4x20_oled/system_init.c ../src/system_config/dev_brd_4x20_oled/system_interrupt.c ../src/system_config/dev_brd_4x20_oled/system_exceptions.c ../src/system_config/dev_brd_4x20_oled/system_tasks.c ../src/app.c ../src/main.c C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/globals.c C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/bsp_sys_init.c ../../../../framework/system/devcon/src/sys_devcon.c ../../../../framework/system/devcon/src/sys_devcon_pic32mz.c ../../../../framework/system/devcon/src/sys_devcon_cache_pic32mz.S ../../../../framework/system/int/src/sys_int_pic32.c C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/oled_4x20.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/361269306/drv_spi_static.o ${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o ${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o ${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o ${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o ${OBJECTDIR}/_ext/815995590/drv_tmr_static.o ${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o ${OBJECTDIR}/_ext/1231051722/sys_clk_static.o ${OBJECTDIR}/_ext/432116218/sys_ports_static.o ${OBJECTDIR}/_ext/1523783629/system_init.o ${OBJECTDIR}/_ext/1523783629/system_interrupt.o ${OBJECTDIR}/_ext/1523783629/system_exceptions.o ${OBJECTDIR}/_ext/1523783629/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1961740186/globals.o ${OBJECTDIR}/_ext/7179038/bsp_sys_init.o ${OBJECTDIR}/_ext/1271179505/sys_devcon.o ${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o ${OBJECTDIR}/_ext/122796885/sys_int_pic32.o ${OBJECTDIR}/_ext/7179038/oled_4x20.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/361269306/drv_spi_static.o.d ${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o.d ${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o.d ${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o.d ${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o.d ${OBJECTDIR}/_ext/815995590/drv_tmr_static.o.d ${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o.d ${OBJECTDIR}/_ext/1231051722/sys_clk_static.o.d ${OBJECTDIR}/_ext/432116218/sys_ports_static.o.d ${OBJECTDIR}/_ext/1523783629/system_init.o.d ${OBJECTDIR}/_ext/1523783629/system_interrupt.o.d ${OBJECTDIR}/_ext/1523783629/system_exceptions.o.d ${OBJECTDIR}/_ext/1523783629/system_tasks.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1961740186/globals.o.d ${OBJECTDIR}/_ext/7179038/bsp_sys_init.o.d ${OBJECTDIR}/_ext/1271179505/sys_devcon.o.d ${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o.d ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.d ${OBJECTDIR}/_ext/122796885/sys_int_pic32.o.d ${OBJECTDIR}/_ext/7179038/oled_4x20.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/361269306/drv_spi_static.o ${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o ${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o ${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o ${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o ${OBJECTDIR}/_ext/815995590/drv_tmr_static.o ${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o ${OBJECTDIR}/_ext/1231051722/sys_clk_static.o ${OBJECTDIR}/_ext/432116218/sys_ports_static.o ${OBJECTDIR}/_ext/1523783629/system_init.o ${OBJECTDIR}/_ext/1523783629/system_interrupt.o ${OBJECTDIR}/_ext/1523783629/system_exceptions.o ${OBJECTDIR}/_ext/1523783629/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1961740186/globals.o ${OBJECTDIR}/_ext/7179038/bsp_sys_init.o ${OBJECTDIR}/_ext/1271179505/sys_devcon.o ${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o ${OBJECTDIR}/_ext/122796885/sys_int_pic32.o ${OBJECTDIR}/_ext/7179038/oled_4x20.o

# Source Files
SOURCEFILES=../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static.c ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_mapping.c ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_tasks.c ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_sys_queue.c ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/dev_brd_4x20_oled/framework/system/clk/src/sys_clk_static.c ../src/system_config/dev_brd_4x20_oled/framework/system/ports/src/sys_ports_static.c ../src/system_config/dev_brd_4x20_oled/system_init.c ../src/system_config/dev_brd_4x20_oled/system_interrupt.c ../src/system_config/dev_brd_4x20_oled/system_exceptions.c ../src/system_config/dev_brd_4x20_oled/system_tasks.c ../src/app.c ../src/main.c C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/globals.c C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/bsp_sys_init.c ../../../../framework/system/devcon/src/sys_devcon.c ../../../../framework/system/devcon/src/sys_devcon_pic32mz.c ../../../../framework/system/devcon/src/sys_devcon_cache_pic32mz.S ../../../../framework/system/int/src/sys_int_pic32.c C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/oled_4x20.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-dev_brd_4x20_oled.mk dist/${CND_CONF}/${IMAGE_TYPE}/wm_fiber_demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048EFM100
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o: ../../../../framework/system/devcon/src/sys_devcon_cache_pic32mz.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1271179505" 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.ok ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.d" "${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.d"  -o ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o ../../../../framework/system/devcon/src/sys_devcon_cache_pic32mz.S  -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1
	
else
${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o: ../../../../framework/system/devcon/src/sys_devcon_cache_pic32mz.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1271179505" 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.ok ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.d" "${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.d"  -o ${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o ../../../../framework/system/devcon/src/sys_devcon_cache_pic32mz.S  -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1271179505/sys_devcon_cache_pic32mz.o.asm.d",--gdwarf-2
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/361269306/drv_spi_static.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/361269306" 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/361269306/drv_spi_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/361269306/drv_spi_static.o.d" -o ${OBJECTDIR}/_ext/361269306/drv_spi_static.o ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_mapping.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/361269306" 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o.d" -o ${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_mapping.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/361269306" 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o.d" -o ${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_tasks.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_sys_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/361269306" 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o.d" -o ${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_sys_queue.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/361269306" 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/815995590/drv_tmr_static.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/815995590" 
	@${RM} ${OBJECTDIR}/_ext/815995590/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/815995590/drv_tmr_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/815995590/drv_tmr_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/815995590/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/815995590/drv_tmr_static.o ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_mapping.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/815995590" 
	@${RM} ${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1231051722/sys_clk_static.o: ../src/system_config/dev_brd_4x20_oled/framework/system/clk/src/sys_clk_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1231051722" 
	@${RM} ${OBJECTDIR}/_ext/1231051722/sys_clk_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1231051722/sys_clk_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1231051722/sys_clk_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1231051722/sys_clk_static.o.d" -o ${OBJECTDIR}/_ext/1231051722/sys_clk_static.o ../src/system_config/dev_brd_4x20_oled/framework/system/clk/src/sys_clk_static.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/432116218/sys_ports_static.o: ../src/system_config/dev_brd_4x20_oled/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/432116218" 
	@${RM} ${OBJECTDIR}/_ext/432116218/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/432116218/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/432116218/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/432116218/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/432116218/sys_ports_static.o ../src/system_config/dev_brd_4x20_oled/framework/system/ports/src/sys_ports_static.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1523783629/system_init.o: ../src/system_config/dev_brd_4x20_oled/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1523783629" 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1523783629/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1523783629/system_init.o.d" -o ${OBJECTDIR}/_ext/1523783629/system_init.o ../src/system_config/dev_brd_4x20_oled/system_init.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1523783629/system_interrupt.o: ../src/system_config/dev_brd_4x20_oled/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1523783629" 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1523783629/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1523783629/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1523783629/system_interrupt.o ../src/system_config/dev_brd_4x20_oled/system_interrupt.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1523783629/system_exceptions.o: ../src/system_config/dev_brd_4x20_oled/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1523783629" 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1523783629/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1523783629/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1523783629/system_exceptions.o ../src/system_config/dev_brd_4x20_oled/system_exceptions.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1523783629/system_tasks.o: ../src/system_config/dev_brd_4x20_oled/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1523783629" 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1523783629/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1523783629/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1523783629/system_tasks.o ../src/system_config/dev_brd_4x20_oled/system_tasks.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1961740186/globals.o: C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/globals.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1961740186" 
	@${RM} ${OBJECTDIR}/_ext/1961740186/globals.o.d 
	@${RM} ${OBJECTDIR}/_ext/1961740186/globals.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1961740186/globals.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1961740186/globals.o.d" -o ${OBJECTDIR}/_ext/1961740186/globals.o C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/globals.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/7179038/bsp_sys_init.o: C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/bsp_sys_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/7179038" 
	@${RM} ${OBJECTDIR}/_ext/7179038/bsp_sys_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/7179038/bsp_sys_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/7179038/bsp_sys_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/7179038/bsp_sys_init.o.d" -o ${OBJECTDIR}/_ext/7179038/bsp_sys_init.o C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/bsp_sys_init.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1271179505/sys_devcon.o: ../../../../framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1271179505" 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1271179505/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1271179505/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/1271179505/sys_devcon.o ../../../../framework/system/devcon/src/sys_devcon.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o: ../../../../framework/system/devcon/src/sys_devcon_pic32mz.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1271179505" 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o.d" -o ${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o ../../../../framework/system/devcon/src/sys_devcon_pic32mz.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/122796885/sys_int_pic32.o: ../../../../framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/122796885" 
	@${RM} ${OBJECTDIR}/_ext/122796885/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/122796885/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/122796885/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/122796885/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/122796885/sys_int_pic32.o ../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/7179038/oled_4x20.o: C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/oled_4x20.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/7179038" 
	@${RM} ${OBJECTDIR}/_ext/7179038/oled_4x20.o.d 
	@${RM} ${OBJECTDIR}/_ext/7179038/oled_4x20.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/7179038/oled_4x20.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/7179038/oled_4x20.o.d" -o ${OBJECTDIR}/_ext/7179038/oled_4x20.o C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/oled_4x20.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/_ext/361269306/drv_spi_static.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/361269306" 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/361269306/drv_spi_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/361269306/drv_spi_static.o.d" -o ${OBJECTDIR}/_ext/361269306/drv_spi_static.o ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_mapping.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/361269306" 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o.d" -o ${OBJECTDIR}/_ext/361269306/drv_spi_mapping.o ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_mapping.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/361269306" 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o.d" -o ${OBJECTDIR}/_ext/361269306/drv_spi_static_tasks.o ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_tasks.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_sys_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/361269306" 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o.d" -o ${OBJECTDIR}/_ext/361269306/drv_spi_static_sys_queue.o ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_sys_queue.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/361269306" 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/361269306/drv_spi_static_ebm_tasks.o ../src/system_config/dev_brd_4x20_oled/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/815995590/drv_tmr_static.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/815995590" 
	@${RM} ${OBJECTDIR}/_ext/815995590/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/815995590/drv_tmr_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/815995590/drv_tmr_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/815995590/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/815995590/drv_tmr_static.o ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o: ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_mapping.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/815995590" 
	@${RM} ${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/815995590/drv_tmr_mapping.o ../src/system_config/dev_brd_4x20_oled/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1231051722/sys_clk_static.o: ../src/system_config/dev_brd_4x20_oled/framework/system/clk/src/sys_clk_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1231051722" 
	@${RM} ${OBJECTDIR}/_ext/1231051722/sys_clk_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1231051722/sys_clk_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1231051722/sys_clk_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1231051722/sys_clk_static.o.d" -o ${OBJECTDIR}/_ext/1231051722/sys_clk_static.o ../src/system_config/dev_brd_4x20_oled/framework/system/clk/src/sys_clk_static.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/432116218/sys_ports_static.o: ../src/system_config/dev_brd_4x20_oled/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/432116218" 
	@${RM} ${OBJECTDIR}/_ext/432116218/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/432116218/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/432116218/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/432116218/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/432116218/sys_ports_static.o ../src/system_config/dev_brd_4x20_oled/framework/system/ports/src/sys_ports_static.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1523783629/system_init.o: ../src/system_config/dev_brd_4x20_oled/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1523783629" 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1523783629/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1523783629/system_init.o.d" -o ${OBJECTDIR}/_ext/1523783629/system_init.o ../src/system_config/dev_brd_4x20_oled/system_init.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1523783629/system_interrupt.o: ../src/system_config/dev_brd_4x20_oled/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1523783629" 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1523783629/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1523783629/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1523783629/system_interrupt.o ../src/system_config/dev_brd_4x20_oled/system_interrupt.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1523783629/system_exceptions.o: ../src/system_config/dev_brd_4x20_oled/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1523783629" 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1523783629/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1523783629/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1523783629/system_exceptions.o ../src/system_config/dev_brd_4x20_oled/system_exceptions.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1523783629/system_tasks.o: ../src/system_config/dev_brd_4x20_oled/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1523783629" 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1523783629/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1523783629/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1523783629/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1523783629/system_tasks.o ../src/system_config/dev_brd_4x20_oled/system_tasks.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1961740186/globals.o: C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/globals.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1961740186" 
	@${RM} ${OBJECTDIR}/_ext/1961740186/globals.o.d 
	@${RM} ${OBJECTDIR}/_ext/1961740186/globals.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1961740186/globals.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1961740186/globals.o.d" -o ${OBJECTDIR}/_ext/1961740186/globals.o C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/globals.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/7179038/bsp_sys_init.o: C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/bsp_sys_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/7179038" 
	@${RM} ${OBJECTDIR}/_ext/7179038/bsp_sys_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/7179038/bsp_sys_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/7179038/bsp_sys_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/7179038/bsp_sys_init.o.d" -o ${OBJECTDIR}/_ext/7179038/bsp_sys_init.o C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/bsp_sys_init.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1271179505/sys_devcon.o: ../../../../framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1271179505" 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1271179505/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1271179505/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/1271179505/sys_devcon.o ../../../../framework/system/devcon/src/sys_devcon.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o: ../../../../framework/system/devcon/src/sys_devcon_pic32mz.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1271179505" 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o.d" -o ${OBJECTDIR}/_ext/1271179505/sys_devcon_pic32mz.o ../../../../framework/system/devcon/src/sys_devcon_pic32mz.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/122796885/sys_int_pic32.o: ../../../../framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/122796885" 
	@${RM} ${OBJECTDIR}/_ext/122796885/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/122796885/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/122796885/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/122796885/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/122796885/sys_int_pic32.o ../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/7179038/oled_4x20.o: C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/oled_4x20.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/7179038" 
	@${RM} ${OBJECTDIR}/_ext/7179038/oled_4x20.o.d 
	@${RM} ${OBJECTDIR}/_ext/7179038/oled_4x20.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/7179038/oled_4x20.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/dev_brd_4x20_oled" -I"../src/dev_brd_4x20_oled" -I"../../../../framework" -I"../src/system_config/dev_brd_4x20_oled/framework" -MMD -MF "${OBJECTDIR}/_ext/7179038/oled_4x20.o.d" -o ${OBJECTDIR}/_ext/7179038/oled_4x20.o C:/microchip/harmony/v1_08/apps/wm_fiber_demo/firmware/src/system_config/dev_brd_4x20_oled/oled_4x20.c    -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/wm_fiber_demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../bin/framework/peripheral/PIC32MZ2048EFM100_peripherals.a ../../../../framework/tcpip/src/crypto/aes_pic32mx.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/wm_fiber_demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\bin\framework\peripheral\PIC32MZ2048EFM100_peripherals.a ..\..\..\..\framework\tcpip\src\crypto\aes_pic32mx.a      -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/wm_fiber_demo.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../bin/framework/peripheral/PIC32MZ2048EFM100_peripherals.a ../../../../framework/tcpip/src/crypto/aes_pic32mx.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/wm_fiber_demo.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\bin\framework\peripheral\PIC32MZ2048EFM100_peripherals.a ..\..\..\..\framework\tcpip\src\crypto\aes_pic32mx.a      -DXPRJ_dev_brd_4x20_oled=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/wm_fiber_demo.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/dev_brd_4x20_oled
	${RM} -r dist/dev_brd_4x20_oled

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

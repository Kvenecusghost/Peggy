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
ifeq "$(wildcard nbproject/Makefile-local-Sheala_A.mk)" "nbproject/Makefile-local-Sheala_A.mk"
include nbproject/Makefile-local-Sheala_A.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=Sheala_A
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main.c timer0.c gpio.c rfm95w.c spi.c uart.c traffic_light.c lora.c timer1.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/timer0.o ${OBJECTDIR}/gpio.o ${OBJECTDIR}/rfm95w.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/uart.o ${OBJECTDIR}/traffic_light.o ${OBJECTDIR}/lora.o ${OBJECTDIR}/timer1.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/timer0.o.d ${OBJECTDIR}/gpio.o.d ${OBJECTDIR}/rfm95w.o.d ${OBJECTDIR}/spi.o.d ${OBJECTDIR}/uart.o.d ${OBJECTDIR}/traffic_light.o.d ${OBJECTDIR}/lora.o.d ${OBJECTDIR}/timer1.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/timer0.o ${OBJECTDIR}/gpio.o ${OBJECTDIR}/rfm95w.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/uart.o ${OBJECTDIR}/traffic_light.o ${OBJECTDIR}/lora.o ${OBJECTDIR}/timer1.o

# Source Files
SOURCEFILES=main.c timer0.c gpio.c rfm95w.c spi.c uart.c traffic_light.c lora.c timer1.c



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
	${MAKE}  -f nbproject/Makefile-Sheala_A.mk dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega32U4
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  .generated_files/flags/Sheala_A/81408bde4d5ff6541da78d0c3f2d7b758018ee02 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
${OBJECTDIR}/timer0.o: timer0.c  .generated_files/flags/Sheala_A/d7467599c0573277b8e2aa6d5e6c416831203c89 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer0.o.d 
	@${RM} ${OBJECTDIR}/timer0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer0.o.d" -MT "${OBJECTDIR}/timer0.o.d" -MT ${OBJECTDIR}/timer0.o -o ${OBJECTDIR}/timer0.o timer0.c 
	
${OBJECTDIR}/gpio.o: gpio.c  .generated_files/flags/Sheala_A/2f3efaf91af7f5b519265b0afc7db358917584cf .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gpio.o.d 
	@${RM} ${OBJECTDIR}/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/gpio.o.d" -MT "${OBJECTDIR}/gpio.o.d" -MT ${OBJECTDIR}/gpio.o -o ${OBJECTDIR}/gpio.o gpio.c 
	
${OBJECTDIR}/rfm95w.o: rfm95w.c  .generated_files/flags/Sheala_A/c50e761f62b9227904d13f00b39136d77eea25db .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/rfm95w.o.d 
	@${RM} ${OBJECTDIR}/rfm95w.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/rfm95w.o.d" -MT "${OBJECTDIR}/rfm95w.o.d" -MT ${OBJECTDIR}/rfm95w.o -o ${OBJECTDIR}/rfm95w.o rfm95w.c 
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/Sheala_A/ac517f1f563e9c7bf07e2310033bfb3e2ddc7e73 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/spi.o.d" -MT "${OBJECTDIR}/spi.o.d" -MT ${OBJECTDIR}/spi.o -o ${OBJECTDIR}/spi.o spi.c 
	
${OBJECTDIR}/uart.o: uart.c  .generated_files/flags/Sheala_A/df9c7149c5f5bbad84d5de16377b9bf30c4e7c80 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/uart.o.d" -MT "${OBJECTDIR}/uart.o.d" -MT ${OBJECTDIR}/uart.o -o ${OBJECTDIR}/uart.o uart.c 
	
${OBJECTDIR}/traffic_light.o: traffic_light.c  .generated_files/flags/Sheala_A/3a2025024e07719e8854a6b8e97278485f499ba0 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traffic_light.o.d 
	@${RM} ${OBJECTDIR}/traffic_light.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/traffic_light.o.d" -MT "${OBJECTDIR}/traffic_light.o.d" -MT ${OBJECTDIR}/traffic_light.o -o ${OBJECTDIR}/traffic_light.o traffic_light.c 
	
${OBJECTDIR}/lora.o: lora.c  .generated_files/flags/Sheala_A/c771ea78a076118a732ccbd76aaab14d3b0866b6 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lora.o.d 
	@${RM} ${OBJECTDIR}/lora.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/lora.o.d" -MT "${OBJECTDIR}/lora.o.d" -MT ${OBJECTDIR}/lora.o -o ${OBJECTDIR}/lora.o lora.c 
	
${OBJECTDIR}/timer1.o: timer1.c  .generated_files/flags/Sheala_A/28874e23a4e0950699cafcb93d994142e97cf680 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer1.o.d 
	@${RM} ${OBJECTDIR}/timer1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer1.o.d" -MT "${OBJECTDIR}/timer1.o.d" -MT ${OBJECTDIR}/timer1.o -o ${OBJECTDIR}/timer1.o timer1.c 
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/Sheala_A/ecb1a3fa2fcb69a7b76f0860028c57f4eb1c0b88 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
${OBJECTDIR}/timer0.o: timer0.c  .generated_files/flags/Sheala_A/752ca54625780fcaad6a7f6323a540daa77b7a2e .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer0.o.d 
	@${RM} ${OBJECTDIR}/timer0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer0.o.d" -MT "${OBJECTDIR}/timer0.o.d" -MT ${OBJECTDIR}/timer0.o -o ${OBJECTDIR}/timer0.o timer0.c 
	
${OBJECTDIR}/gpio.o: gpio.c  .generated_files/flags/Sheala_A/9119806ba1dbcb90b3744ef4f1f34bde4b7c8693 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gpio.o.d 
	@${RM} ${OBJECTDIR}/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/gpio.o.d" -MT "${OBJECTDIR}/gpio.o.d" -MT ${OBJECTDIR}/gpio.o -o ${OBJECTDIR}/gpio.o gpio.c 
	
${OBJECTDIR}/rfm95w.o: rfm95w.c  .generated_files/flags/Sheala_A/4d6e220834a57cf3ae0b28b75ea7a85177a8468e .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/rfm95w.o.d 
	@${RM} ${OBJECTDIR}/rfm95w.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/rfm95w.o.d" -MT "${OBJECTDIR}/rfm95w.o.d" -MT ${OBJECTDIR}/rfm95w.o -o ${OBJECTDIR}/rfm95w.o rfm95w.c 
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/Sheala_A/c92287fa1c6eb5debcfc7d397dc26a5b3773052b .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/spi.o.d" -MT "${OBJECTDIR}/spi.o.d" -MT ${OBJECTDIR}/spi.o -o ${OBJECTDIR}/spi.o spi.c 
	
${OBJECTDIR}/uart.o: uart.c  .generated_files/flags/Sheala_A/4c452aa9f1ddc0fbc595bcfb5d6e13ec25bc3a61 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/uart.o.d" -MT "${OBJECTDIR}/uart.o.d" -MT ${OBJECTDIR}/uart.o -o ${OBJECTDIR}/uart.o uart.c 
	
${OBJECTDIR}/traffic_light.o: traffic_light.c  .generated_files/flags/Sheala_A/cb6d4eb79e48f1d669e0907f43c22cf4f040b9fa .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traffic_light.o.d 
	@${RM} ${OBJECTDIR}/traffic_light.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/traffic_light.o.d" -MT "${OBJECTDIR}/traffic_light.o.d" -MT ${OBJECTDIR}/traffic_light.o -o ${OBJECTDIR}/traffic_light.o traffic_light.c 
	
${OBJECTDIR}/lora.o: lora.c  .generated_files/flags/Sheala_A/76153c3df0c04116bb37e45316df7b8215854bc6 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lora.o.d 
	@${RM} ${OBJECTDIR}/lora.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/lora.o.d" -MT "${OBJECTDIR}/lora.o.d" -MT ${OBJECTDIR}/lora.o -o ${OBJECTDIR}/lora.o lora.c 
	
${OBJECTDIR}/timer1.o: timer1.c  .generated_files/flags/Sheala_A/746921e7f489974d78dc5ca0961ffe8a934be555 .generated_files/flags/Sheala_A/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer1.o.d 
	@${RM} ${OBJECTDIR}/timer1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -DXPRJ_Sheala_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer1.o.d" -MT "${OBJECTDIR}/timer1.o.d" -MT ${OBJECTDIR}/timer1.o -o ${OBJECTDIR}/timer1.o timer1.c 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_Sheala_A=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"   -gdwarf-2 -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.map  -DXPRJ_Sheala_A=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SHEALA_A -DSHEALA_A=2 -Wall -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.hex"
	@echo Normalizing hex file
	@"C:/Program Files/Microchip/MPLABX/v5.50/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v5.50/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.hex -odist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.hex

endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Sheala_A
	${RM} -r dist/Sheala_A

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

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
ifeq "$(wildcard nbproject/Makefile-local-Specto_A.mk)" "nbproject/Makefile-local-Specto_A.mk"
include nbproject/Makefile-local-Specto_A.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=Specto_A
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
	${MAKE}  -f nbproject/Makefile-Specto_A.mk ${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega32U4
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  .generated_files/flags/Specto_A/c598100c46f27142df984863a781b2c90e8bbd1a .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
${OBJECTDIR}/timer0.o: timer0.c  .generated_files/flags/Specto_A/a244c03fdb8b2c22f8bbdeb3619ab5ec4ceee61c .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer0.o.d 
	@${RM} ${OBJECTDIR}/timer0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer0.o.d" -MT "${OBJECTDIR}/timer0.o.d" -MT ${OBJECTDIR}/timer0.o -o ${OBJECTDIR}/timer0.o timer0.c 
	
${OBJECTDIR}/gpio.o: gpio.c  .generated_files/flags/Specto_A/2b00a701801d377af8a355eecdd24bcb45976bbf .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gpio.o.d 
	@${RM} ${OBJECTDIR}/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/gpio.o.d" -MT "${OBJECTDIR}/gpio.o.d" -MT ${OBJECTDIR}/gpio.o -o ${OBJECTDIR}/gpio.o gpio.c 
	
${OBJECTDIR}/rfm95w.o: rfm95w.c  .generated_files/flags/Specto_A/a5655a57aad45365ac618c7c24daa9ab0a56d63f .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/rfm95w.o.d 
	@${RM} ${OBJECTDIR}/rfm95w.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/rfm95w.o.d" -MT "${OBJECTDIR}/rfm95w.o.d" -MT ${OBJECTDIR}/rfm95w.o -o ${OBJECTDIR}/rfm95w.o rfm95w.c 
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/Specto_A/2d7990236c9ff9aa528df83f72082c95f47bc71 .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/spi.o.d" -MT "${OBJECTDIR}/spi.o.d" -MT ${OBJECTDIR}/spi.o -o ${OBJECTDIR}/spi.o spi.c 
	
${OBJECTDIR}/uart.o: uart.c  .generated_files/flags/Specto_A/e19f95ed32b5e6b483754cb2c56f64f65fdf751 .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/uart.o.d" -MT "${OBJECTDIR}/uart.o.d" -MT ${OBJECTDIR}/uart.o -o ${OBJECTDIR}/uart.o uart.c 
	
${OBJECTDIR}/traffic_light.o: traffic_light.c  .generated_files/flags/Specto_A/a67f9b83a3e3e829c218cf354812f1de72761daa .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traffic_light.o.d 
	@${RM} ${OBJECTDIR}/traffic_light.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/traffic_light.o.d" -MT "${OBJECTDIR}/traffic_light.o.d" -MT ${OBJECTDIR}/traffic_light.o -o ${OBJECTDIR}/traffic_light.o traffic_light.c 
	
${OBJECTDIR}/lora.o: lora.c  .generated_files/flags/Specto_A/5ed1fcaff2b40872394110fd0035a8e413d47f56 .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lora.o.d 
	@${RM} ${OBJECTDIR}/lora.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/lora.o.d" -MT "${OBJECTDIR}/lora.o.d" -MT ${OBJECTDIR}/lora.o -o ${OBJECTDIR}/lora.o lora.c 
	
${OBJECTDIR}/timer1.o: timer1.c  .generated_files/flags/Specto_A/181f5ad3e3ace7d32b5a74fd064274cf6a3975c7 .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer1.o.d 
	@${RM} ${OBJECTDIR}/timer1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer1.o.d" -MT "${OBJECTDIR}/timer1.o.d" -MT ${OBJECTDIR}/timer1.o -o ${OBJECTDIR}/timer1.o timer1.c 
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/Specto_A/74b8c2780dde584062e8d1a2095a91efdfc880a8 .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
${OBJECTDIR}/timer0.o: timer0.c  .generated_files/flags/Specto_A/5da53d4fd0294e8cf0f14363c2ee891ad2c85735 .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer0.o.d 
	@${RM} ${OBJECTDIR}/timer0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer0.o.d" -MT "${OBJECTDIR}/timer0.o.d" -MT ${OBJECTDIR}/timer0.o -o ${OBJECTDIR}/timer0.o timer0.c 
	
${OBJECTDIR}/gpio.o: gpio.c  .generated_files/flags/Specto_A/b1378a2f61c00bc1284058ed2c84d065b43d73e5 .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gpio.o.d 
	@${RM} ${OBJECTDIR}/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/gpio.o.d" -MT "${OBJECTDIR}/gpio.o.d" -MT ${OBJECTDIR}/gpio.o -o ${OBJECTDIR}/gpio.o gpio.c 
	
${OBJECTDIR}/rfm95w.o: rfm95w.c  .generated_files/flags/Specto_A/ea0ec770d4edda27802aa98f6ecf051b039510fc .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/rfm95w.o.d 
	@${RM} ${OBJECTDIR}/rfm95w.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/rfm95w.o.d" -MT "${OBJECTDIR}/rfm95w.o.d" -MT ${OBJECTDIR}/rfm95w.o -o ${OBJECTDIR}/rfm95w.o rfm95w.c 
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/Specto_A/7a2ee37ce8a42bf9be4a0939180117e95f045a13 .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/spi.o.d" -MT "${OBJECTDIR}/spi.o.d" -MT ${OBJECTDIR}/spi.o -o ${OBJECTDIR}/spi.o spi.c 
	
${OBJECTDIR}/uart.o: uart.c  .generated_files/flags/Specto_A/7ad67d0948053d29002cbac5e5b77c02aa851daa .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/uart.o.d" -MT "${OBJECTDIR}/uart.o.d" -MT ${OBJECTDIR}/uart.o -o ${OBJECTDIR}/uart.o uart.c 
	
${OBJECTDIR}/traffic_light.o: traffic_light.c  .generated_files/flags/Specto_A/2c4546189cb0a31799e416301b60c97e37a6d5fe .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traffic_light.o.d 
	@${RM} ${OBJECTDIR}/traffic_light.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/traffic_light.o.d" -MT "${OBJECTDIR}/traffic_light.o.d" -MT ${OBJECTDIR}/traffic_light.o -o ${OBJECTDIR}/traffic_light.o traffic_light.c 
	
${OBJECTDIR}/lora.o: lora.c  .generated_files/flags/Specto_A/f061b760f1d6b81a8916f667f60c436b56031880 .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lora.o.d 
	@${RM} ${OBJECTDIR}/lora.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/lora.o.d" -MT "${OBJECTDIR}/lora.o.d" -MT ${OBJECTDIR}/lora.o -o ${OBJECTDIR}/lora.o lora.c 
	
${OBJECTDIR}/timer1.o: timer1.c  .generated_files/flags/Specto_A/ede38cc830e4e0a68547bdfb8d259cba5d1bdd33 .generated_files/flags/Specto_A/7300a4ed7e27d28dcabe6ca6fcfb41256bc2446d
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer1.o.d 
	@${RM} ${OBJECTDIR}/timer1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -DXPRJ_Specto_A=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer1.o.d" -MT "${OBJECTDIR}/timer1.o.d" -MT ${OBJECTDIR}/timer1.o -o ${OBJECTDIR}/timer1.o timer1.c 
	
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
${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_Specto_A=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"   -gdwarf-2 -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1
	@${RM} ${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.map  -DXPRJ_Specto_A=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -DPCB=SPECTO_A -DSPECTO_A=1 -Wall -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.hex"
	@echo Normalizing hex file
	@"C:/Program Files/Microchip/MPLABX/v6.00/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v6.00/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" ${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.hex -o${DISTDIR}/Peggy_Tracker.X.${IMAGE_TYPE}.hex

endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

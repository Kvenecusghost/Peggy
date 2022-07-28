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
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega32U4
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/fe86b31d4c5bb351d06ebb574eee9223267ed534 .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
${OBJECTDIR}/timer0.o: timer0.c  .generated_files/flags/default/605d5e05aad1c0e4d971bc3978e6a065c2b88f68 .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer0.o.d 
	@${RM} ${OBJECTDIR}/timer0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer0.o.d" -MT "${OBJECTDIR}/timer0.o.d" -MT ${OBJECTDIR}/timer0.o -o ${OBJECTDIR}/timer0.o timer0.c 
	
${OBJECTDIR}/gpio.o: gpio.c  .generated_files/flags/default/b869e2e2dca4c02ecd60706448ab21f35462fe55 .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gpio.o.d 
	@${RM} ${OBJECTDIR}/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/gpio.o.d" -MT "${OBJECTDIR}/gpio.o.d" -MT ${OBJECTDIR}/gpio.o -o ${OBJECTDIR}/gpio.o gpio.c 
	
${OBJECTDIR}/rfm95w.o: rfm95w.c  .generated_files/flags/default/979263a453cabc32aca83285c2a8791792d056e1 .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/rfm95w.o.d 
	@${RM} ${OBJECTDIR}/rfm95w.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/rfm95w.o.d" -MT "${OBJECTDIR}/rfm95w.o.d" -MT ${OBJECTDIR}/rfm95w.o -o ${OBJECTDIR}/rfm95w.o rfm95w.c 
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/default/e99eba2c782aa575b72d2d64030850603c539bf .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/spi.o.d" -MT "${OBJECTDIR}/spi.o.d" -MT ${OBJECTDIR}/spi.o -o ${OBJECTDIR}/spi.o spi.c 
	
${OBJECTDIR}/uart.o: uart.c  .generated_files/flags/default/55ee61521d70060067e531e057bcdf4a0e837efd .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/uart.o.d" -MT "${OBJECTDIR}/uart.o.d" -MT ${OBJECTDIR}/uart.o -o ${OBJECTDIR}/uart.o uart.c 
	
${OBJECTDIR}/traffic_light.o: traffic_light.c  .generated_files/flags/default/5a712c839317e72703b2fea15b8a1c2ec85d1a8b .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traffic_light.o.d 
	@${RM} ${OBJECTDIR}/traffic_light.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/traffic_light.o.d" -MT "${OBJECTDIR}/traffic_light.o.d" -MT ${OBJECTDIR}/traffic_light.o -o ${OBJECTDIR}/traffic_light.o traffic_light.c 
	
${OBJECTDIR}/lora.o: lora.c  .generated_files/flags/default/21c5cda30800bae6cecdefa2717e7d1b0d45b607 .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lora.o.d 
	@${RM} ${OBJECTDIR}/lora.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/lora.o.d" -MT "${OBJECTDIR}/lora.o.d" -MT ${OBJECTDIR}/lora.o -o ${OBJECTDIR}/lora.o lora.c 
	
${OBJECTDIR}/timer1.o: timer1.c  .generated_files/flags/default/c3358fefc1305c7e8aae866697c4eced48f0aab1 .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer1.o.d 
	@${RM} ${OBJECTDIR}/timer1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer1.o.d" -MT "${OBJECTDIR}/timer1.o.d" -MT ${OBJECTDIR}/timer1.o -o ${OBJECTDIR}/timer1.o timer1.c 
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/8263cf21a159b83c0632d20a59898afe80d21a40 .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o -o ${OBJECTDIR}/main.o main.c 
	
${OBJECTDIR}/timer0.o: timer0.c  .generated_files/flags/default/16f94ad5fcbb89691f090994b876e10d0ffa069e .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer0.o.d 
	@${RM} ${OBJECTDIR}/timer0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer0.o.d" -MT "${OBJECTDIR}/timer0.o.d" -MT ${OBJECTDIR}/timer0.o -o ${OBJECTDIR}/timer0.o timer0.c 
	
${OBJECTDIR}/gpio.o: gpio.c  .generated_files/flags/default/eb207f5d69732e75df2d6939018146f2aba19cfc .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gpio.o.d 
	@${RM} ${OBJECTDIR}/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/gpio.o.d" -MT "${OBJECTDIR}/gpio.o.d" -MT ${OBJECTDIR}/gpio.o -o ${OBJECTDIR}/gpio.o gpio.c 
	
${OBJECTDIR}/rfm95w.o: rfm95w.c  .generated_files/flags/default/fe3dfdf6519f4b835311874f9476d14843ae34a .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/rfm95w.o.d 
	@${RM} ${OBJECTDIR}/rfm95w.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/rfm95w.o.d" -MT "${OBJECTDIR}/rfm95w.o.d" -MT ${OBJECTDIR}/rfm95w.o -o ${OBJECTDIR}/rfm95w.o rfm95w.c 
	
${OBJECTDIR}/spi.o: spi.c  .generated_files/flags/default/ea5e1cff48e27980e90aeccdd3fcd3842e9e70ea .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/spi.o.d" -MT "${OBJECTDIR}/spi.o.d" -MT ${OBJECTDIR}/spi.o -o ${OBJECTDIR}/spi.o spi.c 
	
${OBJECTDIR}/uart.o: uart.c  .generated_files/flags/default/2322026f395b44a012ea58d33f1c68c13ac27edf .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/uart.o.d" -MT "${OBJECTDIR}/uart.o.d" -MT ${OBJECTDIR}/uart.o -o ${OBJECTDIR}/uart.o uart.c 
	
${OBJECTDIR}/traffic_light.o: traffic_light.c  .generated_files/flags/default/9894e463a37616844861953398e49d9b5e73761d .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traffic_light.o.d 
	@${RM} ${OBJECTDIR}/traffic_light.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/traffic_light.o.d" -MT "${OBJECTDIR}/traffic_light.o.d" -MT ${OBJECTDIR}/traffic_light.o -o ${OBJECTDIR}/traffic_light.o traffic_light.c 
	
${OBJECTDIR}/lora.o: lora.c  .generated_files/flags/default/7c027797c1fae069b1a3aca37d20fe7da6a33c79 .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lora.o.d 
	@${RM} ${OBJECTDIR}/lora.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/lora.o.d" -MT "${OBJECTDIR}/lora.o.d" -MT ${OBJECTDIR}/lora.o -o ${OBJECTDIR}/lora.o lora.c 
	
${OBJECTDIR}/timer1.o: timer1.c  .generated_files/flags/default/9f46ff10a75a1563cc92dee6ca789c2b03743918 .generated_files/flags/default/fbabd97ff93d4a5fa31b2b62828276c8d5328679
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer1.o.d 
	@${RM} ${OBJECTDIR}/timer1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/timer1.o.d" -MT "${OBJECTDIR}/timer1.o.d" -MT ${OBJECTDIR}/timer1.o -o ${OBJECTDIR}/timer1.o timer1.c 
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"   -gdwarf-2 -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -Wall -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o dist/${CND_CONF}/${IMAGE_TYPE}/Specto_A.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
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
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

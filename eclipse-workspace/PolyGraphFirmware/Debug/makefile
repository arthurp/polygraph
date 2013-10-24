################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
LSS += \
PolyGraphFirmware.lss \

FLASH_IMAGE += \
PolyGraphFirmware.hex \

SIZEDUMMY += \
sizedummy \

AVRDUDEDUMMY += \
avrdudedummy \


# All Target
all: PolyGraphFirmware.elf secondary-outputs

# Tool invocations
PolyGraphFirmware.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: AVR C++ Linker'
	avr-g++ -Wl,-Map,PolyGraphFirmware.map,--cref -Wl,--gc-sections -L"/home/amp/shared/polygraph/eclipse-workspace/ArduinoCore/168_16MHz" -mmcu=atmega168 -o "PolyGraphFirmware.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

PolyGraphFirmware.lss: PolyGraphFirmware.elf
	@echo 'Invoking: AVR Create Extended Listing'
	-avr-objdump -h -S PolyGraphFirmware.elf  >"PolyGraphFirmware.lss"
	@echo 'Finished building: $@'
	@echo ' '

PolyGraphFirmware.hex: PolyGraphFirmware.elf
	@echo 'Create Flash image (ihex format)'
	-avr-objcopy -R .eeprom -O ihex PolyGraphFirmware.elf  "PolyGraphFirmware.hex"
	@echo 'Finished building: $@'
	@echo ' '

sizedummy: PolyGraphFirmware.elf
	@echo 'Invoking: Print Size'
	-avr-size --format=berkeley -t PolyGraphFirmware.elf
	@echo 'Finished building: $@'
	@echo ' '

avrdudedummy: PolyGraphFirmware.elf
	@echo 'Invoking: AVRDude'
	avrdude -pnull -carduino -P/dev/ttyUSB0 -b19200 -Ereset -Uflash:w:PolyGraphFirmware.hex:a
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(ELFS)$(FLASH_IMAGE)$(LSS)$(S_DEPS)$(CXX_DEPS)$(S_UPPER_DEPS)$(C++_DEPS)$(ASM_DEPS)$(CC_DEPS)$(AVRDUDEDUMMY)$(CPP_DEPS)$(C_UPPER_DEPS)$(SIZEDUMMY) PolyGraphFirmware.elf
	-@echo ' '

secondary-outputs: $(LSS) $(FLASH_IMAGE) $(SIZEDUMMY) $(AVRDUDEDUMMY)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

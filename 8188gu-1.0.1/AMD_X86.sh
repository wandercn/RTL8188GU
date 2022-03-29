#!/bin/bash
#
# Purpose: Change settings in the Makefile to support compiling x86 PC 
# operating systems for PC x86 Hardware.
#
# To make this file executable (if necessary):
#
# $ chmod +x AMD_X86.sh
#
# To execute this file:
#
# $ ./AMD_X86.sh

# getconf LONG_BIT (need to work on this)

sed -i 's/CONFIG_PLATFORM_ARM_PI = y/CONFIG_PLATFORM_ARM_PI = n/g' Makefile
RESULT=$?

if [[ "$RESULT" != "0" ]]; then
	echo "An error occurred and Raspberry Pi OS (32 bit) support was not turned off in Makefile."
	exit 1
else
	echo "Raspberry Pi OS (32 bit) support was turned off in Makefile as planned."
fi


sed -i 's/CONFIG_PLATFORM_I386_PC = n/CONFIG_PLATFORM_I386_PC = y/g' Makefile
RESULT=$?

if [[ "$RESULT" != "0" ]]; then
	echo "An error occurred and i386 support was not turned on in Makefile."
	exit 1
else
	echo "i386 support was turned on in Makefile as planned."
	exit 0
fi

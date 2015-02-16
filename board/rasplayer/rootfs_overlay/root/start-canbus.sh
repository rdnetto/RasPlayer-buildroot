#!/bin/sh
# the spi-config set the config to the PICAN module
# 10MHz SPI clock GPIO 25 for MCP2515 /INT and 16Mhz clock (crystal) - 0x2002 -> IRQF_ONESHOT
modprobe spi-config devices=bus=0:cs=0:modalias=mcp2515:speed=10000000:gpioirq=25:pd=20:pds32-0=16000000:pdu32-4=0x2002:force_release

modprobe mcp251x
ip link set can0 up type can bitrate 125000 triple-sampling on


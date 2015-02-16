#!/bin/sh

#pin 15 = GPIO22
RPI_OK=22

echo $RPI_OK > /sys/class/gpio/export 
echo out     > /sys/class/gpio/gpio${RPI_OK}/direction 
echo 1       > /sys/class/gpio/gpio${RPI_OK}/value 


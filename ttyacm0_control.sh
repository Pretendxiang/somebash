#!/bin/bash

# Device name
DEVICE="/dev/ttyACM0"

# Extracted USB bus path
USB_BUS_PATH="1-2.3"

# Log file
LOG_FILE="/var/log/manage_usb.log"

# Function to log messages
log_message() {
    echo "$(date): $1" | sudo tee -a $LOG_FILE
}

# Function to unbind the device
stop_device() {
    log_message "Stopping device $DEVICE"
    echo $USB_BUS_PATH | sudo tee /sys/bus/usb/drivers/usb/unbind
}

# Function to bind the device
start_device() {
    log_message "Starting device $DEVICE"
    echo $USB_BUS_PATH | sudo tee /sys/bus/usb/drivers/usb/bind
}

# Stop the device
stop_device

# Sleep for a while (optional)
sleep 5s

# Start the device
start_device

#!/bin/sh

DIR="~/aq/scripts"

if [ -d "$DIR" ]; then
  echo "The directory '$DIR' exists."
else
  echo "ERROR: The directory '$DIR' does not exist."
  exit 1
fi

echo "checking if the variables are already set"
echo "..."


echo "Please enter the PORT to be used for FRP:"
read PORT

echo "AQ_FRP_PORT: , $PORT."

echo "Please enter the DEVICE NUMBER:"
read DEVICE_NUMBER

echo "AQ_DEVICE_NUMBER: , $DEVICE_NUMBER."


echo "export AQ_FRP_PORT=\"$PORT\"" >> ~/.bashrc
# AQ_FRP_ADDRESS
echo "export AQ_DEVICE_NUMBER=\"$DEVICE_NUMBER\"" >> ~/.bashrc

source ~/.bashrc
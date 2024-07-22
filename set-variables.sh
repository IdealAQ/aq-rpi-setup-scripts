#!/bin/sh

echo "Please enter the PORT to be used for FRP:"
read PORT

echo "PORT: , $PORT."

echo "export AQ_FRP_PORT=\"$PORT\"" >> ~/.bashrc
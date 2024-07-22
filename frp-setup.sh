#!/bin/sh

# development in progress

if [ -z "${AQ_FRP_PORT}" ]; then
  echo "AQ_FRP_PORT is not set"
else
  echo "AQ_FRP_PORT is set to '$AQ_FRP_PORT'"
fi
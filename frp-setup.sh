#!/bin/sh

# development in progress.

echo "Verifying all required environmental variables are set."
echo "..."
if [ -z "${AQ_FRP_PORT}" ]; then
  echo "AQ_FRP_PORT is not set"
else
  echo "AQ_FRP_PORT is set to '$AQ_FRP_PORT'"
fi
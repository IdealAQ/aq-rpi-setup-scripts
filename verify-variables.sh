#!/bin/sh

STATUS = 0

# should not be combined with set-variables.sh?
echo "Verifying all required environmental variables are set."
echo "..."
if [ -z "${AQ_FRP_PORT}" ]; then
  echo "AQ_FRP_PORT is not set"
  STATUS=$((STATUS + 1))
else
  echo "AQ_FRP_PORT is set to '$AQ_FRP_PORT'"
fi

if [ -z "${AQ_DEVICE_NUMBER}" ]; then
  echo "AQ_DEVICE_NUMBER is not set"
  STATUS=$((STATUS + 1))
else
  echo "AQ_DEVICE_NUMBER is set to '$AQ_DEVICE_NUMBER'"
fi

echo "STATUS is set to '$STATUS'"

exit $STATUS
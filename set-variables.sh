#!/bin/bash

variables=(
  "AQ_DEVICE_ID,Device identifier"
  "AQ_FRP_SERVER_ADDRESS,FRP server address"
  "AQ_FRP_SERVER_PORT,FRP server port"
  "AQ_FRP_DEVICE_PORT,FRP device port"
)

echo "verifying if all variables are set..."
echo ""
printf "%-25s %-15s %-10s \n" "Name" "Value" "Description"
echo "---------------------------------------------------------------------"
missing=()

for index in "${!variables[@]}"; do
  variable="${variables[$index]}"
  IFS=',' read -r name description <<< "$variable"
  if [ -z "${!name}" ]; then # check if variable is set already
    missing+=($index)
    printf "%-25s %-15s %-10s \n" "${name}" "< MISSING!!! >" "${description}"
  else
    printf "%-25s %-15s %-10s \n" "${name}" "${!name}" "${description}"
  fi
done

echo ""

if [ ${#missing[@]} -eq 0 ]; then
  echo "All variables are set!"
  return
fi

echo ""
echo "Set (${#missing[@]}) missing variables..."
echo ""

for missing_index in "${missing[@]}"; do
  missing_variable="${variables[$missing_index]}"
  IFS=',' read -r name description <<< "$missing_variable"
  echo "Please, enter ${name} (${description}):"
  read value
  echo "export ${name}=\"$value\"" >> ~/.bashrc
done

source ~/.bashrc

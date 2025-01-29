#!/bin/bash

variables=(
  "AQ_FRP_PORT,Port to be used for FRP"
  "AQ_DEVICE_ID,Device identifier"
)

echo "verifying if all variables are set..."
echo ""
printf "%-20s %-15s %-10s \n" "Name" "Value" "Description"
echo "---------------------------------------------------------------------"
missing=()

for index in "${!variables[@]}"; do
  variable="${variables[$index]}"
  IFS=',' read -r name description <<< "$variable"
  if [ -z "${!name}" ]; then # check if variable is set already
    missing+=$index
    printf "%-20s %-15s %-10s \n" "${name}" "< MISSING!!! >" "${description}"
  else
    printf "%-20s %-15s %-10s \n" "${name}" "${!name}" "${description}"
  fi
done

echo ""

if [ ${#missing[@]} -eq 0 ]; then
  echo "All variables are set!"
  return
fi

echo ""
echo "Set missing variables..."
echo ""

for missing_index in "${missing}"; do
  missing_variable="${variables[$missing_index]}"
  IFS=',' read -r name description <<< "$missing_variable"

  echo "Please, enter ${name} (${description})"
  read value
  echo "export ${name}=\"$value\"" >> ~/.bashrc
done

source ~/.bashrc

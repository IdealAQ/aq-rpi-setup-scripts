#!/bin/bash

variables=(
  "AQ_DEVICE_ID,Device identifier,"
  "AQ_FRP_SERVER_ADDRESS,FRP server address,"
  "AQ_FRP_SERVER_PORT,FRP server port,7000"
  "AQ_FRP_DEVICE_PORT,FRP device port,"
  "AQ_USER,User to run FRP service,aq"
  "AQ_GROUP,Group of user to run FRP service,aq"

)

echo "verifying if all variables are set..."
echo ""
printf "%-25s %-15s %-10s \n" "Name" "Value" "Description"
echo "---------------------------------------------------------------------"
missing=()

for index in "${!variables[@]}"; do
  variable="${variables[$index]}"
  IFS=',' read -r name description default <<< "$variable"
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
  echo "For instructions to edit already set variable, navigate to the documentation:"
  echo ">>> https://github.com/IdealAQ/aq-rpi-setup-scripts"
  return
fi

echo ""
echo "Set (${#missing[@]}) missing variables..."
echo ""

for missing_index in "${missing[@]}"; do
  success=0
  unset default
  missing_variable="${variables[$missing_index]}"
  IFS=',' read -r name description default <<< "$missing_variable"
  
  while [ "$success" -eq 0 ]; do
    echo "Setting variable ${name} (${description})"
    if [ ! -z "$default" ]; then
      echo "Press ENTER to use default value \"${default}\"."
    fi
    read -p "provide value: " value
    if [ -z "$value" ]; then
      if [ ! -z "$default" ]; then
        value="$default"
      fi
    fi
    
    if [ ! -z "$value" ]; then
      echo "Setting value \"${value}\" for variable ${name}."
      echo "export ${name}=\"$value\"" >> ~/.bashrc
      success=1
    fi
  done
done

source ~/.bashrc

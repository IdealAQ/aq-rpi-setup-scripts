#!/bin/bash

echo "Checking if frpc.service exists..."
if systemctl list-units --type=service --all | grep -q "frpc.service"; then
    echo "frpc.service exists."
    
    # Check if the service is running
    if systemctl is-active --quiet frpc.service; then
        echo "frpc.service is running."
        echo "Exiting the script!"
        echo "No change has been performed."
    else
        echo "frpc.service is NOT running."
        echo "to start the service, run \"sudo systemctl start frpc.service\""
    fi
    return
else
    echo "frpc.service does not exist."
    echo ""
    echo "Continuing with setting up the service..."
fi

. ./set-variables.sh

envsubst < ~/aq/scripts/templates/template_etc_frpc.ini > just_testing.conf

cd /tmp
wget https://github.com/fatedier/frp/releases/download/v0.49.0/frp_0.49.0_linux_amd64.tar.gz
tar -xzf frp_0.49.0_linux_amd64.tar.gz

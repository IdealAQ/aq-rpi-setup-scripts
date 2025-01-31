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

cd /opt

echo "Downloading FRP..."
sudo wget https://github.com/fatedier/frp/releases/download/v0.49.0/frp_0.49.0_linux_arm.tar.gz
sudo tar -xzf frp_0.49.0_linux_arm.tar.gz
sudo ln -s frp_0.49.0_linux_arm frp

echo "Configuring /etc/frpc.ini"
envsubst < ~/aq/scripts/templates/template_etc_frpc.ini | sudo tee /etc/frpc.ini
echo "Configuring /etc/systemd/system/frpc.service"
envsubst < ~/aq/scripts/templates/template_etc_systemd_system_frpc.service | sudo tee /etc/systemd/system/frpc.service

echo "Starting frp.service"
sudo systemctl enable /etc/systemd/system/frpc.service
sudo systemctl start frpc.service

echo ""
echo ">> DONE! FRP installed! <<"


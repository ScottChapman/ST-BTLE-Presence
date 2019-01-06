#!/bin/bash
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bashrc
nvm install v8.11.1
npm install -g node-red pm2 smartthings-mqtt-bridge libbluetooth-dev
apt install -y mosquitto mosquitto-clients git libbluetooth-dev
systemctl enable mosquitto.service
# launch node-red-pi and then exit

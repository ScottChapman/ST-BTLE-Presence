#!/bin/bash
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bashrc
nvm install v8.11.1
npm install -g node-red pm2 smartthings-mqtt-bridge libbluetooth-dev
apt install -y mosquitto mosquitto-clients git libbluetooth-dev
systemctl enable mosquitto.service
sudo setcap cap_net_raw+eip $(eval readlink -f `which node`)
# launch node-red-pi and then exit
cd ~/.node-red
npm install --save node-red-contrib-noble
pm2 start smartthings-mqtt-bride
pm2 start node-red-pi
pm2 save
pm2 startup
sudo env PATH=$PATH:/home/pi/.nvm/versions/node/v8.11.1/bin /home/pi/.nvm/versions/node/v8.11.1/lib/node_modules/pm2/bin/pm2 startup systemd -u pi --hp /home/pi

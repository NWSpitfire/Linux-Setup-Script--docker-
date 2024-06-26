# Linux Setup Script to install Docker, Portainer and others.

#V2.0

#! /bin/bash


echo "Welcome to the JDRTS Linux VM Setup Script v2"
echo "WARNING: This script uses root privellages"

echo ""

echo "--- Installing Nala (APT Wrapper) for faster installation---"
sudo apt install nala -y

echo "--- Installing System Updates ---"
sudo nala update && sudo nala upgrade -y

echo "--- Installing QEMU Guest Agent ---"
sudo nala install qemu-guest-agent -y
sudo systemctl start qemu-guest-agent
sudo systemctl enable qemu-guest-agent

#clear terminal
clear

echo "--- Install Docker GPG Keys ---"
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "--- Add Docker to APT Repository Sources ---"
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

echo "--- Install Docker CE, Docker Compose and other required packages ---"
sudo nala install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#clear terminal
clear

echo ""
echo "--- Test Docker ---"
sudo docker ps

echo ""
echo ""
echo ""
echo ""
echo ""

echo "--- Install Portainer WebUI ---"
sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

sudo docker ps

ip a


echo "--- SCRIPT COMPLETE ---"
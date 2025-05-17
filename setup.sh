# Linux Setup Script to install Docker, Portainer and others.

#V2.0

#! /bin/bash


echo "Welcome to the JDRTS Linux VM Setup Script v3"
echo "WARNING: This script uses root privellages"

echo ""

#wait 5s
sleep 5s

echo "--- Installing Nala (APT Wrapper) for faster installation---"
sudo apt install nala -y

echo "--- Installing System Updates ---"
sudo nala update && sudo nala upgrade -y

echo "--- Installing QEMU Guest Agent ---"
sudo nala install qemu-guest-agent -y
sudo systemctl start qemu-guest-agent
sudo systemctl enable qemu-guest-agent

echo "--- Installing (file) Tree ---"
sudo nala install tree

echo "--- Installing Midnight Commander (Terminal File Browser) ---"
sudo nala install mc

#wait 3s
sleep 3s

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

#wait 3s
sleep 3s

echo "--- Install Dockge WebUI ---"
# Create directories that store your stacks and stores Dockge's stack
sudo mkdir -p /opt/stacks /opt/dockge
cd /opt/dockge

# Download the compose.yaml
sudo curl https://raw.githubusercontent.com/louislam/dockge/master/compose.yaml --output compose.yaml

# Start the server
sudo docker compose up -d


sudo docker ps

echo ""
echo ""
echo ""

ip a


echo "--- SCRIPT COMPLETE ---"

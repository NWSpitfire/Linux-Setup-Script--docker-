# Linux Setup Script to install Docker, Portainer and others.

#V2.0

#! /bin/bash


echo "Welcome to the JDRTS Linux VM Docker Install Script v1"
echo "WARNING: This script uses root privellages"

echo ""

#wait 5s
sleep 5s

echo "--- Installing Nala (APT Wrapper) for faster installation---"
sudo apt install nala -y

echo "--- Installing System Updates ---"
sudo nala update && sudo nala upgrade -y

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

echo "--- Install nginx to test docker ---"

sudo docker run --name some-nginx -d -p 8080:80


echo "--- Installing (file) Tree, Midnight Commander (Terminal File Browser) & DUF ---"
sudo nala install tree mc duf

sudo docker ps

echo ""
echo ""
echo ""

ip a


echo "--- SCRIPT COMPLETE ---"

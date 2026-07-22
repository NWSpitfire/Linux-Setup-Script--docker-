# Linux Setup Script to install Docker on vanilla Debian (Trixie)

#V1.0

#! /bin/bash


EXPECTED_VERSION="13"  # Change this to your expected version
CURRENT_VERSION=$(lsb_release -sr)

echo "Welcome to the JDRTS Debian 13 Linux VM Docker Install Script v1"
echo "WARNING: This script uses root privellages"

echo ""

#wait 5s
sleep 5s

if [ "$CURRENT_VERSION" != "$EXPECTED_VERSION" ]; then
    echo "Unexpected Debian version: $CURRENT_VERSION. Exiting."
    exit 1  # Exit with a non-zero status
fi

echo "Debian version is as expected: $CURRENT_VERSION."
echo ""
echo ""
sleep 1s

echo "--- Installing System Updates ---"
sudo apt update && sudo apt upgrade -y

#wait 3s
sleep 3s

#clear terminal
clear

echo "--- Remove Any Old or Conflicting Docker Packages ---"
sudo apt remove docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc -y

echo "--- Install Dependencies ---"
sudo apt update
sudo apt install ca-certificates curl -y

echo "--- Install Docker GPG Keys ---"
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "--- Add Docker to Debian APT Repository Sources (Trixie/13) ---"
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

echo "--- Install Docker CE, Docker Compose and other required packages ---"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sleep 3s

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

echo "--- Install hello-world to test docker ---"

sudo docker run hello-world

sleep 5s


echo "--- Installing (file) Tree, DUF, iotop & nmap---"
sudo nala install tree duf iotop nmap

sudo docker ps

echo ""
echo ""
echo ""

ip a

echo ""
echo ""
echo ""

duf


echo "--- SCRIPT COMPLETE ---"

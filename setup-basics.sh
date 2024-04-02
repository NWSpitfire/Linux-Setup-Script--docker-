# Linux Setup Script to install the basics on a new Proxmox VM (no Docker install - to be used for machines running local services, not containers).

#V2.0

#! /bin/bash


echo "Welcome to the JDRTS Linux VM Setup Script v2 - Basic"
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

ip a

echo "--- SCRIPT COMPLETE ---"
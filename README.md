# Linux-Setup-Script-(docker)
 
###### NOTE: This is badly written for my use case only. USE AT YOUR OWN RISK.

**Version 3.0**

**CHANGELOG**

V1.0 - Initial 

V2.0 - Added basic script and updated main setup script.

V3.0 - Remove Portainer from the main setup script and replace with Dockge. Create dedicated "-portainer.sh" script for portainer. Add sleep functions to allow for better readability of actions in the script.

**ABOUT**

This script auto downloads and installs;

 - Nala (APT wrapper for faster [and multithreaded] updates & installs)
 - QEMU-Guest-Agent
 - Docker CE
 - Portainer CE
 - Tree
 - Midnight Commander (Terminal File Browser)
 - DUF

Designed for fast start of Proxmox VM's

## Download and Run Standard Script

1. Download file

        curl -s https://raw.githubusercontent.com/NWSpitfire/Linux-Setup-Script--docker-/main/setup.sh | bash

2. Reboot

## Download and Run Portainer Script

1. Download file

        curl -s https://raw.githubusercontent.com/NWSpitfire/Linux-Setup-Script--docker-/main/setup-portainer.sh | bash

2. Reboot

## Download and Run Basic Script

1. Download file

        curl -s https://raw.githubusercontent.com/NWSpitfire/Linux-Setup-Script--docker-/main/setup-basics.sh | bash

2. Reboot


## -- Debugging --

## Download and Run Standard Script (Debugging)

1. Download file

        curl https://raw.githubusercontent.com/NWSpitfire/Linux-Setup-Script--docker-/main/setup.sh > setup.sh

2. Make Executable

        sudo chmod +x setup.sh

3. Run Script

        sudo bash setup.sh

4. Reboot

## Download and Run Portainer Script (Debugging)

1. Download file

        curl https://raw.githubusercontent.com/NWSpitfire/Linux-Setup-Script--docker-/main/setup-portainer.sh > setup.sh

2. Make Executable

        sudo chmod +x setup.sh

3. Run Script

        ./setup-portainer.sh

4. Reboot


## Download and Run Basic Script (Debugging)

1. Download file

        curl https://raw.githubusercontent.com/NWSpitfire/Linux-Setup-Script--docker-/main/setup-basics.sh > setup-basics.sh

2. Make Executable

        sudo chmod +x setup-basics.sh

3. Run Script

        ./setup-basics.sh

4. Reboot

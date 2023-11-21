# Linux-Setup-Script-(docker)
 
###### NOTE: This is badly written for my use case only. USE AT YOUR OWN RISK.

**Version 2.0**

This script auto downloads and installs;

 - Nala (APT wrapper for faster [and multithreaded] updates & installs)
 - QEMU-Guest-Agent
 - Docker CE
 - Portainer CE

Designed for fast start of Proxmox VM's

## Download and Run

1. Download file

        curl https://raw.githubusercontent.com/NWSpitfire/Linux-Setup-Script--docker-/main/setup.sh > setup.sh

2. Make Executable

        sudo chmod +x setup.sh

3. Run Script

        ./setup.sh

4. Reboot


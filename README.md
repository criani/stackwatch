# StackWatch: Ultra Lightweight Homelab Security Solution

## Overview
StackWatch is an integrated security suite for networks, featuring SimpleScan (an nmap-based vulnerability scanner), EveBox (a Suricata frontend for intrusion detection), and PiHole (a DNS server / ad and malware blocker).

## What is it?
StackWatch is meant to be installed in a docker environment. The overall goal of the project is to allow someone with limited security knowledge or money or both, to quickly deploy some helpful security tools on hardware that would otherwise be under-powered. I included an ARM build so this can be installed on a RaspBerry PI. Currently I recommend host specs of 2CPU cores and 4GB RAM, but for bigger networks that may be a push. 

Note: If you dont want to run the install script or want to customize, you can simply copy the docker-compose into your favorite docker manager (I really like Portainer) and run the shell file to create the files you need (it's just a JSON file for heimdall and the docker-compose with your required passwrd and IP).

## Installation
1. **Copy Contents and Install**:
   - On the host do the following
   - **Note**:This shell uses apt-get, if you are on a system such as centOS that uses yum, you will need to update accordingly. See above for manual install. 
   - Run the below Command   
   - Bash: `cd /opt/ && sudo git clone https://github.com/criani/stackwatch.git && cd /opt/stackwatch && sudo bash autoinstall.sh`

3. **Validate Containers**:
   - The final part of the autoinstall.sh should run, which will show the running containers
   - if you are not sure, Check containers: `sudo docker ps -a` to make sure all are up. 

## Access and Configuration
- **Dashboard Access**: Navigate to `<docker host-ip>:8080`.
- **Import Configuration**:
  - In the dashboard, go to settings, select 'Import', and upload `stackwatch.json`, which is created and saved to the directory you ran the installer command.

## Components
- **SimpleScan**: URL/IP vulnerability and port scanner.
- **EveBox**: Suricata-based network threat monitor.
- **PiHole**: DNS server/filter for blocking ads/malicious sites.

## Additional Setup for PiHole
- Basic configuration included. For full features, see [Pi-hole documentation](https://pi-hole.net/).
- Configure network DNS settings to point to the PiHole host.

## Support
For queries or issues, please refer to the [GitHub Issues](#) section.

## License
[MIT License](LICENSE)

## Contributing
Contributions are welcome. See [Contribution Guidelines](CONTRIBUTING.md) for more details.

## Attribution
This stack is comprised of various containers that were made by, and maintained by, some amazing folks THAT ARE NOT ME. 
- I am simply riding on the shoulders of giants! 
- EveBox is made by Jasonish
- PiHole is an amazing community supported application
- I made SimpleScan, but not that would not be possible without having tools like Bootstrap and NMAP available to me!
- The dashboard is from Heimdall, another amazing open source project

- I will do my absolute best to include all credit where it is due. If I forget to attribute work you did that I included in this project, please let me know so I can give credit! 

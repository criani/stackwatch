# SecureStack: Ultra Lightweight Homelab Security Solution

## Overview
SecureStack is an integrated security suite for networks, featuring SimpleScan (an nmap-based vulnerability scanner), EveBox (a Suricata frontend for intrusion detection), and PiHole (a DNS ad and malware blocker).

## What is it?
Secure stack is meant to be installed in a docker environment. The overall goal of the project is to allow someone with limited security knowledge or money or both, to quickly deploy some helpful security tools on hardware that would otherwise me underpowered. Ultimately, I plan to include and ARM build so this can be installed on a RaspBerry PI 4b. Currently I recommend host specs of 4CPU cores and 6GB RAM, but for small nets you could get away with less RAM.

Note: You can simply copy the docker-compose into your favorite docker manager (I really like Portainer) and run the shell file to create the files you need, you don't have to use docker-compose directly. 

## Installation
1. **Copy Contents**: 
   - Preferred location: `/opt/<docker-install-location>`
   - Platform: Primarily for Ubuntu.

2. **Install Docker Compose**:
   - Command: `sudo apt update && sudo apt-get install docker-compose`

3. **Run Setup Script**:
   - Execute: `sudo bash makefile.sh`
   - This script generates:
     - `.env`: For Docker Compose container configuration.
     - `stackwatch.json`: For dashboard import.

4. **Create Containers**:
   - Command: `sudo docker-compose up -d`
   - Check containers: `sudo docker ps`

## Access and Configuration
- **Dashboard Access**: Navigate to `<host-ip>:8080`.
- **Import Configuration**:
  - In the dashboard, go to settings, select 'Import', and upload `stackwatch.json`.

## Components
- **SimpleScan**: URL/IP range scanner.
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

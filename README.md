# SecureStack: Network Security Solution

## Overview
SecureStack is an integrated security suite for networks, featuring SimpleScan (an nmap-based scanner), EveBox (a Suricata frontend for intrusion detection), and PiHole (a DNS ad and malware blocker).

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

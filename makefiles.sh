#!/bin/bash

# Check if jq is installed, if not, install it
if ! command -v jq &> /dev/null
then
    echo "jq could not be found, installing..."
    # Assuming a Debian/Ubuntu system, using apt-get to install jq
    sudo apt-get update && sudo apt-get install jq -y
fi

# Prompt user for the host IP address
read -p "Enter the host IP address: " host_ip

# Prompt user for Pi-hole initial password
read -p "Enter the Pi-hole initial password: " pihole_password

# Create a JSON template for heimdall dashboard setup
json_template='[
  {
    "title": "EveBox Suricata",
    "colour": "#8AC",
    "url": "http://IP_ADDRESS:5636",
    "description": null,
    "appid": "null",
    "appdescription": "Evebox is a lightweight frontend for Suricata, designed to help detect and respond to network-based attacks and threats."
  },
  {
    "title": "Pi-hole",
    "colour": "#161b1f",
    "url": "http://IP_ADDRESS/admin",
    "description": "{\"enabled\":\"0\",\"dataonly\":\"1\",\"override_url\":null,\"apikey\":null}",
    "appid": "b89920409bdce40e08ba1023480b0546061cd577",
    "appdescription": "Pi-hole is a Linux network-level advertisement and internet tracker blocking application which acts as a DNS sinkhole, intended for use on a private network."
  },
  {
    "title": "SimpleScan",
    "colour": "#005",
    "url": "http://IP_ADDRESS:5000",
    "description": null,
    "appid": "null",
    "appdescription": "SimpleScan from NexTier Cyber is a lightweight, Nmap based scanning application designed to help identify network security issues and open ports."
  }
]'

# Replace IP_ADDRESS placeholder with the actual IP address in the JSON template
updated_json=$(echo $json_template | jq --arg ip "$host_ip" 'map(.url |= gsub("IP_ADDRESS"; $ip))')

# Save to a new file
echo $updated_json > securestack.json
echo "JSON file created: securestack.json"

# Create the .env file
echo "WEBPASSWORD_Pihole=$pihole_password" > .env
echo "TZ=UTC" >> .env
echo "PIHOLE_DNS=9.9.9.9 #preferred upstream" >> .env
echo "HOST_IP=$host_ip #IP of the container host" >> .env

echo ".env file created."


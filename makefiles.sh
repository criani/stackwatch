#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$@" > /dev/null 2>&1
}

# Check for Docker and install it if not found
if ! command_exists docker; then
    echo "Docker is not installed. Installing Docker..."
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
fi

# Check for Docker Compose and install it if not found
if ! command_exists docker-compose; then
    echo "Docker Compose is not installed. Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Check for jq and install it if not found
if ! command_exists jq; then
    echo "jq could not be found. Installing jq..."
    sudo apt-get update
    sudo apt-get install jq -y
fi

# Prompt user for the host IP address and Pi-hole initial password
read -p "Enter the host IP address: " host_ip
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

# Replace IP_ADDRESS placeholder in the JSON template
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


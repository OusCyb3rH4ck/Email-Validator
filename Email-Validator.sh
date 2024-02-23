#!/bin/bash

install_package() {
    package_name=$1
    if ! command -v "$package_name" &> /dev/null; then
        echo -e "\e[1;35m\nInstalling $package_name...\e[0m"
        sudo apt-get update && sudo apt-get install -y "$package_name"
        if [ $? -ne 0 ]; then
            echo -e "\e[1;31m\n\n[!] There was an error installing $package_name...\n\e[0m"
            exit 1
        fi
    fi
}

install_package "figlet"
install_package "lolcat"
install_package "curl"

clear && figlet "Email Validator" | lolcat
echo -e "\e[1;32m\nMade by OusCyb3rH4ck\n\e[0m"

zerobounce_api_key="7dba02eb52f0452c8ae1b9197ebc130b"

read -p "Enter the email address: " email_to_validate
echo -e "\n"
curl -s -X GET "https://api.zerobounce.net/v2/validate?api_key=$zerobounce_api_key&email=$email_to_validate&ip_address=" | jq
echo -e "\n"

#!/bin/bash

if [ ! -d "/home/$USER/dutchgov_bug_bounty" ]; then
    mkdir "/home/$USER/dutchgov_bug_bounty"
fi


read -p "Enter directory name: " dir_name

if [ -z "$dir_name" ]; then
    echo "Error: Directory name cannot be empty"
    exit 1
fi

if [[ ! "$dir_name" =~ ^[a-zA-Z0-9_.]+$ ]]; then
    echo "Error: Invalid characters in directory name"
    exit 1
fi

if [ -d "/home/$USER/dutchgov_bug_bounty/$dir_name" ]; then
    echo "Error: Directory '$dir_name' already exists"
    exit 1
fi

mkdir "/home/$USER/dutchgov_bug_bounty/$dir_name"
cd "/home/$USER/dutchgov_bug_bounty/$dir_name"
mkdir loots vulns notes

echo "## Hunted subdomain :" >> notes/notes.txt
echo "## Vulns :" >> notes/notes.txt
echo "## PoC :" >> notes/notes.txt


echo "Directory '$dir_name' successfully created"

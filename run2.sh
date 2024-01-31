#!/bin/bash

# Function to perform a scan and handle errors
perform_scan() {
    local tool=$1
    local cmd=$2
    local output_file="enumotomu-$1.txt"

    echo -e "\n$tool start ... \c"
    if $cmd "$2" >> "$output_file"; then
        echo " done!"
    else
        echo " error: $?"
    fi
}

# Display banner
cat ~/enumotomu/banner.txt

# Create output directory
mkdir "enumotomu-$1"

# Perform sslscan
perform_scan "sslscan" "~/sslscan/sslscan $1"

# Perform nikto
perform_scan "nikto" "~/nikto/program/nikto.pl -h $1 | sed 's///g'"

# Perform nmap
perform_scan "nmap" "nmap -sS $1 -Pn"

# Perform nuclei
perform_scan "nuclei" "nuclei -u $1 --silent"

echo -e "\n~merci~"


#!/bin/bash

# Output file
opf() {
    output_file="$1-$2.txt"
}

# Message
msg() {
    echo -e "running $1 ... \c"
}

# Running tool
cmd() {
    if "$@" >> "$output_file"; then
        echo "done!"
    else
        echo "error: $?"
    fi
}

# nmap
msg "nmap"; opf "$1" "nmap"
cmd nmap -sS $1 -Pn

# sslscan
msg "sslscan"; opf "$1" "sslscan"
cmd ~/./sslscan/sslscan "$1"

# nuclei
msg "nuclei"; opf "$1" "nuclei"
cmd nuclei -u "$1" --silent

# nikto
msg "nikto"; opf "$1" "nikto"
cmd ~/./nikto/program/nikto.pl -h "$1"

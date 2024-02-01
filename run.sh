#!/bin/bash

# Show banner
cat ~/enumotomu/banner.txt

# Make output directory
mkdir enumotomu-$1

# sslscan
echo -e "sslscan start ... \c"
if ~/./sslscan/sslscan "$1" >> "enumotomu-$1/sslscan-$1.txt"; then
    echo " done!"
else
    echo " error: $?"
fi

# nmap
echo -e "\nnmap start ... \c"
if nmap -sS "$1" -Pn >> "enumotomu-$1/nmap-$1.txt"; then
    echo " done!"
else
    echo " error: $?"
fi

# nuclei
echo -e "\nnuclei start ... \c"
if nuclei -u "$1" --silent >> "enumotomu-$1/nuclei-$1.txt"; then
    echo " done!"
else
    echo " error: $?"
fi

# nikto
echo -e "\nnikto start ... \c" 
sed 's///g' 
if ~/./nikto/program/nikto.pl -h "$1" >> "enumotomu-$1/nikto-$1.txt"; then
    echo " done!"
else
    echo " error: $?"
fi

cho -e "\n~merci~"

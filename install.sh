# install dirsearch
git clone https://github.com/maurosoria/dirsearch.git --depth 1 ~/.

# install gobuster
go install github.com/OJ/gobuster/v3@latest

# install nuclei
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
nuclei up ut

# install nikto
git clone https://github.com/sullo/nikto ~/.

# install sslcan
git clone git clone https://github.com/rbsec/sslscan.git ~/.
~/sslscan/make static

# install nmap
https://github.com/nmap/nmap.git
~/nmap/./configure
~/nmap/Make
~/nmap/make install

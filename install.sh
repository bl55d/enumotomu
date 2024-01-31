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
git clone https://github.com/rbsec/sslscan.git ~/.
cd ~/sslscan/; make static

# install nmap
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    if command -v brew &> /dev/null; then
        brew install nmap
    else
        echo "Homebrew is not installed. Please install Homebrew first: https://brew.sh/"
        exit 1
    fi
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    # Linux
    if command -v apt-get &> /dev/null; then
        sudo apt-get install -y nmap
    else
        echo "APT package manager is not available. Please install nmap manually on your Linux distribution."
        exit 1
    fi
else
    echo "Unsupported operating system"
    exit 1
fi

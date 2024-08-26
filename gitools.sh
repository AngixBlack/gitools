#!/bin/bash

# Color Codes
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
CYAN='\033[36m'
RESET='\033[0m'

# Function to Print Message with a Typing Effect
print_message() {
    local color=$1
    local message=$2
    local delay=${3:-0.05}

    for ((i=0; i<${#message}; i++)); do
        echo -ne "${color}${message:$i:1}${RESET}"
        sleep $delay
    done
    echo ""
}

print_logo() {
    echo -e "${CYAN}"
    echo "   ▄██████▄   ▄█      ███         ███      ▄██████▄   ▄██████▄   ▄█          ▄████████ "
    echo "  ███    ███ ███  ▀█████████▄ ▀█████████▄ ███    ███ ███    ███ ███         ███    ███ "
    echo "  ███    █▀  ███▌    ▀███▀▀██    ▀███▀▀██ ███    ███ ███    ███ ███         ███    █▀  "
    echo " ▄███        ███▌     ███   ▀     ███   ▀ ███    ███ ███    ███ ███         ███        "
    echo "▀▀███ ████▄  ███▌     ███         ███     ███    ███ ███    ███ ███       ▀███████████ "
    echo "  ███    ███ ███      ███         ███     ███    ███ ███    ███ ███                ███ "
    echo "  ███    ███ ███      ███         ███     ███    ███ ███    ███ ███▌    ▄    ▄█    ███ "
    echo "  ████████▀  █▀      ▄████▀      ▄████▀    ▀██████▀   ▀██████▀  █████▄▄██  ▄████████▀  "
    echo "                                                                ▀                      "
    echo -e "${RESET}"
    print_message $GREEN "                             Coded by Angix Black" 0.05
}

# Function to Check and Install Dependencies
check_and_install_dependency() {
    local dep=$1
    local install_command=$2

    if ! command -v $dep &> /dev/null; then
        print_message $YELLOW "Warning: $dep is not installed. Installing it now..." 0.02
        eval $install_command
        if ! command -v $dep &> /dev/null; then
            print_message $RED "Error: Failed to install $dep. Please install it manually and try again." 0.02
            exit 1
        else
            print_message $GREEN "$dep installed successfully." 0.02
        fi
    fi
}

# Function to Check for All Required Dependencies
check_dependencies() {
    echo "         "
    check_and_install_dependency "git" "sudo apt-get install -y git"
    check_and_install_dependency "go" "sudo apt-get install -y golang"
    check_and_install_dependency "pip3" "sudo apt-get install -y python3-pip"
    check_and_install_dependency "curl" "sudo apt-get install -y curl"
}

# Function to Show Help Menu
show_help() {
    echo -e "${CYAN}Usage: $0 [option]${RESET}"
    echo -e "${YELLOW}Options:${RESET}"
    echo -e "${GREEN}  install     ${RESET}- Install all tools"
    echo -e "${GREEN}  -h          ${RESET}- Show this help message"
}

# Function to Install All Tools
install_tools() {
    print_message $CYAN "Starting tool installation..." 0.02

    go_tools=(
        "github.com/tomnomnom/anew@latest"
        "github.com/dwisiswant0/unew@latest"
        "github.com/tomnomnom/gf@latest"
        "github.com/tomnomnom/httprobe@latest"
        "github.com/projectdiscovery/httpx/cmd/httpx@latest"
        "github.com/tomnomnom/waybackurls@latest"
        "github.com/lc/gau/v2/cmd/gau@latest"
        "github.com/bp0lr/gauplus@latest"
        "github.com/tomnomnom/qsreplace@latest"
        "github.com/utkusen/socialhunter@latest"
        "github.com/hakluke/hakrawler@latest"
        "github.com/KathanP19/Gxss@latest"
        "github.com/hahwul/dalfox/v2@latest"
        "github.com/projectdiscovery/katana/cmd/katana@latest"
        "github.com/jaeles-project/gospider@latest"
        "github.com/ferreiraklet/Jeeves@latest"
        "github.com/projectdiscovery/dnsx/cmd/dnsx@latest"
        "github.com/tomnomnom/assetfinder@latest"
        "github.com/gwen001/github-subdomains@latest"
        "github.com/rix4uni/xsschecker@latest"
        "github.com/rix4uni/unew@latest"
        "github.com/Emoe/kxss@latest"
        "github.com/LukaSikic/subzy@latest"
        "github.com/bitquark/shortscan/cmd/shortscan@latest"
        "github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest"
    )

    pip_tools=(
        "arjun"
        "uro"
        "droopescan"
        "dnsgen"
        "xsrfprobe"
        "xss-shield"
        "wapiti3"
        "crlfsuite"
        "xnLinkFinder"
        "waymore"
        "pyfiglet"
        "termcolor"
        "cors"
    )

    git_repos=(
        "https://github.com/swisskyrepo/SSRFmap"
        "https://github.com/tarunkant/Gopherus.git"
        "https://github.com/takshal/freq.git"
        "https://github.com/capture0x/XSS-LOADER"
        "https://github.com/s0md3v/XSStrike.git"
        "https://github.com/nahamsec/JSParser.git"
        "https://github.com/m4ll0k/SecretFinder.git"
        "https://github.com/GerbenJavado/LinkFinder.git"
        "https://github.com/codingo/NoSQLMap.git"
        "https://github.com/americo/sqlifinder"
        "https://github.com/PushkraJ99/ParamSpider"
        "https://github.com/ahmed-alnassif/net-spider.git"
        "https://github.com/D35m0nd142/LFISuite.git"
        "https://github.com/hisxo/gitGraber.git"
        "https://github.com/1N3/Sn1per"
        "https://github.com/0xKayala/NucleiFuzzer.git"
        "https://github.com/gotr00t0day/spyhunt.git"
        "https://github.com/un9nplayer/AutoRecon-XSS.git"
        "https://github.com/haroonawanofficial/XSSInspector-SecurityToolkit-AI-ML.git"
        "https://github.com/Dheerajmadhukar/karma_v2.git"
        "https://github.com/EmperialX/XSS-Automation-Tool.git"
        "https://github.com/TalMaIka/Site-Scanner.git"
        "https://github.com/epsylon/xsser.git"
        "https://github.com/0xKayala/NucleiScanner.git"
        "https://github.com/Dheerajmadhukar/4-ZERO-3.git"
        "https://github.com/r0075h3ll/Oralyzer.git"
        "https://github.com/rbsec/dnscan.git"
        "https://github.com/vladko312/SSTImap.git"
        "https://github.com/mandatoryprogrammer/xsshunter.git"
        "https://github.com/ksharinarayanan/SSRFire.git"
        "https://github.com/anshumanpattnaik/http-request-smuggling.git"
        "https://github.com/compsec-snu/razzer.git"
        "https://github.com/devanshbatham/openredirex"
        "https://github.com/swisskyrepo/GraphQLmap"
        "https://github.com/mzfr/liffy"
        "https://github.com/MichaelStott/CRLF-Injection-Scanner.git"
        "https://github.com/s0md3v/Corsy.git"
        "https://github.com/RUB-NDS/CORStest.git"
        "https://github.com/YashGoti/crtsh.py.git"
        "https://github.com/aw-junaid/Hacking-Tools.git"
        "https://github.com/Mr-dark55/XSSGen.git"
        "https://github.com/sarperavci/MXS.git"
        "https://github.com/faiyazahmad07/xss_vibes.git"
        "https://github.com/sanjai-AK47/SubProber.git"
        "https://github.com/r0oth3x49/ghauri.git"
        "https://github.com/Angix-Black/Corscan"
    )

    for tool in "${go_tools[@]}"; do
        print_message $CYAN "Installing $tool..." 0.02
        go install -v $tool
    done

    for tool in "${pip_tools[@]}"; do
        print_message $CYAN "Installing $tool..." 0.02
        pip install $tool
    done

    for repo in "${git_repos[@]}"; do
        repo_name=$(basename "$repo" .git)
        print_message $CYAN "Cloning $repo_name..." 0.02
        git clone "$repo" Tools/"$repo_name"

        if [ -f Tools/"$repo_name"/requirements.txt ]; then
            cd Tools/"$repo_name"
            pip3 install -r requirements.txt
            cd - > /dev/null
        fi

        if [ -f Tools/"$repo_name"/setup.py ]; then
            cd Tools/"$repo_name"
            python3 setup.py install
            cd - > /dev/null
        fi
    done

    print_message $GREEN "All tools have been installed successfully!" 0.02

    print_message $CYAN "Copying Go binaries to /usr/bin..." 0.02
    sudo cp ~/go/bin/* /usr/bin/

    print_message $CYAN "Cloning Gf-Patterns and moving JSON files to ~/.gf..." 0.02
    git clone https://github.com/1ndianl33t/Gf-Patterns
    mkdir -p ~/.gf
    mv ~/Gf-Patterns/*.json ~/.gf/

    print_message $GREEN "All tools have been installed and configured successfully!" 0.02
}

# Main Script Execution
print_logo
check_dependencies

if [ "$1" == "install" ]; then
    install_tools
elif [ "$1" == "-h" ]; then
    show_help
else
    print_message $RED "Invalid option. Use -h for help." 0.01
    exit 1
fi

#!/bin/bash

# ASCII Art
echo "   _____                   __ _           ______    __ ______    __ ______"
echo "  / ___/ __  __ _____ ____/ /(_)____ _   / ____/  _/_// ____/  _/_// ____/"
echo "  \\__ \\ / / / // ___// __  // // __ \`/  /___ \\  _/_/ /___ \\  _/_/ /___ \\  "
echo " ___/ // /_/ /(__  )/ /_/ // // /_/ /  ____/ /_/_/  ____/ /_/_/  ____/ /  "
echo "/____/ \\__, //____/ \\__,_//_/ \\__, /  /_____//_/   /_____//_/   /_____/   "
echo "      /____/                 /____/                                       "
echo ""

# Function to display the menu
display_menu() {
    echo "Sysdig Command Line Tool"
    echo "========================="
    echo "1. AWS Simulations"
    echo "2. Kubernetes Simulations"
    echo "3. Linux Simulations"
    echo "4. Run Additional Security Commands"
    echo "5. Cleanup Simulations"
    echo "6. Exit"
    echo ""
}

# AWS Simulations
simulate_aws() {
    echo "Running AWS Simulations..."
    echo "Simulating AWS credential exfiltration..."
    touch ~/.aws/credentials_exfiltrated
    echo "[default]" > ~/.aws/credentials_exfiltrated
    echo "aws_access_key_id = AKIAxxxxxxxxxxxxxxx" >> ~/.aws/credentials_exfiltrated
    echo "aws_secret_access_key = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> ~/.aws/credentials_exfiltrated
    echo "AWS credential exfiltration simulation completed."
    echo
}

# Kubernetes Simulations
simulate_kubernetes() {
    echo "Running Kubernetes Simulations..."
    echo "Simulating malicious pod creation..."
    kubectl run malicious-pod --image=alpine --command -- sleep 3600
    echo "Malicious pod 'malicious-pod' created."
    echo
}

# Linux Simulations
simulate_linux() {
    echo "Running Linux Simulations..."
    echo "Simulating file creation and privilege escalation..."
    touch /tmp/linux_simulation_file.txt
    echo "Test data" > /tmp/linux_simulation_file.txt
    chmod 777 /tmp/linux_simulation_file.txt
    echo "Privilege escalation attempt (access /etc/shadow)..."
    cat /etc/shadow >/dev/null 2>&1 || echo "Access denied (expected)."
    echo "Linux simulation completed."
    echo
}

# Additional Security Commands
run_additional_commands() {
    echo "Running Additional Security Commands..."
    echo "Executing XMRig with donate-level 8..."
    ./xmrig-6.16.4/xmrig --donate-level 8 -o 47.115.41.163:14433 -u 422skia35WvF9mVq9Z9oCMRtoEunYQ5kHPvRqpH1rGCv1BzD5dUY4cD8wiCMp4KQEYLAN1BuawbUEJE99SNrTv9N9gf2TWC --tls --coin monero

    echo "Executing XMRig with alternative pool..."
    ./xmrig -o stratum+tcp://xmr.pool.minergate.com:45700 -u lies@lies.lies -p x -t 2

    echo "Searching for AWS secret keys in files..."
    grep "aws_secret_access_key" /path/to/some/file || echo "No AWS secrets found."

    echo "Attempting to read shadow file..."
    sudo cat /etc/shadow > /dev/null || echo "Access denied (expected)."

    echo "Running LinEnum script for privilege enumeration..."
    bash -c ./LinEnum.sh || echo "LinEnum execution failed."
    echo
}

# Cleanup Function
cleanup_simulations() {
    echo "Cleaning up simulations..."
    rm -f ~/.aws/credentials_exfiltrated
    kubectl delete pod malicious-pod --ignore-not-found >/dev/null 2>&1
    rm -f /tmp/linux_simulation_file.txt
    echo "All simulations cleaned up."
    echo
}

# Main Program
while true; do
    display_menu
    read -rp "Select an option [1-6]: " choice
    case $choice in
        1) simulate_aws ;;
        2) simulate_kubernetes ;;
        3) simulate_linux ;;
        4) run_additional_commands ;;
        5) cleanup_simulations ;;
        6) echo "Exiting. Stay secure!"; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done

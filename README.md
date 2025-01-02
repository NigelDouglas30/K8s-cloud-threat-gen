# Kubernetes & Cloud Threat Generator
Open Source Threat Generator for Linux hosts, containers, Kubernetes and cloud


## Instructions

Download the threat generator
```
wget https://raw.githubusercontent.com/NigelDouglas30/K8s-cloud-threat-gen/refs/heads/main/threat-gen.sh
```

Convert it to executable format
```
chmod +x threat-gen.sh
```

Run the threat generator without any feature flags
```
./threat-gen.sh
```


Sending the packet capture from my Linux box to my local workstation:
```
scp -i nigel-inspect.pem ubuntu@ec2-**-**-**-**.eu-west-1.compute.amazonaws.com:/home/ubuntu/nigel-capture.scap ~/Desktop/
```

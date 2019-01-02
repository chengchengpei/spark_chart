#!/bin/bash

# Assume kubectl is installed and configured. Read ips and pod names of pods
kubectl get pods -o wide | grep myspark | awk '{print $6,$1}' > ips.txt
# kubectl get pods -o wide | grep myspark | cut -d' ' -f1 > pods.txt

# echo these ips and hostnames to /etc/hosts on each pod
while read -r line; do
  ips=$(<ips.txt); kubectl exec $line -- sh -c "echo \"$ips\" >> /etc/hosts"
done < <(kubectl get pods -o wide | grep myspark | cut -d' ' -f1)


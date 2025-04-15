#!/bin/bash

# Attendre que l'IP soit attribuÃ©e (max 10s)
for i in {1..10}; do
    IP=$(ip -4 -o addr show scope global | awk '{print $4}' | head -n1)
    [ -n "$IP" ] && break
    sleep 1
done

# Afficher dans /etc/issue
echo -e "Debian GNU/Linux 12\nIP: $IP\n" > /etc/issue

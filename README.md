# 🔐 Evil Twin WiFi Lab – Raspberry Pi 5

Educational WiFi Security Laboratory Environment  
Built with Raspberry Pi 5 + Kali Linux

---

## 📌 Overview

This project implements a controlled WiFi laboratory environment for studying:

- Access Point configuration
- DHCP and DNS services
- NAT and packet forwarding
- Captive portal behavior
- Traffic monitoring
- Wireless security concepts

⚠️ This repository is strictly for educational purposes in authorized lab environments.

---

## 🖥️ Hardware Used

- Raspberry Pi 5 (4GB)
- Alfa AWUS1900 (RTL8814AU chipset)
- Kali Linux ARM
- Powerbank (portable testing)
- Official 27W USB-C PSU

---

## 🏗️ Architecture

Internet → Router → Raspberry Pi → Test Access Point → Lab Clients

---

### Network Interfaces

| Interface | Function |
|-----------|----------|
| wlan0     | Internet connection |
| wlan1     | Test Access Point |
| eth0      | Optional internet uplink |

---

## ⚙️ Features

- Custom WiFi Access Point
- DHCP + DNS server (dnsmasq)
- NAT configuration (iptables)
- Optional captive portal
- Traffic inspection tools
- Automation scripts

---

## 🚀 Quick Start

cd scripts
chmod +x start-eviltwin.sh
./start-eviltwin.sh
./stop-eviltwin.sh

---

📂 Documentation

See /docs folder:
Architecture
System setup
Access Point configuration
Captive portal design
Traffic monitoring
WiFi security concepts

---

🛡️ Legal Notice

This project is intended for:
Personal lab environments
Academic research
Authorized penetration testing training
Unauthorized usage against networks you do not own or have explicit permission to test may be illegal.


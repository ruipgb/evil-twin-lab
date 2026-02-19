# 01 – Architecture

## Overview

This lab environment uses a Raspberry Pi 5 running Kali Linux
to create a controlled wireless access point.

The Raspberry Pi acts as a gateway between lab clients and the internet.

Internet → wlan0 → Raspberry Pi → wlan1 → Lab Client

---

## Network Interfaces

| Interface | Function |
|-----------|----------|
| wlan0     | Internet uplink (router connection) |
| wlan1     | Access Point interface |
| eth0      | Optional wired uplink |

---

## Services Used

- hostapd → Creates the Access Point
- dnsmasq → DHCP + DNS
- iptables → NAT and packet forwarding
- apache2 → Optional captive portal
- bettercap → Traffic inspection (lab only)

---

## Traffic Flow

1. Client connects to wlan1
2. Receives IP from dnsmasq (192.168.4.x)
3. Traffic forwarded via wlan0
4. NAT applied by iptables

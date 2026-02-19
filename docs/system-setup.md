# System Setup

-> sudo apt update && sudo apt upgrade -y

Install Required Packages

-> sudo apt install hostapd dnsmasq apache2 php libapache2-mod-php bettercap -y

Install AWUS1900 Driver (RTL8814AU)

-> sudo apt install realtek-rtl88xxau-dkms -y
-> sudo reboot

Verify:

-> iwconfig

Expected:

-> wlan0

-> wlan1

Enable SSH

-> sudo systemctl enable ssh
-> sudo systemctl start ssh

Check IP:

-> hostname -I

Configure NetworkManager to Ignore wlan1

Edit:

-> sudo nano /etc/NetworkManager/NetworkManager.conf

Add:

"
[keyfile]
unmanaged-devices=interface-name:wlan1
"

Restart:

-> sudo systemctl restart NetworkManager

---

# Access Point Configuration

hostapd Configuration

Create file:

-> sudo nano /etc/hostapd/hostapd.conf

Example WPA2 configuration:

"
interface=wlan1
driver=nl80211
ssid=Lab_Test_AP
hw_mode=g
channel=6
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=labpassword123
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
"

dnsmasq Configuration

Edit:

-> sudo nano /etc/dnsmasq.conf

Replace content with:

"
interface=wlan1
bind-interfaces
dhcp-range=192.168.4.2,192.168.4.100,255.255.255.0,24h
dhcp-option=3,192.168.4.1
dhcp-option=6,8.8.8.8
except-interface=wlan0
except-interface=eth0
"

Assign IP to wlan1

-> sudo ip addr flush dev wlan1
-> sudo ip addr add 192.168.4.1/24 dev wlan1
-> sudo ip link set wlan1 up

Enable IP Forwarding

-> sudo sysctl -w net.ipv4.ip_forward=1

To make permanent:

-> sudo nano /etc/sysctl.conf

Uncomment:

"
net.ipv4.ip_forward=1
"

Configure NAT

-> sudo iptables -t nat -F
-> sudo iptables -F FORWARD
-> sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
-> sudo iptables -A FORWARD -i wlan1 -o wlan0 -j ACCEPT
-> sudo iptables -A FORWARD -i wlan0 -o wlan1 -m state --state RELATED,ESTABLISHED -j ACCEPT

Start Services Manually

Terminal 1:

-> sudo dnsmasq -C /etc/dnsmasq.conf -d

Terminal 2:

-> sudo hostapd /etc/hostapd/hostapd.conf

---

# traffic-monitoring

Start Bettercap

-> sudo bettercap -iface wlan1

Inside bettercap:

-> net.show
-> net.sniff on

Alternative Tools

Capture packets:

-> sudo tcpdump -i wlan1

View raw HTTP traffic:

-> sudo tcpdump -i wlan1 -A

Stop monitoring with:

-> quit

⚠️ Only monitor traffic in authorized lab environments.

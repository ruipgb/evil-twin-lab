# Wireless Security Concepts

## WPA2

WPA2 uses a 4-way handshake to establish secure communication
between client and access point.

Strong passwords prevent dictionary-based attacks.

---

## Deauthentication

Deauthentication frames are management frames that can disconnect clients.
Modern networks use Protected Management Frames (802.11w) to mitigate this.

---

## Rogue Access Points

A rogue access point mimics a legitimate network.
Detection methods:

- Monitor for duplicate SSIDs
- Check BSSID inconsistencies
- Use wireless intrusion detection systems (WIDS)

---

## Defensive Best Practices

- Use WPA3 where possible
- Enable PMF
- Use long passphrases (16+ chars)
- Monitor for unknown APs

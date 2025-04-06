# Networking Basics

## Introduction
Networking is a fundamental concept in computing that enables communication between devices. Understanding networking basics is crucial for system administrators, developers, and IT professionals.

## Types of Networks
- **LAN (Local Area Network)**: A network confined to a small geographical area, such as an office or home.
- **WAN (Wide Area Network)**: A network that spans large geographical areas, such as the Internet.
- **MAN (Metropolitan Area Network)**: Covers a city or large campus.
- **PAN (Personal Area Network)**: Connects personal devices within a short range (e.g., Bluetooth).

## Networking Components
- **Router**: Connects different networks and directs traffic.
- **Switch**: Connects devices within a network and manages data flow.
- **Modem**: Converts digital signals to analog for transmission over telephone lines.
- **Firewall**: Protects a network from unauthorized access.

## Network Protocols
- **TCP/IP (Transmission Control Protocol/Internet Protocol)**: Foundation of Internet communication.
- **HTTP/HTTPS (Hypertext Transfer Protocol)**: Used for web browsing.
- **FTP (File Transfer Protocol)**: Transfers files between computers.
- **SSH (Secure Shell)**: Secure remote login.
- **DNS (Domain Name System)**: Resolves domain names to IP addresses.
- **DHCP (Dynamic Host Configuration Protocol)**: Assigns IP addresses dynamically.

## Checking Network Configuration
### View IP Address
```bash
ip a  # Show IP addresses
ifconfig  # Alternative command (deprecated in some distributions)
```

### Check Network Connectivity
```bash
ping google.com  # Check if a host is reachable
traceroute google.com  # Trace the route packets take to a destination
```

### Display Active Network Connections
```bash
netstat -tulnp  # Show listening ports and services
ss -tulnp  # Alternative for netstat
```

## Configuring Network Interfaces
### Assigning a Static IP (Linux)
Edit the network configuration file:
```bash
sudo nano /etc/network/interfaces  # Debian-based systems
sudo nano /etc/sysconfig/network-scripts/ifcfg-eth0  # RHEL-based systems
```
Restart networking services:
```bash
sudo systemctl restart networking
```

## Conclusion
Understanding networking basics is essential for managing and troubleshooting network issues effectively. Learning common commands and network protocols will enhance your ability to diagnose and configure network settings.


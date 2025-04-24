# Linux Firewall Configuration

## Introduction

A firewall acts as a security guard for your Linux system. It monitors incoming and outgoing traffic and allows or blocks traffic based on defined security rules.

In this tutorial, we'll cover:

- What is a firewall?
- Introduction to UFW (Uncomplicated Firewall)
- Managing iptables Rules
- Using firewalld
- Common Firewall Best Practices

---

## What is a Firewall?

A firewall is a system that controls network traffic based on security rules. It protects servers from unauthorized access while allowing legitimate communication.

In Linux, popular firewall tools are:

- **UFW** — Simple interface for firewall management.
- **iptables** — Powerful rule-based firewall.
- **firewalld** — Dynamic firewall manager using zones.

---

## Introduction to UFW (Uncomplicated Firewall)

**UFW** is the default firewall configuration tool for Ubuntu and other Debian-based distributions.

### Installing UFW

```bash
sudo apt update
sudo apt install ufw
```

### Enabling UFW

```bash
sudo ufw enable
```

### Basic UFW Commands

| Command                        | Description                          |
|---------------------------------|--------------------------------------|
| `sudo ufw status`               | Check firewall status               |
| `sudo ufw allow 22`             | Allow SSH (port 22)                  |
| `sudo ufw deny 80`              | Block HTTP (port 80)                 |
| `sudo ufw allow from 192.168.1.10` | Allow a specific IP                 |
| `sudo ufw disable`              | Disable UFW                         |

---

## Managing iptables Rules

**iptables** is a powerful but complex firewall utility used for packet filtering and NAT.

### Installing iptables

```bash
sudo apt install iptables
```

### Basic iptables Commands

| Command                                              | Description                          |
|------------------------------------------------------|--------------------------------------|
| `sudo iptables -L`                                   | List all current rules               |
| `sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT`  | Allow SSH                            |
| `sudo iptables -A INPUT -j DROP`                     | Drop all other incoming traffic      |
| `sudo iptables-save > /etc/iptables/rules.v4`         | Save rules permanently               |

> **Tip:** Always save iptables rules before reboot; otherwise, they will reset.

---

## Using firewalld

**firewalld** provides a dynamic firewall with support for network/firewall zones.

### Installing firewalld

```bash
sudo apt install firewalld
```

### Basic firewalld Commands

| Command                                             | Description                        |
|-----------------------------------------------------|------------------------------------|
| `sudo systemctl start firewalld`                    | Start firewalld service            |
| `sudo firewall-cmd --state`                         | Check firewalld status             |
| `sudo firewall-cmd --zone=public --add-port=80/tcp --permanent` | Open HTTP port 80  |
| `sudo firewall-cmd --reload`                        | Apply changes                     |

---

## Common Firewall Best Practices

- Always allow SSH (port 22) to prevent locking yourself out.
- Only open necessary ports (e.g., 80 for HTTP, 443 for HTTPS).
- Regularly review and update firewall rules.
- Enable logging to monitor suspicious activities.

---

## Conclusion

Mastering firewall configuration is a must for every Linux system administrator. Start with UFW for simple setups, move to iptables/firewalld for complex environments.

> **Pro Tip:** Practice setting up a web server with UFW rules enabled to allow only ports 22 (SSH) and 80 (HTTP).

---

## Quick Quiz

1. How do you allow traffic on port 443 using UFW?
2. What command saves iptables rules permanently?
3. Name two firewalls commonly used in Linux.

---

## Interview Questions

- What is the difference between UFW and iptables?
- How would you block all incoming traffic except SSH and HTTP?
- How do zones work in firewalld?

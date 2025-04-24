# SSH Hardening in Linux

## Introduction

SSH (Secure Shell) is a key protocol for remote access to Linux servers. By default, SSH is secure, but you should always **harden** it to prevent unauthorized access.

In this tutorial, we'll cover:

- Basic SSH Hardening Steps
- Disabling Root Login
- Changing the Default SSH Port
- Setting Up Key-Based Authentication
- Using Fail2Ban for SSH Protection
- Bonus Best Practices

---

## Basic SSH Hardening Steps

SSH configuration file location:

```bash
/etc/ssh/sshd_config
```

After making changes, **restart SSH**:

```bash
sudo systemctl restart sshd
```

Always **keep a second session open** when testing new SSH configs, to avoid locking yourself out!

---

## Disabling Root Login

Prevent attackers from directly logging in as root.

Edit `/etc/ssh/sshd_config`:

```bash
PermitRootLogin no
```

Save and restart SSH:

```bash
sudo systemctl restart sshd
```

Now users must login as a normal user and then switch (`sudo -i`) to root.

---

## Changing the Default SSH Port

Bots constantly scan default port **22**. Changing the port can reduce random attacks.

Edit `/etc/ssh/sshd_config`:

```bash
Port 2222
```

Restart SSH:

```bash
sudo systemctl restart sshd
```

> **Note:** Make sure to update your firewall rules to allow the new port!

Example for UFW:

```bash
sudo ufw allow 2222/tcp
```

---

## Setting Up Key-Based Authentication

Passwords are vulnerable to brute-force attacks. Use SSH keys instead.

### Step 1: Generate SSH Key

On your client machine:

```bash
ssh-keygen -t rsa -b 4096
```

### Step 2: Copy Public Key to Server

```bash
ssh-copy-id username@server_ip
```

OR manually:

```bash
scp ~/.ssh/id_rsa.pub username@server_ip:~/
```
Then on server:

```bash
cat ~/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

### Step 3: Disable Password Authentication

Edit `/etc/ssh/sshd_config`:

```bash
PasswordAuthentication no
```

Restart SSH:

```bash
sudo systemctl restart sshd
```

Now only key holders can connect.

---

## Using Fail2Ban for SSH Protection

**Fail2Ban** automatically blocks IPs that show malicious signs (like too many failed login attempts).

Install Fail2Ban:

```bash
sudo apt install fail2ban
```

Start and enable:

```bash
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
```

Configure jail:

```bash
sudo nano /etc/fail2ban/jail.local
```

Example to protect SSH:

```ini
[sshd]
enabled = true
port = 2222
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
```

Restart Fail2Ban:

```bash
sudo systemctl restart fail2ban
```

---

## Bonus Best Practices

- Use a strong passphrase for your SSH keys.
- Limit users who can SSH into the server (`AllowUsers username`).
- Enable Two-Factor Authentication (2FA) for SSH.
- Regularly check SSH login logs:
  
```bash
sudo cat /var/log/auth.log | grep sshd
```

---

## Conclusion

SSH is powerful but needs hardening for production servers. Disabling password authentication and enabling key-based login should be your **first priority**.

> **Pro Tip:** Always test SSH configuration changes on a different session or console!

---

## Quick Quiz

1. What does `PermitRootLogin no` do?
2. Why should you change the default SSH port?
3. How can you block brute-force SSH attacks automatically?

---

## Interview Questions

- How does SSH key authentication work?
- How would you lock down SSH on a public server?
- What is the role of Fail2Ban in server security?


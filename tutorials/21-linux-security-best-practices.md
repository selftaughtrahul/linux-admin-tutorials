# Linux Security Best Practices

## Introduction

Linux systems are generally secure, but proper configuration and continuous monitoring are critical to maintain that security.  
This guide will cover:

- Hardening Linux Systems
- User Management
- File System Security
- Network Security
- Monitoring and Auditing
- Interview Questions

---

## Hardening Linux Systems

- **Keep Systems Updated**: Regularly patch and update your Linux system.

```bash
# On Debian/Ubuntu
sudo apt update && sudo apt upgrade

# On RHEL/CentOS
sudo yum update
```

- **Minimize Installed Packages**: Install only necessary software.
- **Use Secure Boot Settings**: Disable booting from external devices.

---

## User Management

- **Create Users with Least Privilege**:

```bash
# Add user
sudo adduser username

# Add user to specific group
sudo usermod -aG groupname username
```

- **Use `sudo` Instead of Root**: Give users limited root access using `sudo`.

- **Lock Inactive Accounts**:

```bash
sudo usermod --expiredate 1 username
```

- **Strong Password Policies**: Enforce strong passwords using `pam_pwquality`.

---

## File System Security

- **Set Correct File Permissions**:

```bash
chmod 644 filename    # Owner read/write, group and others read
chmod 600 filename    # Owner read/write, no access for others
```

- **Use `chattr` to Protect Important Files**:

```bash
sudo chattr +i /etc/passwd
```
(Immutable flag prevents modifications.)

- **Mount Sensitive Filesystems with `noexec`, `nodev`, and `nosuid`**.

Example `/etc/fstab` entry:

```
/tmp    ext4    defaults,nosuid,nodev,noexec    0 0
```

---

## Network Security

- **Use Firewalls (iptables, ufw, firewalld)**:

```bash
sudo ufw enable
sudo ufw allow ssh
sudo ufw status
```

- **Disable Unused Services**:

```bash
sudo systemctl disable service_name
```

- **Use SSH Key Authentication** (Disable password-based login):

```bash
# /etc/ssh/sshd_config
PasswordAuthentication no
```

- **Change SSH Port**: Avoid using default port 22.

---

## Monitoring and Auditing

- **Log Monitoring**:

```bash
sudo tail -f /var/log/auth.log
```

- **Use Auditd** for advanced auditing:

```bash
sudo apt install auditd
sudo systemctl start auditd
```

- **Intrusion Detection**: Use tools like **AIDE**, **Tripwire**.

- **Security Scanning Tools**: 
  - Lynis
  - OpenSCAP
  - Nessus

- **Fail2ban**: Protect against brute-force attacks.

```bash
sudo apt install fail2ban
sudo systemctl start fail2ban
```

---

## Best Practices Summary

| Area                | Best Practice |
|---------------------|---------------|
| Updates             | Regularly patch and update |
| User Management     | Principle of Least Privilege |
| File Security       | Correct permissions, immutable files |
| Network Security    | Firewall rules, disable unused services |
| Monitoring          | Continuous log monitoring and auditing |
| SSH Security        | Use key authentication, change default port |

---

## Interview Questions

- How do you secure a Linux server immediately after installation?
- What are `iptables` and `ufw`?
- How would you detect unauthorized access?
- What tools do you use for Linux auditing and monitoring?
- How do you secure SSH access?
- What is `/etc/shadow` and how is it different from `/etc/passwd`?

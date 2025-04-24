# SELinux and AppArmor in Linux

## Introduction

**SELinux** (Security-Enhanced Linux) and **AppArmor** are **Mandatory Access Control (MAC)** systems that add an extra layer of security on top of traditional Linux permissions.

They **restrict what programs can do**, even if the program is compromised.

In this tutorial, we'll cover:

- What is SELinux?
- What is AppArmor?
- SELinux Basics
- AppArmor Basics
- Key Differences
- When to Use Which
- Bonus: Troubleshooting Tips

---

## What is SELinux?

- Developed by the NSA (U.S. National Security Agency).
- Uses **policies** to define what processes can access.
- Works with **contexts** (labels) assigned to files, processes, and ports.
- Very strict and granular control.

SELinux modes:

| Mode    | Description                       |
|---------|-----------------------------------|
| Enforcing | Actively enforces policies        |
| Permissive | Logs violations but does not block |
| Disabled | Turns off SELinux completely       |

Check SELinux status:

```bash
sestatus
```

OR

```bash
getenforce
```

---

## What is AppArmor?

- Developed by SUSE and now used in Ubuntu and Debian.
- Easier to configure than SELinux.
- Works with **profiles** that define what programs can access.
- Paths are used instead of labels.

AppArmor modes:

| Mode    | Description                       |
|---------|-----------------------------------|
| Enforce  | Enforces profiles strictly        |
| Complain | Logs violations without enforcing |
| Disabled | Turns off AppArmor completely     |

Check AppArmor status:

```bash
sudo apparmor_status
```

---

## SELinux Basics

### Enable SELinux

Edit `/etc/selinux/config`:

```bash
SELINUX=enforcing
```

Reboot the system to apply.

### Manage SELinux Policies

View current contexts:

```bash
ls -Z
```

Change file context:

```bash
chcon -t httpd_sys_content_t /var/www/html/index.html
```

Restore default context:

```bash
restorecon -v /path/to/file
```

Allow a service:

```bash
sudo setsebool -P httpd_can_network_connect 1
```

---

## AppArmor Basics

### Enable AppArmor

Install AppArmor if missing:

```bash
sudo apt install apparmor apparmor-utils
```

Enable AppArmor:

```bash
sudo systemctl enable apparmor
sudo systemctl start apparmor
```

### Manage AppArmor Profiles

List profiles:

```bash
sudo aa-status
```

Put a profile in complain mode:

```bash
sudo aa-complain /usr/sbin/apache2
```

Put a profile in enforce mode:

```bash
sudo aa-enforce /usr/sbin/apache2
```

Create or edit profiles:

```bash
sudo aa-genprof /path/to/program
```

---

## Key Differences Between SELinux and AppArmor

| Feature          | SELinux                         | AppArmor                      |
|------------------|----------------------------------|--------------------------------|
| Control Method   | Labels (context-based)           | File paths (profile-based)     |
| Complexity       | High (steep learning curve)       | Lower (easier to configure)    |
| Flexibility      | Very granular control            | Moderate control               |
| Popular Distros  | Red Hat, CentOS, Fedora          | Ubuntu, Debian, SUSE           |

---

## When to Use Which?

| Situation                     | Use SELinux             | Use AppArmor           |
|--------------------------------|-------------------------|------------------------|
| Need very strict security     | ✅                       |                        |
| Simpler setup required        |                         | ✅                     |
| Running Red Hat-based distro  | ✅                       |                        |
| Running Ubuntu/Debian         |                         | ✅                     |

**Pro Tip:**  
- **Enterprise servers:** Prefer SELinux for max security.
- **Personal laptops/desktops:** AppArmor is usually enough.

---

## Troubleshooting Tips

- **If a service isn't working**, check if SELinux or AppArmor is blocking it.
- **View SELinux logs:**

```bash
sudo cat /var/log/audit/audit.log | grep denied
```

- **View AppArmor logs:**

```bash
sudo dmesg | grep apparmor
```

- **Temporarily set SELinux to Permissive:**

```bash
sudo setenforce 0
```

(But fix the policy properly later.)

---

## Conclusion

Both SELinux and AppArmor are critical for securing Linux systems beyond traditional permissions.  
Choosing the right one depends on your **distro**, **expertise**, and **security needs**.

> **Golden Rule:** Never fully disable them on production servers!

---

## Quick Quiz

1. What is the difference between enforcing and permissive modes in SELinux?
2. How does AppArmor identify which program to restrict?
3. Which MAC system is default in Ubuntu?

---

## Interview Questions

- Explain the concept of MAC (Mandatory Access Control).
- How would you troubleshoot a service being blocked by SELinux?
- Can SELinux and AppArmor run together on the same system?


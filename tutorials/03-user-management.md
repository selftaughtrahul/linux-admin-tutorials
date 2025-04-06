# User Management in Linux

## Introduction
User management in Linux is essential for maintaining system security and ensuring proper access control. Linux allows multiple users to operate simultaneously while managing their access rights and permissions.

## User Types
- **Root User**: The superuser with full system privileges.
- **Regular Users**: Standard users with restricted access.
- **System Users**: Used for running system processes and services.

## User Management Commands
```bash
# Add a new user
sudo useradd username

# Set a password for a user
sudo passwd username

# Delete a user
sudo userdel username

# Modify an existing user
sudo usermod -aG groupname username
```

## Group Management
- **Primary Group**: The default group assigned to a user.
- **Supplementary Groups**: Additional groups that provide extra permissions.

### Group Commands
```bash
# Create a new group
sudo groupadd groupname

# Add a user to a group
sudo usermod -aG groupname username

# Remove a user from a group
sudo gpasswd -d username groupname

# Delete a group
sudo groupdel groupname
```

## Viewing User Information
```bash
# List all users
cat /etc/passwd

# List all groups
cat /etc/group

# Check user details
id username

# Show currently logged-in users
who
```

## File Permissions and Ownership
Linux uses a permission system to control access to files and directories.

### Changing Ownership
```bash
# Change file owner
sudo chown username filename

# Change group ownership
sudo chgrp groupname filename
```

### Changing Permissions
```bash
# Set read, write, execute permissions
chmod 755 filename
```


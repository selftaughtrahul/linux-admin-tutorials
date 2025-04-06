# Permissions and Ownership in Linux

## Introduction
Linux uses a robust permission system to control access to files and directories. Understanding permissions and ownership is crucial for system security and proper user management.

## File Permissions
Each file and directory in Linux has three permission sets:
- **Owner (User)**: The user who owns the file.
- **Group**: The group assigned to the file.
- **Others**: All other users.

### Permission Types
- **r (read)**: Allows viewing file contents.
- **w (write)**: Allows modifying the file.
- **x (execute)**: Allows executing a file or accessing a directory.

### Viewing Permissions
Use the `ls -l` command to view permissions:
```bash
ls -l filename
```
Example output:
```
-rwxr-xr--  1 user group  1234 Feb  1 12:34 file.txt
```
- `rwx` (Owner) → Read, write, execute
- `r-x` (Group) → Read, execute
- `r--` (Others) → Read only

## Changing Permissions
Use the `chmod` command to modify permissions.

### Symbolic Method
```bash
chmod u+x file.txt  # Add execute for owner
chmod g-w file.txt  # Remove write for group
chmod o+r file.txt  # Add read for others
```

### Numeric Method
Each permission is assigned a number:
- `r = 4`
- `w = 2`
- `x = 1`

Combine values to set permissions:
```bash
chmod 755 file.txt  # rwx for owner, r-x for group, r-x for others
chmod 644 file.txt  # rw- for owner, r-- for group and others
```

## File Ownership
Each file has an owner and a group. Use the `chown` and `chgrp` commands to change ownership.

### Changing Owner
```bash
sudo chown newuser file.txt
```

### Changing Group
```bash
sudo chgrp newgroup file.txt
```

### Changing Owner and Group Together
```bash
sudo chown newuser:newgroup file.txt
```

## Special Permissions
- **Setuid (s)**: Execute file as the owner.
- **Setgid (s)**: Execute file with group permissions.
- **Sticky Bit (t)**: Prevent deletion by non-owners in directories.

Example:
```bash
chmod u+s script.sh  # Setuid
chmod g+s shared_dir  # Setgid
chmod +t /tmp        # Sticky bit
```


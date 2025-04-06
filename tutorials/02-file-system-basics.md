# File System Basics

## What is a File System?
A file system is a method used by operating systems to store, retrieve, and organize files on a storage device such as a hard drive or SSD.

## Types of File Systems
- **ext4** - Default file system for most Linux distributions.
- **NTFS** - Used by Windows operating systems.
- **FAT32** - Common on USB drives and older systems.
- **XFS** - High-performance journaling file system.
- **Btrfs** - Advanced file system with snapshot capabilities.

## Linux File System Hierarchy
The Linux file system follows a hierarchical structure:

```
/
├── bin    # Essential command binaries
├── boot   # Boot loader files
├── dev    # Device files
├── etc    # System configuration files
├── home   # User home directories
├── lib    # Shared libraries
├── mnt    # Mounted file systems
├── opt    # Optional application software
├── root   # Home directory for root user
├── tmp    # Temporary files
├── usr    # User binaries and applications
└── var    # Variable data (logs, cache)
```

## Basic File System Commands
```bash
ls       # List directory contents
pwd      # Print working directory
cd       # Change directory
mkdir    # Create a new directory
touch    # Create a new file
rm       # Remove files or directories
cp       # Copy files or directories
mv       # Move or rename files
find     # Search for files in a directory
```


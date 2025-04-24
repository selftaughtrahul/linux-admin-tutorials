# High Availability (HA) Clustering on Linux

## Introduction

High Availability (HA) Clustering ensures that services remain available even if one server fails.  
This guide covers:

- What is High Availability?
- Key Concepts in HA Clustering
- Popular HA Cluster Software
- Setting up a Basic HA Cluster
- Common HA Cluster Configurations
- Testing Failover
- Interview Questions

---

## What is High Availability?

High Availability means the system is continuously operational for a desired length of time.  
It minimizes downtime by using multiple servers (nodes) that can automatically replace each other in case of failure.

---

## Key Concepts in HA Clustering

| Term           | Description |
|----------------|-------------|
| Node           | A server in the cluster. |
| Cluster        | Group of nodes working together. |
| Resource       | Services like IP addresses, web servers, or databases managed by the cluster. |
| Failover       | Automatic switching to a standby node if the active one fails. |
| Fencing        | Isolating or powering off a failed node to protect shared resources. |
| Quorum         | A mechanism to prevent "split brain" by ensuring a majority of nodes agree on the cluster state. |

---

## Popular HA Cluster Software

| Software | Description |
|----------|-------------|
| Pacemaker | Cluster resource manager for Linux HA setups. |
| Corosync  | Provides messaging and membership services for Pacemaker. |
| Keepalived | Provides simple load balancing and HA using VRRP. |
| DRBD      | Distributed Replicated Block Device, mirrors storage between servers. |

---

## Setting up a Basic HA Cluster

Example: Setting up a 2-node cluster using Pacemaker and Corosync.

### 1. Install Packages

**On both nodes:**

```bash
sudo apt update
sudo apt install pacemaker corosync pcs
```

Enable services:

```bash
sudo systemctl enable pcsd
sudo systemctl start pcsd
```

Set password for `hacluster` user:

```bash
sudo passwd hacluster
```

Authenticate nodes:

```bash
pcs cluster auth node1 node2
```

Create the cluster:

```bash
pcs cluster setup --name mycluster node1 node2
```

Start the cluster:

```bash
pcs cluster start --all
```

Enable at boot:

```bash
pcs cluster enable --all
```

---

## Common HA Cluster Configurations

| Configuration | Description |
|---------------|-------------|
| Active-Passive | One active node, one standby node. |
| Active-Active  | Both nodes active; load sharing services. |
| Load Balancing | Distributing traffic among nodes. |
| Storage Clustering | Shared or replicated storage across nodes. |

---

## Example: Add a Virtual IP Resource

```bash
pcs resource create virtual-ip ocf:heartbeat:IPaddr2 ip=192.168.1.100 cidr_netmask=24 op monitor interval=30s
```

Check cluster status:

```bash
pcs status
```

---

## Testing Failover

1. Manually stop a node:

```bash
sudo systemctl stop corosync
```

2. Verify that services move to the second node automatically:

```bash
pcs status
```

3. Start the stopped node:

```bash
sudo systemctl start corosync
```

4. Services can optionally move back.

---

## Tips for a Healthy Cluster

- Always configure fencing devices.
- Use quorum devices for even number of nodes.
- Monitor logs `/var/log/pacemaker.log` and `/var/log/corosync/corosync.log`.
- Regularly test failover scenarios.

---

## Interview Questions

- What is the difference between Active-Active and Active-Passive clustering?
- What is fencing and why is it important in HA clusters?
- How does Pacemaker handle resource monitoring and failover?
- What causes a split-brain scenario, and how do you prevent it?

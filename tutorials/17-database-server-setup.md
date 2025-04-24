# Database Server Setup on Linux

## Introduction

A database server stores and manages data for applications and websites.  
This guide covers:

- Popular Database Servers
- Installing a Database Server
- Basic Database Configuration
- Creating a Database and User
- Securing the Database Server
- Managing the Database Service
- Basic Troubleshooting

---

## Popular Database Servers

| Database | Description |
|----------|-------------|
| MySQL    | Widely used relational database, easy to use. |
| MariaDB  | Fork of MySQL, fully open-source. |
| PostgreSQL | Advanced open-source relational database. |
| MongoDB  | NoSQL database for modern applications. |

---

## Installing a Database Server

### 1. Install MySQL

**On Ubuntu/Debian:**

```bash
sudo apt update
sudo apt install mysql-server
```

**On CentOS/RHEL:**

```bash
sudo yum install mysql-server
```

Start MySQL service:

```bash
sudo systemctl start mysql
sudo systemctl enable mysql
```

### 2. Install PostgreSQL

**On Ubuntu/Debian:**

```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
```

**On CentOS/RHEL:**

```bash
sudo yum install postgresql-server postgresql-contrib
```

Initialize database:

```bash
sudo postgresql-setup initdb
```

Start service:

```bash
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

---

## Basic Database Configuration

- **MySQL Config File:** `/etc/mysql/my.cnf`
- **PostgreSQL Config File:** `/etc/postgresql/<version>/main/postgresql.conf`

Common settings to configure:
- Port (default MySQL 3306, PostgreSQL 5432)
- Authentication method
- Data directory location

---

## Creating a Database and User

### MySQL

1. Log in to MySQL shell:

```bash
sudo mysql
```

2. Create a database and user:

```sql
CREATE DATABASE mydb;
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';
GRANT ALL PRIVILEGES ON mydb.* TO 'myuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

### PostgreSQL

1. Switch to `postgres` user:

```bash
sudo -i -u postgres
```

2. Create database and user:

```bash
createdb mydb
createuser myuser
psql
ALTER USER myuser WITH ENCRYPTED PASSWORD 'mypassword';
GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;
\q
```

---

## Securing the Database Server

- **MySQL Secure Installation:**

```bash
sudo mysql_secure_installation
```

Steps include:
- Set root password
- Remove anonymous users
- Disallow root remote login
- Remove test database
- Reload privilege tables

- **PostgreSQL Secure Access:**
  - Edit `pg_hba.conf` to allow only trusted IPs.
  - Disable remote root login.

**Example: Allow only local connections**

```conf
# /etc/postgresql/<version>/main/pg_hba.conf
host    all             all             127.0.0.1/32            md5
```

Reload configuration:

```bash
sudo systemctl reload postgresql
```

---

## Managing the Database Service

| Command | MySQL | PostgreSQL |
|---------|-------|------------|
| Start   | `sudo systemctl start mysql` | `sudo systemctl start postgresql` |
| Stop    | `sudo systemctl stop mysql`  | `sudo systemctl stop postgresql`  |
| Restart | `sudo systemctl restart mysql` | `sudo systemctl restart postgresql` |
| Enable (Auto-Start) | `sudo systemctl enable mysql` | `sudo systemctl enable postgresql` |

---

## Basic Troubleshooting

- **Check service status:**

```bash
sudo systemctl status mysql
sudo systemctl status postgresql
```

- **View logs:**

| Database | Log Location |
|----------|--------------|
| MySQL    | `/var/log/mysql/error.log` |
| PostgreSQL | `/var/log/postgresql/postgresql-*.log` |

- **Check port is listening:**

```bash
sudo netstat -tuln | grep 3306  # MySQL
sudo netstat -tuln | grep 5432  # PostgreSQL
```

- **Login to DB manually to test:**

```bash
sudo mysql -u root -p
```
```bash
psql -U postgres
```

---

## Bonus Tip: Allow Remote Connections

- **MySQL:**

Edit `/etc/mysql/mysql.conf.d/mysqld.cnf`:

```ini
bind-address = 0.0.0.0
```

Restart MySQL:

```bash
sudo systemctl restart mysql
```

- **PostgreSQL:**

Edit `/etc/postgresql/<version>/main/postgresql.conf`:

```conf
listen_addresses = '*'
```

Edit `/etc/postgresql/<version>/main/pg_hba.conf` to allow specific IPs.

Restart PostgreSQL:

```bash
sudo systemctl restart postgresql
```

---

## Quick Quiz

1. Which command installs MySQL on Ubuntu?
2. How do you create a new database in PostgreSQL?
3. What command runs MySQL secure installation?

---

## Interview Questions

- What is the difference between MySQL and PostgreSQL?
- How do you secure a database server?
- How can you allow remote connections securely to a database?

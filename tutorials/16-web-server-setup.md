# Web Server Setup on Linux

## Introduction

A web server hosts websites and delivers web pages to clients (browsers) over HTTP/HTTPS.  
This guide covers:

- Popular Web Servers
- Installing a Web Server
- Basic Web Server Configuration
- Serving a Website
- Managing Web Server Service
- Securing the Web Server
- Basic Troubleshooting

---

## Popular Web Servers

| Web Server | Description |
|------------|-------------|
| Apache (`httpd`) | Most widely used, highly configurable web server. |
| Nginx | Lightweight, high-performance web server and reverse proxy. |
| Lighttpd | Optimized for speed-critical environments. |
| Caddy | Automatic HTTPS, simple configuration. |

---

## Installing a Web Server

### 1. Install Apache

**On Ubuntu/Debian:**

```bash
sudo apt update
sudo apt install apache2
```

**On CentOS/RHEL:**

```bash
sudo yum install httpd
```

### 2. Install Nginx

**On Ubuntu/Debian:**

```bash
sudo apt update
sudo apt install nginx
```

**On CentOS/RHEL:**

```bash
sudo yum install nginx
```

---

## Basic Web Server Configuration

- **Apache Configuration File:**  
  `/etc/apache2/apache2.conf` or `/etc/httpd/conf/httpd.conf`
  
- **Nginx Configuration File:**  
  `/etc/nginx/nginx.conf`

- **Document Root (Default Web Directory):**

| Web Server | Path |
|------------|------|
| Apache     | `/var/www/html` |
| Nginx      | `/usr/share/nginx/html` |

You can modify configuration files to change ports, domains, security settings, etc.

---

## Serving a Simple Website

### 1. Create an HTML Page

```bash
sudo nano /var/www/html/index.html
```

Example content:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h1>My First Web Page on Linux!</h1>
</body>
</html>
```

Save and exit.

### 2. Restart the Web Server

**Apache:**

```bash
sudo systemctl restart apache2
```

**Nginx:**

```bash
sudo systemctl restart nginx
```

Now visit `http://your_server_ip/` in your browser.

---

## Managing Web Server Service

| Command | Apache | Nginx |
|---------|--------|-------|
| Start   | `sudo systemctl start apache2` | `sudo systemctl start nginx` |
| Stop    | `sudo systemctl stop apache2`  | `sudo systemctl stop nginx`  |
| Restart | `sudo systemctl restart apache2` | `sudo systemctl restart nginx` |
| Enable (Auto-Start) | `sudo systemctl enable apache2` | `sudo systemctl enable nginx` |

---

## Securing the Web Server

- **Allow HTTP and HTTPS through Firewall:**

**UFW (Ubuntu):**

```bash
sudo ufw allow 'Apache Full'
sudo ufw allow 'Nginx Full'
sudo ufw reload
```

- **Enable HTTPS with SSL/TLS:**

Use **Let's Encrypt** to get free SSL certificates.

Install `certbot`:

```bash
sudo apt install certbot python3-certbot-apache
# or
sudo apt install certbot python3-certbot-nginx
```

Obtain certificate:

```bash
sudo certbot --apache
# or
sudo certbot --nginx
```

- **Harden Security:**
  - Disable directory listing.
  - Hide server version information.
  - Use strong SSL ciphers.

---

## Basic Troubleshooting

- **Check service status:**

```bash
sudo systemctl status apache2
sudo systemctl status nginx
```

- **Check configuration syntax:**

```bash
sudo apachectl configtest
sudo nginx -t
```

- **View logs:**

| Web Server | Access Logs | Error Logs |
|------------|-------------|------------|
| Apache     | `/var/log/apache2/access.log` | `/var/log/apache2/error.log` |
| Nginx      | `/var/log/nginx/access.log`   | `/var/log/nginx/error.log`   |

- **Restart after changes:**

```bash
sudo systemctl restart apache2
sudo systemctl restart nginx
```

---

## Bonus Tip: Hosting Multiple Websites (Virtual Hosts)

**Apache:**

```bash
sudo nano /etc/apache2/sites-available/mywebsite.conf
```

Example:

```apache
<VirtualHost *:80>
    ServerName mywebsite.com
    DocumentRoot /var/www/mywebsite
</VirtualHost>
```

Enable site:

```bash
sudo a2ensite mywebsite.conf
sudo systemctl reload apache2
```

**Nginx:**

```bash
sudo nano /etc/nginx/sites-available/mywebsite
```

Example:

```nginx
server {
    listen 80;
    server_name mywebsite.com;
    root /var/www/mywebsite;
}
```

Enable site:

```bash
sudo ln -s /etc/nginx/sites-available/mywebsite /etc/nginx/sites-enabled/
sudo systemctl reload nginx
```

---

## Quick Quiz

1. What command is used to install Nginx on Ubuntu?
2. Where is the default document root for Apache?
3. How do you test Nginx configuration syntax?

---

## Interview Questions

- What are the advantages of using Nginx over Apache?
- How would you secure a web server in a production environment?
- How do you host multiple domains on the same server?


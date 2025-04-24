# Docker and Containers

## Introduction

Docker is a platform that uses OS-level virtualization to deliver software in packages called **containers**.  
Containers are lightweight, portable, and ensure consistency across different environments.

This guide covers:

- What is Docker?
- Benefits of Containers
- Basic Docker Concepts
- Installing Docker
- Common Docker Commands
- Docker Compose
- Interview Questions

---

## What is Docker?

Docker is an open-source platform for developing, shipping, and running applications inside isolated environments called **containers**.

Containers include:

- Application code
- Dependencies
- Configuration files

---

## Benefits of Containers

- **Portability**: Run anywhere (local machine, cloud, production).
- **Isolation**: Each container has its own resources and environment.
- **Efficiency**: Use fewer resources than traditional VMs.
- **Scalability**: Easy to scale applications up or down.

---

## Basic Docker Concepts

| Term            | Description |
|-----------------|-------------|
| **Image**       | A lightweight, standalone package with all dependencies. |
| **Container**   | A running instance of an image. |
| **Dockerfile**  | Instructions to build a Docker image. |
| **Docker Hub**  | Public registry for sharing Docker images. |
| **Volume**      | Persistent storage for containers. |
| **Network**     | Communication between containers. |

---

## Installing Docker

### 1. Install on Ubuntu

```bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
```

Verify installation:

```bash
docker --version
```

Enable and start Docker:

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

---

## Common Docker Commands

### 1. Docker Service Commands

| Command                         | Description |
|----------------------------------|-------------|
| `sudo systemctl start docker`    | Start Docker service |
| `sudo systemctl stop docker`     | Stop Docker service |
| `sudo systemctl restart docker`  | Restart Docker service |
| `sudo systemctl status docker`   | Check Docker service status |

### 2. Docker Image Commands

| Command                             | Description |
|-------------------------------------|-------------|
| `docker pull ubuntu`                | Download image from Docker Hub |
| `docker images`                     | List all images |
| `docker rmi image_id`                | Remove an image |

### 3. Docker Container Commands

| Command                                     | Description |
|---------------------------------------------|-------------|
| `docker run hello-world`                    | Run a test container |
| `docker run -it ubuntu`                     | Run Ubuntu container interactively |
| `docker ps`                                 | List running containers |
| `docker ps -a`                              | List all containers |
| `docker stop container_id`                  | Stop a running container |
| `docker rm container_id`                    | Remove a stopped container |
| `docker exec -it container_id bash`          | Access container shell |

---

## Dockerfile Example

```Dockerfile
# Use an official Python runtime
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy local code to container
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Run the application
CMD ["python", "app.py"]
```

Build and run:

```bash
docker build -t my-python-app .
docker run -p 5000:5000 my-python-app
```

---

## Docker Compose

Docker Compose helps you run multi-container applications.

### 1. `docker-compose.yml` Example

```yaml
version: '3'
services:
  web:
    image: nginx
    ports:
      - "80:80"
  db:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
```

Start the containers:

```bash
docker-compose up
```

Stop the containers:

```bash
docker-compose down
```

---

## Interview Questions

- What is Docker and how is it different from a VM?
- What is the difference between an image and a container?
- How can you persist data in Docker?
- What is Docker Compose and why is it used?
- How do you expose a port from a Docker container?
- What happens when you run `docker run`?
- How do you troubleshoot a failing container?


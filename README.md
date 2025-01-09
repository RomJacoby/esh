# README for ESH Web Application

## Project Overview  
This is a containerized web application consisting of a **frontend (React)** and a **backend (Node.js)**, orchestrated using **Docker Compose**. The application showcases a simple "Hello World" page where the message is fetched from the backend API.

---

## Requirements List

- **Docker** (version 20.10+)
- **Docker Compose** (version 1.29+)
- **Node.js** (for local development)
- **Git** (for version control)
- **bash** (for running the `build.sh` script)

---

## Setup Instructions

Follow the steps below to get the application up and running:

1. **Clone the repository**  
   ```bash
   git clone https://github.com/RomJacoby/esh.git
   cd esh
   ```

2. **Run the build script to build Docker images**  
   The `build.sh` script automates the process of building and starting the containers.  
   ```bash
   ./build.sh
   ```

3. **Access the application**  
   - **Frontend**: `http://localhost`  
   - **Backend API**: `http://localhost:8080`

---

## Architecture Decisions Explanation

### 1. Multi-Container Setup
The application is split into two services, each running in its own Docker container:

| **Service**   | **Technology** | **Description**                              |
|---------------|----------------|----------------------------------------------|
| **Frontend**  | React          | Serves the user interface.                  |
| **Backend**   | Node.js        | Provides a simple API that returns a JSON response. |

### 2. Docker and Docker Compose
- **Docker** is used to containerize both the **frontend** and **backend** services.
- **Docker Compose** is used to orchestrate and manage both containers together.

### 3. Build Automation with `build.sh`
The provided **build script** (`build.sh`) automates the process of building images, handling errors, and starting the services using Docker Compose.

---

## 💻 Local Development Guide

To run the application locally without Docker, follow these steps:

### 1. Start the Backend (Node.js)
```bash
cd backend
npm install
npm start
```
The backend will run on **http://localhost:8080**.

### 2. Start the Frontend (React)
```bash
cd frontend
npm install
npm start
```
The frontend will run on **http://localhost:80**.

### 3. Update the Frontend API URL
Ensure that the **API URL** in the frontend is pointing to the correct backend endpoint. Modify the `frontend/src/index.js` file:

```javascript
const apiUrl = "http://localhost:8080";
```

---

## Troubleshooting Section

Here are some common issues and their solutions:

### 1. Docker: "Permission Denied" When Running `build.sh`
**Cause:** The script doesn’t have executable permissions.  
**Solution:**  
```bash
chmod +x build.sh
./build.sh
```

### 2. Docker Compose: "Port Already in Use" Error
**Cause:** The ports `8080` or `80` are already being used by another process.  
**Solution:**  
- Stop and terminate running services are using these ports.  
- Or change the ports in the `docker-compose.yml` file and in the frontend & backend configurations.

### 3. Frontend: "Failed to Fetch" Error
**Cause:** The frontend is unable to reach the backend.  
**Solution:**  
- Ensure both containers are running.  
- Check that the backend is accessible at **http://localhost:8080**.

---

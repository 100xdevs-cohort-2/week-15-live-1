# Server

A containerized Node.js + TypeScript backend using Prisma and PostgreSQL.

## 🐳 Run Using Docker

The easiest way to run this server locally is using the pre-built Docker image available on Docker Hub.

### Prerequisites

Make sure you have:

- [Docker](https://www.docker.com/) installed and running
- A PostgreSQL database
- A PostgreSQL connection string

You **do not need Node.js, npm, or Prisma installed locally** to run the Docker image.

---

## 1. Pull the Docker Image

Pull the latest version from Docker Hub:

```bash
docker pull harsh012/server:latest
```

---

## 2. Set Up the Database

This server uses PostgreSQL through Prisma.

You need a PostgreSQL database and its connection URL.

The connection string should look like:

```text
postgresql://USERNAME:PASSWORD@HOST:PORT/DATABASE
```

For example:

```text
postgresql://postgres:password@localhost:5432/mydatabase
```

> Make sure your PostgreSQL server is running before starting the application.

---

## 3. Run the Container

Run the server using:

```bash
docker run -d \
  --name server \
  -p 3000:3000 \
  -e DATABASE_URL="YOUR_DATABASE_URL" \
  harsh012/server:latest
```

Replace:

```text
YOUR_DATABASE_URL
```

with your actual PostgreSQL connection string.

For example:

```powershell
docker run -d `
  --name server `
  -p 3000:3000 `
  -e DATABASE_URL="postgresql://postgres:password@host.docker.internal:5432/mydatabase" `
  harsh012/server:latest
```

`host.docker.internal` allows the container to access a PostgreSQL server running on the host machine on Docker Desktop.

---

## 4. Check if the Container is Running

Run:

```bash
docker ps
```

You should see something similar to:

```text
CONTAINER ID   IMAGE                    PORTS
xxxxxxxx       harsh012/server:latest  0.0.0.0:3000->3000/tcp
```

---

## 5. Check Server Logs

To view the application logs:

```bash
docker logs server
```

To continuously follow the logs:

```bash
docker logs -f server
```

Press:

```text
Ctrl + C
```

to stop viewing the logs.

---

## 6. Access the Server

Once the container is running, the server is available at:

```text
http://localhost:3000
```

You can test your API using a browser, Postman, Thunder Client, or curl.

Example:

```bash
curl http://localhost:3000
```

Use the appropriate API endpoint if your application does not expose a route at `/`.

---

## 7. Stop the Server

```bash
docker stop server
```

## 8. Start the Existing Container Again

After stopping it, you can start it again with:

```bash
docker start server
```

You don't need to pull or create the image again.

---

## 9. Remove the Container

If you want to completely remove the container:

```bash
docker rm -f server
```

The Docker image will remain available locally.

---

## 🔄 Get the Latest Image

Whenever a new version is pushed to Docker Hub, download it with:

```bash
docker pull harsh012/server:latest
```

Then remove the old container:

```bash
docker rm -f server
```

and create a new one:

```bash
docker run -d \
  --name server \
  -p 3000:3000 \
  -e DATABASE_URL="YOUR_DATABASE_URL" \
  harsh012/server:latest
```

---

## 🛠 Useful Docker Commands

### Check downloaded images

```bash
docker images
```

### Check running containers

```bash
docker ps
```

### Check all containers

```bash
docker ps -a
```

### View logs

```bash
docker logs server
```

### Stop container

```bash
docker stop server
```

### Start container

```bash
docker start server
```

### Remove container

```bash
docker rm -f server
```

### Remove image

```bash
docker rmi harsh012/server:latest
```

---

## 📁 Project Structure

The project contains:

```text
.
├── prisma/
├── src/
├── node_modules/
├── .dockerignore
├── .gitignore
├── Dockerfile
├── package.json
├── package-lock.json
└── tsconfig.json
```

The Docker image contains the application and its required dependencies, so users do not need to install the Node.js dependencies manually.

---

## 🔐 Environment Variables

The server currently requires:

| Variable | Description |
|---|---|
| `DATABASE_URL` | PostgreSQL database connection string |

Example:

```text
DATABASE_URL=postgresql://postgres:password@localhost:5432/mydatabase
```

Do **not** commit passwords, database credentials, API keys, or other secrets to GitHub.

---

## 🐳 Docker Image

Docker Hub:

```text
harsh012/server:latest
```

Pull it using:

```bash
docker pull harsh012/server:latest
```

---
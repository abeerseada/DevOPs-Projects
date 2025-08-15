
# Next.js Docker Production Setup

This repository demonstrates how to build and run a **Next.js** application using Docker multi-stage builds for a production-ready container.

## Table of Contents

* [Prerequisites](#prerequisites)
* [Dockerfile Overview](#dockerfile-overview)
* [Build and Run](#build-and-run)
* [Environment Variables](#environment-variables)
* [Ports](#ports)

---

## Prerequisites

Make sure you have the following installed:

* [Docker](https://www.docker.com/get-started)
* Node.js (for local development)
* npm

---

## Dockerfile Overview

The Dockerfile uses **multi-stage builds** to optimize the final image size:

1. **Base stage**:
   Uses `node:22-slim` as the base image.

2. **Deps stage**:
   Installs dependencies from `package.json` using `npm ci`.

3. **Builder stage**:

   * Copies dependencies from the `deps` stage
   * Copies the application code
   * Builds the Next.js project using `npm run build`

4. **Runtime stage** (final production image):

   * Copies only the **standalone build**, `public`, and `.next/static` folders from the builder stage
   * Sets environment variables for production
   * Runs the application as a non-root user (`node`)

This approach ensures the final image is **small and production-ready**.

---

## Build and Run

1. **Build the Docker image**

```bash
docker build -t nextjs-app .
```

2. **Run the container**

```bash
docker run -d -p 3000:3000 nextjs-app
```

3. **Access the application**

Open your browser and navigate to:

```
http://localhost:3000
```

---

## Environment Variables

The following environment variables are configured in the Dockerfile:

```bash
NEXT_TELEMETRY_DISABLED=1
NODE_ENV=production
HOSTNAME=0.0.0.0
PORT=3000
```

You can override them at runtime using `-e` flags:

```bash
docker run -d -p 3000:3000 -e PORT=4000 nextjs-app
```

---

## Ports

The application exposes port `3000` by default. Make sure to map it when running the container:

```bash
-p 3000:3000
```

---

## Notes

* The Dockerfile uses a **standalone Next.js build**, which allows running the app with **Node.js only**, without installing Next.js in the final image.
* All heavy build dependencies and dev files are removed from the final image to keep it lightweight.

---
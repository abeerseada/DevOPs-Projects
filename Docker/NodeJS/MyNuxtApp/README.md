
# Nuxt3 Starter App

A modern Nuxt 3 project with Docker support, ready for production builds and local development.

---

## Prerequisites

* Node.js (Recommended v22 or at least >= 20.19.0)
* npm
* Docker (optional, for containerization)

---

## Installation

```bash
npm install
```

---

## Development

Run the app locally with hot-reloading:

```bash
npm run dev
```

App will be available at `http://localhost:3000`.

---

## Production Build

Build the project for production:

```bash
npm run build
```

Preview the production build locally:

```bash
npm run preview
```

---

## Docker Usage

### Build Docker Image

```bash
npm run docker:build
```

### Run Docker Container

```bash
npm run docker:run
```

---

## Docker Environment Variables Explained

```dockerfile
ENV NODE_ENV=production
ENV NUXT_ENVIRONMENT=production
ENV NUXT_TELEMETRY_DISABLED=1
ENV NITRO_HOST=0.0.0.0
ENV NITRO_PORT=3030
```
---

## Useful Links

* [Nuxt 3 Documentation](https://nuxt.com/docs)
* [Docker Documentation](https://docs.docker.com)



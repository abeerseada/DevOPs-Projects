

---

## Description

This is an advanced Go application built with the **Go** programming language, designed to be lightweight, fast, and efficient. The application is containerized using **Docker** for seamless deployment across various environments. It includes a multi-stage Dockerfile to ensure efficient image building and optimized size. The application is designed for **production use** and is structured to be **scalable** and **maintainable**.

## Features

* **Go-based backend** using **Alpine Linux** for a minimal base image.
* Multi-stage Docker build to reduce the final image size.
* Static content (templates, static files) included with the final build.
* Easy-to-use `Makefile` for building, pushing, and cleaning Docker images.
* **Non-root user** for better security.
* **No shell** in the production image for enhanced security.
* **Cache mounting** for optimized builds and improved build times.

## Architecture

The application is structured using a **multi-stage Dockerfile** for optimized performance:

1. **Builder Stage**:

   * Uses the `golang:alpine3.22` base image.
   * Copies the Go source files.
   * Downloads dependencies and builds the executable.
2. **Production Stage**:

   * Uses the `gcr.io/distroless/static-debian12:nonroot` base image to provide a minimal and secure runtime.
   * Copies only the necessary files (the built Go binary, templates, and static files) from the builder stage.

### Key Docker Techniques:

* **Mounting Cache**: The `--mount=type=cache` directive is used to optimize the build process by caching dependencies and build artifacts. This speeds up subsequent builds, reducing the need to download dependencies and rebuild artifacts.

* **No Shell**: The **distroless** base image used in production has **no shell** included. This enhances security by ensuring that there is no access to a shell inside the container.

* **Non-root User**: The application runs as a **non-root user** (`nonroot`), which is a best practice for production environments. This ensures that even if an attacker gains access to the container, they cannot perform privileged actions.

## Getting Started

### Prerequisites

1. **Docker**: Ensure Docker is installed and running on your machine. [Install Docker](https://docs.docker.com/get-docker/).
2. **Make**: The project uses a Makefile for managing builds. Install [Make](https://www.gnu.org/software/make/).

### Running Locally

To get started and run the application locally:

1. Clone the repository:

   ```bash
   git clone https://github.com/abeerseada/advanced_go_app.git
   cd advanced_go_app
   ```

2. Build the Docker image:

   ```bash
   make docker_build
   ```

3. Run the application:

   ```bash
   docker run -p 3000:3000 <your_dockerhub_user>/advanced_go_app:latest
   ```

4. Access the application in your browser by visiting `http://localhost:3000`.

### Docker Commands

* **Build Docker Image**:

  ```bash
  docker build -t <your_dockerhub_user>/advanced_go_app:latest .
  ```

* **Push Docker Image to Docker Hub**:

  ```bash
  docker push <your_dockerhub_user>/advanced_go_app:latest
  ```

* **Clean up Docker images**:

  ```bash
  docker rmi <your_dockerhub_user>/advanced_go_app:latest
  ```

### Using Makefile

The project provides a Makefile for simplifying common tasks. The available commands are:

* **Build the Docker image**:

  ```bash
  make docker_build
  ```

* **Push the image to Docker Hub**:

  ```bash
  make docker_push
  ```

* **Clean up Docker images**:

  ```bash
  make clean
  ```

---

### LinkedIn:

* [Abeer Abd Elhameed](https://www.linkedin.com/in/abeer-abd-elhameed/)


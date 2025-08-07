# Multi-stage-NodeJS-Dockerfile

## Project Overview

This project demonstrates how to use multi-stage builds in a Node.js Dockerfile to optimize image size and security.

## Steps Performed

1. **Checked Users in Node.js Alpine Image**
    - Run:  
      ```
      docker run -it --rm node:12-alpine cat /etc/passwd
      ```
    - Purpose: To view all users in the container for security review.

2. **Searched for Environment Variable Usage**
    - Run:  
      ```
      grep -r "process.env" .
      ```
    - Purpose: To find all instances where environment variables are accessed in the codebase.

3. **Developed Node.js Application**
    - Built the application using JavaScript or TypeScript.

4. **Created Multi-stage Dockerfile**
    - Used multi-stage builds to reduce final image size and exclude unnecessary files.

## Usage

1. Build the Docker image:
    ```
    docker build -t my-node-app .
    ```
2. Build the Docker image for each stage (optional, for debugging or inspection):

- Build the production stage:
    ```
    docker build --target prod -t my-node-app:prod .
    ```

- Build the development stage:
    ```
    docker build --target dev -t my-node-app:dev .
    ```

- Build the test stage:
    ```
    docker build --target test -t my-node-app:test .
    ```

3. Run the container(production stage):
```
docker run -it -p 3000:3000 my-node-app:prod
```

## Notes

- Multi-stage builds help keep your images lean and secure.
- Always review user accounts and environment variable usage for best practices.

## Best Practices Resources

- [Docker Official Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Node.js Docker Best Practices](https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md)
- [OWASP Docker Security Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html)
- [12 Factor App Methodology](https://12factor.net/)
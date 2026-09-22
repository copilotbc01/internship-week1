# DevOps Internship Week 1

A containerized Flask application created for DevOps internship practice.

## Features

- Flask web application
- `/healthz` health endpoint
- Docker containerization
- Environment variable example
- Bash health-check script
- Git workflow using feature branches and Conventional Commits

## Run with Docker

```bash
docker build -t internship-app .
docker run -d --name internship-container -p 5001:5000 internship-app

```

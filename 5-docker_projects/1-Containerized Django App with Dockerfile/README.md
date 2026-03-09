# Django Docker Deployment
This project demonstrates how to containerize a Django application for production-ready deployment.

## Features
- Custom Dockerfile using Ubuntu base image.
- Optimized layer caching for requirements.txt.
- Port mapping (8000:8000) for AWS EC2 access.

## How to Run
1. Build: `docker build -t django-app .`
2. Run: `docker run -p 8000:8000 -d django-app`

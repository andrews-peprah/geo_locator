# GEO LOCATOR

This service is to provide the geo location data for the given IP address or domain name.

# How to run the service

## Prerequisites

- Docker
- Docker Compose

## Steps to run the service

- Clone the repository
- Navigate to the root directory of the repository
- Decrypt the .env file using the following command and the provided password

```
openssl aes-256-cbc -d -in .env.docker.enc -out .env.docker -k your_password -pbkdf2 -iter 10000
```

- Run the following command to start the service

```
docker compose up
```

- The service will be running on port 5000
- The swagger documentation can be accessed at http://localhost:5000/api/v1/swagger_doc

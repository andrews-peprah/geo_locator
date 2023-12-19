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

## Steps to run the tests

- Run rspec command to run the tests

```
docker compose run web rspec
```

# APIs

Version: 0.0.1  
Host: localhost:5000  
Produces: application/json  
Swagger Version: 2.0

## Tags

- **health_check**: Operations about health_checks
- **geo_location**: Operations about geo_locations

## Paths

### `/api/v1/health_check`

- **GET**
  - **Description**: Returns json to check system functionality
  - **Produces**: application/json
  - **Responses**:
    - **200**: Returns json to check system functionality
  - **OperationId**: getApiV1HealthCheck
  - **Deprecated**: false
  - **Tags**: health_check

### `/api/v1/geo_location`

- **DELETE**

  - **Description**: Deletes the geo location data based on ip address or url
  - **Produces**: application/json
  - **Parameters**:
    - **ip** (query): IP Address (string, optional)
    - **url** (query): URL (string, optional)
  - **Responses**:
    - **204**: Deletes the geo location data based on ip address or url
  - **OperationId**: deleteApiV1GeoLocation
  - **Deprecated**: false
  - **Tags**: geo_location

- **GET**

  - **Description**: Returns the geo location data based on ip address or url
  - **Produces**: application/json
  - **Parameters**:
    - **ip** (query): IP Address (string, optional)
    - **url** (query): URL (string, optional)
  - **Responses**:
    - **200**: Returns the geo location data based on ip address or url
  - **OperationId**: getApiV1GeoLocation
  - **Deprecated**: false
  - **Tags**: geo_location

- **POST**
  - **Description**: Creates the geo location data based on ip address or url
  - **Produces**: application/json
  - **Consumes**: application/json
  - **Parameters**:
    - **type** (formData): Type (string, required, enum: [ip, url])
    - **value** (formData): Value (string, required)
  - **Responses**:
    - **201**: Creates the geo location data based on ip address or url
  - **OperationId**: postApiV1GeoLocation
  - **Deprecated**: false
  - **Tags**: geo_location

## Test Data

- Sample IP Addresses
  - 123.212.128.12
  - 12.38.12.32
  - 82.21.38.12
- Sample Domain Names
  - www.google.com
  - www.facebook.com
  - www.amazon.com
  - www.microsoft.com

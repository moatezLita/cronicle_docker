# Cronicle Task Scheduler Docker Image and Deployment for OKD

 

## Overview

 

Cronicle is a versatile multi-server task scheduler and runner with a web-based front-end UI. It handles scheduled, repeating, and on-demand jobs across multiple worker servers, offering real-time stats and a live log viewer. This repository contains the Dockerfile and shell commands necessary to deploy Cronicle as a Docker image or as a pod in OKD (OpenShift Kubernetes Distribution).

 

## Features

 

- Easy deployment of Cronicle using Docker and OKD.

- Support for scheduled, repeating, and on-demand jobs.

- Real-time stats and a live log viewer for monitoring.

- Plugin support in virtually any language for extensibility.

 

## Prerequisites

 

Before deploying cronicle, ensure you have the following prerequisites installed:

 

- [Docker](https://www.docker.com/get-started)

- [OKD](https://www.okd.io/)

- [OC](https://docs.openshift.com/container-platform/4.8/cli_reference/openshift_cli/getting-started-cli.html)



 


## OKD Usage

### 1. Clone and Build

 

Clone this repository to your local machine, navigate to the directory containing your Dockerfile and run the following command to build the image:

 

```bash
git clone https://github.com/moatezLita/cronicle_docker.git

cd cronicle_docker

sudo docker build -t croncile .

``` 

### 2. Tag the docker image 
You need to tag the Docker image with a name that includes the registry/repository where you plan to push it. If you're using the OpenShift internal image registry, the format is typically:

```bash
sudo docker tag your-image-name registry.example.com/namespace/your-image-name:version

``` 
### 3. Login to OpenShift's Image Registry
If you are using OpenShift's internal image registry, you need to log in:

```bash
oc login -u <username> -p <password> https://your-openshift-cluster
docker login -u <username> -p $(oc whoami -t) registry.example.com
``` 
### 4. Push the Docker Image: 
Push your Docker image to the OpenShift internal image registry:
```bash 
docker push registry.example.com/namespace/your-image-name:version

``` 
### 5. Create an OpenShift Deployment: 
Create a deployment configuration in OpenShift that specifies how your application should run, including the image to use and any environment variables. You can use a YAML file to define this configuration or create it directly with the oc command. Here's an example YAML file (deployment.yaml):
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: your-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: your-app
  template:
    metadata:
      labels:
        app: your-app
    spec:
      containers:
        - name: your-app-container
          image: registry.example.com/namespace/your-image-name:version
          ports:
            - containerPort: 3012 # Adjust the port as needed ( cronicle run on default port 3012 )


```
Deploy the application using the YAML file:
```bash
oc apply -f deployment.yaml
```




##  OKD Usage

### 1. Clone and Build

 

Clone this repository to your local machine, navigate to the directory containing your Dockerfile and run the following command to build the image:

 

```bash
git clone https://github.com/moatezLita/cronicle_docker.git

cd cronicle_docker

sudo docker build -t croncile .

``` 

### 2. Run the image

To run Chronicle as a Docker container, use the following command:

```bash
docker run -d -p 8080:3012 cronicle-image
``` 

### 3. Change config
To change config as shown in the base [repo](https://github.com/jhuckaby/Cronicle/blob/master/docs/Setup.md)
## Managing Jobs
You can manage jobs through the Chronicle UI or by using the Chronicle API. Refer to the documentation for more details on job management.
you can visit:

- [localhost:3012](http://localhost:3012)


## Acknowledgments
Chronicle is developed and maintained by [jhuckaby/Cronicle](https://github.com/jhuckaby/Cronicle).

Special thanks to the open-source community for their contributions.

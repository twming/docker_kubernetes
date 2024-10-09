# Kubernetes / Minikube Installation
For window users, please install chololaty, before install Kubernetes-cli and minikube using choco install command. Go to Powershell command line:
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
Install Kubernetes-cli
```
choco install kubernetes-cli
```
Check kubernetes-cli version
```
kubectl version --client
```
Install Minikube
```
choco install minikube
```
Start Minikube
```
minikube start
```
Stop Minikube
```
minikube stop
```
Minikube Dashboard
```
minikube dashboard
```
Delete all Minikube cluster
```
minikube delete --all
```
Change the default memory limit (requires a restart):
```
minikube config set memory 9001
```
### docker compose template
```
version: "3.8"
services: 
  mongodb:
    image: 'mongo'
    volume:
      - data:/data/db
    environment:
      MONGO_INITDB_ROOT_USERNAME: max
      MONGO_INITDB_ROOT_PASSWORD: 
      #- MONGO_INITDB_ROOT_USERNAME=max
    #env_file:
    #  - ./env/mongo.env
    # inside the mongo.env file, MONGO_INITDB_ROOT_USERNAME=max
    #container_name: mongodb

  backend:
    build: ./backend
      #context: ./backend
      #dockerfile: Dockerfile
      #args:
        #some-arg: 1
    ports:
      - '80:80'
    volumes:
      - logs:/app/logs
      - ./backend:/app
      - /app/node_modules
    env_file:
      - ./env/backend.env
    depends_on: 
      - mongodb

  frontend:
    build: ./frontend
    ports:
      - '3000:3000'
    volumes:
      - ./frontend/src:/app/src
    stdin_open: true
    tty: true
    depends_on:
      - backend

volumes:
  data:
  logs:
  # for named volume only
```

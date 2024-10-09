# Dockerfile Template
```
```

# Docker Compose YAML Template
```
```

# Kubernetes Deployment YAML Template
```
```

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
Minikube Status
```
minikube status
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
# Kubernetes Objects and Commands
Run
---
```
kubectl run nginx --image nginx
kubectl run nginx --image ngix --port=80 --labels="app=hazelcast,env=prod" --env="DNS_DOMAIN=cluster" --restart=Never
```
Kubernetes manage objects:
- pods
- deployments
- services
- volumes
  
Pods / Deployments
------------------
```
kubectl create deployment first-app --image=twming/kube01
kubectl delete deployment first-app
kubectl get pods
kubectl expose deployment first-app --port=8080
kubectl expose deployment first-app --type=ClusterIP/NodePort/LoadBalancer --port=8080
```
Service
-------
Port Type:
- ClusterIP : only access by internal node
- NodePort : excess from outside cluster
- LoadBalancer : allow load distribution
```
kubectl expose deployment first-app --type=LoadBalancer --port=8080
kubectl get service
minikube service first-app
```
Scale
-----
```
kubectl scale deployment/first-app --replicas=3
```
Update
------
```
kubectl set image deployment/first-app kube01=twming/kube01:1
kubectl rollout status deployment/first-app
```
Rollback
--------
```
kubectl rollout undo deployment/first-app
kubectl rollout history deployment/first-app --revision=2
kubectl rollout undo deployment/first-app --to-revision=1
```
Delete
------
```
kubectl delete service first-app
kubectl delete deployment first-app
```
More
----
```
kubectl delete service first-app
kubectl delete deployment first-app

kubectl apply -f=deployment.yaml
	
kubectl get deployments

kubectl apply -f=service.yaml

kubectl get services

kubectl delete -f=deployment.yaml -f=service.yaml
kubectl apply -f=master_deployment.yaml
minikube service backend

kubectl delete deployments,services -l group=example

kubectl get sc
kubectl apply -f=host-pv.yaml
kubectl apply -f=host-pvc.yaml
kubectl apply -f=deployment.yaml
kubectl get pv
kubectl get pvc

kubectl apply -f=environment.yaml
kubectl get configmap
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

# Installation 
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

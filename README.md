# sms-dockers
Run steps: 
1. `sh ./create-dirs.sh`
2. `cp .env.example .env`
3. `docker-compose up -d [SERVICE_NAME]`

Shutdown steps:
1. `docker-compose down [SERVICE_NAME]`

Cluster Mode
`docker-compose -f docker-compose-cluster.yml up -d`

### Useful commands
```
docker-compose up --build (every time we do some changes on the image)
docker-compose up -d
docker-compose down
docker-compose ps ---> To see the apps running
docker-compose up --remove-orphans
```

### Jenkins
[http://localhost:8080](http://localhost:8080)

### Nexus 3
[http://localhost:8081](http://localhost:8081)


To sign in, get inside containers, and use user: admin and password: value inside container/nexus-data/admin.password
```
docker exec -it nexus bash                                                                                                                       ✔ │ base Py 
nexus-data/
cat admin.password 
ed66ab4d-2c0e-4784-8269-d315178efba2bash 
```

### PostgreSQL
http://localhost:5432

### SonarQube
[http://localhost:9000](http://localhost:9000)
```
User: admin
Pass: admin
```

### Architecture
![](DockerArch.png)
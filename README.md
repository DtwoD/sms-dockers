# sms-dockers
Run steps: 
1. `sh ./create-dirs.sh`
2. `docker-compose up -d [SERVICE_NAME]`

Shutdown steps:
1. `docker-compose down [SERVICE_NAME]`

### Nexus
To sign in, get inside containers, and use user: admin and password: value inside container/nexus-data/admin.password
```
docker exec -it nexus bash                                                                                                                       ✔ │ base Py 
nexus-data/
cat admin.password 
ed66ab4d-2c0e-4784-8269-d315178efba2bash 
```

### Architecture
![](DockerArch.png)
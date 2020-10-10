# sms-dockers
Run steps: 
1. `sh ./create-dirs.sh`
2. `docker-compose up -d [SERVICE_NAME]`

Shutdown steps:
1. `docker-compose down [SERVICE_NAME]`


Permissions:
```
chmod a+w /containers/jenkins/data
chmod a+w /containers/nexus/data
chmod a+w -R /containers/gitlab/data
```
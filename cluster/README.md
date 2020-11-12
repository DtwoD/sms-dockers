```
docker run -v "$PWD":/opt -p 5701:5701 -p 8081:8081 -it centos
docker run -v "$PWD":/opt -p 8091:8081 -p 5702:5702 -it centos2
```
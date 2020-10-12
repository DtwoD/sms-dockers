#### Notes
Here is where Influx Metada data will be stored, you can change on docker-compose:

```
influxdbData:
    image: busybox
    volumes:
      - ./containers/analytics/influxdb/data/influxdb:/data
```
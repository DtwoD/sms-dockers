# sms-dockers
Run steps: 
1. `sh ./create-dirs.sh`
2. `docker-compose up -d [SERVICE_NAME]`

Shutdown steps:
1. `docker-compose down [SERVICE_NAME]`


### Monitoring with sms-dockers analytics
- Influxdb
- Prometheus background Node_exporter
- Cadvisor
- Prometheus      
- Grafana_1      

#### Running analytics showing containers logs
`docker-compose up` without -d (daemon mode)

### Prometheus
- http://localhost:9090

### Grafana
http://localhost:3000

### InfluxDB
- http://localhost:8083

EXPOSES port: 8086

### [CAdvisor](https://github.com/google/cadvisor)
http://localhost:9500/containers

#### Add Grafana new InfluxDB add source
```
Connect to Grafana (http://locahost:3000/)

Click on Data Sources -> Add new

Add the following data:

Name: influxdb
Type: InfluxDB 0.9.x

Note: Check default option. So Grafana do not create random data.

Http settings
Url: http://localhost:8086
Access: 
    proxy (Grafana Backend will proxy the request) - still testing to use this option
    direct (via Browser)
Basic Auth: Enabled
User: admin
Password: admin

InfluxDB Details
Database: cadvisor
User: root
Password: root

Test Connection (should be successful) -> Save  
```

### What is running on docker monitor analytics combo?
```
 ~/devops/sms-dockers │ feature/docker-monitoring: docker-compose up                                                                                                                    
Starting sms-dockers_influxdbData_1 ... done
Starting monitoring_node_exporter   ... done
Starting sms-dockers_influxdb_1     ... done
Starting sms-dockers_cadvisor_1     ... done
Starting monitoring_prometheus      ... done
Starting sms-dockers_grafana_1      ... done
Attaching to monitoring_node_exporter, sms-dockers_influxdbData_1, sms-dockers_influxdb_1, sms-dockers_cadvisor_1, monitoring_prometheus, sms-dockers_grafana_1
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.104Z caller=main.go:310 msg="No time or size retention was set so using the default time retention" duration=15d
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.358Z caller=node_exporter.go:177 msg="Starting node_exporter" version="(version=1.0.1, branch=HEAD, revision=3715be6ae899f2a9b9dbfd9c39f3e09a7bd4559f)"
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.358Z caller=node_exporter.go:178 msg="Build context" build_context="(go=go1.14.4, user=root@1f76dbbcfa55, date=20200616-12:44:12)"
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.104Z caller=main.go:346 msg="Starting Prometheus" version="(version=2.21.0, branch=HEAD, revision=e83ef207b6c2398919b69cd87d2693cfc2fb4127)"
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.104Z caller=main.go:347 build_context="(go=go1.15.2, user=root@a4d9bea8479e, date=20200911-11:35:02)"
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.104Z caller=main.go:348 host_details="(Linux 4.19.76-linuxkit #1 SMP Tue May 26 11:42:35 UTC 2020 x86_64 16dfc10def8b (none))"
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.105Z caller=main.go:349 fd_limits="(soft=1048576, hard=1048576)"
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.105Z caller=main.go:350 vm_limits="(soft=unlimited, hard=unlimited)"
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:105 msg="Enabled collectors"
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=arp
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=bcache
cadvisor_1       | W1012 17:07:21.116424       1 manager.go:349] Could not configure a source for OOM detection, disabling OOM events: open /dev/kmsg: no such file or directory
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.117Z caller=main.go:701 msg="Starting TSDB ..."
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.118Z caller=web.go:523 component=web msg="Start listening for connections" address=0.0.0.0:9090
influxdb_1       | => The initialization script had been executed before, skipping ...
influxdb_1       | => Starting InfluxDB in foreground ...
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=bonding
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=btrfs
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=conntrack
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=cpu
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=cpufreq
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=diskstats
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=edac
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.133Z caller=head.go:644 component=tsdb msg="Replaying on-disk memory mappable chunks if any"
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.133Z caller=head.go:658 component=tsdb msg="On-disk memory mappable chunks replay completed" duration=3.7µs
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.133Z caller=head.go:664 component=tsdb msg="Replaying WAL, this may take a while"
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.137Z caller=head.go:716 component=tsdb msg="WAL segment loaded" segment=0 maxSegment=1
influxdb_1       | 
influxdb_1       |  8888888           .d888 888                   8888888b.  888888b.
influxdb_1       |    888            d88P"  888                   888  "Y88b 888  "88b
influxdb_1       |    888            888    888                   888    888 888  .88P
influxdb_1       |    888   88888b.  888888 888 888  888 888  888 888    888 8888888K.
influxdb_1       |    888   888 "88b 888    888 888  888  Y8bd8P' 888    888 888  "Y88b
influxdb_1       |    888   888  888 888    888 888  888   X88K   888    888 888    888
influxdb_1       |    888   888  888 888    888 Y88b 888 .d8""8b. 888  .d88P 888   d88P
influxdb_1       |  8888888 888  888 888    888  "Y88888 888  888 8888888P"  8888888P"
influxdb_1       | 
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=entropy
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=filefd
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=filesystem
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=hwmon
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=infiniband
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=ipvs
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=loadavg
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=mdadm
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=meminfo
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=netclass
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.359Z caller=node_exporter.go:112 collector=netdev
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=netstat
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=nfs
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=nfsd
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=powersupplyclass
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=pressure
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=rapl
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.139Z caller=head.go:716 component=tsdb msg="WAL segment loaded" segment=1 maxSegment=1
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.139Z caller=head.go:719 component=tsdb msg="WAL replay completed" checkpoint_replay_duration=1.084ms wal_replay_duration=4.5588ms total_replay_duration=5.7042ms
influxdb_1       | 2020/10/12 17:07:09 InfluxDB starting, version 0.9.6.1, branch 0.9.6, commit 6d3a8603cfdaf1a141779ed88b093dcc5c528e5e, built 2015-12-10T23:40:23+0000
influxdb_1       | 2020/10/12 17:07:09 Go version go1.4.2, GOMAXPROCS set to 8
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.143Z caller=main.go:721 fs_type=65735546
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.143Z caller=main.go:724 msg="TSDB started"
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=schedstat
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=sockstat
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=softnet
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=stat
influxdb_1       | 2020/10/12 17:07:09 Using configuration at: /config/config.toml
influxdb_1       | [metastore] 2020/10/12 17:07:09 Using data dir: /data/meta
sms-dockers_influxdbData_1 exited with code 0
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.143Z caller=main.go:850 msg="Loading configuration file" filename=/etc/prometheus/prometheus.yml
influxdb_1       | [metastore] 2020/10/12 17:07:09 Node at localhost:8088 [Follower]
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.145Z caller=main.go:881 msg="Completed loading of configuration file" filename=/etc/prometheus/prometheus.yml totalDuration=1.9454ms remote_storage=6.1µs web_handler=3.5µs query_engine=4.7µs scrape=285.5µs scrape_sd=47.1µs notify=5.1µs notify_sd=5.1µs rules=3.4µs
monitoring_prometheus | level=info ts=2020-10-12T17:07:27.145Z caller=main.go:673 msg="Server is ready to receive web requests."
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=textfile
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=thermal_zone
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=time
influxdb_1       | [metastore] 2020/10/12 17:07:09 Skipping cluster join: already member of cluster: nodeId=1 raftEnabled=true peers=[localhost:8088]
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=timex
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=udp_queues
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=uname
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=vmstat
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=xfs
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:112 collector=zfs
influxdb_1       | [metastore] 2020/10/12 17:07:10 Node at localhost:8088 [Leader]. peers=[localhost:8088]
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=node_exporter.go:191 msg="Listening on" address=:9100
monitoring_node_exporter | level=info ts=2020-10-12T17:07:01.360Z caller=tls_config.go:170 msg="TLS is disabled and it cannot be enabled on the fly." http2=false
influxdb_1       | [metastore] 2020/10/12 17:07:10 spun up monitoring for 1
influxdb_1       | [store] 2020/10/12 17:07:10 Using data dir: /data/db
influxdb_1       | [metastore] 2020/10/12 17:07:10 Updated node id=1 hostname=localhost:8088
influxdb_1       | [wal] 2020/10/12 17:07:10 WAL starting with 30720 ready series size, 0.50 compaction threshold, and 52428800 partition size threshold
influxdb_1       | [wal] 2020/10/12 17:07:10 WAL writing to /data/wal/_internal/monitor/1
influxdb_1       | [wal] 2020/10/12 17:07:11 WAL starting with 30720 ready series size, 0.50 compaction threshold, and 52428800 partition size threshold
influxdb_1       | [wal] 2020/10/12 17:07:11 WAL writing to /data/wal/cadvisor/default/2
influxdb_1       | [handoff] 2020/10/12 17:07:11 Starting hinted handoff service
influxdb_1       | [monitor] 2020/10/12 17:07:11 'hh' registered for diagnostics monitoring
influxdb_1       | [handoff] 2020/10/12 17:07:11 Using data dir: /data/hh
influxdb_1       | [subscriber] 2020/10/12 17:07:11 opened service
influxdb_1       | [monitor] 2020/10/12 17:07:11 Starting monitor system
influxdb_1       | [monitor] 2020/10/12 17:07:11 'build' registered for diagnostics monitoring
influxdb_1       | [monitor] 2020/10/12 17:07:11 'runtime' registered for diagnostics monitoring
influxdb_1       | [monitor] 2020/10/12 17:07:11 'network' registered for diagnostics monitoring
influxdb_1       | [monitor] 2020/10/12 17:07:11 'system' registered for diagnostics monitoring
influxdb_1       | [cluster] 2020/10/12 17:07:11 Starting cluster service
influxdb_1       | [shard-precreation] 2020/10/12 17:07:11 Starting precreation service with check interval of 10m0s, advance period of 30m0s
influxdb_1       | [snapshot] 2020/10/12 17:07:11 Starting snapshot service
influxdb_1       | [copier] 2020/10/12 17:07:11 Starting copier service
influxdb_1       | [admin] 2020/10/12 17:07:11 Starting admin service
influxdb_1       | [monitor] 2020/10/12 17:07:11 Storing statistics in database '_internal' retention policy '', at interval 10s
influxdb_1       | [admin] 2020/10/12 17:07:11 Listening on HTTP: [::]:8083
influxdb_1       | [continuous_querier] 2020/10/12 17:07:11 Starting continuous query service
influxdb_1       | [httpd] 2020/10/12 17:07:11 Starting HTTP service
influxdb_1       | [httpd] 2020/10/12 17:07:11 Authentication enabled: false
influxdb_1       | [httpd] 2020/10/12 17:07:11 Listening on HTTP: [::]:8086
influxdb_1       | [retention] 2020/10/12 17:07:11 Starting retention policy enforcement service with check interval of 10m0s
influxdb_1       | [run] 2020/10/12 17:07:11 Listening for signals
influxdb_1       | 2020/10/12 17:07:11 Sending anonymous usage statistics to m.influxdb.com
influxdb_1       | [wal] 2020/10/12 17:07:26 Flush due to idle. Flushing 3 series with 3 points and 177 bytes from partition 1
influxdb_1       | [wal] 2020/10/12 17:07:26 write to index of partition 1 took 12.7255ms
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Starting Grafana" logger=server version=7.2.1 commit=72a6c64532 branch=HEAD compiled=2020-10-08T09:00:32+0000
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config loaded from" logger=settings file=/usr/share/grafana/conf/defaults.ini
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config loaded from" logger=settings file=/etc/grafana/grafana.ini
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from command line" logger=settings arg="default.paths.data=/var/lib/grafana"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from command line" logger=settings arg="default.paths.logs=/var/log/grafana"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from command line" logger=settings arg="default.paths.plugins=/var/lib/grafana/plugins"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from command line" logger=settings arg="default.paths.provisioning=/etc/grafana/provisioning"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from command line" logger=settings arg="default.log.mode=console"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_PATHS_DATA=/var/lib/grafana"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_PATHS_LOGS=/var/log/grafana"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_PATHS_PLUGINS=/var/lib/grafana/plugins"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_PATHS_PROVISIONING=/etc/grafana/provisioning"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_SERVER_DOMAIN=myrul.com"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_SECURITY_ADMIN_PASSWORD=*********"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_USERS_ALLOW_SIGN_UP=false"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_SMTP_ENABLED=true"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_SMTP_HOST=smtp.gmail.com:587"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_SMTP_USER=myadrress@gmail.com"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_SMTP_PASSWORD=*********"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Config overridden from Environment variable" logger=settings var="GF_SMTP_FROM_ADDRESS=myaddress@gmail.com"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Path Home" logger=settings path=/usr/share/grafana
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Path Data" logger=settings path=/var/lib/grafana
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Path Logs" logger=settings path=/var/log/grafana
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Path Plugins" logger=settings path=/var/lib/grafana/plugins
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Path Provisioning" logger=settings path=/etc/grafana/provisioning
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="App mode production" logger=settings
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Connecting to DB" logger=sqlstore dbtype=sqlite3
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Starting DB migrations" logger=migrator
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Starting plugin search" logger=plugins
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="Registering plugin" logger=plugins name="Direct Input"
grafana_1        | t=2020-10-12T17:07:30+0000 lvl=info msg="HTTP Server Listen" logger=http.server address=[::]:3000 protocol=http subUrl= socket=
^CGracefully stopping... (press Ctrl+C again to force)
```

### Open Source Resources

- https://github.com/prometheus/prometheus
- https://github.com/vegasbrianc/prometheus
- https://github.com/RiFi2k/dockerize-your-dev
- https://grafana.com/grafana/dashboards/893
- https://github.com/vegasbrianc/prometheus/blob/master/docker-compose.yml
- https://github.com/alerta/prometheus-config/blob/master/docker-compose.yml

## Known issues
- https://github.com/helm/charts/issues/2712 
```
 command:
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--storage.local.path=/prometheus' <!--- Error parsing commandline arguments: unknown long flag '--storage.local.path'
      - '--alertmanager.url=http://alertmanager:9093'
```

- https://github.com/prometheus/prometheus/issues/2878
[New rule format](https://prometheus.io/blog/2017/06/21/prometheus-20-alpha3-new-rule-format/)
```
monitoring_prometheus | prometheus: error: unknown short flag '-c'
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.417Z caller=node_exporter.go:105 msg="Enabled collectors"
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.417Z caller=node_exporter.go:112 collector=arp
influxdb_1       | => Starting InfluxDB in background ...
influxdb_1       | => Waiting for confirmation of InfluxDB service startup ...
influxdb_1       | 
influxdb_1       |  8888888           .d888 888                   8888888b.  888888b.
influxdb_1       |    888            d88P"  888                   888  "Y88b 888  "88b
influxdb_1       |    888            888    888                   888    888 888  .88P
influxdb_1       |    888   88888b.  888888 888 888  888 888  888 888    888 8888888K.
influxdb_1       |    888   888 "88b 888    888 888  888  Y8bd8P' 888    888 888  "Y88b
influxdb_1       |    888   888  888 888    888 888  888   X88K   888    888 888    888
influxdb_1       |    888   888  888 888    888 Y88b 888 .d8""8b. 888  .d88P 888   d88P
influxdb_1       |  8888888 888  888 888    888  "Y88888 888  888 8888888P"  8888888P"
influxdb_1       | 
influxdb_1       | 2020/10/12 16:49:20 InfluxDB starting, version 0.9.6.1, branch 0.9.6, commit 6d3a8603cfdaf1a141779ed88b093dcc5c528e5e, built 2015-12-10T23:40:23+0000
influxdb_1       | 2020/10/12 16:49:20 Go version go1.4.2, GOMAXPROCS set to 8
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.417Z caller=node_exporter.go:112 collector=bcache
influxdb_1       | 2020/10/12 16:49:21 Using configuration at: /config/config.toml
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.417Z caller=node_exporter.go:112 collector=bonding
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.417Z caller=node_exporter.go:112 collector=btrfs
influxdb_1       | [metastore] 2020/10/12 16:49:21 Using data dir: /data/meta
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.418Z caller=node_exporter.go:112 collector=conntrack
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.418Z caller=node_exporter.go:112 collector=cpu
influxdb_1       | [metastore] 2020/10/12 16:49:21 Node at localhost:8088 [Follower]
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.418Z caller=node_exporter.go:112 collector=cpufreq
influxdb_1       | [metastore] 2020/10/12 16:49:22 Node at localhost:8088 [Leader]. peers=[]
monitoring_node_exporter | level=info ts=2020-10-12T16:49:15.418Z caller=node_exporter.go:112 collector=diskstats
```

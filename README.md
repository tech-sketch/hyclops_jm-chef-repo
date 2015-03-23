# Overview
This is chef repository that install following middlewares for "HyClops JobMonitoring".

* Zabbix
* JobScheduler
* PostgreSQL
* Fabric

HyClops JobMonitoring is the tool for system operators that is collaborating monitoring tool of Zabbix and job management tool of JobScheduler. 

HyClops JobMonitoring is released under the Apache License, Version 2.0.

* GitHub repository: https://github.com/tech-sketch/hyclops_jm.git
* Official Site: http://tech-sketch.github.io/hyclops_jm

# Usage

## Download

```
$ git clone https://github.com/tech-sketch/hyclops_jm-chef-repo.git
$ cd hyclops_jm-chef-repo
```

## Configuration

This repository provides shell script wrapped chef. So you can configure only following settings.

```
$ vi config/config.json
```

And you should select middleware version.

```
{
  "postgresql": {
    "version": "9.3"
  },
  "zabbix": {
    "version": "2.2"
  },
  "jobscheduler": {
    "version": {
      "major": "1.7"
    }
  }
}
```

## Execute

```
$ bash install_middleware.sh
```

# License

Copyright 2014 TIS Inc. HyClops for Zabbix Team (hyclops@ml.tis.co.jp)

Licensed under the Apache License, Version 2.0. The Apache v2 full text is published at [this link](http://www.apache.org/licenses/LICENSE-2.0).

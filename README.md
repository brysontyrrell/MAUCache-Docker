# MAUCache Docker

A `docker-compose` configuration for launching a Microsoft Auto-Update Cache server.

## Launch MAUCache

You will need to install [Docker Toolbox](https://www.docker.com/products/docker-toolbox) to use the `docker-compose` command.

### Connect to your docker machine:

```
~$ eval $(docker-machine env <name>)
```

### Build the image:

```
~$ cd /MAUCache-Docker
MAUCache-Docker$ docker-compose build
...
```

### Start the services:

*(The services are named `maucache` and `nginx` respectively)*

```
MAUCache-Docker$ docker-compose up -d
```

The Nginx web server will start and serve traffic at the docker machine's IP address over port 80.

The MAUCacheAdmin script will start automatically and run every 15 minutes. This script will save all packages to `/usr/share/nginx/html` which is within a volume also mounted by the Nginx container.

The `maucachedocker_cache` volume will persist if you bring down the running containers.

## View Logs

To help troubleshoot the running containers, you can view the logs for each service:

```
~$ docker logs <name>
...
```

You may also launch a shell within the running container:

```
~$ docker exec -it <name> bash
root@xxxxx:/#
```

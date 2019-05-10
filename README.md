# Kong Plugin Development Environment

Docker based development environment for Kong Plugins.

## Prerequisites

For this project you will need to have **Docker**, **Docker-Compose** and **Make** installed.

## Installations

#### Docker and Docker-Compose

Docker installation inscrutions can be found [here.](https://docs.docker.com/install/linux/docker-ce/ubuntu/)  
Docker-Compose installation instructions can be found [here.](https://docs.docker.com/compose/install/)


#### Make

Make is part of the `build-essential` package. On a linux distribution you 
can install it with the following commands:
```bash
sudo apt-get update;
sudo apt-get install build-essential;
```
## Usage

The recommended enterypoint for every command is the Makefile.  
> Each call can be made using a command like follow: `make [something]`

#### Commands

- `deploy`: deploys a complete Kong environment over Docker.
- `package`: packages the plugin in a temporary Kong instance.
- `install`: update configuration files, and installs the plugin.
    > This command induce a restart of the Kong instance
- `clean`: removes any temporary files created during installation.
- `fclean`: `clean` + stops and removes ***all*** the docker containers.
    > :bangbang: If you are using Docker for other project, it's heavily recommended that you use namespaces to secure your running containers from this command.
- `all`: `deploy` + `package` + `install` + `clean`
- `re`: `fclean` + `all`
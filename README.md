# Kong Plugin Development Environment

Docker based development environment for Kong Plugins.

## Prerequisites

For this project you will need to have **Docker**, **Docker-Compose** and **Make** installed.

## Installations

#### Docker and Docker-Compose

Docker installation instructions can be found [here.](https://docs.docker.com/install/linux/docker-ce/ubuntu/)  
Docker-Compose installation instructions can be found [here.](https://docs.docker.com/compose/install/)


#### Make
e
Make is part of the `build-essential` package. On a linux distribution you 
can install it with the following commands:
```bash
sudo apt-get update;
sudo apt-get install -y build-essential;
```

## Folder structure and Plugin location

## Usage

The recommended enterypoint for every command is the Makefile.  
Each call can be made using a command like follow: `make [something]`

#### Commands List

- `deploy`: deploys a complete Kong environment over Docker.
- `package`: packages the plugin in a temporary Kong instance.
- `install`: update configuration files, and installs the plugin.  
    > This command induce a restart of the Kong instance
- `clean`: removes any temporary files created during installation.
- `fclean`: `clean` + stops and removes ***all*** the docker containers.  
    > If you are using Docker for other project, it's heavily recommended that you use namespaces to secure your running containers from this command.
- `all`: `deploy` + `package` + `install` + `clean`
- `re`: `fclean` + `all`

#### Details

As described each command has a specific task, except for the `all` and `re` command who are respectively used to execute every command, or remove everything that was done by the makefile and re-doing it.

> Each time you want to test your plugin inside a Kong environement you should run `make all`.  
> It will redo the `deploy` part of the execution. But docker-compose will only update the actual environment, doing nothing if nothing changed.  
> If you need a clean environment you should call `make re` who will erase all Docker container and re-deploy everything for you.
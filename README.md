# Kong Plugin Development Environment

Docker based development environment for Kong Plugins.

![kong](https://2tjosk2rxzc21medji3nfn1g-wpengine.netdna-ssl.com/wp-content/uploads/2018/08/logo-color.png "Image Kong")

## Prerequisites

For this project you will need to have **Docker**, **Docker-Compose** and **Make** installed.

## Installations

#### Docker and Docker-Compose

Docker installation instructions can be found [here.](https://docs.docker.com/install/linux/docker-ce/ubuntu/)  
Docker-Compose installation instructions can be found [here.](https://docs.docker.com/compose/install/)


#### Make

Make is part of the `build-essential` package. On a linux distribution you 
can install it with the following commands:
```bash
sudo apt-get update;
sudo apt-get install -y build-essential;
```

## Folder structure and Plugin location

To use this repository you will need to set it up.

### Set the variables in the Makefile  

```bash
PLUGIN_NAME		= [Plugin Name]   
PLUGIN_VERSION 		= [Plugin Version]  
PLUGIN_HOST_PATH	= /home/[user]/path/to/[Kong Plugin Repository]  
```
PLUGIN_NAME will define the name of your plugin in Kong once installed.  
PLUGIN_VERSION will be used on the LuaRocks files for installation and packaging.  
PLUGIN_HOST_PATH should be an absolute path to the Kong-Plugin directory you want to deploy

> I recommend you put your Kong Plugin Repository inside the kong-docker repository

## Usage

The recommended enterypoint for every command is the Makefile.  
Each call can be made using a command like follow: `make [something]`

#### Commands List

- `deploy`: deploys a complete Kong environment over Docker.
- `package`: packages the plugin in a temporary Kong instance.
- `install`: update configuration files, and installs the plugin.  
This command induces a restart of the Kong instance
- `clean`: removes any temporary files created during installation.
- `fclean`: `clean` + stops and removes ***all*** the docker containers.  
If you are using Docker for other project, it's heavily recommended that you use namespaces to secure your running containers from this command.
- `all`: `deploy` + `package` + `install` + `clean`
- `re`: `fclean` + `all`

#### Details

As described each command has a specific task, except for the `all` and `re` command who are respectively used to execute every command, or remove everything that was done by the makefile and re-doing it.

Each time you want to test your plugin inside a Kong environement you should run `make all`.  
> It will redo the `deploy` part of the execution. But docker-compose will only update the actual environment, doing nothing if nothing changed.  

If you need a clean environment you should call `make re` who will erase all Docker container and re-deploy everything for you.
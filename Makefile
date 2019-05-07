PLUGIN_NAME = myplugin
PLUGIN_VERSION = 0.1.0-1

PLUGIN_HOST_PATH = /home/julien/Project/kong-docker/kong-plugin

INSTALL = ./deployment/install.sh
PACKAGE = ./deployment/compile.sh
COMPOSE = ./deployment/docker-compose.yml
TEMP_FILES = ./deployment/kong.conf

deploy:
		docker-compose -f $(COMPOSE) up -d

package: $(PACKAGE)
		 sh $(PACKAGE) $(PLUGIN_HOST_PATH) $(PLUGIN_NAME) $(PLUGIN_VERSION)

install: $(INSTALL) 
		 sh $(INSTALL) $(TEMP_FILES) $(PLUGIN_NAME)

clean: $(TEMP_FILES)
		 rm -rf $(TEMP_FILES)

all: deploy package install clean

re: clean all

.PHONY: all clean re
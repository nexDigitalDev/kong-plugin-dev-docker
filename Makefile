PLUGIN_NAME = myplugin
PLUGIN_VERSION = 0.1.0-1
PLUGIN_HOST_PATH = /home/julien/Project/kong-docker/kong-plugin

INSTALL = ./deployment/install.sh
PACKAGE = ./deployment/compile.sh
COMPOSE = ./deployment/docker-compose.yml
TEMP_FILES = ./deployment/kong.conf

COM_COLOR   = \033[0;34m
OBJ_COLOR   = \033[0;36m
OK_COLOR    = \033[0;32m
ERROR_COLOR = \033[0;31m
WARN_COLOR  = \033[0;33m
NO_COLOR    = \033[m

deploy:
		@printf "%b" "\n$(OBJ_COLOR)Deploy Kong:\n\n$(NO_COLOR)"
		@-docker-compose -f $(COMPOSE) up -d ; RESULT=$$?; \
		if [ $$RESULT -ne 0 ]; then \
			printf "%b"  "\n$(ERROR_COLOR)Kong failed to deploy$(NO_COLOR)\n"; \
		else \
			printf "%b" "\n$(OK_COLOR)Kong deployed successfully$(NO_COLOR)\n"; \
		fi;

package: $(PACKAGE)
		 @printf "%b" "\n$(OBJ_COLOR)Package Plugin:\n\n$(NO_COLOR)"
		 @sh $(PACKAGE) $(PLUGIN_HOST_PATH) $(PLUGIN_NAME) $(PLUGIN_VERSION) ; RESULT=$$?; \
		 if [ $$RESULT -ne 0 ]; then \
		 	printf "%b"  "\n$(ERROR_COLOR)Failed to package plugin$(NO_COLOR)\n"; \
		 else \
			printf "%b" "\n$(OK_COLOR)Plugin packaged successfully$(NO_COLOR)\n"; \
		 fi;

install: $(INSTALL)
		 @printf "%b" "\n$(OBJ_COLOR)Install Plugin:\n\n$(NO_COLOR)"
		 @sh $(INSTALL) $(TEMP_FILES) $(PLUGIN_NAME) ; RESULT=$$?; \
		 if [ $$RESULT -ne 0 ]; then \
		 	printf "%b"  "\n$(ERROR_COLOR)Failed to install the plugin$(NO_COLOR)\n"; \
		 else \
			printf "%b" "\n$(OK_COLOR)Plugin installed successfully$(NO_COLOR)\n"; \
		 fi;

clean:
		 @printf "%b" "\n$(OBJ_COLOR)Clean Repository:\n\n$(NO_COLOR)"
		 -rm -rf $(TEMP_FILES)

fclean:	 clean
		 @printf "%b" "\n$(OBJ_COLOR)Clean Repository and Docker Containers:\n\n$(NO_COLOR)"
		 @-printf "%b" "$(COM_COLOR)Stopped Containers:\n$(NO_COLOR)" ; docker kill $$(docker ps -q); \
		 printf "%b" "$(COM_COLOR)Removed Containers:\n$(NO_COLOR)" ; docker rm $$(docker ps -a -q)

all: deploy package install clean

re: fclean all

.PHONY: all clean fclean re
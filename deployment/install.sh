# Copies conf file from Container
docker cp kong-compose:/etc/kong/kong.conf.default $1;

# Adds the plugin line at the start of the file
sed -i "1iplugins = bundled,$2" $1

# Copies the file back inside the container.
docker cp $1 kong-compose:/etc/kong/kong.conf;

# Installs the plugin inside the container
docker exec -it kong-compose /bin/sh -c "cd /kong-plugin/ && luarocks make";

# Restarts Kong for the modifications to take effect
docker exec -d kong-compose kong restart

# Maybe export KONG_PLUGINS=bundled,myplugin
# Does not work from outside the container, the env do not seem to permanently change
# Does changes during the execution: docker exec -it kong-compose /bin/sh -c "export TEST=lol && env"l
# This returns an env with TEST. But right after a simple Env gives no TEST

# Solution edit Kong conf file on the fly
    # Cpoy conf file in directory
    # Edit file
    # Install get the file paste
docker exec -it kong-compose /bin/sh -c "cd /kong-plugin && luarocks make && kong restart"
# Maybe export KONG_PLUGINS=bundled,myplugin
# Does not work from outside the container, the env do not seem to change
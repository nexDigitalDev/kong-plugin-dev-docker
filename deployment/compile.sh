docker build -t kong-compiler:latest .;

docker run --rm --name kong-plugin-packaging \
    --network=kong-net \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST=kong-database" \
    -v /home/julien/Project/kong-docker/kong-plugin:/kong-plugin \
    kong-compiler:latest \
    /bin/sh -c "cd /kong-plugin/ && luarocks make && luarocks pack kong-plugin-myplugin-0.1.0-1.rockspec";
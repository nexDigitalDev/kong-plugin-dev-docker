# Builds the docker image based on the Dockerfile in the current directory
docker build -t kong-compiler:latest ./deployment/;

# Runs an instance of the image previously created
# flag --rm ensure the container is destroyed once done.
docker run --rm --name kong-plugin-packaging \
    --network=kong-net \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST=kong-database" \
    -v $1:/kong-plugin/ \
    kong-compiler:latest \
    /bin/sh -c "cd /kong-plugin/ && luarocks make && luarocks pack kong-plugin-$2-$3.rockspec";
# Builds the docker image based on the Dockerfile in the current directory
printf "%b" "\033[0;34mBuilding Docker Image: kong-compiler\033[m\n";
docker build -t kong-compiler:latest ./deployment/;


# 'kong migrations list' return val
ue
# if 3 bootstrap
# if 4 finish
# if 5 up and finish 


printf "%b" "\n\033[0;34mRun Migration Container\033[m\n";
docker run --rm --name kong-plugin-packaging \
    --network=kong-net \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST=kong-database" \
    -v $1:/kong-plugin/ \
    kong-compiler:latest \
    /bin/sh -c "kong migrations up";

printf "%b" "\n\033[0;34mRun Migration Container\033[m\n";
docker run --rm --name kong-plugin-packaging \
    --network=kong-net \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST=kong-database" \
    -v $1:/kong-plugin/ \
    kong-compiler:latest \
    /bin/sh -c "kong migrations finish";
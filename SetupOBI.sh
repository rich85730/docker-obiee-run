#!/bin/sh

#####

rich cat
#####

echo "starting dockers db"
###
1521:1521 probably need to replace first 1521 with valid ip in subnet
###
docker run -d -p 1521:1521 --stop-timeout 600 --name database oracle/database:12.1.0.2-ee
##if docker run command has error do something
##docker rm database will remove failed version
##docker containers ls -a will show all containers (a option to show all otherwise only shows running)

##show log

docker logs -f database


docker run -d -P \
--name obiee_12.2.1.2.0 \
--stop-timeout 600 \
-e "BI_CONFIG_RCU_DBSTRING=192.168.120.81:1521:orclpdb1" \
-3 "BI_CONFIG_RCU_PWD=oracle" \
oracle/obiee:12.2.1.2.0

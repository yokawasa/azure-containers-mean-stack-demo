#!/bin/sh

TARGET_API_BASE="http://172.17.0.2:3000"
docker run --rm -it -p 8080:80 -e CONTAINER_ROLE="FRONTEND" -e TARGET_API_BASE="$TARGET_API_BASE" mean-demo:0.0.1

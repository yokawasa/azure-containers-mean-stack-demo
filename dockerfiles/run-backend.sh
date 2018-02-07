#!/bin/sh

MONGODB_URI="mongodb://<accountname>:<accountkey>@<accountname>.documents.azure.com:10255/<database>?
ssl=true&sslverifycertificate=false"

docker run --rm -it -p 3000:3000 -p 2222:2222 -e MONGODB_URI="$MONGODB_URI" -e CONTAINER_ROLE="BACKEND" mean-demo:0.0.1

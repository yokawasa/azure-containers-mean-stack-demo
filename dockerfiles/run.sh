#!/bin/sh

MONGODB_URI="mongodb://localhost:27017/meandemo"
docker run --rm -it -p 4200:4200 -p 3000:3000 -p 2222:2222 -e MONGODB_URI="$MONGODB_URI" mean-demo:0.0.1

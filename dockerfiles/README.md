## Build container image
```
docker build -t mean-demo:0.0.1 .
```
or you can execute **build.sh ** script to build the container image
```
$ vi VERSION   # Update the image version
$ ./build.sh
```

## Run the image locally
Run the image via docker-compose
```
$ docker-compose -f docker-compose.yml up
```
Access to app page
```
open http://localhost:8080
```

## Push the image to Continer registory
```
$ ./push.sh [dockerhub account] [dockerhub password] [imageid]
ex)
$ ./push.sh <dockeruser> <pass> mean-demo:0.0.1
```

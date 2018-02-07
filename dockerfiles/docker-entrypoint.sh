#!/bin/bash

## SSHD
service ssh start

## Role switch
echo "Starting as role: ${CONTAINER_ROLE}"
if [ ${CONTAINER_ROLE} = "FRONTEND" ]; then
    ## NGINX
    cat /tmp/default.conf.templ | sed "s,TARGET_API_BASE,${TARGET_API_BASE},g" > /etc/nginx/conf.d/default.conf
    STARTUPCOMMAND="nginx -g 'daemon off;'"
elif [ ${CONTAINER_ROLE} = "BACKEND" ]; then
    STARTUPCOMMAND="npm run server-start"
else
    ## NGINX
    TARGET_API_BASE="http://localhost:3000"
    cat /tmp/default.conf.templ | sed "s,TARGET_API_BASE,${TARGET_API_BASE},g" > /etc/nginx/conf.d/default.conf
    service nginx start
    STARTUPCOMMAND="npm run server-start"
fi

echo "Running ${STARTUPCOMMAND}"
eval "exec ${STARTUPCOMMAND}"

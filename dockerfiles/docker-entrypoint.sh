#!/usr/bin/env bash

service ssh start

STARTUPCOMMAND="npm run start"
echo "Running $STARTUPCOMMAND"
eval "exec $STARTUPCOMMAND"

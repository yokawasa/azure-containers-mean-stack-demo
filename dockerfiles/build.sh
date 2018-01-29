#!/usr/bin/env bash
set -x -e

{
version=`cat ./VERSION`
tag="$version"
echo "tag=$tag"
docker build -t mean-demo:$tag .
} 2>&1 | tee build.log

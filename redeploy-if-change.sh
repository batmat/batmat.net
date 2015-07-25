#!/bin/bash

containerName=blog
containerPort=80
imageName=blog
currentSha=$( git rev-parse HEAD )


imageFullName="$imageName:$currentSha"

echo "Looking for $imageFullName image"
if docker images | grep $currentSha >/dev/null ; then
  echo "Image found, nothing to do"
else
  echo "No image found with that name, rebuild and redeploy"
  echo "building"
  docker build -t $imageFullName .
  docker kill $containerName || echo "No container to kill named $containerName"
  docker rm $containerName || echo "No container to remove named $containerName"

  echo "Starting new instance"
  docker run -d -p $containerPort:80 --name blog $imageFullName

  echo "OK"
fi

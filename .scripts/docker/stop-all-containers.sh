#!/bin/bash

PROCS=$(docker ps -q)
PROC_COUNT=$(docker ps -q | wc -l)

if ((PROC_COUNT == 0)); then
  echo "No containers active"
  exit 0
fi

echo "Stopping $PROC_COUNT Docker containers"

docker stop $(docker ps -q)

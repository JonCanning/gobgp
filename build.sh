#!/bin/bash
set -e
docker build --no-cache -t joncanning/gobgp:latest .
docker push joncanning/gobgp:latest

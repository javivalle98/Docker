#!/bin/bash
docker kill debian > /dev/null 2>&1
docker rm debian > /dev/null 2>&1
docker run -d -p 80:80 -i debian

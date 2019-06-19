#!/bin/bash
docker kill debian > /dev/null 2>&1
docker rm debian > /dev/null 2>&1
docker-compose up -d
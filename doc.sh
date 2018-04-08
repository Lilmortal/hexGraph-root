#!/bin/bash

echo "Running zookeeper..."

docker build -t zookeeper zookeeper/

echo "Zookeeper image build"

docker run -it --rm zookeeper

echo "Running zookeeper container..."

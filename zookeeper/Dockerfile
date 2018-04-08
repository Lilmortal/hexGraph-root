FROM ubuntu:latest
LABEL maintainer="Jack Tan"

RUN apt-get update

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

# Setup JAVA classpath, needed to run kafka command lines
ENV CLASSPATH /app

RUN export JAVA_HOME
RUN export CLASSPATH

WORKDIR /app/zookeeper

COPY bin/ bin
COPY config/ config
COPY libs/ libs

ENTRYPOINT ["/bin/bash", "bin/zookeeper-server-start.sh", "config/zookeeper.properties"]
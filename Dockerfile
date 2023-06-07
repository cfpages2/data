FROM ubuntu:latest
EXPOSE 8080
WORKDIR /app
COPY files/* /app/

RUN apt-get update &&\
    apt-get install -y iproute2 wget &&\
    chmod +x appdata.js

ENTRYPOINT [ "/bin/bash", "start.sh" ]

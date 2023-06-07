FROM debian11:latest
EXPOSE 8080
WORKDIR /app
COPY files/* /app/

RUN apt-get update &&\
    apt-get install -y iproute2 &&\
    wget -O cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb &&\
    dpkg -i cloudflared.deb &&\
    rm -f cloudflared.deb &&\
    chmod +x appdata

ENTRYPOINT [ "cloudflared", "" ]

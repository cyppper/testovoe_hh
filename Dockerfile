FROM phusion/baseimage:18.04-1.0.0-amd64
WORKDIR /app
COPY . .
RUN sh install.sh
ENTRYPOINT ["/sbin/my_init"]
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM golang:1.9.1

MAINTAINER Fedorenko Victor <fedorenko22116@gmail.com>

RUN apt-get update && apt-get install -y build-essential

RUN go get -v github.com/webchain-network/webchaind/...
RUN go install github.com/webchain-network/webchaind/cmd/webchaind

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 39573
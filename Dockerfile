FROM golang:1.12-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers git bash cargo

ENV GOPATH=/go
RUN mkdir -p /go/src/github.com/webchain-network/webchaind

WORKDIR /go/src/github.com/webchain-network

RUN git clone https://github.com/webchain-network/webchaind

WORKDIR /go/src/github.com/webchain-network/webchaind

RUN make cmd/webchaind

# Pull webchaind into a second stage deploy alpine container
FROM alpine:latest

RUN apk update && apk add --no-cache ca-certificates rust-stdlib bash
COPY --from=builder /go/src/github.com/webchain-network/webchaind/bin/webchaind /usr/sbin/

COPY docker-entrypoint.sh /usr/bin/
RUN chmod 755 /usr/bin/docker-entrypoint.sh

EXPOSE 39573 31440 31440/udp
ENTRYPOINT ["docker-entrypoint.sh"]

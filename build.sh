#!/bin/sh
set -e
apk add --update go build-base git ca-certificates
mkdir -p /go/src/github.com/gliderlabs
cp -r /src /go/src/github.com/gliderlabs/logspout
cd /go/src/github.com/gliderlabs/logspout
export GOPATH=/go
go get
go build -ldflags "-X main.Version=$1" -o /bin/logspout
apk del go git build-base
rm -rf /go /var/cache/apk/* /root/.glide

# backwards compatibility
ln -fs /tmp/docker.sock /var/run/docker.sock

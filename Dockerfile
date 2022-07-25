FROM golang:alpine as builder

WORKDIR /go/src/github.com/imjcw/apis/

COPY . ./

RUN apk --no-cache add git; \
    go install; \
    go build -ldflags '-s -w' -o app; \
    mkdir /tmp/scripts; \
    git clone https://github.com/imjcw/scripts.git /tmp/scripts; \
    mv /tmp/scripts/files ./; \
    ls -al

FROM alpine:latest as prod

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=0 /go/src/github.com/imjcw/apis/app .

CMD ["./app"]

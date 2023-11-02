FROM alpine:3.18.4

ENV destination foo

WORKDIR /opt/

RUN apk upgrade --update-cache --available && \
    apk add openssl && \
    rm -rf /var/cache/apk/*

COPY tls-n-ciphers.sh .

ENTRYPOINT sh ./tls-n-ciphers.sh $destination
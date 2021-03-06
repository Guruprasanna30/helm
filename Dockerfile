FROM alpine

ENV HELM_VERSION="v3.6.3"

RUN apk add --update ca-certificates git wget make bash \
 && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-arm64.tar.gz \
 && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -rf /helm-${HELM_VERSION}-linux-amd64.tar.gz linux-amd64 \
 && addgroup -g 1000 -S helm \
 && adduser -u 1000 -h /home/helm -D -S -G helm helm \
 && rm /var/cache/apk/*  

USER helm

RUN helm init --client-only

USER root

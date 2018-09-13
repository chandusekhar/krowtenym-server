FROM nginx:stable-alpine
LABEL maintainer "Phanuphat Cholatda"

ARG proxy

ENV HTTP_PROXY="$proxy"
RUN apk update && \
    apk upgrade && \ 
    apk add ca-certificates && update-ca-certificates && \
    apk add --update tzdata
ENV TZ=Asia/Bangkok

COPY nginx.conf /etc/nginx
COPY conf /root/

RUN rm -rf /var/cache/apk/*
EXPOSE 4200 6444 6443 6090 6190 6099 6199 6080 6180
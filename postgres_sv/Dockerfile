FROM postgres:9.6-alpine
LABEL maintainer "Phanuphat Cholatda"

ARG proxy

ENV HTTP_PROXY="$proxy"
RUN apk update && \
    apk upgrade && \ 
    apk add ca-certificates && update-ca-certificates && \
    apk add --update tzdata
ENV TZ=Asia/Bangkok
RUN rm -rf /var/cache/apk/*
EXPOSE 5432
 
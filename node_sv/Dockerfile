FROM node:6.11.2-alpine
LABEL maintainer "Phanuphat Cholatda"
WORKDIR /mnt/source/app/root/src/bin
ARG proxy
ARG fuse_dev_ip
ARG fuse_name
ENV HTTP_PROXY="$proxy"
ENV FUSE_DEV_IP="$fuse_dev_ip"
ENV FUSE_NAME="$fuse_name"

RUN apk update && \
    apk upgrade && \ 
    apk add ca-certificates && update-ca-certificates && \
    apk add tzdata && \ 
    apk add iptables
ENV TZ=Asia/Bangkok

RUN rm -rf /var/cache/apk/*

EXPOSE 443
# RUN npm install pm2 -g

#CMD ["pm2","start", "./src/bin/www"]
CMD iptables -t nat -A OUTPUT -d "$FUSE_DEV_IP" -j DNAT --to-destination $(ping $FUSE_NAME -c 1 | awk FNR==2{'print $4'} | sed 's/://g') ; ping localhost ; 
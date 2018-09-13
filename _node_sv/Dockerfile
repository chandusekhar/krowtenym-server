FROM node:6.11.2-alpine
LABEL maintainer "Phanuphat Cholatda"
WORKDIR /app
ARG proxy
ARG backend_address
ARG backend_service_name
ENV HTTP_PROXY="$proxy"
ENV BACKEND_ADDRESS="$backend_address"
ENV BACKEND_SERVICE_NAME="$backend_service_name"

RUN apk update && \
    apk upgrade && \ 
    apk add ca-certificates && update-ca-certificates && \
    apk add tzdata && \ 
    apk add iptables
ENV TZ=Asia/Bangkok

RUN rm -rf /var/cache/apk/*

EXPOSE 3000
RUN npm install nodemon -g

CMD /app/script/start.sh
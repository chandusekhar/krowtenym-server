FROM java:8-jre-alpine
LABEL maintainer "Phanuphat Cholatda"
WORKDIR /opt/install

ARG proxy
ENV HTTP_PROXY="$proxy"
ENV TZ=Asia/Bangkok
#TimeZone Setup
RUN apk update && \
    apk upgrade && \
    apk add ca-certificates && update-ca-certificates && \
    apk add --update tzdata && \
    rm -rf /var/cache/apk/*

#insatll jBoss Server
COPY install /opt/install
RUN java -jar jboss-eap-6.4.0-installer.jar auto.xml -variablefile auto.xml.variables && \
    cd /opt/install/jboss-cli && \
    /opt/EAP-6.4.0/bin/jboss-cli.sh --file=cli_script.txt && \
    cd /opt/EAP-6.4.0 && \
    java -jar /opt/install/fuse-eap-installer-6.3.0.redhat-187.jar && \
    sed -i 's/127.0.0.1/0.0.0.0/g' /opt/EAP-6.4.0/standalone/configuration/standalone.xml && \
    rm -rf /opt/install /opt/EAP-6.4.0/standalone/configuration/standalone_xml_history/current



EXPOSE 8080 9990 9999
CMD /opt/jboss-cli/start_server.sh

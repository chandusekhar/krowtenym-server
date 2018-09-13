#!/bin/sh

JBOSS_HOME=/opt/EAP-6.4.0

cp /opt/jboss-cli/utilities-1.0.0.jar /opt/EAP-6.4.0/modules/th/co/ais/mynetwork/module/utilities/main
/opt/EAP-6.4.0/bin/standalone.sh 
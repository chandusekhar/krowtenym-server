#!/bin/sh

jbossCliPath=/opt/EAP-6.4.0/bin/jboss-cli.sh

/opt/jboss-cli/stop_all_services.sh

$jbossCliPath 'connect,shutdown'




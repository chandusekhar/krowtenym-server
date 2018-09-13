#!/bin/sh

jbossCliPath=/opt/EAP-6.4.0/bin/jboss-cli.sh

appList=$("$jbossCliPath" "connect,deployment-info" | awk 'FNR>1{print $2}')

cliCommand='connect'
for app in $appList
do
   cliCommand="$cliCommand,/deployment=$app:undeploy"
done

$jbossCliPath $cliCommand

$jbossCliPath connect,deployment-info

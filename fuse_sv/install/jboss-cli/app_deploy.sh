#!/bin/sh

jbossCliPath=/app/usr/jboss-eap-6.4/bin/jboss-cli.sh

appList=$(ls -l | grep .jar$ | awk '{print $9}')

cliCommand='connect'
for app in $appList
do
   cliCommand="$cliCommand,\"deploy ./$app --force\""
done

echo $jbossCliPath $cliCommand
$jbossCliPath $cliCommand

$jbossCliPath connect,deployment-info
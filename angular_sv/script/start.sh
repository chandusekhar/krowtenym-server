# reverse proxy

backend_ip=$(ping $BACKEND_SERVICE_NAME -c 1 | awk FNR==2{'print $4'} | sed 's/://g')

sysctl -w net.ipv4.conf.all.route_localnet=1
iptables -t nat -A OUTPUT -p tcp --dport 3000 -j DNAT --to-destination $backend_ip:3000
iptables -t nat -A POSTROUTING -j MASQUERADE

cd /app/source/source/web/root
npm install
ng serve --host 0.0.0.0 
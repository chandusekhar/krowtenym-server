# revert proxy
iptables -t nat -A OUTPUT -d "$BACKEND_ADDRESS" -j DNAT --to-destination $(ping $BACKEND_SERVICE_NAME -c 1 | awk FNR==2{'print $4'} | sed 's/://g')

cd /app/source/source/app/root
npm install
npm start
#!/usr/bin/env sh

cat <<- EOF > /tmp/radsecproxy.conf
# auto-generated config file from /etc/config/radsecproxy
    ListenUDP '$RS_LISTENUDP'
client '$RS_CLIENT_NAME' {
    type 'udp'
    secret '$RS_CLIENT_SECRET'
}
server '$RS_SERVER_ADDRESS' {
    type 'udp'
    secret '$RS_SERVER_SECRET'
}
realm '*' {
    server '$RS_REALM_ANY_SERVER'
}
EOF

exec /root/radsecproxy/radsecproxy -c /tmp/radsecproxy.conf -f

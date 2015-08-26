sudo iptables -t nat -A SHADOWSOCKS -p tcp -d $1 -j REDIRECT --to-ports $2
echo $1,$2

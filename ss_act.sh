#!/bin/sh
sudo iptables -t nat -N SHADOWSOCKS
ipmask_list_file=$1

while read -r line
do
   sudo iptables -t nat -A SHADOWSOCKS -p tcp -d $line -j REDIRECT --to-ports $2 
   echo $line,$2
done < $ipmask_list_file
sudo iptables -t nat -A PREROUTING -p tcp -j SHADOWSOCKS
sudo iptables -t nat -A OUTPUT -p tcp -j SHADOWSOCKS

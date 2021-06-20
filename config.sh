#!/bin/bash

host_ip=$(hostname  -i)

iptables -I INPUT -p tcp -m tcp --dport 9100 -j DROP
iptables -I INPUT -s "$host_ip"/32 -p tcp -m tcp -j ACCEPT
iptables -I INPUT -s 127.0.0.0/8 -p tcp -m tcp -j ACCEPT
iptables -I INPUT -s 10.0.0.0/8 -p tcp -m tcp -j ACCEPT
iptables -I INPUT -s 172.16.0.0/12 -p tcp -m tcp -j ACCEPT
iptables -I INPUT -s 192.168.0.0/16 -p tcp -m tcp -j ACCEPT



iptables -I DOCKER-USER -p tcp -m tcp --dport 9090 -j DROP
iptables -I DOCKER-USER -p tcp -m tcp --dport 80 -j DROP
iptables -I DOCKER-USER -p tcp -m tcp --dport 9093 -j DROP
iptables -I DOCKER-USER -p tcp -m tcp --dport 8080 -j DROP
iptables -I DOCKER-USER -s "$host_ip"/32 -p tcp -m tcp -j ACCEPT
iptables -I DOCKER-USER -s 127.0.0.0/8 -p tcp -m tcp -j ACCEPT
iptables -I DOCKER-USER -s 10.0.0.0/8 -p tcp -m tcp -j ACCEPT
iptables -I DOCKER-USER -s 172.16.0.0/12 -p tcp -m tcp -j ACCEPT
iptables -I DOCKER-USER -s 192.168.0.0/16 -p tcp -m tcp -j ACCEPT

iptables-save > /etc/iptables/rules.v4
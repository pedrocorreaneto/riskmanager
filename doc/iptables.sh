#!/bin/bash
#Configurações para permitir outros dispositivos acessarem ao site
#must be run as root

iptables -v -I INPUT 1 -p tcp --dport 3000 -j ACCEPT
iptables -v -I OUTPUT 1 -p tcp --sport 3000 -j ACCEPT

echo -e "lembre-se de usar:\n\$ rails s -b 0.0.0.0"

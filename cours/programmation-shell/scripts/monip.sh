#!/bin/bash
INTERFACE=$(ip -c a | grep -E '.+: ' | awk '{print $2}')
IP=$( ip -c a | grep "\." | awk '{print $2}'| tr -s '\n' ', '| sed 's/, $//')

echo -e "voilà les interfaces:\n$INTERFACE \net les ip associés $IP"

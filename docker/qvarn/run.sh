#!/bin/bash

set -o errexit

RSA_KEY=$(cat /keys/rsa.pub)

sed -i \
  -e "s#GLUU_KEY#${RSA_KEY}#g" \
  /etc/qvarn/qvarn.conf

# wait for postgres
sleep 5

if [ -e /qvarnboot ]
then 
  exec uwsgi --ini /etc/uwsgi/apps-available/qvarn.ini
else
  /usr/bin/qvarn-backend-vaultit --config=/etc/qvarn/qvarn.conf --prepare-storage && touch /qvarnboot
  exec uwsgi --ini /etc/uwsgi/apps-available/qvarn.ini  
fi

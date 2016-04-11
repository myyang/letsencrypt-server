#!/bin/bash 

echo "Re-download /tmp/lets ..."
rm -rf /tmp/lets
git clone https://github.com/lukas2511/letsencrypt.sh /tmp/lets 

echo "Copy to /letsencrypt.sh"
cp /tmp/lets/letsencrypt.sh /letsencrypt.sh/

echo "Start cronjob"
crontab /letsencrypt.sh/service-cron && cron

for p in DOMAIN_NAME 
do
    eval value=\$$p
    sed -i "s|{{${p}}}|${value}|g" /etc/nginx/conf.d/default.conf
done

nginx -g 'daemon off;'

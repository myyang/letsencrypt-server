#!/bin/bash 

echo "Re-download /tmp/lets ..."
rm -rf /tmp/lets
curl -XGET -L https://github.com/lukas2511/letsencrypt.sh/archive/master.zip -o /tmp/lets.zip
unzip /tmp/lets.zip -d /tmp

echo "Copy to /letsencrypt.sh"
cp /tmp/letsencrypt.sh-master/letsencrypt.sh /letsencrypt.sh/

echo "Start cronjob"
crontab /letsencrypt.sh/service-cron && cron

for p in DOMAIN_NAME 
do
    eval value=\$$p
    sed -i "s|{{${p}}}|${value}|g" /etc/nginx/conf.d/default.conf
done

nginx -g 'daemon off;'

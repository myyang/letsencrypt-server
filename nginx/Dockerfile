from nginx:latest

maintainer ymy1019@gmail.com

run apt-get update && apt-get install -y curl cron unzip

copy nginx.conf /etc/nginx/
copy default.conf /etc/nginx/conf.d/default.conf

run mkdir -p /var/www/letsencrypt
copy letsencrypt.sh /letsencrypt.sh
run ln -s /letsencrypt.sh/certs /etc/nginx/ssl

copy start-service.sh /
cmd ["/start-service.sh"]

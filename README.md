# letsencrypt-server

## How to use

1. Modify domain in `nginx/envs` and `nginx/letsencrypt.sh/domains.txt` and email in `nginx/letsencrypt.sh/config.sh`
2. Build docker and run with `docker-compose up -d`
3. Request ssl `docker exec -it letsencryptserver_nginx_1 /letsencrypt.sh/letsencrypt.sh -c`
4. Find certifications in `/letsencrypt.sh/certs`

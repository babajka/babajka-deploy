# !/bin/bash
set -e

sudo rm /etc/nginx/sites-enabled/prod.wir.by
sudo ln -s /etc/nginx/sites-available/stub.wir.by /etc/nginx/sites-enabled/

sudo nginx -t

sudo systemctl reload nginx

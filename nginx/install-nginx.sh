#!/bin/bash

sudo apt-get -y install curl gnupg2 ca-certificates lsb-release ubuntu-keyring
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
    | sudo tee /etc/apt/preferences.d/99nginx

sudo apt-get -y update
sudo apt-get -y install nginx

# user
usermod -aG www-data nginx
usermod -aG www-data $USER

sudo chown root -R /usr/share/nginx
sudo chgrp www-data -R /usr/share/nginx
sudo setfacl -d -m g::rwX /usr/share/nginx
sudo chmod ug+s -R /usr/share/nginx

# htdocs
ln -s /usr/share/nginx/html ~/htdocs

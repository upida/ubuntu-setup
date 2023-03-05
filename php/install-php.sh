#!/bin/bash

apt-get -y install software-properties-common ca-certificates lsb-release apt-transport-https
add-apt-repository ppa:ondrej/php -y
apt-get -y install php{7.4,8.0,8.1,8.2}-{xml,mbstring,curl,mysql,pdo,gd,cli,common,fpm,zip}


php_versions=("7.4" "8.0" "8.1" "8.2")
for i in "${php_versions[@]}"
do
   : 
   # do whatever on "$i" here
   sudo update-alternatives --install /usr/bin/php php /usr/bin/php$i 1
done


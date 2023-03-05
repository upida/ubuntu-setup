password=SalmakuYangTercintah😍🥰

# mysql 5.7
sudo docker run -p 33080:3306 -d --name mysql8 -e MYSQL_ROOT_PASSWORD=$password -d mysql:8

# mysql 8
sudo docker run -p 33057:3306 -d --name mysql5.7 -e MYSQL_ROOT_PASSWORD=$password -d mysql:5.7


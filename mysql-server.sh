#!/usr/bin/zsh


docker run --name mysql-container -p 3306:3306 -e MYSQL_ROOT_PASSWORD=hallo -d mysql:8.0
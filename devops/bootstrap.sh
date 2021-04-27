#!/bin/bash
echo "------------ Starting provisioning script -------------------------------------"

. /vagrant/devops/config

sudo apt-get update && sudo apt-get -y upgrade

echo "------------ MySQL ------------------------------------------------------------"
sudo apt-get install -y libmysqlclient-dev
echo "mysql-server mysql-server/root_password password $DBPASSWD" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DBPASSWD" | sudo debconf-set-selections
sudo apt-get install -y mysql-server-5.7
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to 'root'@'%' identified by '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "ALTER DATABASE $DBNAME DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"


echo "---------------- RVM -----------------------------------------------"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s $1

source $HOME/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh
rvm use --default --install 3.0.0
rvm cleanup all

echo "------------ Install project gems ---------------------------------------------"
cd /vagrant
bundle

#!/bin/bash
echo "------------ Starting provisioning script -------------------------------------"

. /vagrant/devops/config

sudo apt-get update && sudo apt-get -y upgrade

echo "------------------NodeJS ------------------------------------------"
curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get install -y nodejs

npm install --global yarn

echo "---------------- RVM -----------------------------------------------"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s $1

source $HOME/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh
rvm use --default --install 3.0.0
rvm cleanup all

echo "------------ Install project gems ---------------------------------------------"
cd /vagrant
bundle

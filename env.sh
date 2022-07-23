#!/bin/bash

#Install curl vim wget snap
sudo apt update
sudo apt install -y vim wget
sudo apt install -y curl
sudo apt install snapd

# Install Chrome browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Install vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders

# Install sublime
sudo apt update
sudo apt install apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt update
sudo apt install sublime-text

# Install slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo apt install ./slack-desktop-*.deb

# Install NVM & Node & bower && vue
sudo apt-get install build-essential libssl-dev
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.profile
nvm install v12.18.2
# change .npm and .config owner to current user
sudo chown -R $USER:$GROUP ~/.npm
sudo chown -R $USER:$GROUP ~/.config
npm install -g bower
npm install -g @vue/cli

# Install upwork
wget https://updates-desktopapp.upwork.com/binaries/v5_4_2_2_18294613b3a84769/upwork_5.4.2.2_amd64.deb
sudo dpkg -i upwork_5.4.2.2_amd64.deb
sudo apt-get -f install

# Install Docker - ubuntu
sudo apt-get install     apt-transport-https     ca-certificates     curl     software-properties-common
sudo apt-get install     linux-image-extra-$(uname -r)     linux-image-extra-virtual
sudo apt-get update
sudo apt-get install     apt-transport-https     ca-certificates     curl     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce
apt-cache madison docker-ce
# Making current user in docker group
sudo groupadd docker
sudo usermod -aG docker $USER
sudo apt-get install -f

# Install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install autoenv
git clone https://github.com/hyperupcall/autoenv.git ~/.autoenv
echo 'source ~/.autoenv/activate.sh' >> ~/.bashrc
source ~/.bashrc

# Install git
sudo apt install git

# Install PostMan
sudo snap install postman

# Install nodemon .. less
npm install -g less
npm install -g nodemon
npm install -g grunt-cli

# Install timedoctor
wget https://s3.amazonaws.com/sfproc-downloads/3.0.83/linux/ubuntu-18.04/interactive/timedoctor2-setup-3.0.83-linux-x86_64.run
sudo apt-get install libappindicator1
sudo chmod +x timedoctor2-setup-3.0.83-linux-x86_64.run
./timedoctor-setup-1.5.1.0-linux-x86_64.run

# Install workbench
sudo apt update
sudo apt install mysql-workbench

# Install Pgadmin 
# Add PostgreSQL APT repository
# During installation, you’re asked to configure initial user account. Provide email address.
# also set admin password
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RELEASE=$(lsb_release -cs) echo "deb http://apt.postgresql.org/pub/repos/apt/ ${RELEASE}"-pgdg main | sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt update
sudo apt -y install pgadmin4 pgadmin4-apache2

#!/bin/sh

sudo apt-add-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
sudo apt-add-repository "deb http://cran.rstudio.com/bin/linux/ubuntu $(lsb_release -sc)"
sudo apt-add-repository ppa:alessandro-strada/ppa
sudo apt-add-repository ppa:cassou/emacs
sudo apt-add-repository ppa:nesthib/weechat-stable

sudo apt-get update

sudo apt-get install account-plugin-irc alpine apache2-utils bitlbee chromium-browser ctags-exuberant curl default-jre default-jre docker emacs24 exuberant-ctags git git-gui gitstats gnome-tweak-tool google-drive-ocamlfuse gparted inkscape iotop java6-runtime jitsy keepass2 libcurl4-openssl-dev libgnutls-dev libgnutls26 libmysqlclient-dev libxml2-dev libxslt1-dev lxc-docker lynx mixxx mmpong-gl mongodb-clients mongodb-server mongodb-server monit mplayer mysql-server ncurses-term nmap openjdk-7-jre openssh-server p7zip p7zip-full p7zip-rar pwgen python python-dbus python-indicate python-jabber python-notify2 python-pymongo r-base r-recommended r-base-dev redis-server ruby2.0 skype tmux traceroute tree unclutter vagrant weechat weechat-plugins weechat-scripts whois wmctrl xclip xkpassphrase
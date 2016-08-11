#!/bin/bash
# check os
#
#    . .-.-.-  .    -.-. ..-.---. . .
#   /_\|-' |  /_\    | |\|`-. |/_\| |
#  '   '`--'-'   '  -'-' '`-' '   '-'-'
#  dont forget to run server as  aria2c --enable-rpc --rpc-listen-all --rpc-secret helloworldhelloworld
#  Author: James Campbell
#  Date working: May 19th 2016
#  What: Installs nginx, aria2, pyaria2, and webui-aria2 in one swoooooooooop.
#  Note: Works for linux (Debian-based) and OSX but NOT WINDOWS!
#  Contact: use my key https://www.jamescampbell.us/key.asc: and email me james@jamescampbell.us
#
#  RELEVANT LINKS
#  web wrapper: https://github.com/ziahamza/webui-aria2
#  documentation: https://aria2.github.io/manual/en/html/index.html
#  python3 module for aria2 https://github.com/kevinxhuang/pyaria2
#
#
echo "  __  ___ _  __    _ __  _   __ _____ __  _   _    ";
echo " /  \| _ \ |/  \  | |  \| |/' _/_   _/  \| | | |   ";
echo "| /\ | v / | /\ | | | | ' |\`._\`. | || /\ | |_| |_  ";
echo "|_||_|_|_\_|_||_| |_|_|\__||___/ |_||_||_|___|___| ";
echo "";
echo " ___  _          _   __   _     ____ __      __    __   _     ___  ___  ____ _    _    ";
echo "| |_)\ \_/      | | / /\ | |\/|| |_ ( (\`    / /\`  / /\ | |\/|| |_)| |_)| |_ | |  | |   ";
echo "|_|_) |_|     \_|_|/_/--\|_|  ||_|___)_)    \_\_,/_/--\|_|  ||_|  |_|_)|_|__|_|__|_|__ ";
echo "";

# OSX
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
# check if homebrew installed
if which brew 2> /dev/null; then
    brewLocation=`which brew`
    appLocation=`brew --prefix`
    echo "Homebrew is installed in $brewLocation"
    echo "Homebrew apps are run from $appLocation"
    brew update
    brew install aria2
    # check if directory already exists and do git pull if so and restart server
    ariadirectory=`~/projects/ariaweb/`
    if cd ~/projects/ariaweb 2> /dev/null; then
        cd ~/projects/ariaweb
        echo "since you already have it installed, just updating the repo charles."
        git pull
        secrets="helloworldhelloworldhelloworld"
        echo "now starting up the server with password $secrets..."
        echo "location will be http://aria.local in browser or 127.0.0.1:6800 if you suck at nginx"
        aria2c --enable-rpc --rpc-listen-all --rpc-secret helloworldhelloworldhelloworld
        exit 0
    else
        pip3 install pyaria2 # might need sudo depending on permissions and also might need pip vs pip3 -jc
        mkdir ~/projects && cd ~/projects
        git clone https://github.com/ziahamza/webui-aria2.git ariaweb
        sudo echo "127.0.0.1 aria.local" >> /etc/hosts
        echo "installed pyaria2 and cloned in ariaweb, setup nginx vhost and should be gtg"
    fi
else
   echo "Can't find Homebrew"
   echo "To install it open a Terminal window and type :"
   echo /usr/bin/ruby -e \"\$\(curl\ \-fsSL\ https\:\/\/raw\.github\.com\/Homebrew\/homebrew\/go\/install\)\"
   exit 0
fi

# LINUX
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    # install aria2 via apt-get
    sudo apt-get install aria2 -y
    if which nginx 2> /dev/null; then
        $nginxlocation=`which nginx`
        echo "must be added to a new file in $nginxlocation/sites-available as aria.local and then sudo ln -s to $nginxlocation/sites-enabled"
        echo "a default nginx vhost file is included commented out in the bottom of this script file"
    ariadirectory=`~/projects/ariaweb/`
    if cd ~/projects/ariaweb 2> /dev/null; then
        cd ~/projects/ariaweb
        echo "since you already have it installed, just updating the repo charles."
        git pull
        secrets="helloworldhelloworldhelloworld"
        echo "now starting up the server with password $secrets..."
        echo "location will be http://aria.local in browser or 127.0.0.1:6800 if you suck at nginx"        aria2c --enable-rpc --rpc-listen-all --rpc-secret helloworldhelloworldhelloworld
        exit 0
    else
        pip3 install pyaria2 # might need sudo depending on permissions and also might need pip vs pip3 -jc
        mkdir ~/projects && cd ~/projects
        git clone https://github.com/ziahamza/webui-aria2.git ariaweb
        sudo echo "127.0.0.1 aria.local" >> /etc/hosts
        echo "installed pyaria2 and cloned in ariaweb, setup nginx vhost and should be gtg"
    fi
    sudo echo "127.0.0.1 aria.local" >> /etc/hosts
    else
        sudo apt-get install nginx nginx-extras -y
        echo "installed nginx, please run script again..."
        exit 0
    fi

# WINDOWS
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
    echo "Windows installer not configured yet, switch OSes or wait patiently for the world to change."
    exit 0
fi

### nginx aria.local vhost file ### BONUS!
#server {
#    listen 80;
#    server_name aria.local;
#    root /home/[youruser]/projects/ariaweb/;
#    ssl_protocols TLSv1.2;
#    index index.html index.htm index.php;
#    charset utf-8;
#    location / {
#        try_files $uri $uri/ /static/$uri /static/$uri/index.html /static/ $uri /index.php?$query_string;
#    }
#    error_log  /[path to your log stores]/aria.local-error.log error;
#    error_page 404 /index.php;
#    location ~ \.php$ {
#        fastcgi_split_path_info ^(.+\.php)(/.+)$;
#        fastcgi_pass 127.0.0.1:6800;
#        fastcgi_index index.php;
#        include fastcgi_params;
#    }
#    location ~ /\.ht {
#        deny all;
#    }
#}
#
exit 1

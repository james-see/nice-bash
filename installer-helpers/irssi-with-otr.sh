mkdir ~/Downloads
cd ~/Downloads
wget https://otr.cypherpunks.ca/libotr-4.1.1.tar.gz
tar -xzf libotr-4.1.1.tar.gz
cd libotr-4.1.1
sudo apt-get install automake libtool autoconf irssi-dev tor git bitlbee-plugin-otr irssi-plugin-otr libgcrypt-dev gcc libglib2.0-dev -y
./configure --prefix=/usr && make && sudo make install
mkdir ~/projects
cd ~/projects
git clone https://github.com/cryptodotis/irssi-otr.git
cd irssi-otr
./bootstrap
export LC_ALL=en_US.UTF-8
./configure --prefix="/usr"
make && sudo make install
cd /usr/lib/irssi/modules
sudo cp libotr.so /usr/lib/x86_64-linux-gnu/irssi/modules/
cd ~
openssl req -nodes -newkey rsa:2048 -keyout nick.key -x509 -days 3650 -out nick.cer
chmod 400 nick.key
cat nick.cer nick.key > nick.pem
mkdir ~/.irssi
mkdir ~/.irssi/certs
sudo mv nick.{key,cer,pem} ~/.irssi/certs
# irssi
# within irssi then do /load otr and it should work
# first run in irssi do:
# /connect OFTC
# /msg nickserv identify [pass]
# /server remove irc.oftc.net
# /network add OFTC
# /server add -auto -ssl -ssl_cert ~/.irssi/certs/nick.pem -ssl_verify -network OFTC irc.oftc.net 6697
# /disconnect OFTC
# /connect OFTC
# /msg nickserv cert add
# /reconnect

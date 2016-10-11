```
           /$$                           /$$                           /$$      
          |__/                          | $$                          | $$      
 /$$$$$$$  /$$  /$$$$$$$  /$$$$$$       | $$$$$$$   /$$$$$$   /$$$$$$$| $$$$$$$ 
| $$__  $$| $$ /$$_____/ /$$__  $$      | $$__  $$ |____  $$ /$$_____/| $$__  $$
| $$  \ $$| $$| $$      | $$$$$$$$      | $$  \ $$  /$$$$$$$|  $$$$$$ | $$  \ $$
| $$  | $$| $$| $$      | $$_____/      | $$  | $$ /$$__  $$ \____  $$| $$  | $$
| $$  | $$| $$|  $$$$$$$|  $$$$$$$      | $$$$$$$/|  $$$$$$$ /$$$$$$$/| $$  | $$
|__/  |__/|__/ \_______/ \_______/      |_______/  \_______/|_______/ |__/  |__/
                                                                                
```

my fav collection of useful, fun, weird bash scripts. enjoy.

all of these tested and working on Ubuntu 16 or OSX if noted in script itself.

# folders

### bitcoin-related

* bitbalance - lookup current balance for any wallet

### recon

* wholook - do a whois and nslookup in one command, example `./wholook.sh jamescampbell.us`
* gpg me - lookup an email for a public key, example `./gpgme.sh james@jamescampbell.us`
* get-macs - get all mac addresses on curently connect LAN or WLAN (can do > out.html)

### installers

* aria2 - aria2 is a download manager. this installs and sets up the web gui for it

* [irssi](https://irssi.org) with otr - irssi is the premier command line irc client. this ensures that OTR functionality works

### hide

* mac-mask - install spoofmask and runs on every restart to spoof your mac address on Apple computers running OSX using [SpoofMac](https://github.com/feross/SpoofMAC)
* change-mac-address - quickly change your mac address for your wifi adapter (OSX required), run as sudo
* give-me-names - get either usernames or a real name for fun & profit
* eraseme - securely erases (shreds) any file you put in front of it regardless of OS

### design

* red-bar - how to print colors in bash, red, yellow, blue, green, light blue, white colors

### secure

* passme - generate a new 64 string password using /dev/urandom (tested on OSX)

### sysadmin

* startmysql - checks if mysql running as a service and if not starts it (great for crontab check once an hour for low-resource VPS's that tend to crash out mysql randomly)



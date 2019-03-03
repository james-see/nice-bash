# Gets GEO using coredataservices in OSX (working as of January 2018 if you allow app in security settings to access location)
# requires homebrew 
# creates a location.log file with all relevant info
clear # always clear before your app starts man
echo """
╔═════════════════════════════╗
║                             ║
║     ◒◒◒◒◒◒  ◒◒◒◒◒  ◒◒◒◒◒    ║
║     ◒       ◒      ◒   ◒    ║
║     ◒  ◒◒◒  ◒◒◒    ◒   ◒    ║
║     ◒    ◒  ◒      ◒   ◒    ║
║     ◒◒◒◒◒◒  ◒◒◒◒◒  ◒◒◒◒◒    ║
║                             ║
║      ◒◒◒  ◒◒◒  ◒◒◒◒◒        ║
║      ◒ ◒◒◒◒ ◒  ◒            ║
║      ◒  ◒◒  ◒  ◒◒◒          ║
║      ◒      ◒  ◒            ║
║      ◒      ◒  ◒◒◒◒◒        ║
║                             ║
╚═════════════════════════════╝
""";
echo -e "\033[0;32m[*]\033[0m checking and installing corelocationcli via homebrew as necessary"
sleep 2;
if brew cask ls --versions corelocationcli > /dev/null; then
  # The package is installed
  echo -e "\033[0;34m[*]\033[0m corelocationcli already installed, skipping..."
  sleep 2
else
  # The package is not installed
  brew cask install corelocationcli
fi
./CoreLocationCLI -json > location.log
echo "," >> location.log
echo -e "\033[0;32m[*]\033[0m getting ip address data and writing to location.log"
sleep 2;
curl -s httpbin.org/ip >> location.log
echo -e "\033[0;32m[*]\033[0m data gathering complete, here is contents of location.log:"
cat location.log
sleep 2;
echo """
◎◎◎◎◎◎◎◎◎◎◎◎◎
┌───────────┐
│  goodbye  │
└───────────┘
◎◎◎◎◎◎◎◎◎◎◎◎◎
""";

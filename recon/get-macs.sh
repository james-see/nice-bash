printf "<html>\n<title>LAN IPs and their MACs</title>\n<body>\n"
arp -a | awk '{print $2,$4}' | awk -F'[().: ]' '{print $2"."$3"."$4"."$5,$6,$7":"$8":"$9":"$10":"$11":"$12,"<a href=\"http://standards.ieee.org/cgi-bin/ouisearch?"$7$8$9"\">IEEE OUI Lookup "$7"-"$8"-"$9"</a><br>"}'
printf "\n</body>\n</html>\n"

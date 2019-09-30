#!/bin/bash
# Author: James Campbell
# Date: September 2019
# What: swagger.json to pdf
# assumes Mac OS #TODO make it also work for Linux & Windows
if [ -z $1 ]; then
    echo "Must run command with the url that has swagger.json at the end point."
    exit 1
else
    URL="$1"  # set the URL of your swagger compatible api path
fi
### install pre-requisites ###
# curl
if [[ ! `curl --help` ]]; then
    brew install curl
fi
# swagger2markup
if [[ ! `swagger2markup help` ]]; then
    brew install swagger2markup-cli
fi
# asciidoctor
if [[ ! `asciidoctor-pdf --help` ]]; then
    gem install asciidoctor-pdf --pre
fi

### Make the donuts ###
# get the json
curl -O "$URL/swagger.json" --insecure
# convert json to adocs
swagger2markup convert -i swagger.json -d ./adocs
# combine all adocs into one
find adocs/ -name '*.adoc' -exec cat {} \; > combined.adoc
# convert adoc to pdf
asciidoctor-pdf -b pdf -o api-documentation.pdf combined.adoc
rm -rf adocs/
read -r -p "Would you like to open pdf now? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        open api-documentation.pdf
        ;;
    *)
        echo "api-documentation.pdf created"
        ;;
esac
exit 0


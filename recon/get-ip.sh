#!/bin/bash
# This should work on OSX and Debian out of the box after hgrep is installed (sudo npm install -g hgrep)
curl https://ipof.me | hgrep -a href a | cut -d'/' -f6

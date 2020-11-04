#!/bin/bash
if brew ls --versions lsof > /dev/null; then
    echo "lsof command found, scanning..."
    sudo lsof -iTCP -sTCP:LISTEN -n -P
else
    brew install lsof
    echo "run again now that lsof is installed"
fi



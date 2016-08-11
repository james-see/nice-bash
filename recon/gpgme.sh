#!/bin/bash
# Author: James Campbell
# What: lookup an email in gpg key server to see if there is a public key associated
# Example: ./gpgme.sh james@jamescampbell.us
uemail=$1
gpg --keyserver hkp://pool.sks-keyservers.net --search-keys $uemail

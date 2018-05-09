#!/bin/bash
# What: Uses built-in wordlist to generate list of random names
clear
read -p "how many names do you need? [1]: " total
totaldef=1
total="${total:-${totaldef}}"
command -v gshuf >/dev/null 2>&1 || { echo >&2 "I require gshuf but it's not installed. On OSX, install via brew install coreutils."; exit 1; }
gshuf -n${total} /usr/share/dict/words

#!/bin/bash
# What: Uses built-in wordlist to generate list of random names
clear
read -p "how many names do you need? [1]: " total
totaldef=1
total="${total:-${totaldef}}"
gshuf -n${total} /usr/share/dict/words

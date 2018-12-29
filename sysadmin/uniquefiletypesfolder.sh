#!/bin/bash
ls -R1 | egrep -C 0 "[^\.]+\.[^\./:]+$" | sed 's/.*\.//' | sort -u


#!/bin/bash
ls -R1 | rg -C 0 "[^\.]+\.[^\./:]+$" | sed 's/.*\.//' | sort -u


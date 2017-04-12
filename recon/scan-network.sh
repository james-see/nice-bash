#!/bin/bash
nmap $1 -n -sn | grep report | awk '{print $5}'


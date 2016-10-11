#!/bin/bash
if [[ ! "$(service mysql status)" =~ "start/running" ]]
then
    service mysql start
fi

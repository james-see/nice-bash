#!/bin/bash
# tested on High Sierra OSX
totalprocesses="$(ps -ax | wc -l)"
echo "Total processes: ${totalprocesses}"
exit 0

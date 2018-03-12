#!/bin/bash
echo 00-60-2f$(hexdump -n3 -e '/1 "-%02X"' /dev/random);

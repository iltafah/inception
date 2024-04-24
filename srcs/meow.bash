#!/bin/bash

echo "[nginx 1/3]" > >(while read line; do  if [[ $line =~ \[.+([0-9]+)/([0-9]+)\] ]]; then echo $line; fi;   done)

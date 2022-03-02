#/bin/bash

printf "Reading tech support: $1\n"
ls $1

./grep_between_patterns.sh $1 " show config" "\* show profile demuxmgr"

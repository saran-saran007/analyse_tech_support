#/bin/bash

printf "Greping file $1\n"

printf "Extracting lines between $2 and $3 \n"

awk "/$2 /,/$3/" $1

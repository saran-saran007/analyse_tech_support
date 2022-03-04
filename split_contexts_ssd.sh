#/bin/bash

if [ $# -lt 1 ]
then
printf "$0 <path-to-support_summary-file\n"
exit
fi

csplit --digits=2  --quiet --prefix=ctx_ $1 "/\* Context: /+1" "{*}"

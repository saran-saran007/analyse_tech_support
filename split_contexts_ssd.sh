#/bin/bash

if [ $# -lt 2 ]
then
  printf "$0 <path-to-support_summary-file> <context-prefix>\n"
  exit
fi

printf -v exec_cmd "csplit --digits=2  --quiet --prefix=ctx_$2 $1 \"/\* Context: $2/+1\" \"{*}\""

echo "Executing command $exec_cmd"
eval $exec_cmd

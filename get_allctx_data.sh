#/bin/bash

if [ $# -ne 2 ]
then
printf "Usage: $0 <support_summary_file_path> <pattern to grep>\n"
exit 
fi

./get_matching_sh_cmds.sh $2 $1 > sections_with_match
cat sections_with_match | egrep "\*\*\*\*|$4"

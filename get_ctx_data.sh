#/bin/bash

if [ $# -lt 3 ]
then
printf "Usage: $0 <support_summary_file_path> <Context-name of interest> <Next-context-name> [<data from this context>] [print-section]\n"
exit 
fi

./get_config.sh $1 > show_config
./get_logs.sh $1 > show_logs

if [ $# -eq 5 ]
then
printf "Getting show commands from context $2 ...\n"
./grep_between_patterns.sh $1 "\* Context: $2" "\* Context: $3"  > ctx$2_show_commands
printf "finding $4 in context $2 ...\n"
./get_matching_sh_cmds.sh $4 ctx$2_show_commands > sections_with_match
./get_matching_sh_cmds.sh $4 show_config >> sections_with_match
./get_matching_sh_cmds.sh $4 show_logs >> sections_with_match
cat sections_with_match | egrep "\*\*\*\*|$4"
exit
fi

if [ $# -eq 4 ]
then
printf "Getting show commands from context $2 ...\n"
./grep_between_patterns.sh $1 "\* Context: $2" "\* Context: $3"  > ctx$2_show_commands
printf "finding $4 in context $2 ...\n"
cat ctx$2_show_commands | grep "$4"
cat show_config | grep "$4"
exit
fi

if [ $# -eq 3 ]
then
printf "Getting show commands from context $2 ...\n"
./grep_between_patterns.sh $1 "\* Context: $2" "\* Context: $3"
exit
fi


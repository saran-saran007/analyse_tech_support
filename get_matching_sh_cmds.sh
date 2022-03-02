#/bin/bash

printf -v exec_cmd "awk \'BEGIN{RS=\" show \"}/$1/{printf \"%%s\", \$0; print RT}\' ./$2"

# echo "Generated command: $exec_cmd"
printf "getting matching show commands...\n"
eval $exec_cmd



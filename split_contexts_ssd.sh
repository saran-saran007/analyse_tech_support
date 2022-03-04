#/bin/bash

if [ $# -lt 2 ]
then
  printf "$0 <path-to-support_summary-file> <context-prefix>\n"
  exit
fi

./get_config.sh $1  > show_config

printf -v exec_cmd "csplit --digits=1  --quiet --prefix=ctx_$2 $1 \"/\* Context: $2/+1\" \"{*}\""

echo "Fetching show commands:-  $exec_cmd"
eval $exec_cmd

printf -v exec_get_cfg_cmd "csplit --digits=1  --quiet --prefix=ctx_$2_cfg ./show_config \"/^  context $2/+1\" \"{*}\""

echo "$exec_get_cfg_cmd" > split_configs.sh
chmod +x  split_configs.sh

./split_configs.sh

numctx=$(ls -dq *ctx_$2_cfg* | wc -l)

printf "Combining show-cmds and cfg for $numctx contexts\n"

for (( ctxnum=0; ctxnum<$numctx; ctxnum++ ))
do
  printf -v cfg_file "ctx_$2_cfg$ctxnum"
  printf -v shcmd_file "ctx_$2$ctxnum"
  printf -v ssd_file "ctx_ssd$2$ctxnum"
  printf "combining $cfg_file and $shcmd_file into $ssd_file\n"
  cat $cfg_file > $ssd_file
  cat $shcmd_file >> $ssd_file
done

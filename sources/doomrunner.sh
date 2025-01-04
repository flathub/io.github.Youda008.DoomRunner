#!/bin/sh
app_config_dir=$XDG_DATA_HOME/DoomRunner
app_share_dir=$XDG_DATA_HOME/share
[ ! -d $app_config_dir ] && mkdir -p $app_config_dir
[ ! -d $app_share_dir  ] && mkdir -p $app_share_dir
[ ! -f $app_config_dir/options.json ] && envsubst < /app/share/config/options.json > $app_config_dir/options.json
exec /app/bin/DoomRunner
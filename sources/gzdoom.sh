#!/bin/sh
gzdoom_command='gzdoom +fluid_patchset /app/share/games/doom/soundfonts/gzdoom.sf2'
# Use config file from ${XDG_CONFIG_HOME}/gzdoom.ini if none specified
[[ "$@" =~ '-config ' ]] || gzdoom_command="${gzdoom_command} -config ${XDG_CONFIG_HOME}/gzdoom.ini"
exec $gzdoom_command "$@"
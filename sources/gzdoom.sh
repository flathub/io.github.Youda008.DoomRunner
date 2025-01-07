#!/bin/sh
exec zenity --width=400 --error --title='Embedded engine is no more available' \
    --no-wrap --text='The GZDoom embedded engine is no more available inside this app.\n\nYou can use other engines, please read this page:\n\nhttps://github.com/flathub/io.github.Youda008.DoomRunner' \
    --ok-label "Close"
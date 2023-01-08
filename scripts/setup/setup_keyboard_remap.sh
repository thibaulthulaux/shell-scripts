#!/usr/bin/env bash
#
# Edit /etc/default/keyboard and change XKBOPTIONS to swap caps and escape.
#

# FILE="/etc/default/keyboard"
# SEARCH="XKBOPTIONS=+.*"
# REPLACE="XKBOPTIONS=caps:swapescape"
# 
# echo $0:edit ${FILE}
# sudo sed -ri "s/${SEARCH}/${REPLACE}/g" "${FILE}"

sudo apt update

sudo apt install \
	xcape

setxkbmap -option
setxkbmap -option 'caps:ctrl_modifier' 

xcape -e 'Caps_Lock=Escape' &

# /usr/bin/setxkbmap -option 'caps:ctrl_modifier'
# /usr/bin/xcape -e 'Caps_Lock=Escape' -t 100


echo $0:done.
exit 0

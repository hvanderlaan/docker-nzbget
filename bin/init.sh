#!/bin/bash
# ----------------------------------------------------------
# docker-nzbget init script
#
# Author: Harald van der Laan
# Updated: 2014/12/18
# ----------------------------------------------------------

if [ ! -f /etc/nzbget.conf ]; then
	curl "https://raw.githubusercontent.com/hvanderlaan/docker-nzbget/master/conf/nzbget.conf" > /etc/nzbget.conf
fi

nzbget --daemon --configfile /etc/nzbget.conf

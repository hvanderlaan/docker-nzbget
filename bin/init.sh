#!/bin/bash
# ----------------------------------------------------------
# docker-nzbget init script
#
# Author: Harald van der Laan
# Updated: 2014/12/18
# ----------------------------------------------------------

if [ ! -f /etc/nzbget.conf ]; then
	echo "Could not start nzbget because the config file is missing"
	exit 1
fi

nzbget --daemon --configfile /etc/nzbget.conf

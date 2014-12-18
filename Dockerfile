# ----------------------------------------------------------
# docker-nzbget
#
# Build a basic nzbget docker container
#
# Author : Harald van der Laan
# Updated: 2014/12/18
# ----------------------------------------------------------

# Base system is the LTS version of Ubuntu
from		ubuntu:14.04
maintainer	Harald van der Laan <harald@familievdlaan.nl>

# Make sure we don't get notifications we can't answer during building.
env DEBIAN_FRONTEND noninteractive

# Download and install everything from the repos.
RUN apt-get --yes update
RUN apt-get --yes upgrade

# Installing nzbget
RUN apt-get --yes install nzbget curl
ADD ./conf/nzbget.conf /etc/nzbget.conf

# /data contains the download location for the files
VOLUME ["/data"]

# Exposing the nzbget webgui port
EXPOSE 6789

# Creating startup script.
ADD ./bin/init.sh /init.sh
RUN chmod +x /init.sh

# Starting nzbget
CMD ["/init.sh"]

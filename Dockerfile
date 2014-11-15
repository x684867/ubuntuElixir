# Docker Container for ubuntuElixir
# (c) 2014 EdgeCase, Inc.  sam@edgecase.io
# 
#FROM scratch
FROM x684867/ubuntucore14.04
MAINTAINER Sam Caldwell <mail@samcaldwell.net>

#ADD files/udev.sh /usr/bin/fake-udev

ENV DEBIAN_FRONTEND noninteractive

RUN \
        apt-get update --fix-missing -y && \
        apt-get install wget -y && \
        apt-get install erlang-base erlang-dev -y

RUN \
   URL=http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
   echo "URL: $URL" && \
   wget $URL && \
   dpkg -i erlang-solutions_1.0_all.deb && \
   echo "erlang-solutions installed."
   apt-get update --fix-missing -y && \
   echo "aptitude is updated."
   apt-get install elixir -y && \
   echo "elixir is installed."

COMMAND ["/bin/bash"]
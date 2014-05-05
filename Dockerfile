FROM debian:wheezy
MAINTAINER mojotech <ops@mojotech.com>

ADD apt.withmojo.com.key /tmp/apt/apt.withmojo.com.key
ADD apt.withmojo.com.pref /tmp/apt/apt.withmojo.com.pref
ADD apt.withmojo.com.list /tmp/apt/apt.withmojo.com.list

RUN chown root:root /tmp/apt/*
RUN chmod 755 /tmp/apt/*

RUN apt-key add /tmp/apt/apt.withmojo.com.key
RUN mv /tmp/apt/apt.withmojo.com.pref /etc/apt/preferences.d/
RUN mv /tmp/apt/apt.withmojo.com.list /etc/apt/sources.list.d/

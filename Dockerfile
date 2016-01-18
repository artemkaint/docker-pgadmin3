FROM ubuntu:14.04
MAINTAINER artemkaint

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y wget software-properties-common python-software-properties
RUN add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main"
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN apt-get update && apt-get install -y pgadmin3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/user

RUN useradd user -u 1000 -s /bin/bash

RUN chown user -R /home/user

USER user
ENV HOME /home/user
WORKDIR /home/user
CMD pgadmin3
FROM ubuntu:14.04
MAINTAINER Michael Duffy <michael@stunthamster.com>
RUN apt-get update
RUN apt-get install -y ruby1.9.1 ruby1.9.1-dev make zlib1g-dev libicu-dev build-essential git
RUN gem install gollum
RUN mkdir -p /usr/local/gollum

WORKDIR /usr/local/gollum
RUN git init .

EXPOSE 4567

CMD ["gollum"]
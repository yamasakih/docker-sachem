FROM postgres:10.0
MAINTAINER Hiroyuki Yamasaki yamasaki.phone@gmail.com

RUN apt update && \
    apt install -y git \
                   autoconf \
                   automake \
                   libtool \
                   ant \
                   libpq-dev \
                   software-properties-common \
                   openjdk-8-jdk \
                   make

WORKDIR /tmp
RUN git clone --recursive https://took28.ics.muni.cz/chemdb/sachem.git
WORKDIR sachem
RUN autoreconf -i
WORKDIR build

#RUN apt -y upgrade
#RUN add-apt-repository -y ppa:webupd8team/java

RUN ../configure --with-postgresql=/usr/bin/pg_config --with-jdk8=/usr/lib/jvm/java-8-openjdk-amd64/
RUN make


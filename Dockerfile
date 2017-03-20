FROM uwitech/ohie-base

USER root

#install openinfoman

RUN apt-get update
COPY BaseX862.zip /root/BaseX862.zip
RUN apt-get -y install software-properties-common python-software-properties debconf-utils wget unzip git default-jre openjdk-7-jre
RUN unzip ~/BaseX862.zip -d ~/
RUN touch ~/basex/.basexhome
RUN chmod 777 -R ~/basex
RUN git clone https://github.com/openhie/openinfoman ~/openinfoman

COPY basex.sh /root/basex.sh
RUN chmod 777 -R ~/basex.sh
RUN ~/./basex.sh

COPY web.xml /root/basex/webapp/WEB-INF/web.xml 

CMD /root/basex/bin/./basexhttp

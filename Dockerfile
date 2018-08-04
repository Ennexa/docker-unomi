FROM java:8-jre
MAINTAINER joyce@ennexa.com

COPY install.sh /home/jahia/install.sh
USER root
WORKDIR /home/jahia
RUN ./install.sh

COPY startWithIp.sh /home/jahia/unomi/bin/startWithIp.sh
WORKDIR /home/jahia/unomi/bin

CMD ["sh", "./startWithIp.sh"]
ENV KARAF_OPTS="-Dunomi.autoStart=true"
EXPOSE 9443
EXPOSE 8181
EXPOSE 9200
EXPOSE 9001

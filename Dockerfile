FROM maven:3.5.0-jdk-8
MAINTAINER irskl
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ENV KARAF_VERSION=4.0.10

RUN wget http://www-us.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /opt/karaf; \
    tar --strip-components=1 -C /opt/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz; \
    rm apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /deploy;
COPY rest-1.0-SNAPSHOT.kar /opt/karaf/deploy/rest-1.0-SNAPSHOT.kar
EXPOSE 8181

ENTRYPOINT ["/opt/karaf/bin/karaf"]

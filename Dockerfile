FROM centos

# Upgrading system and Installing Java.
RUN yum -y upgrade && \
        yum -y install wget && \
        wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2F%www.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm" \
        -O /tmp/jdk-8-linux-x64.rpm && \
        yum -y install /tmp/jdk-8-linux-x64.rpm && \
        rm -rf /tmp/jdk-8-linux-x64.rpm && \
        alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000 && \
        alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000 && \
        alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

# Setting ENV

ENV JAVA_HOME /usr/java/latest
ENV PATH="$JAVA_HOME/bin:$PATH"

ADD helloworld.war helloworld.war

CMD ["java", "-jar", "helloworld.war"]

EXPOSE 8080

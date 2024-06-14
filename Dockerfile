FROM centos

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
RUN tar xvzf apache*.tar.gz
RUN mv apache-tomcat-9.0.89/* /opt/tomcat/
ADD ./target/simpleweb.war /opt/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]

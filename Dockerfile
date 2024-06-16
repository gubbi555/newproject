FROM centos

# Install dependencies
RUN yum update -y && yum install -y curl tar java-17-amazon-corretto

# Create the tomcat directory
RUN mkdir /opt/tomcat/

# Set the working directory
WORKDIR /opt/tomcat

# Download and extract Tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
RUN tar xvzf apache-tomcat-9.0.89.tar.gz
RUN mv apache-tomcat-9.0.89/* /opt/tomcat/

# Add the application
ADD ./target/simpleweb.war /opt/tomcat/webapps/

# Expose the port
EXPOSE 8080

# Set the JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto

# Update the PATH
ENV PATH=$JAVA_HOME/bin:$PATH

# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

# Use an official Tomcat base image
FROM tomcat:9.0.53-jdk11-openjdk


# Copy the WAR file from the host to the webapps directory in Tomcat
COPY target/simpleweb.war /usr/local/tomcat/webapps

# Expose the Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

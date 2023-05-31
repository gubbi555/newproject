# Use the official CentOS base image
FROM centos:latest

# Update the package manager and install httpd
RUN yum update -y && \
    yum install -y httpd

# Copy custom index.html file to the container
COPY index.html /var/www/html/index.html

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80

# Start httpd when the container launches
CMD ["httpd", "-D", "FOREGROUND"]

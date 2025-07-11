# Dockerfile to build Docker Image with Apache Web Server running on Ubuntu

FROM ubuntu:22.04

# Prevents interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add custom HTML content
RUN echo 'Docker Image on CloudRun by Eugene!<br>' > /var/www/html/index.html && \
    echo '<b><font color="magenta">Version 1.1</font></b>' >> /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

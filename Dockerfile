# Use Amazon Linux 2 as the base image
FROM amazonlinux

# Install Nginx and clean up unnecessary files
RUN yum -y update && \
    yum -y install nginx && \
    yum clean all

# Copy custom index.html into Nginx's default document root
COPY index.html /usr/share/nginx/html/

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx in the foreground (daemon off)
CMD ["nginx", "-g", "daemon off;"]

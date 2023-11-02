# Use the official Nginx base image from Docker Hub
FROM nginx:latest

# Optional: Set an environment variable to customize Nginx configuration
ENV NGINX_PORT 80

# Copy your custom Nginx configuration files if needed
COPY nginx.conf /etc/nginx/nginx.conf

# Copy your static web content into the Nginx web root directory
COPY ./html /usr/share/nginx/html

# Expose the port that Nginx will listen on (default is 80)
EXPOSE $NGINX_PORT

# Start Nginx when the container is run
CMD ["nginx", "-g", "daemon off;"]

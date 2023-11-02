# Nginx Usage and Configuration Guide

Nginx is a powerful and versatile web server and reverse proxy server that can be used for various purposes. In this guide, we will explore its usage in different scenarios, including as a web server, reverse proxy, layer 4 load balancing, and layer 7 load balancing. We will also cover SSL and HTTP2 configuration with examples.

## Table of Contents

- [Nginx Usage as a Web Server](#nginx-usage-as-a-web-server)
- [Nginx as a Reverse Proxy](#nginx-as-a-reverse-proxy)
- [Layer 4 Load Balancing with Nginx](#layer-4-load-balancing-with-nginx)
- [Layer 7 Load Balancing with Nginx](#layer-7-load-balancing-with-nginx)
- [SSL and HTTP2 Configuration](#ssl-and-http2-configuration)

## Nginx Usage as a Web Server

Nginx can be used as a web server to serve static and dynamic content. Here's a basic example of how to configure Nginx to serve a static website:

```nginx
server {
    listen 80;
    server_name example.com;

    location / {
        root /var/www/html;
        index index.html;
    }
}
```

In this example, Nginx listens on port 80 and serves the static content of the website from the `/var/www/html` directory.

## Nginx as a Reverse Proxy

A reverse proxy is a server that sits in front of web servers and forwards client requests to the appropriate backend servers. Here's an example of Nginx configuration as a reverse proxy:

```nginx
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend_server;
    }
}

upstream backend_server {
    server backend1.example.com;
    server backend2.example.com;
}
```

Nginx in this configuration acts as a reverse proxy, directing incoming requests to the backend servers defined in the `upstream` block.

## Layer 4 Load Balancing with Nginx

Nginx can perform Layer 4 load balancing by distributing traffic based on IP addresses and ports. Here's an example:

```nginx
stream {
    upstream backend_servers {
        server backend1.example.com:80;
        server backend2.example.com:80;
    }

    server {
        listen 80;
        proxy_pass backend_servers;
    }
}
```

In this example, Nginx is balancing traffic at the transport layer (Layer 4) between two backend servers.

## Layer 7 Load Balancing with Nginx

Layer 7 load balancing is more advanced, as it considers application-level data such as HTTP headers and content. Here's a configuration example:

```nginx
http {
    upstream backend_servers {
        server backend1.example.com;
        server backend2.example.com;
    }

    server {
        listen 80;
        server_name example.com;

        location / {
            proxy_pass http://backend_servers;
        }
    }
}
```

In this case, Nginx balances traffic at the application layer (Layer 7), making routing decisions based on the URL and HTTP headers.

## SSL and HTTP2 Configuration

Nginx supports SSL encryption and HTTP2 for secure and efficient communication. Here's an example of SSL and HTTP2 configuration:

```nginx
server {
    listen 443 ssl http2;
    server_name example.com;

    ssl_certificate /etc/nginx/ssl/example.com.crt;
    ssl_certificate_key /etc/nginx/ssl/example.com.key;

    location / {
        # Your application configuration
    }
}
```

This configuration sets up SSL and HTTP2 for the `example.com` domain and specifies the SSL certificate and private key files.

These are just some basic examples of Nginx usage and configuration. Nginx is a highly flexible and powerful web server and reverse proxy server, capable of handling complex scenarios and configurations.

#!/bin/bash

# Define certificate paths
CERT_PATH="/etc/letsencrypt/live/garb-anzo.tech/fullchain.pem"
NGINX_SSL_PATH="/etc/nginx/ssl"

# Ensure SSL directory exists
mkdir -p "$NGINX_SSL_PATH"

# Check if SSL certificate already exists
if [ ! -f "$CERT_PATH" ]; then
    echo "No SSL certificate found. Generating a new one..."
    certbot certonly --standalone --agree-tos --email your-email@domain.com \
    -d garb-anzo.tech  --expand --non-interactive
else
    echo "SSL certificate already exists. Skipping Certbot."
fi

# Copy certificates to Nginx directory (if not already copied)
if [ ! -f "$NGINX_SSL_PATH/fullchain.pem" ]; then
    echo "Copying SSL certificates to Nginx folder..."
    cp /etc/letsencrypt/live/garb-anzo.tech/fullchain.pem "$NGINX_SSL_PATH/fullchain.pem"
    cp /etc/letsencrypt/live/garb-anzo.tech/privkey.pem "$NGINX_SSL_PATH/privkey.pem"
    echo "SSL certificates copied successfully."
fi

# Start Nginx
nginx -g "daemon off;"

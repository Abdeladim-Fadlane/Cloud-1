FROM debian:11

RUN apt update && apt install -y \
    nginx \
    certbot \
    python3-certbot-nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/* \
    && rm /etc/nginx/sites-enabled/default  

# Create a directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Copy your custom Nginx config
COPY conf/nginx.conf /etc/nginx/sites-enabled/pixelagri.conf

# Add entrypoint script to run Certbot and Nginx
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
FROM debian:11

RUN apt-get update -y && apt-get install nginx -y
RUN apt-get update -y && apt-get install openssl -y

RUN mkdir -p /etc/nginx/ssl
COPY ./conf/nginx.conf /etc/nginx/sites-enabled/

CMD [ "nginx","-g","daemon off;" ]

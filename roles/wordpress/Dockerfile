FROM debian:11

RUN apt-get update -y &&  apt-get install  wget -y

RUN apt-get update -y && apt-get install -y php7.4 php7.4-fpm  php7.4-mysql  mariadb-client 

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN	chmod 777 -R /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

COPY ./tools/script.sh /script.sh
RUN chmod +x script.sh

EXPOSE 9000

RUN mkdir /run/php/
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


CMD ["./script.sh"]


				
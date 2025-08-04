FROM  debian:11

RUN  apt-get update -y && apt-get install mariadb-server -y
EXPOSE  3306
COPY ./tools/script ./script
RUN chmod +x script
CMD [ "./script" ]

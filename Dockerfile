FROM ubuntu
LABEL user KHAN
RUN apt-get update
RUN apt-get install apache2 -y
COPY index.html /var/www/html/
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

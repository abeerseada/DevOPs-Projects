FROM php:8.1.33-apache 
WORKDIR /var/www/html
COPY ./src .
EXPOSE 80
# Set the 'ServerName'
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf




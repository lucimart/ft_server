# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lucimart <lucimart@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/24 10:47:13 by lucimart          #+#    #+#              #
#    Updated: 2020/09/24 22:35:05 by lucimart         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Base Image: https://hub.docker.com/_/debian
FROM debian:buster

#ENV VARS
ENV AUTO_INDEX="on"

##### PACKAGE INSTALLATION ON BUILD INI
# Update Software Packages
RUN apt-get -qq update && apt-get -qq upgrade -y

# Install Web Server NginX
RUN apt-get -y install nginx > /dev/null

# Install to further config a SSL Self-signed certificate for NginX
RUN apt-get -y install openssl > /dev/null

# Install Open Source, community-developed, fork of MySQL: MariaDB
RUN apt-get -y install mariadb-server > /dev/null

# Install PHP 7.3 and some common PHP extensions + for DB management
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-mbstring > /dev/null

# Install Wget to further install and configurate phpMyAdmin and Wordpress
RUN apt-get -y install wget > /dev/null
##### PACKAGE INSTALLATION ON BUILD END

##### DOWNLOAD phpMyAdmin && Wordpress IN /tmp/ ON BUILD INI
RUN cd /tmp/ && wget -q https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN cd /tmp/ && wget -q https://wordpress.org/latest.tar.gz
##### DOWNLOAD phpMyAdmin && Wordpress IN /tmp/ ON BUILD END

##### COPY CONF FILES && init.sh TO CONTAINER INI
COPY ./srcs/init.sh /
COPY ./srcs/conf-* /tmp/
##### COPY CONF FILES && init.sh TO CONTAINER END

##### Start the configuration of the container once ran.
# The last bash is to trick docker into not killing the container lmao
CMD bash init.sh && bash
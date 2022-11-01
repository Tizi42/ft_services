# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tyuan <tyuan@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:31:55 by tyuan             #+#    #+#              #
#    Updated: 2021/05/09 00:46:10 by tyuan            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
LABEL maintainer="tyuan@student.42.fr"

#Donlowding, installing and set up
ADD https://wordpress.org/latest.tar.gz .
RUN tar -xvf latest.tar.gz && \
	#mv wordpress /www && \
	#mv wp-config.php /www/ \
	rm -f latest.tar.gz && \
	mkdir /run/nginx/ && \
	apk add --no-cache openssl nginx php php-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom && \
	openssl req -x509 -nodes -newkey rsa:2048 -keyout /opt/server.pem -out /opt/server.pem -days 365 -subj '/CN=localhost'

#Put telegraf download to a single layer(so can be reused) to speed up
RUN apk add --no-cache telegraf

#Ports
EXPOSE 5050

#Start
COPY start.sh .
CMD ["./start.sh"]

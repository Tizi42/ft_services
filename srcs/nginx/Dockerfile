# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tyuan <tyuan@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:31:55 by tyuan             #+#    #+#              #
#    Updated: 2021/05/09 00:45:14 by tyuan            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
LABEL maintainer="tyuan@student.42.fr"

#Donlowd and setup
RUN	apk add --no-cache nginx openssl openssh openrc && \
	mkdir -p /run/nginx && \
	ssh-keygen -A && \
	adduser -D ssh_admin && \
	echo "ssh_admin:ssh_pw" | chpasswd && \
	openssl req -x509 -nodes -newkey rsa:2048 -keyout /opt/server.pem -out /opt/server.pem -days 365 -subj '/CN=localhost'

#Add files
COPY start.sh ./

#Put telegraf download to a single layer(so can be reused) to speed up
RUN apk add --no-cache telegraf

#Ports
EXPOSE 80 443 22

#Start
CMD ["./start.sh"]

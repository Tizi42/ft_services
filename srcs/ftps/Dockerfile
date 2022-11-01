#**************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tyuan <tyuan@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:31:55 by tyuan             #+#    #+#              #
#    Updated: 2021/05/09 00:42:35 by tyuan            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
LABEL maintainer="tyuan@student.42.fr"

#Donlowding, installing and set up
RUN apk add --no-cache openssl vsftpd && \
    openssl req -x509 -nodes -newkey rsa:2048 -keyout /opt/vsftpd.pem -out /opt/vsftpd.pem -days 365 -subj '/CN=localhost'

#Put telegraf download to a single layer(so can be reused) to speed up
RUN apk add --no-cache telegraf

#Ports
EXPOSE 21 42000

#Start
COPY start.sh ./
CMD ["./start.sh"]

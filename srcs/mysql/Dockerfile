# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tyuan <tyuan@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:31:55 by tyuan             #+#    #+#              #
#    Updated: 2021/05/09 00:44:45 by tyuan            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
LABEL maintainer="tyuan@student.42.fr"

#Donlowd
RUN apk add --no-cache mysql mysql-client openrc

#Put telegraf download to a single layer(so can be reused) to speed up
RUN apk add --no-cache telegraf

#Add files
COPY start.sh wpdb.sql ./

#Ports
EXPOSE 80 443

#Start
CMD ./start.sh

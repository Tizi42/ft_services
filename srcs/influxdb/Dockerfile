# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tyuan <tyuan@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:31:55 by tyuan             #+#    #+#              #
#    Updated: 2021/05/09 00:44:30 by tyuan            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
LABEL maintainer="tyuan@student.42.fr"

COPY start.sh ./

RUN apk add --no-cache influxdb 

#Put telegraf download to a single layer(so can be reused) to speed up
RUN apk add --no-cache telegraf

EXPOSE 8086

#Start
CMD ./start.sh

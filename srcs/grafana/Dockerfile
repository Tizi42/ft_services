# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tyuan <tyuan@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 18:31:55 by tyuan             #+#    #+#              #
#    Updated: 2021/05/09 00:43:59 by tyuan            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
LABEL maintainer="tyuan@student.42.fr"

COPY start.sh dashboards ./

RUN apk add --no-cache grafana && \
    mkdir -p /var/lib/grafana/dashboards && \
    mv *.json /var/lib/grafana/dashboards

#Put telegraf download to a single layer(so can be reused) to speed up
RUN apk add --no-cache telegraf

EXPOSE 3000

#Start
CMD ./start.sh

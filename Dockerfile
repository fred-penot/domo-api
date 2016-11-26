# DomoApi dans un container
#
# VERSION               0.0.1
#

FROM     fwed/php-zs-project:holly
MAINTAINER Fwedoz "fwedoz@gmail.com"

# Mise a jour des depots
RUN (apt-get update && apt-get upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)

# Installation des paquets
RUN apt-get install -y -q git mediainfo

# Telechargement et installation de DomoApi
RUN cd /var/www/html; git clone https://github.com/fred-penot/DomoApi.git

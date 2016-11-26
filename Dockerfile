# DomoApi dans un container
#
# VERSION               0.0.1
#

FROM     fwed/php-zs-project:holly
MAINTAINER Fwedoz "fwedoz@gmail.com"

# Definition des constantes
ENV login_ssh="docker"

# Installation des paquets
RUN apt-get install -y -q git mediainfo

# Telechargement et installation de DomoApi
COPY install.sh /root/install.sh
RUN chmod -f 755 /root/install.sh
RUN sh /root/install.sh

# Modification de la page d accueil du serveur
RUN rm -f /var/www/html/index.html
COPY index.html /var/www/html/index.html
RUN chmod -f 755 /var/www/html/index.html

# Modification de services.sh
RUN rm -f /root/services.sh
COPY services.sh /root/services.sh
RUN chmod -f 755 /root/services.sh

# Point de montage
VOLUME ["/home/${login_ssh}", "/var/www/html/domoapi"]

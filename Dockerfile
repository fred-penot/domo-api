# DomoApi dans un container
#
# VERSION               0.0.1
#

FROM     fwed/php-zs-project:holly
MAINTAINER Fwedoz "fwedoz@gmail.com"

# Installation des paquets
RUN apt-get install -y -q git mediainfo

# Telechargement et installation de DomoApi
RUN cd /var/www/html; git clone https://github.com/fred-penot/DomoApi.git
RUN mv /var/www/html/DomoApi /var/www/html/domoapi
RUN chmod -Rf 777 /var/www/html/domoapi
RUN cd /var/www/html/domoapi; /usr/local/zend/bin/php composer.phar install
RUN rm -f /var/www/html/domoapi/vendor/knplabs/console-service-provider/Knp/Provider/ConsoleServiceProvider.php
RUN cp /var/www/html/domoapi/app/doc/ConsoleServiceProvider.php /var/www/html/domoapi/vendor/knplabs/console-service-provider/Knp/Provider/
RUN cp -Rf /var/www/html/domoapi/app/doc/allocine /var/www/html/domoapi/vendor/
RUN rm -f /var/www/html/domoapi/vendor/composer/autoload_psr4.php
RUN cp /var/www/html/domoapi/app/doc/autoload_psr4.php /var/www/html/domoapi/vendor/composer/
RUN rm -f /var/www/html/domoapi/vendor/phansys/getid3/GetId3/Lib/Helper.php
RUN cp /var/www/html/domoapi/app/doc/Helper.php /var/www/html/domoapi/vendor/phansys/getid3/GetId3/Lib/
RUN rm -f /var/www/html/domoapi/vendor/phansys/getid3/GetId3/GetId3.php
RUN cp /var/www/html/domoapi/app/doc/GetId3.php /var/www/html/domoapi/vendor/phansys/getid3/GetId3/
RUN cd /var/www/html/domoapi/app/doc; unzip DomoApi.sql.zip
RUN cd /var/www/html/domoapi/app/doc; unzip HomeOS.sql.zip
RUN cd /var/www/html/domoapi/app/doc; rm -f DomoApi.sql.zip
RUN cd /var/www/html/domoapi/app/doc; rm -f HomeOS.sql.zip
RUN chmod -Rf 777 /var/www/html/domoapi

# Modification de la page d accueil du serveur
RUN rm -f /var/www/html/index.html
COPY index.html /var/www/html/index.html
RUN chmod -f 755 /var/www/html/index.html

# Modification de services.sh
RUN rm -f /root/services.sh
COPY services.sh /root/services.sh
RUN chmod -f 755 /root/services.sh

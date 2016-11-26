password_mysql=docker
login_ssh=docker
password_ssh=docker

service ssh start
service zend-server start
service mysql start

# Import des bdd de DomoApi...
if [ -f /var/www/html/domoapi/app/doc/DomoApi.sql ]
then
	mysql -u root -p${password_mysql} < /var/www/html/domoapi/app/doc/DomoApi.sql
	rm -f /var/www/html/domoapi/app/doc/DomoApi.sql
fi

# ... et de HomeOS
if [ -f /var/www/html/domoapi/app/doc/HomeOS.sql ]
then
	mysql -u root -p${password_mysql} < /var/www/html/domoapi/app/doc/HomeOS.sql
	rm -f /var/www/html/domoapi/app/doc/HomeOS.sql
fi

chmod -Rf 777 /var/www/html/domoapi

# Suppresion des fichiers temporaires de DomoApi
rm -Rf /var/www/html/domoapi/app/doc/*

echo ''
echo ''
echo ''
echo '###############################################################################'
echo '##                                                                             '
echo '##                   Bienvenue sur le container de Base ZS9                    '
echo '##                                                                             '
echo '##                                                                             '
echo '##    * Page d accueil du serveur : http://172.17.0.2                          '
echo '##                                                                             '
echo '##    * Connexion SSH :                                                        '
echo '##      - host => 172.17.0.2                                                   '
echo '##      - login => ${login_ssh}                                                '
echo '##      - password => ${password_ssh}                                          '
echo '##                                                                             '
echo '##    * Connexion MySQL :                                                      '
echo '##      - login => root                                                        '
echo '##      - password => ${password_mysql}                                        '
echo '##                                                                             '
echo '###############################################################################'
echo ''
echo ''
echo ''
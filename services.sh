password_mysql=docker
login_ssh=docker
password_ssh=docker

service ssh start
service zend-server start
service mysql start

# Import des bdd de DomoApi...
if [ -f /home/${login_ssh}/DomoApi.sql ]
then
	mysql -u root -p${password_mysql} < /home/${login_ssh}/DomoApi.sql
	rm -f /home/${login_ssh}/DomoApi.sql
fi

# ... et de HomeOS
if [ -f /home/${login_ssh}/HomeOS.sql ]
then
	mysql -u root -p${password_mysql} < /home/${login_ssh}/HomeOS.sql
	rm -f /home/${login_ssh}/HomeOS.sql
fi

login_ssh=docker

cd /home/${login_ssh}
unzip DomoApi.sql.zip
unzip HomeOS.sql.zip
rm -f DomoApi.sql.zip
rm -f HomeOS.sql.zip
chmod -f 777 /home/${login_ssh}/DomoApi.sql
chmod -f 777 /home/${login_ssh}/HomeOS.sql

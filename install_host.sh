path_install=/home/apps/workspace/docker/php
dir_domoapi=domoApi

cd ${path_install}
git clone https://github.com/fred-penot/DomoApi.git
mv ${path_install}/DomoApi ${path_install}/${dir_domoapi}
chmod -Rf 777 ${path_install}/${dir_domoapi}
cd ${path_install}/${dir_domoapi}
/usr/local/zend/bin/php composer.phar install
rm -f ${path_install}/${dir_domoapi}/vendor/knplabs/console-service-provider/Knp/Provider/ConsoleServiceProvider.php
cp ${path_install}/${dir_domoapi}/app/doc/ConsoleServiceProvider.php ${path_install}/${dir_domoapi}/vendor/knplabs/console-service-provider/Knp/Provider/
cp -Rf ${path_install}/${dir_domoapi}/app/doc/allocine ${path_install}/${dir_domoapi}/vendor/
rm -f ${path_install}/${dir_domoapi}/vendor/composer/autoload_psr4.php
cp ${path_install}/${dir_domoapi}/app/doc/autoload_psr4.php ${path_install}/${dir_domoapi}/vendor/composer/
rm -f ${path_install}/${dir_domoapi}/vendor/phansys/getid3/GetId3/Lib/Helper.php
cp ${path_install}/${dir_domoapi}/app/doc/Helper.php ${path_install}/${dir_domoapi}/vendor/phansys/getid3/GetId3/Lib/
rm -f ${path_install}/${dir_domoapi}/vendor/phansys/getid3/GetId3/GetId3.php
cp ${path_install}/${dir_domoapi}/app/doc/GetId3.php ${path_install}/${dir_domoapi}/vendor/phansys/getid3/GetId3/
chmod -Rf 777 ${path_install}/${dir_domoapi}
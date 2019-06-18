#!/bin/bash

#Iniciamos mysql
/etc/init.d/mysql start

#Guardamos las variables de la base de datos
DB_ROOT="root"
DB_ROOT_PASS="root"
DB_NAME="wordpress"
DB_USER="wordpress"
DB_PASS="wordpress" 

#Creamos el usuario
mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE USER ${DB_USER};" 

#Creamos la base de datos
mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE DATABASE ${DB_NAME};" 

#Damos permisos al usuario en la base de datos
mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "GRANT ALL ON ${DB_NAME}.* TO ${DB_USER};"

#Iniciamos el servicio
/etc/init.d/apache2 start
/bin/bash

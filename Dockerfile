#Indicamos la imagen de la que creamos nuestro dockerfile con FROM
FROM debian

#Establecemos nuestro directorio home
ENV HOME /root

#Actualizamos
RUN apt-get update

#Instalamos los programas que necesitamos
RUN apt-get install -y nano wget curl unzip lynx apache2 mysql-server php7.0 libapache2-mod-php7.0 php7.0-mysql

#Nos logueamos en la BBDD
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections


#Descargamos Wordpress
ADD https://es.wordpress.org/wordpress-4.2.2-es_ES.zip /var/www/wordpress.zip

#Establecemos nuestro nuevo directorio home
ENV HOME /var/www/html/

#Eliminamos index.html
RUN rm /var/www/html/index.html

#Extraemos wordpress en /var/www
RUN unzip /var/www/wordpress.zip  -d /var/www/

#Copiamos wordpress a /var/www/html
RUN cp -r /var/www/wordpress/* /var/www/html/

#Añadimos el script
ADD /script.sh /script.sh

#Le damos permisos de ejecución
RUN chmod 777 /script.sh

#Lanzamos el script
RUN ./script.sh 

#Establecemos el puerto
EXPOSE 80

#Establecemos el proceso de inicio que usaremos
CMD ["/bin/bash"]

#Especificamos el ejecutable
ENTRYPOINT ["./script.sh"]
# Práctica 3

## Servidor nginx

En primer lugar haremos la instalación del nginx. Para ellos haremos los siguientes pasos:

1. Importación de la clave al repositorio de software:

   Nos vamos al directorio /tmp (cd /tmp/) y ejecutamos las siguientes órdenes:

**cd /tmp/
wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add /tmp/nginx_signing.key
rm -f /tmp/nginx_signing.key**

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura1.png)

2. Añadimos el repositorio

Para esto añadimos al final del archivo **/etc/apt/sources.list** las líneas 

**deb http://nginx.org/packages/ubuntu/ lucid nginx**

**deb-src http://nginx.org/packages/ubuntu/ lucid nginx**

con las ordenes : 

**echo "deb http://nginx.org/packages/ubuntu/ lucid nginx" >> /etc/apt/sources.list**

**echo "deb-src http://nginx.org/packages/ubuntu/ lucid nginx” >>/etc/apt/sources.list**

La siguiente imagen mostramos que dichas líneas las hemos añadido: 

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura2.png)

3. Instalamos el paquete nginx

Hacemos las órdenes ya conocidas:

**sudo apt-get update**

**sudo apt-get install nginx**

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura3.png)

Una vez instalado el nginx pasamos a configurarlo. Lo primero que hacemos el eliminar el contenido del archivo **/etc/nginx/conf.d/default.conf**. 
Ahora definimos qué máquinas forman nuestro cluster web. Para ello incluimos en el archivo **/etc/nginx/conf.d/default.conf** las líneas:

upstream apaches {

server 192.168.129.131;

server 192.168.129.132;

}

Y ahora editamos el archivo para que quede del siguiente modo:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura4.png)

Una vez hecho esto estamos en condiciones de lanzar el servicio ngninx con la orden 
**service nginx restart**:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura5.png)

A continuación hacemos peticiones al balanceador mediante la orden:
**curl http://192.168.129.133/hola.html**
 y estos son los resultados que nos muestran:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura6.png)

Ahora vamos a modificar el upstream de tal modo que la primera máquina tenga el doble de carga que la segunda, para lo cual modificamos upstream para que quede de la siguiente manera:

upstream apaches {

server 192.168.129.131 weight=2;

server 192.168.129.132 weight=1;

}

En la siguiente máquina se muestra el archivo de configuración editado para que la primera máquina tenga el doble de carga que la segunda:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura7.png)

Haciendo ahora la orden curl que hemos hecho antes obtenemos los siguientes resultados:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura8.png)

## haproxy 

Ahora pasamos a instalar y configurar el servidor haproxy

Primero instalamos el haproxy en el balanceador con la orden ya conocida **sudo apt-get install haproxy joe**.

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura9.png)

A continuación editamos el archivo **/etc/haproxy/haproxy.conf** para que quede del siguiente modo:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura10.png)

Una vez hecho esto estamos en condiciones de probar el servicio haproxy mediante la orden **/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg** para lo cual tenemos que cerrar el servicio nginx mediante la orden **service nginx stop**

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura11.png)

Hacemos peticiones dese las otras máquinas mediante curl y estos son los resultados:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica3/Figura12.png)
















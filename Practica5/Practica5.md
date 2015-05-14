# Práctica5 

## Creación de una Base de Datos e inserción de algunos datos

Lo primero que vamos a hacer es crear una base de datos e insertar datos. 

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura1.png)

## Replicación de la base de datos con mysqldump

Ahora ya pasamos a hacer copias de seguridad de la base de datos. Para ello, en primer lugar evitamos que se acceda a la base de datos para cambiar nada del siguiente modo:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura2.png)

Ahora ya pasamos a guardar los datos con mysqldump y a continuación pasamos a desbloquear las tablas: 

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura3.png)

Una vez hecho esto desde la segunda máquina copiamos los archivo.SQL con todos los datos guardados desde la primera máquina:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura4.png)

A continuación pasamos a importar la base de datos completa en el mysql. Para ello, creamos la base de datos y restauramos los datos contenidos en la base de datos: 

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura5.png)

## Replicación de la base de datos mediante una configuración maestro-esclavo

Lo primero que hacemos es editar en nuestra máquina maestra el archivo /etc/mysql/my.cnf para que quede del siguiente modo:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura6.png)

y a continuación reiniciamos el servicio mysql:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura7.png)

Ahora editamos el archivo en el esclavo e iniciamos el servicio del mismo modo que hemos hecho en el maestro, solo que ahora id-server = 2

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura8.png)

A continuación vamos al maestro,  le damos permiso de acceso para la replicación y obtenemos los datos de la base de datos que vamos a replicar:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura9.png)

Posteriormente entramos en la máquina esclava y le damos los datos al maestro. 

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura10.png)

Ahora arrancamos el esclavo 

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura11.png)

Ahora nos vamos al maestro y volvemos a activar las tablas. 

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura12.png)

Una vez llegado a este punto nos vamos al esclavo y ejecutamos la siguiente orden: **mysql> SHOW SLAVE STATUS \G**

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura13.png)

Aquí podemos observar que todo va bien porque el valor de Seconds_Behind_Master es distinto de NULL (es 0). 

Finalmente, vamos a probar que efectivamente se pueden replicar datos. Insertamos datos en el maestro: 

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura14.png)

y por último vemos que en el esclavo se ven replicados:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica5/Figura15.png)




 

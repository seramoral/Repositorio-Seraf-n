#
Práctica6 

## 
Esta práctica la llevaremos a cabo en una nueva máquina denominada UbuntuRaid. 

Una vez que tenemos esta máquina instalada la arrancamos e instalamos el software necesario para configurar el RAID mediante **sudo apt-get**

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica6/Figura1.png)

Estando apagada la máquina, añadimos dos discos, ambos de tipo SCSI y de capacidad 20 GB. 
Según podemos ver en la siguiente imagen tras haber hecho un **fdisk -l**, la ubicación de estos discos es **/dev/sdb y /dev/sdc**.

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica6/Figura2.png)

A continuación creamos el RAID 1

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica6/Figura3.png)

Ahora le damos formato al RAID que hemos creado:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica6/Figura4.png)

Una vez hecho esto creamos el directorio donde se montará la unidad del RAID  y lo montamos:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica6/Figura5.png)

Ahora comprobamos el estado del RAID

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica6/Figura6.png)

Finalmente, para que el dispositivo RAID creado se monte al iniciar el sistema, se modifica el archivo **etc/fstab**  para que quede del siguiente modo:

![imagen](https://github.com/seramoral/Repositorio-Seraf-n/blob/master/Practica6/Figura7.png)

Donde en el primer campo hemos puesto el UUID del disco /dev/md0
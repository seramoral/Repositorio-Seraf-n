#Práctica4

## Observaciones sobre los resultados

### Apache Benchmark

En primer lugar observamos que tanto con nginx como con una sóla máquina no hay failed requests, por lo que todas las peticiones han sido exitosas, mientras que con haproxy no es así. 
La configuración una sóla máquina proporciona un promedio de tiempo de ejecución de los tests menor que con el balanceador y un mayor número de peticiones servidas por segundo. Esto parece lógico, ya que con la primera configuración se llama directamente a la máquina servidora final y, consecuentemente el tiempo que tarda en responder a una petición es menor. Entre nginx y haproxy los tiempos que tardan en ejecutar cada test y el número de respuestas por segundo varían poco.

### Siege

La disponibilidad es 100% tanto con una máquina sóla como con nginx, mientras que con haproxy la disponibilidad es apenas de un 55.6%, lo que supone un rendimiento bastante malo. El **elapsed time** es prácticamente el mismo con las tres configuraciones. La velocidad de transferencia es mucho mayor con una máquina sóla, lo cual es lógico, y con nginx es mucho mayor que con haproxy, de hecho con haproxy la velocidad tiene unas cifras bajísimas. El tiempo de respuesta es prácticamente el mismo con una máquina sóla que con nginx y sin embargo con haproxy es mucho mayor. También observamos que ni con una máquina sóla ni con nignx no hay ninguna transferencia fallida, mientras que con haproxy hay 60 en cada ejecución. Finalmente, en cuanto a la transferencia más larga se aprecian diferencias significativas entre la configuración con nginx y la configuración con una sóla máquina, pero aún mayores entre nginx y haproxy. A nivel general, con haproxy los resultados son muy malos
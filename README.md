# iaw-practica-18
IoT (Internet of Things) con MQTT, Grafana, InfluxDB y Telegraf.

> IES Celia Viñas (Almería) - Curso 2020/2021
Módulo: IAW - Implantación de Aplicaciones Web
Ciclo: CFGS Administración de Sistemas Informáticos en Red

**Introducción**
------------
En esta práctica simularemos las lecturas de un sensor de CO2 y un sensor de temperatura/humedad DHT11 que tomarán medidas de forma constnate y las van a ir publicando en un topic de un broker MQTT.

También existirá un agente de Telegraf que estará suscrito a los topics del broker MQTT donde se publican los valores recogidos por los sensores. El agente de Telegraf insertará los valores que recoge del broker MQTT en una base de datos InfluxDB, que es un sistema gestor de bases de datos diseñado para almacenar series temporales de datos.Finalmente tendremos un servicio web Grafana que nos permitirá visualizar los datos en un panel de control.

Para realizar el despliegue de los servicios de MQTT, Telegraf, InfluxDB y Grafana, vamos a utilizar Docker Compose y contenedores Docker.

![Diagrama](http://josejuansanchez.org/iot-dashboard/images/diagram.png)

**Pasos a seguir**
------------

### Creando una instancia de AWS
Lanzaremos una instancia AWS de Ubuntu Server 20.04 con, al menos, 4 GB de memoria RAM. El grupo de seguridad asignado deberá tener abiertos los siguientes puertos:
- 80
- 8086 (InfluxDB)
- 3000 (Grafana)
- 1883 (Broker MQTT)

### Instalando docker y docker compose.
Con el script de bash adjunto, 'dockerinstall.sh' instalamos los servicios docker y docker-compose.

### Extrayendo telegraf.conf
Para el correcto funcionamiento de la práctica, es necesario extraer y modificar un archivo de configuración de telegraf. Para ello usaremos el siguiente comando:

´docker run --rm telegraf telegraf config > telegraf.conf´

Los cambios realizados estarán señalados en un archivo de configuración ya editado en el propio repositorio. Usaremos control+f para buscar 'cambio'


###

###

###
###



**Información de ampliación**
------------
- 

**Archivos en el repositorio**
------------
1. **README**               Documentación.
      
**Referencias**
------------
- Guía original para la práctica.
http://josejuansanchez.org/iot-dashboard/
- 

**Editor Markdown**
------------
- Markdown editor. Alternativamente, investigar atajos de teclado como Ctrl+B= bold (negrita) 
https://markdown-editor.github.io/
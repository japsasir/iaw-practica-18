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
- 22 (SSH)
- 80
- 8086 (InfluxDB)
- 3000 (Grafana)
- 1883 (Broker MQTT)

![Tipo de instancia.](https://i.imgur.com/GR58RBO.png)
Tipo de instancia.

![Tier medium.](https://i.imgur.com/1bhRwgH.png)
Tier medium.

![Grupo de seguridad.](https://i.imgur.com/Pp8mjn7.png)
Grupo de seguridad.

### Instalando docker y docker compose.
Con el script de bash adjunto, 'dockerinstall.sh' instalamos los servicios docker y docker-compose.

### Extrayendo telegraf.conf
Para el correcto funcionamiento de la práctica, es necesario extraer y modificar un archivo de configuración de telegraf. Para ello usaremos el siguiente comando:

`docker run --rm telegraf telegraf config > telegraf.conf`

Los cambios realizados estarán señalados en un archivo de configuración ya editado en el propio repositorio. Usaremos control+f para buscar 'cambio'


### Prueba del broker MQTT y el cliente MQTT
#### Broker
Con este comando simularemos las lecturas recogidas por los sensores.

`docker run --init -it --rm efrecon/mqtt-client pub -h $DireccionIP -p 1883 -t "iescelia/aula22/co2" -m 30`

- La imagen docker usa el cliente MQTT (mosquitto_pub)
- El comando 'pub' publica un mensaje en el broker
- '-h' indica el host (La IP) del broker MQTT
- '-p' apunta al puerto 1883
- '-t' Indicamos el topic. En este ejemplo "iescelia/aula22/co2"  

#### Cliente
Con este otro comando podemos suscribirnos a los topics que se publiquen en cada aula de iescelia

`docker run --init -it --rm efrecon/mqtt-client sub -h $DireccionIP -t "iescelia/#"`

- La imagen docker usa el cliente MQTT (mosquitto_pub)
- El comando 'sub' se suscribe a un topic
- '-h' indica el host (La IP) del broker MQT
- '-t' Indicamos el topic al que suscribirnos. '#' es una wildcard, así que coge cualquier topic. Podríamos suscribirnos a uno concreto.

**Información de ampliación**
------------
- 

**Archivos en el repositorio**
------------
1. **README**          				  Documentación.
2. **dockerinstall.sh**               Instalación de docker y docker-compose.
3. **docker-compose.yml**             Organizacion de contenedores docker.
4. **.env**							  Entorno para docker-compose.
      
**Referencias**
------------
- Guía original para la práctica.
http://josejuansanchez.org/iot-dashboard/

**Editor Markdown**
------------
- Markdown editor.
https://markdown-editor.github.io/
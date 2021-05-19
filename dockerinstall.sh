#!/bin/bash
set -x

## Recuerda: debes lanzar docker compose desde el directorio donde tengas docker-compose.yml
# Actualizamos 
apt update

# Instalamos docker y docker-compose
apt install docker docker-compose -y

# Habilitamos docker y arrancamos el servicio
systemctl enable docker
systemctl start docker

# Lanzamos los servicios de docker-compose yml. Es necesario usar '-d' para que no se abra la terminal.
# docker-compose up -d

## Para finalizar docker-compose ##
#docker-compose down -v 
#con -v elimina los volúmenes a la vez, útil para prácticas.
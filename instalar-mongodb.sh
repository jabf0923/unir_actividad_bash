#!/bin/bash

# Lee el archivo de configuracion
config_file="config.ini"
if [ ! -f "$config_file" ]; then
  echo "Error: El archivo de configuracion '$config_file' no existe."
  exit 1
fi

# Lee los valores del archivo de configuracion
source "$config_file"

# Comprueba si se proporcionaron todos los valores necesarios
if [ -z "$user" ] || [ -z "$password" ] || [ -z "$port" ]; then
  echo "Error: El archivo de configuracion no contiene todos los parametros necesarios."
  exit 1
fi

# Descarga MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add - && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list


# Instala MongoDB
echo "Instalando MongoDB..."
sudo apt-get update && sudo apt install mongodb -y 


# Inicia el servicio de MongoDB
echo "Iniciando el servicio de MongoDB..."
# Comando para iniciar el servicio de MongoDB
sudo systemctl start mongodb

# Comprueba si el servicio de MongoDB ha arrancado correctamente
echo "Comprobando si el servicio de MongoDB ha arrancado correctamente..."
is_running=false
max_attempts=15
attempt=1

while [ $attempt -le $max_attempts ]; do
  if systemctl is-active --quiet mongodb >/dev/null; then
    is_running=true
    break
  fi
  attempt=$((attempt + 1))
  sleep 1
done

if [ "$is_running" = true ]; then
  echo "El servicio de MongoDB se ha iniciado correctamente."
else
  echo "Error: El servicio de MongoDB no se ha iniciado correctamente."
  exit 1
fi


# Configura MongoDB
echo "Configurando MongoDB..."
# Comandos para configurar MongoDB utilizando los valores proporcionados
mongo -u $user -p $password --authenticationDatabase admin

#!/bin/bash

# Verificar que el archivo de video se proporciona como argumento
if [ -z "$1" ]
  then
    echo "Usage: $0 video_file.mp4"
    exit 1
fi

# Variables de configuración
CLIENT_ID="TU_CLIENT_ID"
CLIENT_SECRET="TU_CLIENT_SECRET"
UPLOAD_URL="https://www.fembed.com/upload"
API_URL="https://www.fembed.com/api/fingerprint"

# Subir el archivo utilizando tusd y obtener la URL de descarga
UPLOAD_OUTPUT=$(tusd "$1" "$UPLOAD_URL" --header "Upload-Metadata token=$CLIENT_ID,name=$(basename "$1")")
DOWNLOAD_URL=$(echo "$UPLOAD_OUTPUT" | grep -oP '(?<=Location: ).*')

# Obtener la huella digital del archivo utilizando la API de Fembed
FINGERPRINT=$(curl -s -X POST "$API_URL" \
    -d "client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET" \
    -d "file_fingerprint=$(echo "$DOWNLOAD_URL" | awk -F"/" '{print $4}') \
    -H "Content-Type: application/x-www-form-urlencoded" \
    | jq -r '.data')

# Verificar si se obtuvo una respuesta correcta
if [ -z "$FINGERPRINT" ]
  then
    echo "Error: Failed to get Fembed video ID"
    exit 1
fi

# Mostrar la URL de descarga del archivo subido a Fembed
echo "Video uploaded successfully!"
echo "Download URL: https://www.fembed.com/v/$FINGERPRINT"

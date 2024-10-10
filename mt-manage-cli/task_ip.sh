#!/bin/bash

# Memeriksa apakah jumlah parameter yang diterima sudah benar
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <user> <usage> <limit>"
    exit 1
fi

# Mendapatkan parameter
USER=$1
USAGE=$2
LIMIT=$3

# Menampilkan pesan info
echo "Executing task_ip.sh for user: $USER, usage: $USAGE, limit: $LIMIT"

# API endpoint (ganti dengan API yang sesuai)
API_URL="http://example.com/api/ip"

# Menyusun data JSON
JSON_PAYLOAD=$(jq -n \
                  --arg user "$USER" \
                  --arg usage "$USAGE" \
                  --arg limit "$LIMIT" \
                  '{user: $user, usage: $usage, limit: $limit}')

# Mengirimkan data menggunakan cURL
response=$(curl -s -w "%{http_code}" -o /tmp/task_ip_response.json \
                -X POST "$API_URL" \
                -H "Content-Type: application/json" \
                -d "$JSON_PAYLOAD")

# Mengecek apakah API request berhasil
if [[ "$response" == "200" ]]; then
    echo "IP task executed successfully for user: $USER"
else
    echo "Failed to execute IP task for user: $USER. Response code: $response"
    cat /tmp/task_ip_response.json
    exit 1
fi
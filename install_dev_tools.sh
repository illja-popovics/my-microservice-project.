#!/bin/bash

set -e

echo "=== Перевірка та встановлення DevOps-інструментів ==="

# Docker
if ! command -v docker &> /dev/null; then
    echo "👉 Встановлюємо Docker..."
    sudo apt update
    sudo apt install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo \
    "deb [arch=$(dpkg --print-architecture) \
    signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker $USER
else
    echo "✅ Docker вже встановлений"
fi

# Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "👉 Встановлюємо Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
        -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
else
    echo "✅ Docker Compose вже встановлений"
fi

# Python
if ! python3 --version | grep -q "3.9\|[4-9]"; then
    echo "👉 Встановлюємо Python 3.9+..."
    sudo apt update
    sudo apt install -y python3 python3-pip
else
    echo "✅ Python 3.9+ вже встановлений"
fi

# Django
if ! pip3 show django &> /dev/null; then
    echo "👉 Встановлюємо Django..."
    pip3 install django
else
    echo "✅ Django вже встановлений"
fi

echo "🎉 Встановлення завершено успішно!"

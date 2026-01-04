FROM ubuntu:22.04

# Evitar prompts interactivos
ENV DEBIAN_FRONTEND=noninteractive

# Instalar Node.js, npm y dependencias
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    ffmpeg \
    espeak-ng \
    python3 \
    python3-pip \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar N8N globalmente
RUN npm install -g n8n

# Crear usuario no-root
RUN useradd -m -s /bin/bash n8n

# Crear directorio temporal
RUN mkdir -p /tmp && chmod 777 /tmp

# Cambiar a usuario n8n
USER n8n
WORKDIR /home/n8n

# Variables de entorno
ENV N8N_PORT=5678

# Exponer puerto
EXPOSE 5678

# Comando de inicio
CMD ["n8n", "start"]

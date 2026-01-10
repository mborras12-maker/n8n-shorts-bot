FROM ubuntu:22.04

# Evitar prompts interactivos
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    ffmpeg \
    espeak-ng \
    python3 \
    python3-pip \
    fonts-liberation \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar N8N globalmente
RUN npm install -g n8n

# Crear usuario n8n
RUN useradd -m -s /bin/bash n8n

# Crear directorios necesarios con permisos
RUN mkdir -p /home/n8n/.n8n && \
    mkdir -p /tmp/shorts && \
    chown -R n8n:n8n /home/n8n && \
    chmod -R 755 /home/n8n && \
    chmod 777 /tmp/shorts

# Cambiar a usuario n8n
USER n8n
WORKDIR /home/n8n

# Variables de entorno
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://n8n-shorts-bot-hh2t.onrender.com

# Exponer puerto
EXPOSE 5678

# Comando de inicio CORREGIDO
CMD ["n8n", "start"]

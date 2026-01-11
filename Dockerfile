FROM node:18-alpine

# Instalar dependencias del sistema
RUN apk add --no-cache \
    ffmpeg \
    wget \
    curl

# Instalar espeak (TTS)
RUN apk add --no-cache espeak

# Instalar N8N
RUN npm install -g n8n

# Crear usuario
RUN adduser -D -h /home/n8n n8n

# Crear directorios
RUN mkdir -p /tmp/shorts && \
    chown -R n8n:n8n /tmp/shorts && \
    chmod 777 /tmp/shorts

# Cambiar a usuario n8n
USER n8n
WORKDIR /home/n8n

# Variables de entorno
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

# Exponer puerto
EXPOSE 5678

# Comando de inicio
CMD ["n8n", "start"]

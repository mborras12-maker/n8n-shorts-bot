FROM n8nio/n8n:latest

USER root

# Instalar FFmpeg, espeak-ng, Python y herramientas necesarias
RUN apk add --no-cache \
    ffmpeg \
    espeak-ng \
    python3 \
    py3-pip \
    wget \
    curl

# Crear directorio temporal
RUN mkdir -p /tmp && chmod 777 /tmp

USER node

# Exponer puerto
EXPOSE 5678

# Comando de inicio
CMD ["n8n"]

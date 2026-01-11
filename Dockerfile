FROM n8nio/n8n:latest

USER root

# Instalar FFmpeg y espeak
RUN apk add --no-cache ffmpeg espeak

# Volver a usuario n8n
USER node

# Variables de entorno
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

EXPOSE 5678

CMD ["n8n", "start"]

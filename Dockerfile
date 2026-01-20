FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache ffmpeg espeak wget curl

RUN mkdir -p /tmp/shorts && chmod 777 /tmp/shorts

USER node

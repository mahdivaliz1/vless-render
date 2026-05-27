FROM alpine:latest

RUN apk add --no-cache curl unzip bash

RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip \
    && mv xray /usr/local/bin/ \
    && chmod +x /usr/local/bin/xray

WORKDIR /app
COPY config.json /app/config.json
COPY start.sh /app/start.sh

RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]

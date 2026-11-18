FROM alpine:latest
RUN apk add --no-cache curl unzip
RUN LATEST_URL=$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases/latest | grep "browser_download_url.*linux-64.zip" | cut -d '"' -f 4) && \
    curl -L -o xray.zip "$LATEST_URL" && \
    unzip xray.zip -d /usr/local/bin/ && \
    rm xray.zip

COPY config.json /etc/xray/config.json
EXPOSE 10000
CMD ["xray", "-config", "/etc/xray/config.json"]

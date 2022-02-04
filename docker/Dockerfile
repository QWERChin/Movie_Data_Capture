FROM python:slim
LABEL maintainer="QWERChin"

RUN apt-get update \
    && apt-get install -y wget ca-certificates \
    && wget -O - 'https://github.com/yoshiko2/AV_Data_Capture/archive/master.tar.gz' | tar xz \
    && mv AV_Data_Capture-master /jav \
    && cd /jav \
    && ( pip install --no-cache-dir -r requirements.txt || true ) \
    && pip install --no-cache-dir requests lxml Beautifulsoup4 pillow \
    && apt-get purge -y wget

RUN \
    apt-get update && \
    apt-get install -y wget ca-certificates git && \
    git clone https://github.com/QWERChin/Movie_Data_Capture.git && \
    mv Movie_Data_Capture /app && \
    cd /app && \
    sed -i '/pyinstaller/d' requirements.txt && \
    cat requirements.txt && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get purge -y wget

VOLUME /app/data
VOLUME /app/JAV_output
WORKDIR /app

# 镜像版本号
ARG BUILD_DATE

ENV LANG C.UTF-8
ADD docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
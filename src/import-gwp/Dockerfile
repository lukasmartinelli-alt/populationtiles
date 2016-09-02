FROM debian:jessie
MAINTAINER Lukas Martinelli <me@lukasmartinelli.ch>

RUN apt-get update && apt-get install -y --no-install-recommends \
      gdal-bin \
      python-gdal \
      wget \
 && rm -rf /var/lib/apt/lists/*

VOLUME /import
ENV IMPORT_DATA_DIR=/import

WORKDIR /usr/src/app
COPY . /usr/src/app
CMD ["./import-gwp.sh"]

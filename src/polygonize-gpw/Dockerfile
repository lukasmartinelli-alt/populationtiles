FROM debian:jessie
MAINTAINER Lukas Martinelli <me@lukasmartinelli.ch>

RUN apt-get update && apt-get install -y --no-install-recommends \
      gdal-bin \
      wget \
 && rm -rf /var/lib/apt/lists/*

VOLUME /in /out
ENV TIFF_INPUT=/in SHP_OUTPUT=/out


WORKDIR /usr/src/app
COPY . /usr/src/app
CMD ["polygonize.sh"]

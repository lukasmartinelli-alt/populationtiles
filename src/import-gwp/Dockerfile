FROM mdillon/postgis:9.5
MAINTAINER Lukas Martinelli <me@lukasmartinelli.ch>

VOLUME /import
ENV IMPORT_DATA_DIR=/import

WORKDIR /usr/src/app
COPY . /usr/src/app
CMD ["./import-gwp.sh"]

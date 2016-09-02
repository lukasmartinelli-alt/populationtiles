#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

readonly PGCONN="dbname=$POSTGRES_DB user=$POSTGRES_USER host=$POSTGRES_HOST password=$POSTGRES_PASSWORD port=5432"
readonly RASTER_SIZE="4096x4096"

function import_tif() {
    local gwp_tif
    for gwp_tif in "$IMPORT_DATA_DIR"/*.tif; do
        raster2pgsql -s 4326 -d -C -M -t "$RASTER_SIZE" "$gwp_tif" | psql -d gwp -U gwp -h postgres
        break
    done
}

import_tif

#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

readonly PGCONN="dbname=$POSTGRES_DB user=$POSTGRES_USER host=$POSTGRES_HOST password=$POSTGRES_PASSWORD port=5432"

function polygonize_gwp_tiff() {
    local gwp_tif
    for gwp_tif in "$IMPORT_DATA_DIR"/*.tif; do
        gdal_polygonize.py "$gwp_tif" \
            -f "PostgreSQL" PG:"$PGCONN" \
            "population" "population"
        break
    done
}

polygonize_gwp_tiff

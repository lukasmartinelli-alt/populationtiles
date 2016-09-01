#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

readonly POLYGONIZED_SHAPE_FILE="$SHP_OUTPUT/gwp.shp"

function polygonize_tiff() {
    local gpw_tif="$1"
    local shapefile="$2"
	gdal_polygonize.py "$gpw_tif" -f 'ESRI Shapefile' "$shapefile"
}

function main() {
    local gwp_tif
    for gwp_tif in "$IMPORT_DATA_DIR"/*.tiff; do
        polygonize_tiff "$gwp_tif" "$POLYGONIZED_SHAPE_FILE"
        break
    done
}

# tippecanoe -o population.mbtiles --force -Z 0 -z 8 -B 8 -ap data/population.geojson

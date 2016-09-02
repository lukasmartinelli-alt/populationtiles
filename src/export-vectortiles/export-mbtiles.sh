#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

readonly PROJECT_DIR="/tm2source"
readonly EXPORT_DIR="/export"
readonly RENDER_SCHEME=${RENDER_SCHEME:-pyramid}
readonly MIN_ZOOM=${MIN_ZOOM:-0}
readonly MAX_ZOOM=${MAX_ZOOM:-8}
readonly BBOX=${BBOX:-"5.8559113 45.717995 10.5922941 47.9084648"}
readonly MBTILES_NAME=${MBTILES_NAME:-"gpw.mbtiles"}

function export_local_mbtiles() {
    exec tl copy \
        -s pyramid \
        -b "$BBOX" \
        --min-zoom="$MIN_ZOOM" \
        --max-zoom="$MAX_ZOOM" \
        "tmsource://$PROJECT_DIR" "mbtiles://$EXPORT_DIR/$MBTILES_NAME"
}

export_local_mbtiles

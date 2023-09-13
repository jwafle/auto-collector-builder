#!/bin/bash -x

export CGO_ENABLED=0
export GOFLAGS=-buildvcs=false
export OUTPUT_DIR=./$1
export CONFIG_PATH=$2
mkdir -p ${OUTPUT_DIR}
chmod 777 ${OUTPUT_DIR}
echo "Building using /builder --config ${CONFIG_PATH}"
/ocb --config ${CONFIG_PATH} --output-path ${OUTPUT_DIR}
chmod 755 ${OUTPUT_DIR}

echo "collector_binary_path=${OUTPUT_DIR}" >> "$GITHUB_OUTPUT"

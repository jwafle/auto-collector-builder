#!/bin/bash -x

export CGO_ENABLED=0
export GOFLAGS=-buildvcs=false
export OUTPUT_DIR=./$1
export CONFIG_PATH=$2
export COLLECTOR_BUILDER_VERSION=$3
export TARGET_ARCH=$TARGETARCH

echo "The collector builder version is: ${COLLECTOR_BUILDER_VERSION}"

curl -L -o /ocb https://github.com/open-telemetry/opentelemetry-collector/releases/download/cmd%2Fbuilder%2Fv${COLLECTOR_BUILDER_VERSION}/ocb_${COLLECTOR_BUILDER_VERSION}_linux_${TARGET_ARCH}
chmod +x /ocb

mkdir -p ${OUTPUT_DIR}
chmod 777 ${OUTPUT_DIR}

echo "Building using /builder --config ${CONFIG_PATH}"
/ocb --config ${CONFIG_PATH} --output-path ${OUTPUT_DIR}
chmod 755 ${OUTPUT_DIR}

echo "collector_binary_path=${OUTPUT_DIR}" >> "$GITHUB_OUTPUT"

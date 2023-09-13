#!/bin/bash -x

export CGO_ENABLED=0
export GOFLAGS=-buildvcs=false
export CONFIG_PATH=$1
export COLLECTOR_BUILDER_VERSION=$2
export TARGET_ARCH=$TARGETARCH

echo "The collector builder version is: ${COLLECTOR_BUILDER_VERSION}"

curl -L -o /ocb https://github.com/open-telemetry/opentelemetry-collector/releases/download/cmd%2Fbuilder%2Fv${COLLECTOR_BUILDER_VERSION}/ocb_${COLLECTOR_BUILDER_VERSION}_linux_${TARGET_ARCH}
chmod +x /ocb

echo "Building using /builder --config ${CONFIG_PATH}"
/ocb --config ${CONFIG_PATH}

echo "collector_binary_path=${OUTPUT_DIR}" >> "$GITHUB_OUTPUT"

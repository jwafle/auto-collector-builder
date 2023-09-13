# Container image that runs your code
FROM golang:1.21

ARG TARGETARCH
ARG INPUT_COLLECTOR_BUILDER_VERSION
RUN echo "The collector builder version is: ${INPUT_COLLECTOR_BUILDER_VERSION}"

RUN curl -L -o /ocb https://github.com/open-telemetry/opentelemetry-collector/releases/download/cmd%2Fbuilder%2Fv${INPUT_COLLECTOR_BUILDER_VERSION}/ocb_${INPUT_COLLECTOR_BUILDER_VERSION}_linux_${TARGETARCH}
RUN chmod +x /ocb

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

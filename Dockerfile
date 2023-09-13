# Container image that runs your code
FROM golang:1.21

ARG TARGETARCH
ENV TARGETARCH ${TARGETARCH}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

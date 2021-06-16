FROM openjdk:8-slim-buster AS builder
COPY --from=python:3.8-slim-buster / /

USER root

RUN apt-get update && apt-get install -y \
        jq dos2unix

RUN pip3 install --pre hamlet-cli

WORKDIR /build/

ENV HAMLET_HOME_DIR='/build/'
RUN mkdir -p "${HAMLET_HOME_DIR}" && hamlet engine install-engine unicycle


# Copy the latest into the container
FROM scratch as base_package

COPY --from=builder /build/engine/engines/unicycle/engine /engine
COPY --from=builder /build/engine/engines/unicycle/engine-plugin-aws /engine-plugin-aws
COPY --from=builder /build/engine/engines/unicycle/engine-plugin-azure /engine-plugin-azure
COPY --from=builder /build/engine/engines/unicycle/executor-bash /executor-bash

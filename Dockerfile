FROM scratch as base_package

# copy the latest image into the container
COPY home/engine/engines/unicycle/engine /engine
COPY home/engine/engines/unicycle/engine-plugin-aws /engine-plugin-aws
COPY home/engine/engines/unicycle/engine-plugin-azure /engine-plugin-azure
COPY home/engine/engines/unicycle/executor-bash /executor-bash

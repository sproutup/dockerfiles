FROM alpine:3.2
MAINTAINER Peter Andersen <peter@sproutup.co>

# Setup environment
ENV NODE_VERSION xxx
ENV NODE_USER node
ENV NODE_GROUP node
ENV NODE_HOME /home/node

# Node is run with user `node`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN addgroup $NODE_GROUP && \
    adduser -u 1000 -D -s /bin/sh -G $NODE_GROUP $NODE_USER

RUN apk update &&\
    apk add curl git wget openssh ttf-dejavu &&\
    apk add nodejs &&\
    # Cleanup
    rm -rf /tmp/* /var/cache/apk/*

RUN apk update && apk add curl make gcc g++ python linux-headers paxctl libgcc libstdc++

# Start container
CMD ["npm","-version"]


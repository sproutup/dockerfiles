# Docker base image for OpenJDK8.
FROM alpine:3.2
MAINTAINER Peter Andersen <peter@sproutup.co>

RUN apk update && \
    apk upgrade && \
    apk add openjdk7 && \
    apk add ttf-dejavu bash && \
    # Cleanup
    rm -rf /tmp/* \
        /var/cache/apk/*

RUN apk update && apk add ca-certificates
COPY cert.sh /home/cert.sh
RUN sh /home/cert.sh

# Start container
CMD ["java","-version"]

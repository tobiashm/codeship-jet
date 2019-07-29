FROM alpine:latest

ARG JET_VERSION
ARG JET_SHA256SUM

RUN set -eux; \
  apk --no-cache add --virtual .jet-builddeps curl tar; \
  curl -SLO "https://s3.amazonaws.com/codeship-jet-releases/${JET_VERSION}/jet-linux_amd64_${JET_VERSION}.tar.gz"; \
  echo "${JET_SHA256SUM}  jet-linux_amd64_${JET_VERSION}.tar.gz" | sha256sum -c -s; \
  tar -xaC /usr/local/bin -f jet-linux_amd64_${JET_VERSION}.tar.gz; \
  chmod +x /usr/local/bin/jet; \
  apk del .jet-builddeps; \
  rm -f jet-linux_amd64_${JET_VERSION}.tar.gz

WORKDIR /root

ENTRYPOINT ["/usr/local/bin/jet"]

FROM alpine

RUN apk add --no-cache \
        curl \
        coreutils \
        openssl \
        aws-cli \
        postgresql16-client

ENV POSTGRES_DATABASE **None**
ENV POSTGRES_HOST **None**
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER **None**
ENV POSTGRES_PASSWORD **None**
ENV POSTGRES_EXTRA_OPTS ''
ENV S3_ACCESS_KEY_ID **None**
ENV S3_SECRET_ACCESS_KEY **None**
ENV S3_BUCKET **None**
ENV S3_REGION us-west-1
ENV S3_PREFIX 'backup'
ENV S3_ENDPOINT **None**
ENV S3_S3V4 no
ENV ENCRYPTION_PASSWORD **None**
ENV DELETE_OLDER_THAN **None**
ENV VICTORIAMETRICS_URL **None**
ENV PUSHGATEWAY_URL **None**

ADD backup.sh /usr/bin/backup.sh
RUN chmod +x /usr/bin/backup.sh

ENTRYPOINT []
WORKDIR /backup
CMD ["sh", "/usr/bin/backup.sh"]
ARG POSTGRES_VERSION
FROM postgres:${POSTGRES_VERSION}-alpine
COPY non-durable-settings.sh /docker-entrypoint-initdb.d/01-non-durable-settings.sh

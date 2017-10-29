FROM postgres:10

COPY pg_hashids /tmp/pg_hashids

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y apt-utils make gcc postgresql-server-dev-10

RUN make -C /tmp/pg_hashids && \
    make -C /tmp/pg_hashids install

RUN rm -rf /tmp/pg_hashids
RUN apt-get -y purge apt-utils make gcc postgresql-server-dev-10
RUN rm -rf /var/cache/apt/archives

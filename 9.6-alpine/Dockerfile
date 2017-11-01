FROM postgres:9.6-alpine

ADD https://github.com/iCyberon/pg_hashids/archive/master.tar.gz /tmp/pg_hashids.tar.gz
RUN cd /tmp && tar -x pg_hashids.tar.gz

RUN apk update && apk upgrade --no-cache
RUN apk add --no-cache --virtual .build-deps make gcc libc-dev postgresql-dev

RUN make -C /tmp/pg_hashids-master && \
    make -C /tmp/pg_hashids-master install

RUN rm -rf /tmp/pg_hashids-master /tmp/pg_hashids.tar.gz
RUN apk del .build-deps

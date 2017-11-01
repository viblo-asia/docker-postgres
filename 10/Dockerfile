FROM postgres:10

ADD https://github.com/iCyberon/pg_hashids/archive/master.tar.gz /tmp/pg_hashids.tar.gz
RUN cd /tmp && tar -xf pg_hashids.tar.gz

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends apt-utils make gcc postgresql-server-dev-10

RUN make -C /tmp/pg_hashids-master && \
    make -C /tmp/pg_hashids-master install

RUN rm -rf /tmp/pg_hashids-master /tmp/pg_hashids.tar.gz
RUN apt-get -y purge apt-utils make gcc postgresql-server-dev-10
RUN rm -rf /var/cache/apt/archives

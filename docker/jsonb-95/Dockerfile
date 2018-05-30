FROM python:3.5-alpine3.4

WORKDIR /opt/qvarn

RUN apk update \
 && apk add \
        git \
        make \
        bash \
        gcc \
        musl-dev \
        build-base \
        postgresql-dev \
        python3-dev \
        py-egenix-mx-base-dev \
        py-setuptools \
        libffi-dev \
        openssl-dev \
 && mkdir -p /var/log/qvarn

COPY vendor/ /tmp/vendor
COPY resources /etc/qvarn/resources
COPY implementations/qvarn-jsonb-0.95 /opt/qvarn
COPY docker/jsonb-95/requirements.txt requirements.txt
COPY docker/jsonb-95/qvarn.conf /etc/qvarn/qvarn.conf
COPY docker/jsonb-95/objstore_postgres.conf /etc/qvarn/objstore_postgres.conf
COPY docker/jsonb-95/Procfile /opt/qvarn/Procfile
COPY docker/jsonb-95/run-objstore.sh /run-objstore.sh
COPY docker/jsonb-95/run-qvarn.sh /run-qvarn.sh

RUN python3 -m venv env \
 && env/bin/pip install --upgrade pip setuptools wheel \
 && env/bin/pip install -f /tmp/vendor -r requirements.txt \
 && env/bin/pip install -f /tmp/vendor -e .

EXPOSE 8000
CMD ["env/bin/honcho", "start"]

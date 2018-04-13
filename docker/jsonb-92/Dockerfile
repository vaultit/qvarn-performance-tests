FROM python:3.5-alpine

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

COPY implementations/qvarn-jsonb-0.92 /opt/qvarn
COPY docker/jsonb-92/qvarn-no-alog.conf /etc/qvarn/qvarn-no-alog.conf
COPY docker/jsonb-92/qvarn-alog.conf /etc/qvarn/qvarn-alog.conf
COPY resources /etc/qvarn/resources
COPY docker/jsonb-92/run.sh /run.sh
COPY vendor/ /tmp/vendor

RUN python3 -m venv env \
 && env/bin/pip install --upgrade pip setuptools wheel \
 && env/bin/pip install -f /tmp/vendor -r requirements.txt \
 && env/bin/pip install -f /tmp/vendor -e .

EXPOSE 8000
CMD ["/run.sh"]

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
        py-cryptography \
 && mkdir -p /var/log/qvarn

COPY implementations/qvarn-jsonb-0.91 /opt/qvarn
COPY docker/jsonb-91/qvarn-no-alog.conf /etc/qvarn/qvarn-no-alog.conf
COPY docker/jsonb-91/qvarn-alog.conf /etc/qvarn/qvarn-alog.conf
COPY resources /etc/qvarn/resources
COPY docker/jsonb-91/run.sh /run.sh
COPY vendor/ /tmp/vendor

RUN python3 -m venv env --system-site-packages \
 && env/bin/pip install --upgrade pip setuptools wheel \
 && env/bin/pip install -f /tmp/vendor -r requirements.txt \
 && env/bin/pip install -f /tmp/vendor -e .

EXPOSE 8000
CMD ["/run.sh"]

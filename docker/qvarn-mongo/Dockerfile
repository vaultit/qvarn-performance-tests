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

COPY docker/qvarn-mongo/qvarn.conf /etc/qvarn/qvarn.conf
COPY resources /etc/qvarn/resources
COPY implementations/qvarn-mongo /opt/qvarn

RUN python3 -m venv env \
 && env/bin/pip install --upgrade pip setuptools wheel \
 && env/bin/pip install -r requirements.txt .

EXPOSE 8000
CMD ["/run.sh"]

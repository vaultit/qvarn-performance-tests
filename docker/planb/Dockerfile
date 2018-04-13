FROM python:3.6-alpine

WORKDIR /opt/qvarn

RUN apk update \
 && apk add \
        git \
        make \
        gcc \
        musl-dev \
        postgresql-dev \
        python3-dev \
        py-egenix-mx-base-dev \
 && rm -rf /var/cache/apk/*

COPY docker/planb/run.sh /run.sh
COPY implementations/qvarn-planb /opt/qvarn
COPY resources /etc/qvarn/resources

RUN python3 -m venv env \
 && env/bin/pip install --upgrade pip setuptools wheel \
 && env/bin/pip install -r requirements.txt \
 && env/bin/pip install -e .

EXPOSE 8000
CMD ["/run.sh"]

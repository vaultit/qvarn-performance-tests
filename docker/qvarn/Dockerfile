FROM debian:8

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" > etc/apt/sources.list.d/backports.list
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y python \
        uwsgi \
        uwsgi-plugin-python \
        python-bottle \
        python-psycopg2 \
        python-yaml \ 
        python-uwsgidecorators \
        python-crypto \
    && apt-get -t jessie-backports install -y \
        python-cryptography && rm -rf /var/lib/apt/lists/*

COPY vendor /tmp/vendor
COPY docker/qvarn/qvarn.conf /etc/qvarn/qvarn.conf
COPY docker/qvarn/uwsgi.ini /etc/uwsgi/apps-available/qvarn.ini
COPY resources /etc/qvarn/resources
COPY docker/qvarn/qvarn-backend /usr/bin/qvarn-backend-vaultit
COPY docker/qvarn/run.sh /run.sh
COPY keys/rsa.pub /keys/rsa.pub

RUN dpkg -i /tmp/vendor/python-jwt_1.4.2-1+deb9u1_all.deb && \
    dpkg -i /tmp/vendor/qvarn-0.82-6.vaultit-6-20180227.deb && \
    rm -rf /tmp/vendor

EXPOSE 8000
CMD ["/run.sh"]

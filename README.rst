Qvarn performance test setup
----------------------------

This repository contains docker-compose setup for running Qvarn with multiple configurations
as well as a Jupyter notebook to run performance


Requirements
============
- Docker with docker-compose
- Python 3.6
- Virtualenv

How to run docker-compose
=========================

To launch docker-compose setup run the following::

    git submodule init
    git submodule update
    docker-compose build
    docker-compose up

To launch Jupyter notebook run::

    make notebook

This will set up virtualenv, install required dependencies, launch Jupyter and open
the notebook.

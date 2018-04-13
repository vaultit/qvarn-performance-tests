.PHONY: env
env: env/.done

env/bin/pip:
	python3 -m venv env
	env/bin/pip install --upgrade pip wheel setuptools

env/.done: env/bin/pip requirements.txt
	env/bin/pip install -r requirements.txt
	touch env/.done

env/bin/pip-compile: env/bin/pip
	env/bin/pip install pip-tools

requirements.txt: env/bin/pip-compile requirements.in
	env/bin/pip-compile --no-index requirements.in -o requirements.txt

.PHONY: notebook
notebook: env
	env/bin/jupyter notebook notebooks/performance-tests.ipynb

.PHONY: ipynbtohtml
ipynbtohtml: env
	env/bin/jupyter nbconvert --to=html notebooks/performance-tests.ipynb

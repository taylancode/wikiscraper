install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
	python -m textblob.download_corpora

format:
	black *.py lib/*.py
lint:
	pylint --disable=R,C *.py lib/*.py
test:
	python -m pytest -vv --cov-append --cov=lib --cov=main tests/
build:
	docker build -t deploy-fastapi
deploy:

all:
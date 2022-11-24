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
	docker build -t deploy-wikiscraper .
run:
	docker run -p 127.0.0.1:8080:8080 b9526d20c720
deploy:

all:
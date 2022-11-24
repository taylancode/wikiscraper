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
	docker build -t wikiscraper .
run:
	docker run -p 127.0.0.1:8080:8080 b9526d20c720
deploy:
	aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 160968874221.dkr.ecr.eu-west-2.amazonaws.com
	docker build -t wikiscraper .
	docker tag wikiscraper:latest 160968874221.dkr.ecr.eu-west-2.amazonaws.com/wikiscraper:latest
	docker push 160968874221.dkr.ecr.eu-west-2.amazonaws.com/wikiscraper:latest

all: install test deploy
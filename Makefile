install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black *.py lib/*.py
lint:
	pylint --disable=R,C *.py lib/*.py
test:
	python -m pytest -vv --cov-append --cov=lib tests/
build:
	#build container
deploy:

all:
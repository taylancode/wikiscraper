install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black *.py lib/*.py
lint:

test:

deploy:

all:
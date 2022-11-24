install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black *.py lib/*.py
lint:
	pylint --disable=R,C *.py lib/*.py
test:

deploy:

all:
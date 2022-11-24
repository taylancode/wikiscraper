install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black *.py lib/*.py
lint:
	pylint --disable=R,C *.py lib/*.py
test:
	python -m pytest -vv --cov=lib test_logic.py
build:
	#build container
deploy:

all:
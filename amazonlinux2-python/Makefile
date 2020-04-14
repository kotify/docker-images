PY3.8 := 3.8.2

build.3.8:
	docker build . --build-arg PYTHON_VERSION=$(PY3.8) --tag=kotify/amazonlinux2-python:3.8
push.3.8: build.3.8
	docker push kotify/amazonlinux2-python:3.8

all: push.3.8

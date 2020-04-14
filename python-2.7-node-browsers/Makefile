all: push

pull:
	docker pull python:2.7-slim-stretch

build: pull
	docker build . --tag=kotify/python:2.7-node-browsers

push: build
	docker push kotify/python:2.7-node-browsers

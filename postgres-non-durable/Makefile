all: push.10 push.11 push.12

pull.%:
	docker pull postgres:$(subst pull.,,$@)-alpine
build.%: pull.%
	docker build . --build-arg POSTGRES_VERSION=$(subst build.,,$@) --tag=kotify/postgres-non-durable:$(subst build.,,$@)
push.%: build.%
	docker push kotify/postgres-non-durable:$(subst push.,,$@)

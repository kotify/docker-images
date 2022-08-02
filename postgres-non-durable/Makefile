all: push.10 push.11 push.12 push.13 push.14 push.anon.10

pull.anon.%:
	docker pull postgres:$(subst pull.anon.,,$@)-alpine
build.anon.%: pull.anon.%
	docker build . -f Dockerfile-anon --build-arg POSTGRES_VERSION=$(subst build.anon.,,$@) --tag=kotify/postgres-non-durable-anon:$(subst build.anon.,,$@)
push.anon.%: build.anon.%
	docker push kotify/postgres-non-durable-anon:$(subst push.anon.,,$@)
pull.%:
	docker pull postgres:$(subst pull.,,$@)-alpine
build.%: pull.%
	docker build . --build-arg POSTGRES_VERSION=$(subst build.,,$@) --tag=kotify/postgres-non-durable:$(subst build.,,$@)
push.%: build.%
	docker push kotify/postgres-non-durable:$(subst push.,,$@)

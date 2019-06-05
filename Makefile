# DO NOT EDIT, AUTOGENERATED BY gen.sh

all: refresh-base-images publish.all

refresh-base-images:
	grep 'FROM' **/Dockerfile | cut -d ' ' -f 2 | xargs -L 1 docker pull


build.circleci_python27_node10_browsers:
	docker build -f circleci-python27-node10-browsers/Dockerfile . --tag=kotify/circleci:python27-node10-browsers
push.circleci_python27_node10_browsers:
	docker push kotify/circleci:python27-node10-browsers
pin.circleci_python27_node10_browsers: build.circleci_python27_node10_browsers
	docker tag kotify/circleci:python27-node10-browsers kotify/circleci:python27-node10-browsers-190605
publish.pin.circleci_python27_node10_browsers: pin.circleci_python27_node10_browsers
	docker push kotify/circleci:python27-node10-browsers-190605
publish.circleci_python27_node10_browsers: build.circleci_python27_node10_browsers push.circleci_python27_node10_browsers


build.circleci_python37_node10_aws:
	docker build -f circleci-python37-node10-aws/Dockerfile . --tag=kotify/circleci:python37-node10-aws
push.circleci_python37_node10_aws:
	docker push kotify/circleci:python37-node10-aws
pin.circleci_python37_node10_aws: build.circleci_python37_node10_aws
	docker tag kotify/circleci:python37-node10-aws kotify/circleci:python37-node10-aws-190605
publish.pin.circleci_python37_node10_aws: pin.circleci_python37_node10_aws
	docker push kotify/circleci:python37-node10-aws-190605
publish.circleci_python37_node10_aws: build.circleci_python37_node10_aws push.circleci_python37_node10_aws


build.circleci_python37_node10_browsers_aws:
	docker build -f circleci-python37-node10-browsers-aws/Dockerfile . --tag=kotify/circleci:python37-node10-browsers-aws
push.circleci_python37_node10_browsers_aws:
	docker push kotify/circleci:python37-node10-browsers-aws
pin.circleci_python37_node10_browsers_aws: build.circleci_python37_node10_browsers_aws
	docker tag kotify/circleci:python37-node10-browsers-aws kotify/circleci:python37-node10-browsers-aws-190605
publish.pin.circleci_python37_node10_browsers_aws: pin.circleci_python37_node10_browsers_aws
	docker push kotify/circleci:python37-node10-browsers-aws-190605
publish.circleci_python37_node10_browsers_aws: build.circleci_python37_node10_browsers_aws push.circleci_python37_node10_browsers_aws


build.postgres_non_durable:
	docker build -f postgres-non-durable/Dockerfile . --tag=kotify/postgres:non-durable
push.postgres_non_durable:
	docker push kotify/postgres:non-durable
pin.postgres_non_durable: build.postgres_non_durable
	docker tag kotify/postgres:non-durable kotify/postgres:non-durable-190605
publish.pin.postgres_non_durable: pin.postgres_non_durable
	docker push kotify/postgres:non-durable-190605
publish.postgres_non_durable: build.postgres_non_durable push.postgres_non_durable


build.python_2_7_node_browsers:
	docker build -f python-2.7-node-browsers/Dockerfile . --tag=kotify/python:2.7-node-browsers
push.python_2_7_node_browsers:
	docker push kotify/python:2.7-node-browsers
pin.python_2_7_node_browsers: build.python_2_7_node_browsers
	docker tag kotify/python:2.7-node-browsers kotify/python:2.7-node-browsers-190605
publish.pin.python_2_7_node_browsers: pin.python_2_7_node_browsers
	docker push kotify/python:2.7-node-browsers-190605
publish.python_2_7_node_browsers: build.python_2_7_node_browsers push.python_2_7_node_browsers


publish.all: publish.circleci_python27_node10_browsers publish.circleci_python37_node10_aws publish.circleci_python37_node10_browsers_aws publish.postgres_non_durable publish.python_2_7_node_browsers

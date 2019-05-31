# Kotify Docker Images

To add new image create new directory with Dockerfile, directory name must match image name eg.: `python-2.7-node` will produce docker tag `python:2.7-node`.
Then regenerate makefile with `./gen.sh` and publish docker image with `make publish.<image_path_underscored>` eg.: `make publish.python_2_7_node`
To rebuild all images from fresh base images run `make all`

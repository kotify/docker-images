FROM circleci/python:3.7-stretch-node

USER root
RUN apt install awscli rsync
RUN pip install ansible-modules-hashivault

USER circleci
COPY ./common/get_token.py /get_token.py

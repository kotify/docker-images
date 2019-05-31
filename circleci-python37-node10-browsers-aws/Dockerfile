FROM circleci/python:3.7-stretch-node-browsers

USER root
RUN apt install awscli
RUN pip install ansible-modules-hashivault

USER circleci
COPY ./common/get_token.py /get_token.py

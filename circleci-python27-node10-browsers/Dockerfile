FROM circleci/python:2.7-stretch-node-browsers

USER root
RUN pip install ansible-modules-hashivault

USER circleci
COPY ./common/get_token.py /get_token.py

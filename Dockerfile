# syntax=docker/dockerfile:1
FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1
# copy python requirements to docker image
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

RUN mkdir /app
# when running docker-compose run app sh -c "django-admin.py startproject app ."
# Essentially we will be running on the docker image, in this dir
WORKDIR /app
COPY ./app /app

# Create user, '-D' means will only run app
# You use this guy instead of running as root
RUN adduser -D user
USER user





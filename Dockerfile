FROM arm32v6/python:3.7.3-alpine

WORKDIR /opt/work

COPY . /opt/work

RUN pip install --upgrade pip

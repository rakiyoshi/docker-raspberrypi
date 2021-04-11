FROM arm32v6/python:3.7.3-alpine

WORKDIR /usr/local/src/awslogs

COPY ./src/etc/issue /etc/issue

RUN apk add  --no-cache \
    openrc
RUN pip install --upgrade pip
RUN pip install --user \
    urllib3

COPY ./src/awslogs-agent-setup.py /usr/local/src/awslogs/awslogs-agent-setup.py

CMD ["python", "/usr/local/src/awslogs/awslogs-agent-setup.py", "--region", "ap-northeast-1"]

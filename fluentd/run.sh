#!/bin/bash

docker run \
  --rm \
  --detach \
  --name fluentd-awslogs \
  --volume /var/log/auth.log:/fluentd/log/auth.log:ro \
  --volume ${PWD}/fluent.conf:/fluentd/etc/fluent.conf \
  --volume ${HOME}/.aws:/home/fluent/.aws:ro \
  --privileged \  # Couldn't identify CAPABILITY
  gcr.io/docker-raspberrypi/fluentd-awslogs

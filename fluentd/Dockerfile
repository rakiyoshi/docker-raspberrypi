FROM arm32v6/ruby:3.0-alpine

RUN apk update \
  && apk add --no-cache \
    tini \
  && apk add --no-cache --virtual .build-deps \
    build-base \
    ruby-dev \
    gnupg \
  && echo 'gem: --no-document' >> /etc/gemrc \
  && gem install oj -v 2.18.3 \
  && gem install json -v 2.2.0 \
  && gem install fluentd -v 0.12.43 \
  && gem install bigdecimal -v 1.3.5 \
  && gem install fluent-plugin-cloudwatch-logs -v 0.13.4 \
  && apk del .build-deps \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

RUN addgroup -S fluent && adduser -S -g fluent fluent \
    && addgroup fluent adm && addgroup fluent fluent\
    # for log storage (maybe shared with host)
    && mkdir -p /fluentd/log \
    # configuration/plugins path (default: copied from .)
    && mkdir -p /fluentd/etc /fluentd/plugins \
    && chown -R fluent /fluentd && chgrp -R fluent /fluentd

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/

ONBUILD COPY fluent.conf /fluentd/etc/
ONBUILD COPY plugins /fluentd/plugins/

ENV FLUENTD_CONF="fluent.conf"

ENV LD_PRELOAD=""
EXPOSE 24224 5140

USER fluent
ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]

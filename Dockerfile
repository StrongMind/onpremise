FROM sentry:9.0-onbuild

COPY patch.txt /usr/src/sentry
RUN apt-get update && apt-get install patch build-essential libxmlsec1 libxmlsec1-dev

WORKDIR /usr/local/lib/python2.7/site-packages
RUN patch -p1 -i /usr/src/sentry/patch.txt
WORKDIR /usr/src/sentry

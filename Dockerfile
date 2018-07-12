FROM sentry:9.0
WORKDIR /usr/src/sentry

ENV PYTHONPATH /usr/src/sentry
COPY . /usr/src/sentry

COPY patch.txt /usr/src/sentry
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -qq patch build-essential libxmlsec1 libxmlsec1-dev

RUN pip install -r requirements.txt

WORKDIR /usr/local/lib/python2.7/site-packages
RUN patch -p1 -i /usr/src/sentry/patch.txt

COPY sentry.conf.py $SENTRY_CONF/
WORKDIR /usr/src/sentry

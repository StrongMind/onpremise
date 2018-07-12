FROM sentry:9.0-onbuild

RUN apt-get update && apt-get install -y pkg-config xmlsec1 libxmlsec1-dev
RUN pip install https://github.com/getsentry/sentry-auth-saml2/archive/master.zip

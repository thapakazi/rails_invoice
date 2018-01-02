FROM ruby:2.5.0-alpine
LABEL maintainer thapakazi

COPY .docker/apk_mirrors /etc/apk/repositories
RUN apk update \
    && apk add --no-cache --virtual .build-deps \
    	gcc build-base \
    && apk add --no-cache --virtual .build-run \
        libsasl \
	nodejs \
	postgresql-dev \
    	make \	
	git \
	bash && sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

ENV APP_ROOT /app
ENV BUNDLE_PATH /bundle_path


WORKDIR $APP_ROOT
EXPOSE 3000
# COPY scripts/main.sh /
CMD ['ruby --version']


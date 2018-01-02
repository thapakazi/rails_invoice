FROM ruby:2.5.0-alpine
LABEL maintainer thapakazi

RUN apk update && \
    apk add --no-cache --virtual .build-deps \
	gcc \
        g++ && \ 
    apk add --no-cache --virtual .build-run \
        postgresql-dev \
	libpq \
        make \	
	git \
	bash && sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

ENV APP_ROOT /app
ENV BUNDLE_PATH /bundle_path

COPY scripts/main.sh /
WORKDIR $APP_ROOT
EXPOSE 3000

CMD ['/main.sh']


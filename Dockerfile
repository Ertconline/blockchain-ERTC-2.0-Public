

FROM node:14

MAINTAINER izzz.io

RUN apt-get update

RUN mkdir -p /app

RUN mkdir -p /app/ERTC/runtime

COPY . /app

WORKDIR /app

RUN npm i --quiet --silent  \
    && cd /app/plugins/iz3-bitcore-crypto \
    && npm i --quiet --silent

EXPOSE 9990 7790

CMD cd /app/ERTC && node ../main.js --config=config.json
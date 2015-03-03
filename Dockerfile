FROM iojs:1.4
MAINTAINER jeff@jeffutter.com

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV CHROME_BIN /chromium.sh
ENV DISPLAY :99

RUN apt-get update \
    && apt-get install -y xvfb chromium \
    && rm -rf /var/lib/apt/lists/*

COPY chromium.sh /chromium.sh

ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install
ONBUILD COPY . /usr/src/app

CMD npm test

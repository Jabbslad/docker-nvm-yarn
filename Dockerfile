FROM ubuntu:latest

LABEL maintainer="jabbslad@gmail.com"

ENV NVM_VERSION v0.33.11

RUN apt-get -y update \
    && apt-get -y install curl \
        git \
        gnupg2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get -y update \
    && apt-get -y install --no-install-recommends yarn \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash
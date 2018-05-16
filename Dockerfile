FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y git curl

RUN groupadd --gid 502 buildkite-agent && \
    useradd --uid 501 --gid buildkite-agent --shell /bin/bash --create-home buildkite-agent

USER buildkite-agent

ENV HOME=/home/buildkite-agent
ENV APP_HOME=$HOME/app

WORKDIR $HOME

RUN curl https://install.meteor.com/ | sh

ENV PATH=$HOME/.meteor:$PATH

RUN meteor npm install -g typescript yarn

WORKDIR $APP_HOME

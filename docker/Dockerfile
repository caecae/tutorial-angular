# https://docs.docker.com/develop/develop-images/multistage-build/

# Multi-stage build: 
## environment setup stage - development container
# https://hub.docker.com/_/node/
FROM node:12.14 AS setup

ARG NG_VERSION=8.3.21

# install chrome for testing
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && \
    apt-get install -yq google-chrome-stable && \
    npm install -g @angular/cli@${NG_VERSION}

# set WORKDIR
WORKDIR /wip
ENV PATH /wip/node_modules/.bin:$PATH

# Multi-stage build: 
## builder/compiler stage
FROM setup AS builder

# add app
COPY . /wip
RUN npm install

# start app
CMD ng serve --host 0.0.0.0

FROM node:10

RUN set -ex \
  && npm install -g ember-cli \
  && apt-get update -y && apt-get install -y curl \
  && curl https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz | tar -C /usr/local -xz
RUN mkdir -p /go/src/github.com/hashicorp/nomad
ENV PATH=/usr/local/go/bin:/go/bin:$PATH
ENV GOPATH=/go
RUN set -ex \
  && go get -v github.com/hashicorp/go-bindata/go-bindata \
  && go get -v github.com/elazarl/go-bindata-assetfs/go-bindata-assetfs
WORKDIR /go/src/github.com/hashicorp/nomad
VOLUME /go/src/github.com/hashicorp/nomad
ENTRYPOINT ["make", "static-assets"]

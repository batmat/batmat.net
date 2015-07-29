from debian

RUN apt-get update -y && \
    apt-get install -y \
                       curl \
                       golang-go \
                       git \
                       mercurial \
                       asciidoctor

ENV GOPATH /gopath
RUN go get -v github.com/spf13/hugo

ENV PATH $GOPATH/bin:$PATH

ADD . /blog

WORKDIR /blog

RUN rm -rf build && \
    hugo --theme=batmat


EXPOSE 80

ENTRYPOINT ["hugo","--theme=batmat", "server", "--port=80"," --appendPort=false","--disableLiveReload=true", "--bind=0.0.0.0"]

CMD ["--baseUrl=http://batmat.net"]

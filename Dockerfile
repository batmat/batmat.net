from debian

RUN apt-get update -y && \
    apt-get install curl -y && \
    version=$( curl -s https://github.com/spf13/hugo/releases/latest | sed 's#.*https://github.com/spf13/hugo/releases/tag/v\(.*\)".*#\1#' ) && \
    curl -L https://github.com/spf13/hugo/releases/download/v$version/hugo_${version}_amd64.deb > hugo.deb && \
    dpkg -i hugo.deb

# TODO merge with above when more bandwidth

RUN apt-get install asciidoctor -y

ADD . /blog

WORKDIR /blog

RUN rm -rf build && \
    hugo --theme=batmat


EXPOSE 80

ENTRYPOINT ["hugo","--theme=batmat", "server", "--port=80"," --appendPort=false","--disableLiveReload=true", "--bind=0.0.0.0"]

CMD ["--baseUrl=http://batmat.net"]

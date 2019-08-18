from nginx:1.9

RUN apt-get update -y && \
    apt-get install -y \
                       curl \
                       golang-go \
                       git \
                       mercurial \
                       asciidoctor

ENV HUGO_VERSION=0.57.2
ENV HUGO_ARCHIVE_SHA_256=558cd6d492562cf7bc2a24a683cdc2608043a4f593077442480944cc7c1f8665

RUN curl -sL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
         --output hugo.tar.gz && \
    echo "$HUGO_ARCHIVE_SHA_256  hugo.tar.gz" | sha256sum --check && \
    tar xvzf hugo*.tar.gz && \
    mv hugo /usr/local/bin/hugo && \
    rm hugo.tar.gz README.md LICENSE

ADD . /blog

WORKDIR /blog

RUN rm -rf public && \
    rm -rf .git && rm -f .gitignore && \
    HUGO_THEME=batmat hugo

RUN mkdir public/cv && \
    cd _cv && \
    ./build.sh && \
    mv _dist/* ../public/cv/

EXPOSE 80

RUN mv public/* /usr/share/nginx/html/
ADD nginx-default.conf /etc/nginx/conf.d/default.conf

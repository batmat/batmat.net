from nginx:1.23.1

RUN apt-get update -y && \
    apt-get install -y \
                       curl \
                       golang-go \
                       git \
                       mercurial \
                       asciidoctor

ENV HUGO_VERSION=0.73.0
ENV HUGO_ARCHIVE_SHA_256=7238b1b39d50667190020c93370bb2727d9097226cb3147c982d4d40004da09f

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

from nginx:1.9

RUN apt-get update -y && \
    apt-get install -y \
                       curl \
                       golang-go \
                       git \
                       mercurial \
                       asciidoctor

RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.36.1/hugo_0.36.1_Linux-64bit.tar.gz | \
    tar xvzf - && \
    mv hugo /usr/local/bin/hugo

ADD . /blog

WORKDIR /blog

RUN rm -rf public && \
    rm -rf .git && rm -f .gitignore && \
    hugo --theme=batmat

RUN mkdir public/cv && \
    cd _cv && \
    ./build.sh && \
    mv _dist/* ../public/cv/

EXPOSE 80

RUN mv public/* /usr/share/nginx/html/
ADD nginx-default.conf /etc/nginx/conf.d/default.conf

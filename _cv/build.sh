#!/bin/bash

TARGET=_dist

set -eou pipefail

rm -rf $TARGET
mkdir $TARGET/

cp -R asciidoctor-stylesheet-factory ressources $TARGET/

cd $TARGET


cat ../cv.adoc | grep -v '<=====en' | sed 's/<=====fr//g' > fr.adoc
cat ../cv.adoc | grep -v '<=====fr' | sed 's/<=====en//g' > en.adoc

asciidoctor fr.adoc
asciidoctor en.adoc

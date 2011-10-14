#!/bin/sh
exec erl -pa apps/*/ebin deps/*/ebin site/ebin -boot start_sasl \
    -sname yawndb_dev +K true +A 10 +P 300000 \
    -s testapp \
    -config ./priv/mochiweb

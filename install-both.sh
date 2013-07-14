#!/bin/sh -ex

cabal clean
mv webkit.cabal-renamed webkit.cabal || true
mv webkit3.cabal webkit3.cabal-renamed || true
cabal-src-install "$@"

cabal clean
mv webkit3.cabal-renamed webkit3.cabal || true
mv webkit.cabal webkit.cabal-renamed || true
cabal-src-install "$@"


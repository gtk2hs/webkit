#!/bin/sh -ex

$CABAL clean
mv webkit.cabal-renamed webkit.cabal || true
mv webkitgtk3.cabal webkitgtk3.cabal-renamed || true
$CABAL install "$@"

$CABAL clean
mv webkitgtk3.cabal-renamed webkitgtk3.cabal || true
mv webkit.cabal webkit.cabal-renamed || true
$CABAL install "$@"


#!/bin/sh
set -e
gocode set autobuild true > /dev/null
gocode set propose-builtins true > /dev/null
gocode set unimported-packages true > /dev/null
nvim

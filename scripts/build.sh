#!/usr/bin/env bash

mkdir -p build
lualatex --output-directory=build ./src/main.tex

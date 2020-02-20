#!/bin/sh
ffmpeg -i $argv[0] -filter_complex \
  "fps=10,scale=640:-1:flags=lanczos[x];[x]split[x1][x2]; \
  [x1]palettegen[p];[x2][p]paletteuse" output.gif

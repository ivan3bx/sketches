#!/bin/sh

# Creating a simple animated gif w/ ImageMagick
convert -delay 2 -resize 400x400 -loop 0 +dither -layers Optimize screen-*.png animated.gif
rm screen-*.png

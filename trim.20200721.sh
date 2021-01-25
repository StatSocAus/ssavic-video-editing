#!/usr/bin/env sh

TITLE="The Eye of the Beholder"
ARTIST="Taya Collyer"
ALBUM="Statistical Society of Australia (Victorian Branch)"
TAG="20200721_collyer"

START_TIME="00:11:50"
DURATION="01:08:39"

INPUT=zoom_1.mp4
OUTPUT=ssavic_$TAG


# Make video.
avconv \
    -y              \
    -i $INPUT       \
    -ss $START_TIME \
    -t  $DURATION   \
    -metadata  title="$TITLE"  \
    -metadata artist="$ARTIST" \
    -metadata  album="$ALBUM"  \
    $OUTPUT.mp4

# Make audio.
avconv \
    -y              \
    -i  $INPUT      \
    -ss $START_TIME \
    -t  $DURATION   \
    -metadata  title="$TITLE"  \
    -metadata artist="$ARTIST" \
    -metadata  album="$ALBUM"  \
    -c mp3 -aq 7 -ac 1 -vn \
    $OUTPUT.mp3

# Fix the output audio file.
#
# See here for more info:
# https://unix.stackexchange.com/a/101526
vbrfix $OUTPUT.mp3 $OUTPUT.mp3
rm vbrfix.tmp  # clean up after vbrfix

#!/bin/bash
# Parameter $1 is input video
#
ffmpeg -i $1 -f ffmetadata FFMETADATAFILE

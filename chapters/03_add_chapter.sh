#!/bin/bash
# Parameter $1 is input video
# Parameter $2 is output video
ffmpeg -i $1 -i FFMETADATAFILE -map_metadata 1 -codec copy $2

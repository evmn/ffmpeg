# Add Chapters to Videos

## Generate ffmpeg metadata file

Run `ffmpeg -i input.mp4 -f ffmetadata FFMETADATAFILE` or `01_init_meta.sh`, this will generate FFMETADATAFILE file.

You can add title and artists etc.

## Edit chapters.txt

Add one empty chapter at the end of files

>0:05:00 Chapter 1
>0:35:00 Chapter 2
>0:55:00 Chapter 3
>...
>1:50:50 

## Add Chapter Info to Files

Run `ffmpeg -i input.mp4 -i FFMETADATAFILE -map_metadata 1 -codec copy output.mp4` or `03_add_chapter.sh` to add chapters to new video.

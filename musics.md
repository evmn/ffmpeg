# Convert flac to 320k mp3


```sh
for fullName in *.flac;do
	fileName=$(echo $fullName | cut -d . -f1)
	ffmpeg -i "$fullName"  -codec:a libmp3lame -b:a 320k "$fileName".mp3
done
```


## Convert flac to mp3, save metadata


```sh
#/bin/bash

for fullName in *.flac;do
	fileName=$(echo $fullName | cut -d . -f1)
	ffmpeg -i "$fullName"  -f ffmetadata "$fileName".txt
	ffmpeg -i "$fullName"  -f ffmetadata -i "$fileName".txt -codec:a libmp3lame -b:a 320k "$fileName".mp3
done
```

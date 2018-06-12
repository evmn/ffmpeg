# Convert flac to 320k mp3


```sh
for fullName in *.flac;do
	fileName=$(echo $fullName | cut -d . -f1)
	ffmpeg -i "$fullName"  -codec:a libmp3lame -b:a 320k "$fileName".mp3
done
```





## Save metadata from flac file


```sh
for fullName in *.flac;do
	fileName=$(echo $fullName | cut -d . -f1)
	ffmpeg -i "$fullName"  -f ffmetadata "$fileName".txt
done
```




## Add metadata to mp3 from file

```sh
for fullName in *.mp3;do
	fileName=$(echo $fullName | cut -d . -f1)
	ffmpeg -i "$fullName"  -f ffmetadata -i "$fileName".txt  -c copy -map_metadata 1 -acodec copy release/"$fullName"
done
```

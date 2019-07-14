# 常用命令

 - 裁剪(cut)视频

```sh
#./cut.sh 0:18:20 input.mp4  20:20 output.mp4
ffmpeg -ss $1 -i $2 -t $3 -c copy -avoid_negative_ts 1 $4
```

 - 剪辑(crop)视频

```sh
# 2160x3840
ffmpeg -i $1 -filter:v "crop=2000:2000:160:400" -strict -2 $2
```
 - 慢速播放

```sh
ffmpeg -i $1 -filter:v "setpts=4.0*PTS" -strict -2  $2
```

 - 视频中提取图片

```sh
ffmpeg -i $1 -qscale:v 2 $2_%03d.jpg
```

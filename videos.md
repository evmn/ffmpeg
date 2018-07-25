# 剪辑视频

裁剪视频，修改metadata信息。

## 定位视频

如果需要输入视频的一部分，你需要使用定位选项指定输入文件特定的位置。参数`-ss`用来定位输入文件，它有以下几种用法。

### 输入定位

参数`-ss`需要位于参数`-i`之前：

```sh
ffmpeg -ss 00:23:00 -i Mononoke.Hime.mkv -frames:v 1 out1.jpg
```

该命令生成电影23分钟处的一帧图片。输入文件使用关键帧解析，速度非常快。以FFmpeg 2.1为例，`-ss`用于输入文件时也满足“frame-accurate”。

### 输出定位

参数`-ss`位于参数`-i`之后：

```sh
ffmpeg -i Mononoke.Hime.mkv -ss 00:23:00 -frames:v 1 out2.jpg
```

该命令将生成刚好位于电影23分钟处的一帧图片。

这里，输入文件被解码（丢弃）直到达到`-ss`指定的位置。这将非常的慢，一帧帧处理。以FFmpeg 2.1为例，主要优势为，当用于输出流时，时间戳不会被重置（例如：为视频嵌入字幕，你无需修改字幕时间戳），缺点是在到达那一帧之前要花很多时间。定位的位置越靠后，需要等的时间越长。

### 联合定位

这次在参数`-i`前后都使用`-ss`参数：

```sh
ffmpeg -ss 00:22:30 -i Mononoke.Hime.mkv -ss 00:00:30 -frames:v 1 out3.jpg
```

以上三个命令产生的效果完全相同。

## 裁剪视频

想要裁剪视频中的一部分，可以结合`-t`参数指定视频长度，例如`-ss 60 -t 10`会裁剪60到70秒之间的内容。当然你也可以使用`-to`参数指定结束位置，`-ss 60 -to 70`也会裁剪60到70秒之间的内容。这两个参数不应该同时使用，如果同时出现，则使用`-t`参数。

注意：如果你在`-i`前只指定`-ss`，时间戳会重置为0，所以`-t`和`-to`会产生不同的效果。如果想要保持时间戳，需要增加`-copyts`选项。

```sh
ffmpeg -ss 00:01:00 -i video.mp4 -to 00:02:00 -c copy cut.mp4
ffmpeg -i video.mp4 -ss 00:01:00 -to 00:02:00 -c copy cut.mp4
ffmpeg -ss 00:01:00 -i video.mp4 -to 00:02:00 -c copy -copyts cut.mp4
```

命令一裁剪1分钟到3分钟之间的内容，快速定位。

命令二裁剪1分钟到2分钟之间的内容，慢速定位。

命令三裁剪1分钟到2分钟之间的内容，快速定位。

**If you cut with stream copy (-c copy) you need to use the -avoid_negative_ts 1 option if you want to use that segment with the concat demuxer . **


```sh
ffmpeg -ss 00:03:00 -i video.mp4 -t 60 -c copy -avoid_negative_ts 1 cut.mp4
```



## 修改metadata信息

首先提取metadata到一个文本文件：

```sh
ffmpeg -i input.mp4  -f ffmetadata metadata.txt
```

编辑之后，再合并到视频中去：

```sh
ffmpeg -i input.mp4 -f ffmetadata -i metadata.txt  -c copy -map_metadata 1  -codec copy output.mp4
```


我发现修改`year`后，并没有变化，不知道什么情况！





## Reference

 - [FFmpeg:seeking](http://trac.ffmpeg.org/wiki/Seeking)
 - CSDN:[ffmpeg视频精准剪切](https://blog.csdn.net/matrix_laboratory/article/details/53157383)


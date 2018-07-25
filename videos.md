# 剪辑视频

裁剪视频，修改metadata信息。

## 裁剪视频

```sh
ffmpeg -ss 10 -to 15 -accurate_seek -i test.mp4 -codec copy -avoid_negative_ts 1 cut.mp4
```

从第10秒开始裁剪，到25秒结束。

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

 - CSDN:[ffmpeg视频精准剪切](https://blog.csdn.net/matrix_laboratory/article/details/53157383)

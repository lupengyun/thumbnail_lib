# thumbnaillib

flutter 获取视频缩略的控件



```dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ThumbnailImage(
            videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",//视频的地址
            showWidth: 100,//图片目标宽高
            showHeight: 200,//图片目标宽高
            imageType: ImageType.CENTER_INSIDE,//图片的缩放方式
          ),
        ),
      ),
    );
  }
```


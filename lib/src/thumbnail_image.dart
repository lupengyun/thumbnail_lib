import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// 显示视频缩略图的图片控件
///
enum ImageType { CENTER_CROP, CENTER_INSIDE }

class ThumbnailImage extends StatefulWidget {
  final String videoUrl;
  double showWidth;
  double showHeight;
  final ImageType imageType;

  ThumbnailImage(
      {@required this.videoUrl,
      this.showWidth,
      this.showHeight,
      this.imageType = ImageType.CENTER_CROP});

  @override
  _ThumbnailImageState createState() => _ThumbnailImageState();
}

class _ThumbnailImageState extends State<ThumbnailImage> {
  final String viewtype = "thumbnailImage";
  var params = <String,dynamic>{};
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var ratio = MediaQuery.of(context).devicePixelRatio;
    params.addAll({
      "videoUrl": widget.videoUrl,
      "showWidth": widget.showWidth * ratio,
      "showHeight": widget.showHeight * ratio,
      "imageType": widget.imageType == ImageType.CENTER_CROP ? 0 : 1
    });

    if (widget.showWidth != null && widget.showWidth != null) {
      return SizedBox(
        width: widget.showWidth,
        height: widget.showHeight,
        child: buildContent(context),
      );
    }
    return buildContent(context);
  }

  Widget buildContent(BuildContext context) {



    if (Platform.isAndroid) {
      return AndroidView(
        viewType: viewtype,
        onPlatformViewCreated: viewCreate,
        creationParams: params,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (Platform.isIOS) {
      return UiKitView(
        viewType: viewtype,
        onPlatformViewCreated: viewCreate,
        creationParams: params,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return Container(
      child: Text("Unsupport Platform"),
    );
  }

  ///视图创建之后的回调
  void viewCreate(id) {
    //TODO 通道建设
  }
}

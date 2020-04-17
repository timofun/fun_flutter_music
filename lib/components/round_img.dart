import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fun_flutter_music/components/load_image.dart';

class RoundImgWidget extends StatelessWidget {
  final String img;
  final double width;
  final BoxFit fit;

  RoundImgWidget(this.img, this.width, {this.fit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(width / 2),
      child: img.startsWith('http')
          ? LoadImage(img,
              width: ScreenUtil().setWidth(width),
              height: ScreenUtil().setWidth(width),
              fit: fit)
          : Image.asset(img, fit: fit,),
    );
  }
}

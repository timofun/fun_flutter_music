/// @Author QINGYU FAN
/// @Version
/// @Description 空widget
/// @date 2020/4/12 0012 20:04
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget {
  final double width;
  final double height;

  EmptyWidget({this.width = 0, this.height = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().setWidth(height),
      height: ScreenUtil().setWidth(height),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fun_flutter_music/components/empty_widget.dart';
import 'package:fun_flutter_music/utils/text_style_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetErrorWidget extends StatelessWidget {
  final VoidCallback callback;

  NetErrorWidget({@required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        height: ScreenUtil().setWidth(200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: ScreenUtil().setWidth(80),
            ),
            EmptyWidget(height: ScreenUtil().setWidth(10)),
            Text(
              '点击重新请求',
              style: commonTextStyle,
            )
          ],
        ),
      ),
    );
  }
}

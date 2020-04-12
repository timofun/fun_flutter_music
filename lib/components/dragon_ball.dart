import 'package:common_utils/common_utils.dart';
/// * @description:
/// * @author: fun
/// * @time: 2020/4/9 0009
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fun_flutter_music/components/empty_widget.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'file:///E:/Project/fun_flutter_music/lib/components/load_image.dart';

class DragonBall extends StatelessWidget {
  final String image;
  final String text;

  DragonBall(this.image, this.text);

  var width = ScreenUtil().setWidth(100);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width / 2),
                  color: ColorDefault
              ),
            ),
            LoadAssetImage(image, width: width),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: text == '每日推荐'
                  ? Text(
                      '${DateUtil.formatDate(DateTime.now(), format: 'dd')}',
                      style: TextStyle(
                          color: ColorDefault, fontWeight: FontWeight.bold),
                    )
                  : Text(''),
            )
          ],
        ),
        EmptyWidget(height: 10),
        Text(
          text,
          style: TextStyle(color: ColorDefault, fontSize: 12),
        ),
      ],
    );
  }
}

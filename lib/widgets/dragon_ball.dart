/// * @description:
/// * @author: fun
/// * @time: 2020/4/9 0009
import 'package:flutter/material.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'package:fun_flutter_music/widgets/load_image.dart';

class DragonBall extends StatelessWidget {
  final String image;
  final String text;
  final GestureTapCallback onTap;

  DragonBall(this.image, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: <Widget>[
            Material(
              shape: CircleBorder(),
              elevation: 5,
              child: ClipOval(
                child: Container(
                  width: 40,
                  height: 40,
                  color: ColorDefault,
                  child: LoadAssetImage(image),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Text(text,
              style: TextStyle(
                color: ColorDefault
              ),
            ),
          ],
        ),
      ));
  }
}

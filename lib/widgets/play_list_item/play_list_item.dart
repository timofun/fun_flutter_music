/// @Author QINGYU FAN
/// @Version
/// @Description
/// @date 2020/4/11 0011 22:38

import 'package:flutter/material.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';

import 'model/play_list_item_model.dart';

class PlayListItem extends StatelessWidget {
  final PlayListItemModel playItem;
  PlayListItem(this.playItem);

  @override
  Widget build(BuildContext context) {
    GestureLongPressCallback onLongPress;

    String copyWrite = playItem.copywriter;
    if (copyWrite != null && copyWrite.isNotEmpty) {
      onLongPress = () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  playItem.copywriter,
                  style: Theme.of(context).textTheme.body2,
                ),
              );
            });
      };
    }
    return InkWell(
      onTap: () {
      },
      onLongPress: onLongPress,
      child: Container(
        width: 110,
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              child: Container(
                width: 110,
                height: 110,
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/icon/aao.png",
                  image: playItem.picUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 4)),
            Text(
              playItem.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: ColorDefault
              ),
            ),
          ],
        ),
      ),
    );;
  }
}

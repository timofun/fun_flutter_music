/// * @description: 
/// * @author: fun
/// * @time: 2020/4/9 0009
import 'package:flutter/material.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'file:///E:/Project/fun_flutter_music/lib/components/dragon_ball.dart';

class DragonBallNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: ColorBackground,
      ),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          DragonBall("icon/t_dragonball_icn_daily", "每日推荐", () {
          }),
          DragonBall("icon/t_dragonball_icn_playlist", "歌单", () {
          }),
          DragonBall("icon/t_dragonball_icn_radio_rank", "排行榜", () {
          }),
          DragonBall("icon/t_dragonball_icn_fm", "电台", () {
          }),
          DragonBall("icon/t_dragonball_icn_look", "直播", () {
          }),
        ],
      ),
    );
  }
}

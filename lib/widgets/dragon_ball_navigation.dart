/// * @description: 
/// * @author: fun
/// * @time: 2020/4/9 0009
import 'package:flutter/material.dart';
import 'package:fun_flutter_music/components/dragon_ball.dart';

class DragonBallNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var map = {
      '每日推荐': 'icon/t_dragonball_icn_daily',
      '歌单': 'icon/t_dragonball_icn_playlist',
      '排行榜': 'icon/t_dragonball_icn_radio_rank',
      '电台': 'icon/t_dragonball_icn_fm',
      '直播': 'icon/t_dragonball_icn_look',
    };

    var keys = map.keys.toList();
    return GridView.custom(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: keys.length,
        childAspectRatio: 1 / 1.1,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              switch (index) {
                case 1:
                  print(index);
                  break;
                case 2:
                  print(index);
                  break;
                case 3:
                  print(index);
                  break;
                case 4:
                  print(index);
                  break;
                case 5:
                  print(index);
                  break;
              }
            },
            child: DragonBall(map[keys[index]], keys[index])
          );
        },
        childCount: keys.length,
      ),
    );
  }
}

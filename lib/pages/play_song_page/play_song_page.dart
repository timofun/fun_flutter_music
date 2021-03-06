import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fun_flutter_music/components/empty_widget.dart';
import 'package:fun_flutter_music/components/load_image.dart';
import 'package:fun_flutter_music/components/round_img.dart';
import 'package:fun_flutter_music/provider/play_song_model.dart';
import 'package:fun_flutter_music/utils/application.dart';
import 'package:fun_flutter_music/utils/text_style_utils.dart';
import 'package:fun_flutter_music/widgets/img_menu.dart';
import 'package:fun_flutter_music/widgets/play_bottom_menu.dart';
import 'package:fun_flutter_music/widgets/song_progress.dart';
import 'package:provider/provider.dart';

import 'lyric_page.dart';

class PlaySongPage extends StatefulWidget {
  @override
  _PlaySongPageState createState() => _PlaySongPageState();
}

class _PlaySongPageState extends State<PlaySongPage>
    with TickerProviderStateMixin {
  AnimationController _controller; // 封面旋转控制器
  AnimationController _stylusController; //唱针控制器
  Animation<double> _stylusAnimation;
  int switchIndex = 0; //用于切换歌词

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _stylusController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _stylusAnimation =
        Tween<double>(begin: -0.03, end: -0.10).animate(_stylusController);
    _controller.addStatusListener((status) {
      // 转完一圈之后继续
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
    /// 初始化搜索栏数据
    Provider.of<PlaySongsModel>(context, listen: false).getPlaySong();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaySongsModel>(builder: (context, model, child) {
//      model.getPlaySong();
      if (model.curState == AudioPlayerState.PLAYING) {
        // 如果当前状态是在播放当中，则唱片一直旋转，
        // 并且唱针是移除状态
        _controller.forward();
        _stylusController.reverse();
      } else {
        _controller.stop();
        _stylusController.forward();
      }
      return Scaffold(
        body: Stack(
          children: <Widget>[
            LoadImage("${model.curPlaySong.picUrl}?param=200y200"),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 100,
                sigmaX: 100,
              ),
              child: Container(
                color: Colors.black38,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            AppBar(
              centerTitle: true,
              brightness: Brightness.dark,
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    model.curSong.name,
                    style: commonWhiteTextStyle,
                  ),
                  Text(
                    model.curSong.artists,
                    style: smallWhite70TextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kToolbarHeight + Application.statusBarHeight),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        setState(() {
                          if(switchIndex == 0){
                            switchIndex = 1;
                          }else{
                            switchIndex = 0;
                          }
                        });
                      },
                      child: IndexedStack(
                        index: switchIndex,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: EdgeInsets.only(top: ScreenUtil().setWidth(150)),
                                  child: RotationTransition(
                                    turns: _controller,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        prefix0.Image.asset(
                                          'images/icon/bol.png',
                                          width: ScreenUtil().setWidth(550),
                                        ),
                                        RoundImgWidget('${model.curPlaySong.picUrl}?param=200y200', 370),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                child: RotationTransition(
                                  turns: _stylusAnimation,
                                  alignment: Alignment(
                                      -1 +
                                          (ScreenUtil().setWidth(45 * 2) /
                                              (ScreenUtil().setWidth(293))),
                                      -1 +
                                          (ScreenUtil().setWidth(45 * 2) /
                                              (ScreenUtil().setWidth(504)))),
                                  child: Image.asset(
                                    'images/icon/bql.png',
                                    width: ScreenUtil().setWidth(205),
                                    height: ScreenUtil().setWidth(352.8),
                                  ),
                                ),
                                alignment: Alignment(0.25, -1),
                              ),
                            ],
                          ),
                          LyricPage(model),
                        ],
                      ),
                    ),
                  ),

                  buildSongsHandle(model),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
                    child: SongProgressWidget(model),
                  ),
                  PlayBottomMenuWidget(model),
                  EmptyWidget(height: 20),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildSongsHandle(PlaySongsModel model) {
    return Container(
      height: ScreenUtil().setWidth(100),
      child: Row(
        children: <Widget>[
          ImageMenuWidget('images/icon_dislike.png', 80),
          ImageMenuWidget(
            'images/icon_song_download.png',
            80,
            onTap: () {},
          ),
          ImageMenuWidget(
            'images/bfc.png',
            80,
            onTap: () {},
          ),
//          Expanded(
//            child: Align(
//              child: Container(
//                width: ScreenUtil().setWidth(130),
//                height: ScreenUtil().setWidth(80),
//                child: CustomFutureBuilder<SongCommentData>(
//                  futureFunc: RequestManager.getInstance().get(PERSONAL, params: {'limit': 6}),
//                  params: {'id': model.curSong.id, 'offset': 1},
//                  loadingWidget: Image.asset(
//                    'images/icon_song_comment.png',
//                    width: ScreenUtil().setWidth(80),
//                    height: ScreenUtil().setWidth(80),
//                  ),
//                  builder: (context, data) {
//                    return GestureDetector(
//                      onTap: () {
//                        NavigatorUtil.goCommentPage(context, data: CommentHead(model.curSong.picUrl, model.curSong.name, model.curSong.artists, data.total, model.curSong.id, CommentType.song.index));
//                      },
//                      child: Stack(
//                        alignment: Alignment.center,
//                        children: <Widget>[
//                          Image.asset(
//                            'images/icon_song_comment.png',
//                            width: ScreenUtil().setWidth(80),
//                            height: ScreenUtil().setWidth(80),
//                          ),
//                          Align(
//                            alignment: Alignment.topRight,
//                            child: Container(
//                              margin: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
//                              width: ScreenUtil().setWidth(58),
//                              child: Text(
//                                '${NumberUtils.formatNum(data.total)}',
//                                style: common10White70TextStyle,
//                              ),
//                            ),
//                          )
//                        ],
//                      ),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
          ImageMenuWidget('images/icon_song_more.png', 80),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _stylusController.dispose();
    super.dispose();
  }
}

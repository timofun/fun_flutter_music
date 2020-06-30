/**
 * 文件,用于初始化跳转到各个页面的handle,并获取到上个页面传递过来的值,然后在初始化要跳转到的页面.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun_flutter_music/pages/login/login_page.dart';
import 'package:fun_flutter_music/pages/play_song_page/play_song_page.dart';
import 'package:fun_flutter_music/pages/rank/rank_page.dart';
import 'package:fun_flutter_music/widgets/home_page.dart';
import 'package:fun_flutter_music/widgets/search_page/search_normal.dart';
import 'package:fun_flutter_music/widgets/search_page/search_result.dart';

// 登录
Handler userHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

// 首页
Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

// 正常搜索页
Handler searchNormalPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SearchNormalPage();
});

// 搜索页结果页
Handler searchResultPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String keyword = params["keyword"].first;
  return SearchResultPage(keyword);
});

// 播放歌曲页
Handler playSongPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return PlaySongPage();
    });


// 播放歌曲页
Handler topListPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return RankPage();
    });
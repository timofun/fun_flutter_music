import 'package:fluro/fluro.dart';
/**
 * 页面点击跳转配置文件
 */
import 'package:flutter/cupertino.dart';
import 'package:fun_flutter_music/routers/router.dart';
import '../utils/application.dart';

// 路由跳转
class NavigatorUtil {

  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
        bool clearStack = false,
        Duration transitionDuration = const Duration(milliseconds: 350),
        TransitionType transition = TransitionType.inFromRight,
        RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: transition);
  }

  // 跳转到用户中心
  static void goLoginPage(BuildContext context){
    Application.router.navigateTo(context, Routers.loginPage);
  }

  // 跳转到home页
  static void goHomePage(BuildContext context, {clearStack = false}){
    Application.router.navigateTo(context, Routers.homePage, clearStack: clearStack);
  }

  // 跳转到搜索页normal页
  static void goSearchNormalPage(BuildContext context){
    _navigateTo(context, Routers.searchNormalPage);
  }

  // 跳转到搜索页结果页
  static void goSearchResultPage(BuildContext context, String keyword){
    _navigateTo(context, Routers.searchResultPage + '?keyword=${Uri.encodeComponent(keyword)}');
  }

  // 跳转到歌曲播放页
  static void goPlaySongPage(BuildContext context){
    _navigateTo(context, Routers.playSongPage);
  }

  // 跳转到排行榜播放页
  static void goTopListPage(BuildContext context){
    _navigateTo(context, Routers.topListPage);
  }

  /// 返回上一页
  static void pop(context) {
    Navigator.of(context).pop();
  }
}

/**
 * 页面点击跳转配置文件
 */
import 'package:flutter/cupertino.dart';
import 'package:fun_flutter_music/routers/router.dart';
import '../utils/application.dart';

// 路由跳转
class NavigatorUtil {

  // 跳转到用户中心
  static void goLoginPage(BuildContext context){
    Application.router.navigateTo(context, Routers.loginPage);
  }

  // 跳转到home页
  static void goHomePage(BuildContext context){
    Application.router.navigateTo(context, Routers.homePage);
  }

  // 跳转到搜索页normal页
  static void goSearchNormalPage(BuildContext context){
    Application.router.navigateTo(context, Routers.searchNormalPage);
  }

  /// 返回上一页
  static void pop(context) {
    Navigator.of(context).pop();
  }
}

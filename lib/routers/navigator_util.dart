/**
 * 页面点击跳转配置文件
 */
import 'package:flutter/cupertino.dart';
import 'package:fun_flutter_music/routers/router.dart';
import 'application.dart';

// 路由跳转
class NavigatorUtil {

  // 跳转到用户中心
  static void goLoginPage(BuildContext context){
    Application.router.navigateTo(context, Routers.loginPage);
  }
}

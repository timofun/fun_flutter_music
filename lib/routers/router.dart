/**
 * 用于绑定路由地址和对应的handler.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import './router_handler.dart';

// 配置路由页面
class Routers{

  static String root='/';
  static String loginPage = '/LoginPage';
  static String homePage = '/HomePage';
  static String searchNormalPage = '/SearchNormalPage';
  static String searchResultPage = '/SearchResultPage';
  static String playSongPage = '/PlaySongPage';
  static String topListPage = '/TopListPage';


  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print('error----找不到路径');
        }
    );
    router.define(loginPage, handler: userHandler);
    router.define(homePage, handler: homeHandler);
    router.define(searchNormalPage, handler: searchNormalPageHandler);
    router.define(searchResultPage, handler: searchResultPageHandler);
    router.define(playSongPage, handler: playSongPageHandler);
    router.define(topListPage, handler: topListPageHandler);
  }
}
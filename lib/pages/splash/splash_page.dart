import 'package:fluro/fluro.dart';
/// @Author QINGYU FAN
/// @Version
/// @Description
/// @date 2020/4/15 0015 22:01

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fun_flutter_music/network/request_manager.dart';
import 'package:fun_flutter_music/provider/search_provider.dart';
import 'package:fun_flutter_music/routers/navigator_util.dart';
import 'package:fun_flutter_music/routers/router.dart';
import 'package:fun_flutter_music/utils/application.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _logoController;
  Tween _scaleTween;
  CurvedAnimation _logoAnimation;

  @override
  void initState() {
    super.initState();
    _scaleTween = Tween(begin: 0, end: 1);
    _logoController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..drive(_scaleTween);
    Future.delayed(Duration(milliseconds: 500), () {
      _logoController.forward();
    });
    _logoAnimation =
        CurvedAnimation(parent: _logoController, curve: Curves.easeOutQuart);

    _logoController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 2000), () {
          goPage();
        });
      }
    });

    /// 初始化搜索栏数据
    Provider.of<SearchProvider>(context, listen: false).getSearchDefault();
  }

  void goPage() async{
    await Application.initSp();
//    UserModel userModel = Provider.of<UserModel>(context);
//    userModel.initUser();
//    PlaySongsModel playSongsModel = Provider.of<PlaySongsModel>(context);
    // 判断是否有保存的歌曲列表
//    if(Application.sp.containsKey('playing_songs')){
//      List<String> songs = Application.sp.getStringList('playing_songs');
//      playSongsModel.addSongs(songs.map((s) => Song.fromJson(FluroConvertUtils.string2map(s))).toList());
//      int index = Application.sp.getInt('playing_index');
//      playSongsModel.curIndex = index;
//    }
//    if (userModel.user != null) {
//      await NetUtils.refreshLogin(context).then((value){
//        if(value.data != -1){
//          NavigatorUtil.goHomePage(context);
//        }
//      });
//      Provider.of<PlayListModel>(context).user = userModel.user;
//    } else {
//      NavigatorUtil.goLoginPage(context);
//    }
    NavigatorUtil.goHomePage(context, clearStack: true);
  }

  @override
  Widget build(BuildContext context) {
    /// 初始化网络实体类
    var opt = RequestManager.getInstance().options;
    RequestManager.getInstance().options = opt;

    /// 初始化fluro
    final router = Router();
    Routers.configureRoutes(router);
    Application.router = router;

    /// 初始化屏幕UI设计稿
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    final size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;
    print({"bottomBarHeight": Application.bottomBarHeight, "statusBarHeight": Application.statusBarHeight});

    /// 初始化本地存储库sp
    Application.initSp();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/icon/axq.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(600),
              child: ScaleTransition(
                scale: _logoAnimation,
                child: Hero(
                  tag: 'logo',
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(200)),
                        child: Text(
                          '网易云音乐',
                          style: TextStyle(fontSize: 28.0, color: Colors.redAccent, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          'By: Fun',
                          style: TextStyle(fontSize: 12.0, color: Colors.lime),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _logoController.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fun_flutter_music/network/request_manager.dart';
import 'package:fun_flutter_music/pages/account/account_page.dart';
import 'package:fun_flutter_music/pages/chat/chat_page.dart';
import 'package:fun_flutter_music/pages/discover/discover_page.dart';
import 'package:fun_flutter_music/pages/mine/mine_page.dart';
import 'package:fun_flutter_music/pages/video/video_page.dart';
import 'package:fun_flutter_music/utils/application.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'file:///E:/Project/fun_flutter_music/lib/components/load_image.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _currentIndex = 0;
  final List<Widget> _children = [DiscoverPage(), VideoPage(), MinePage(), ChatPage(), AccountPage()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var opt = RequestManager.getInstance().options;
    RequestManager.getInstance().options = opt;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    final size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: ColorBottomIconSelected,
        selectedItemColor: Colors.white,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0 ? LoadAssetImage("icon/t_actionbar_discover_selected", width: 52.0) : LoadAssetImage("icon/t_actionbar_discover_normal", width: 52.0),
            title: Text(
                '发现'
            ),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1 ? LoadAssetImage("icon/t_actionbar_video_selected", width: 52.0) : LoadAssetImage("icon/t_actionbar_video_normal", width: 52.0),
            title: Text('视频'),
            //backgroundColor: Colors.orange
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2 ? LoadAssetImage("icon/t_actionbar_music_selected", width: 52.0) : LoadAssetImage("icon/t_actionbar_music_normal", width: 52.0),
            title: Text('我的'),
            //backgroundColor: Colors.orange
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3 ? LoadAssetImage("icon/t_actionbar_friends_selected", width: 52.0) : LoadAssetImage("icon/t_actionbar_friends_normal", width: 52.0),
            title: Text('云村'),
            //backgroundColor: Colors.orange
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4 ? LoadAssetImage("icon/t_actionbar_friends_selected", width: 52.0) : LoadAssetImage("icon/t_actionbar_friends_normal", width: 52.0),
            title: Text('帐号'),
            //backgroundColor: Colors.orange
          )
        ],
        backgroundColor: ColorPrimary
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
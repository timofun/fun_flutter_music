/// @Author QINGYU FAN
/// @Version
/// @Description 正常搜索页
/// @date 2020/4/13 0013 22:40
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fun_flutter_music/components/search_bar.dart';
import 'package:fun_flutter_music/routers/navigator_util.dart';
import 'package:fun_flutter_music/utils/application.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
const SEARCH_BAR_DEFAULT_TEXT = '大家都在搜红色高跟鞋';
class SearchNormal extends StatefulWidget {
  @override
  _SearchNormalState createState() => _SearchNormalState();
}

class _SearchNormalState extends State<SearchNormal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        backgroundColor: ColorBackground,
        title: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SearchBar(
            hideLeft: true,
            searchBarType: SearchBarType.normal,
            speakClick: () {},
            hint: SEARCH_BAR_DEFAULT_TEXT,
            rightButtonClick: () {
              NavigatorUtil.pop(context);
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          Text("hahahah"),
          Padding(
              padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(80) + Application.bottomBarHeight)
          )
        ],
      ),
    );
  }
}

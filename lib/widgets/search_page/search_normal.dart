/// @Author QINGYU FAN
/// @Version
/// @Description 正常搜索页
/// @date 2020/4/13 0013 22:40
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fun_flutter_music/components/search_bar.dart';
import 'package:fun_flutter_music/routers/navigator_util.dart';
import 'package:fun_flutter_music/utils/application.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'package:fun_flutter_music/utils/text_style_utils.dart';

class SearchNormalPage extends StatefulWidget {
  @override
  _SearchNormalState createState() => _SearchNormalState();
}

class _SearchNormalState extends State<SearchNormalPage> {
  /// 历史搜索记录
  List<String> historySearchList;
  @override
  void initState() {
    super.initState();
    historySearchList = Application.sp.getStringList("search_history") ?? [];
  }

  @override
  void deactivate() {
    super.deactivate();
    historySearchList = Application.sp.getStringList("search_history") ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackground,
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
            rightButtonClick: () {
              NavigatorUtil.pop(context);
            },
            onSubmitted: (text) {
              print({"text": text});
              _search(context, text);
            },
          ),
        ),
      ),
      body: ListView(
          physics: BouncingScrollPhysics(),
          padding:
              EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
          children: <Widget>[
            _buildHistorySearch(context),
          ]),
    );
  }

  // 历史搜索
  Widget _buildHistorySearch(context) {
    return Offstage(
      offstage: historySearchList.isEmpty,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '搜索历史',
                  style: bold14TextStyle,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  size: 22.0,
                  color: ColorDefault,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text(
                            "确定清空全部历史记录？",
                            style: common14TextStyle,
                          ),
                          actions: <Widget>[
                            CupertinoDialogAction(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('取消')),
                            CupertinoDialogAction(
                                onPressed: () {
                                  setState(() {
                                    historySearchList.clear();
                                    Application.sp.remove("search_history");
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text('清空')),
                          ],
                        );
                      });
                },
              )
            ],
          ),
          Wrap(
            spacing: ScreenUtil().setWidth(20),
            children: historySearchList
                .map((v) => GestureDetector(
                      onTap: () {
                        _search(context, v);
                      },
                      child: Chip(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        label: Text(
                          v,
                          style: common13TextStyle,
                        ),
                        backgroundColor: Colors.redAccent,
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }

  // 搜索
  void _search(context, text) {
    setState(() {
      if (historySearchList.contains(text)) historySearchList.remove(text);
      historySearchList.insert(0, text);
      if (historySearchList.length > 5) {
        historySearchList.removeAt(historySearchList.length - 1);
      }
    });
    Application.sp.setStringList("search_history", historySearchList);
    NavigatorUtil.goSearchResultPage(context, text);
  }
}

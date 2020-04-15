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

class SearchNormal extends StatefulWidget {
  @override
  _SearchNormalState createState() => _SearchNormalState();
}

class _SearchNormalState extends State<SearchNormal> {
  List<String> historySearchList;
  String searchText;
  bool _isSearching = false; // 是否正在搜索，改变布局
  @override
  void initState() {
    super.initState();
    historySearchList = Application.sp.getStringList("search_history") ?? [];
//    setState(() {
//    });
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
              _search(text);
            },
          ),
        ),
      ),
      body: ListView(
          physics: BouncingScrollPhysics(),
          padding:
              EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
          children: <Widget>[
            _buildHistorySearch(),
          ]),
    );
  }

  // 历史搜索
  Widget _buildHistorySearch() {
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
                        searchText = v;
                        _search(v);
                      },
                      child: Chip(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                        labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
  void _search(text) {
    setState(() {
      if (historySearchList.contains(text)) historySearchList.remove(text);
      historySearchList.insert(0, text);
      if (historySearchList.length > 5) {
        historySearchList.removeAt(historySearchList.length - 1);
      }
      _isSearching = true;
//      _searchController.text = searchText;
    });
    Application.sp.setStringList("search_history", historySearchList);
  }
}

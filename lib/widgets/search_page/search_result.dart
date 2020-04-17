/// @Author QINGYU FAN
/// @Version
/// @Description 搜索结果页
/// @date 2020/4/13 0013 22:40
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fun_flutter_music/components/empty_widget.dart';
import 'package:fun_flutter_music/components/search_bar.dart';
import 'package:fun_flutter_music/utils/application.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'package:fun_flutter_music/widgets/search_page/search_result_content.dart';

// ignore: must_be_immutable
class SearchResultPage extends StatefulWidget {
  String keyword;
  SearchResultPage(this.keyword);
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResultPage> with SingleTickerProviderStateMixin {
  List<String> historySearchList;

  TabController _tabController;
  Map<String, int> _searchTabMap = {
    '综合': 1018,
    '单曲': 1,
    '歌单': 1000,
    '歌手': 100,
    '专辑': 10,
    '视频': 1014,
    '歌词': 1006,
    '主播电台': 1009,
    '用户': 1002
  };
  List<String> _searchTabKeys = [];
  @override
  void initState() {
    super.initState();
    _searchTabKeys.addAll(_searchTabMap.keys.toList());
    _tabController = TabController(vsync: this, length: _searchTabKeys.length);
    historySearchList = Application.sp.getStringList("search_history") ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBackground,
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: ColorBackground,
        title: Container(
          padding: EdgeInsets.only(right: 20),
          child: SearchBar(
            hideLeft: true,
            hideRight: true,
            keyword: widget.keyword,
            searchBarType: SearchBarType.normal,
            speakClick: () {},
            onSubmitted: (text) {
              _search(text);
            },
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Material(
            color: ColorBackground,
            child: TabBar(
              isScrollable: true,
              // indicator: ColorTabIndicator(Colors.black),//选中标签颜色
              indicatorColor: Colors.red,//选中下划线颜色,如果使用了indicator这里设置无效
              controller: _tabController,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.white,
              tabs: _searchTabKeys.map((item)=>Tab(
                child: Text(
                  item,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0
                  ),
                ),
              )).toList(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        children:
          _searchTabMap.keys.map((key) => SearchResultContent(
              _searchTabMap[key].toString(), widget.keyword)).toList()
        ,
        controller: _tabController,),
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
//      _searchController.text = searchText;
    });
    Application.sp.setStringList("search_history", historySearchList);
  }
}

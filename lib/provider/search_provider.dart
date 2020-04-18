import 'package:flutter/material.dart';
import 'package:fun_flutter_music/network/api_request_url.dart';
import 'package:fun_flutter_music/network/request_manager.dart';

class SearchProvider extends ChangeNotifier {
  /// 展示搜索字段
  String _showKeyword;
  /// 搜索字段
  String _realkeyword;
  // 搜索类型
  int _searchType;

  String get showKeyword => _showKeyword ?? '飘向北方 现在很火哦';

  String get realkeyword => _realkeyword ?? '飘向北方';

  int get searchType => _searchType ?? 1018;


  void getSearchDefault () {
    RequestManager.getInstance().get(SEARCH_DEFAULT).then((val) {
      _showKeyword = val.data["data"]['showKeyword'];
      _realkeyword = val.data["data"]['realkeyword'];
      _searchType = val.data["data"]['searchType'];
      notifyListeners();
    });
  }
}
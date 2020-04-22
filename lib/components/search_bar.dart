import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fun_flutter_music/components/load_image.dart';
import 'package:fun_flutter_music/provider/search_provider.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'package:fun_flutter_music/components/empty_widget.dart';
import 'package:provider/provider.dart';
enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  final bool enabled;
  final bool hideLeft;
  final bool hideRight;
  final String keyword;
  final SearchBarType searchBarType;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  const SearchBar(
      {Key key,
        this.enabled = true,
        this.keyword,
        this.hideLeft,
        this.hideRight,
        this.searchBarType = SearchBarType.normal,
        this.leftButtonClick,
        this.rightButtonClick,
        this.speakClick,
        this.inputBoxClick,
        this.onChanged,
        this.onSubmitted
      })
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.keyword != "") {
      setState(() {
        _controller.text = widget.keyword;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSearch();
  }

  /// 搜索页的search_bar
  _genNormalSearch() {
    return Container(
      child: Row(children: <Widget>[
        widget?.hideLeft ?? false ? EmptyWidget() : _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorDefault,
                size: 26,
              ),
            ),
            widget.leftButtonClick),
        Expanded(
          flex: 1,
          child: _inputBox(),
        ),
        widget?.hideRight ?? false ? EmptyWidget() : _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
              child: Text(
                '取消',
                style: TextStyle(color: ColorDefault, fontSize: 17),
              ),
            ),
            widget.rightButtonClick)
      ]),
    );
  }

  /// discover页的search_bar
  _genHomeSearch() {
    return Container(
      child: Row(children: <Widget>[
        _wrapTap(
            Container(
                padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                child: Row(
                  children: <Widget>[
                  LoadAssetImage("icon/b8h", width: 26)
                  ],
                )),
            widget.leftButtonClick),
        Expanded(
          flex: 1,
          child: _inputBox(),
        )
      ]),
    );
  }

  /// 输入框
  _inputBox() {
    Color inputBoxColor = Colors.white10;
    return Consumer<SearchProvider>(
      builder: (context, searchState, child) {
        return Container(
          height: ScreenUtil().setHeight(64),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              color: inputBoxColor,
              borderRadius: BorderRadius.circular(ScreenUtil().setHeight(32))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.search,
                size: 20,
                color: Colors.white70,
              ),
              Container(
                  child: widget.searchBarType == SearchBarType.normal
                      ? Expanded(
                      child: TextField(
                      textInputAction: TextInputAction.search,
                      onSubmitted: (val){
                        //键盘确认
                        if (widget.keyword == "") {
                          _controller.text = "";
                        }
                        showClear = false;
                        var result = (val != null && val.isNotEmpty) ? val : searchState.realkeyword;
                        widget.onSubmitted(result);
                      },
                      cursorColor: ColorDefault,
                      controller: _controller,
                      onChanged: _onChanged,
                      autofocus: false,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: ColorDefault,
                      ),
                      //输入文本的样式
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(22)),
                        border: InputBorder.none,
                        hintText: searchState.showKeyword,
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: ColorDefault,
                        ),
                      )))
                      : _wrapTap(
                      Container(
                        child: Text(
                          searchState.showKeyword,
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ),
                      widget.inputBoxClick)),
              widget.searchBarType == SearchBarType.normal
                ? (!showClear && _controller.text == '' ?
                _wrapTap(
                  Icon(
                    Icons.mic,
                    size: 22,
                    color: Colors.grey,
                  ),
                  widget.speakClick)
                  : _wrapTap(
                  Icon(
                    Icons.clear,
                    size: 22,
                    color: Colors.grey,
                  ), () {
                setState(() {
                  _controller.clear();
                });
                _onChanged('');
              })) : EmptyWidget()
            ],
          ),
        );
      }
    );
  }

  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }
}

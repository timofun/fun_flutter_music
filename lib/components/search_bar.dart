import 'package:flutter/material.dart';
import 'package:fun_flutter_music/components/load_image.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'package:fun_flutter_music/components/empty_widget.dart';
enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  final bool enabled;
  final bool hideLeft;
  final SearchBarType searchBarType;
  final String hint;
  final String defaultText;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  const SearchBar(
      {Key key,
        this.enabled = true,
        this.hideLeft,
        this.searchBarType = SearchBarType.normal,
        this.hint,
        this.defaultText,
        this.leftButtonClick,
        this.rightButtonClick,
        this.speakClick,
        this.inputBoxClick,
        this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
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
        _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
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

  _inputBox() {
    Color inputBoxColor = Colors.white10;
    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: inputBoxColor,
          borderRadius: BorderRadius.circular(15)),
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
                  cursorColor: ColorDefault,
                  controller: _controller,
                  onChanged: _onChanged,
                  autofocus: true,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: ColorDefault,
                  ),
                  //输入文本的样式
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hint ?? '',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: ColorDefault,
                    ),
                  )))
                  : _wrapTap(
                  Container(
                    child: Text(
                      widget.defaultText,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                  widget.inputBoxClick)),
          widget.searchBarType == SearchBarType.normal
            ? (!showClear ?
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

  _homeFontColor() {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black54
        : Colors.white;
  }
}

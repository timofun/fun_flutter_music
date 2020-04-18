import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fun_flutter_music/model/search_result.dart';
import 'package:fun_flutter_music/network/api_request_url.dart';
import 'package:fun_flutter_music/network/request_manager.dart';
import 'package:fun_flutter_music/provider/play_song_model.dart';
import 'package:fun_flutter_music/routers/navigator_util.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'package:fun_flutter_music/model/song.dart' as prefix0;
import 'package:provider/provider.dart';

class SearchResultContent extends StatefulWidget {
  final String type;
  final String keywords;

  const SearchResultContent(this.type, this.keywords);

  @override
  _SearchResultContentState createState() => _SearchResultContentState();
}

class _SearchResultContentState extends State<SearchResultContent> with AutomaticKeepAliveClientMixin {

  int _count = -1;
  Map<String, dynamic> _params;
  List<Songs> _songsData = []; // 单曲数据
  List<Artists> _artistsData = []; // 专辑数据
  List<Albums> _albumsData = []; // 专辑数据
  List<PlayLists> _playListData = []; // 歌单数据
  List<Users> _userListData = []; // 用户数据
  List<Videos> _videosData = []; // 视频数据
  EasyRefreshController _controller;
  int offset = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    // 监听页面渲染完成再执行操作
    WidgetsBinding.instance.addPostFrameCallback((d) {
      _params = {
        'keywords': widget.keywords,
        'type': widget.type,
        'offset': offset
      };
      _request();
    });
  }

  void _request() async {
    var r = await RequestManager.getInstance().get(SEARCH, params: _params);
    var _data = SearchMultipleData.fromJson(r.data);
    if (mounted) {
      setState(() {
        switch (int.parse(widget.type)) {
          case 1: // 单曲
            _count = _data.result.songCount;
            _songsData.addAll(_data.result.songs);
            setState(() {});
            break;
          case 10: // 专辑
            _count = _data.result.albumCount;
            _albumsData.addAll(_data.result.albums);
            break;
          case 100: // 歌手
            _count = _data.result.artistCount;
            _artistsData.addAll(_data.result.artists);
            break;
          case 1000: // 歌单
            _count = _data.result.playlistCount;
            _playListData.addAll(_data.result.playlists);
            break;
          case 1002: // 用户
            _count = _data.result.userprofileCount;
            _userListData.addAll(_data.result.userprofiles);
            break;
          case 1014: // 视频
            _count = _data.result.videoCount;
            _videosData.addAll(_data.result.videos);
            break;
          default:
            break;
        }
      });
    }
  }

  Widget _getBuildSongs() {
    return Consumer<PlaySongsModel>(
        builder: (context, model, child) {
          return ListView(
            physics: BouncingScrollPhysics(),
            children: _songsData.map((item) =>
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    _playSongs(model, _songsData, 0);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(
                            width: 1,
                            color: ColorDefault
                        ))
                    ),
                    child: Text(
                      item.name,
                      style: TextStyle(
                          color: ColorDefault
                      ),
                    ),
                  ),
                )).toList(),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _getBuildSongs();
  }

void _playSongs(PlaySongsModel model, List<Songs> data, int index) {
  print(data[0]);
  model.playSongs(
    data.map((r) =>
        prefix0.Song(
          r.id,
          name: r.name,
          picUrl: r.artists[0].img1v1Url,
          artists: '${r.artists.map((a) => a.name).toList().join('/')}',
        )).toList(),
    index: index,
  );
  NavigatorUtil.goPlaySongPage(context);
}

@override
bool get wantKeepAlive => true;
}

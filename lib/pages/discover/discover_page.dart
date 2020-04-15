import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fun_flutter_music/components/search_bar.dart';
import 'package:fun_flutter_music/network/api_request_url.dart';
import 'package:fun_flutter_music/network/request_manager.dart';
import 'package:fun_flutter_music/routers/navigator_util.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'package:fun_flutter_music/widgets/banner/banner_swiper.dart';
import 'package:fun_flutter_music/widgets/dragon_ball_navigation.dart';
import 'package:fun_flutter_music/widgets/play_list_item/model/play_list_item_model.dart';
import 'package:fun_flutter_music/widgets/play_list_item/model/play_list_model.dart';
import 'package:fun_flutter_music/widgets/play_list_item/play_list_item.dart';

const APPBAR_SCROLL_OFFSET = 100;

class DiscoverPage extends StatefulWidget{
  BuildContext currentContext;
  DiscoverPage(this.currentContext);
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with AutomaticKeepAliveClientMixin {

  List<PlayListItemModel> playList = [];

  @override
  void initState() {
    super.initState();
    _getPersonal();
  }

  void _getPersonal() {
    RequestManager.getInstance().get(PERSONAL, params: {'limit': 6}).then((val) {
      setState(() {
        playList = PlayListModel.fromJsonMap(val.data).result;
        print(playList);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: ColorBackground,
        title: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SearchBar(
            searchBarType: SearchBarType.home,
            inputBoxClick: () {
              NavigatorUtil.goSearchNormalPage(widget.currentContext);
            },
            speakClick: () {},
            leftButtonClick: () {},
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: ColorBackground
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            BannerSwiper(),
            DragonBallNavigation(),
            Container(
              padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "推荐歌单",
                            style: TextStyle(
                                color: ColorDefault,
                                fontSize: 12
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "为你精挑细选",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 60,
                                height: 20,
                                child: OutlineButton(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  textColor: ColorDefault,
                                  borderSide: BorderSide(
                                      color: ColorDefault,
                                      width: 1.0,
                                      style: BorderStyle.solid
                                  ),
                                  splashColor: Colors.grey,
                                  child: Text(
                                    "查看更多",
                                    style: TextStyle(
                                        fontSize: 11
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 5, top: 10),
                        height: ScreenUtil().setWidth(300),
                        child: new ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: playList.map<Widget>((p) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: PlayListItem(p),
                            )).toList()
                        )
                    )
                  ],
                )
            ),
            Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "推荐歌单",
                            style: TextStyle(
                                color: ColorDefault,
                                fontSize: 12
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "为你精挑细选",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 60,
                                height: 20,
                                child: OutlineButton(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  textColor: ColorDefault,
                                  borderSide: BorderSide(
                                      color: ColorDefault,
                                      width: 1.0,
                                      style: BorderStyle.solid
                                  ),
                                  splashColor: Colors.grey,
                                  child: Text(
                                    "查看更多",
                                    style: TextStyle(
                                        fontSize: 11
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 5, top: 10),
                        height: ScreenUtil().setWidth(300),
                        child: new ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: playList.map<Widget>((p) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5),
                              child: PlayListItem(p),
                            )).toList()
                        )
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

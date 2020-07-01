import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fun_flutter_music/components/future_builder.dart';
import 'package:fun_flutter_music/network/api_request_url.dart';
import 'package:fun_flutter_music/network/request_manager.dart';
import 'package:fun_flutter_music/pages/rank/model/TopListModel.dart';
import 'package:fun_flutter_music/pages/rank/model/list.dart';
import 'package:fun_flutter_music/pages/rank/model/tracks.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
class RankPage extends StatefulWidget {
  @override
  _rankPageState createState() => _rankPageState();
}

class _rankPageState extends State<RankPage> {
  /// 排行榜首页
  static Future<TopListModel> getTopListData(BuildContext context) async {
    var response = await RequestManager.getInstance().get(TOP_LIST);
    return TopListModel.fromJsonMap(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '排行榜',
            style: TextStyle(fontSize: 17, color: Color999),
          ),
          centerTitle: true
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: ColorBackground
        ),
        child: ListView(
          children: <Widget>[
            CustomFutureBuilder<TopListModel>(
              futureFunc: getTopListData,
              builder: (context, data) {
                print(data.list.toString());
                return SingleChildScrollView(
                  child: Column(
                    children: listWidget (data.list)
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> listWidget (data) {
  List<Widget> list = [];
  for (var model in data) {
    if (!model.tracks.isEmpty) {
      var item = songItem(model);
      list.add(item);
    }
  }
  return list;
}

Widget songItem (DataList item) {
  var i = 1;
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          width: ScreenUtil().setWidth(200),
          height: ScreenUtil().setWidth(200),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: FadeInImage.assetNetwork(
              placeholder: "images/icon/aao.png",
              image: item.coverImgUrl,
              fit: BoxFit.cover,
            ),
          )
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: item.tracks.map((t) {
              return Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10),
                  height: ScreenUtil().setWidth(65),
                  child: Text(
                      "${i++}.${t.first} - ${t.second}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white
                      )
                  )
              );
            }).toList()
          ),
        )
      ]
    )
  );
}

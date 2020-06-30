import 'package:fun_flutter_music/pages/rank/model/list.dart';
import 'package:fun_flutter_music/pages/rank/model/artist_toplist.dart';
import 'package:fun_flutter_music/pages/rank/model/reward_toplist.dart';

class TopListModel {

  int code;
  List<DataList> list;
  ArtistToplist artistToplist;
  RewardToplist rewardToplist;

	TopListModel.fromJsonMap(Map<String, dynamic> map): 
		code = map["code"],
		list = List<DataList>.from(map["list"].map((it) => DataList.fromJsonMap(it))),
		artistToplist = ArtistToplist.fromJsonMap(map["artistToplist"]),
		rewardToplist = RewardToplist.fromJsonMap(map["rewardToplist"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = code;
		data['list'] = list != null ? 
			this.list.map((v) => v.toJson()).toList()
			: null;
		data['artistToplist'] = artistToplist == null ? null : artistToplist.toJson();
		data['rewardToplist'] = rewardToplist == null ? null : rewardToplist.toJson();
		return data;
	}
}

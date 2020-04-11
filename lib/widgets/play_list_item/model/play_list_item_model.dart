
class PlayListItemModel {

  int id;
  int type;
  String name;
  String copywriter;
  String picUrl;
  bool canDislike;
  int trackNumberUpdateTime;
  int playCount;
  int trackCount;
  bool highQuality;
  String alg;

	PlayListItemModel.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		type = map["type"],
		name = map["name"],
		copywriter = map["copywriter"],
		picUrl = map["picUrl"],
		canDislike = map["canDislike"],
		trackNumberUpdateTime = map["trackNumberUpdateTime"],
		playCount = map["playCount"],
		trackCount = map["trackCount"],
		highQuality = map["highQuality"],
		alg = map["alg"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['type'] = type;
		data['name'] = name;
		data['copywriter'] = copywriter;
		data['picUrl'] = picUrl;
		data['canDislike'] = canDislike;
		data['trackNumberUpdateTime'] = trackNumberUpdateTime;
		data['playCount'] = playCount;
		data['trackCount'] = trackCount;
		data['highQuality'] = highQuality;
		data['alg'] = alg;
		return data;
	}
}


class Artist {

  String name;
  int id;
  int picId;
  int img1v1Id;
  String briefDesc;
  String picUrl;
  String img1v1Url;
  int albumSize;
  List<Object> alias;
  String trans;
  int musicSize;
  int topicPerson;

	Artist.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		id = map["id"],
		picId = map["picId"],
		img1v1Id = map["img1v1Id"],
		briefDesc = map["briefDesc"],
		picUrl = map["picUrl"],
		img1v1Url = map["img1v1Url"],
		albumSize = map["albumSize"],
		alias = map["alias"],
		trans = map["trans"],
		musicSize = map["musicSize"],
		topicPerson = map["topicPerson"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['id'] = id;
		data['picId'] = picId;
		data['img1v1Id'] = img1v1Id;
		data['briefDesc'] = briefDesc;
		data['picUrl'] = picUrl;
		data['img1v1Url'] = img1v1Url;
		data['albumSize'] = albumSize;
		data['alias'] = alias;
		data['trans'] = trans;
		data['musicSize'] = musicSize;
		data['topicPerson'] = topicPerson;
		return data;
	}
}

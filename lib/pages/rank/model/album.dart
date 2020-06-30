import 'package:fun_flutter_music/pages/rank/model/artist.dart';
import 'package:fun_flutter_music/pages/rank/model/artists.dart';

class Album {

  String name;
  int id;
  String type;
  int size;
  int picId;
  String blurPicUrl;
  int companyId;
  int pic;
  String picUrl;
  int publishTime;
  String description;
  String tags;
  Object company;
  String briefDesc;
  Artist artist;
  List<Object> songs;
  List<Object> alias;
  int status;
  int copyrightId;
  String commentThreadId;
  List<Artists> artists;
  String subType;
  Object transName;
  int mark;
  String picId_str;

	Album.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		id = map["id"],
		type = map["type"],
		size = map["size"],
		picId = map["picId"],
		blurPicUrl = map["blurPicUrl"],
		companyId = map["companyId"],
		pic = map["pic"],
		picUrl = map["picUrl"],
		publishTime = map["publishTime"],
		description = map["description"],
		tags = map["tags"],
		company = map["company"],
		briefDesc = map["briefDesc"],
		artist = Artist.fromJsonMap(map["artist"]),
		songs = map["songs"],
		alias = map["alias"],
		status = map["status"],
		copyrightId = map["copyrightId"],
		commentThreadId = map["commentThreadId"],
		artists = List<Artists>.from(map["artists"].map((it) => Artists.fromJsonMap(it))),
		subType = map["subType"],
		transName = map["transName"],
		mark = map["mark"],
		picId_str = map["picId_str"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['id'] = id;
		data['type'] = type;
		data['size'] = size;
		data['picId'] = picId;
		data['blurPicUrl'] = blurPicUrl;
		data['companyId'] = companyId;
		data['pic'] = pic;
		data['picUrl'] = picUrl;
		data['publishTime'] = publishTime;
		data['description'] = description;
		data['tags'] = tags;
		data['company'] = company;
		data['briefDesc'] = briefDesc;
		data['artist'] = artist == null ? null : artist.toJson();
		data['songs'] = songs;
		data['alias'] = alias;
		data['status'] = status;
		data['copyrightId'] = copyrightId;
		data['commentThreadId'] = commentThreadId;
		data['artists'] = artists != null ? 
			this.artists.map((v) => v.toJson()).toList()
			: null;
		data['subType'] = subType;
		data['transName'] = transName;
		data['mark'] = mark;
		data['picId_str'] = picId_str;
		return data;
	}
}

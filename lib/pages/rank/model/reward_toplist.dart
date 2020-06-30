import 'package:fun_flutter_music/pages/rank/model/songs.dart';

class RewardToplist {

  String coverUrl;
  List<Songs> songs;
  String name;
  int position;

	RewardToplist.fromJsonMap(Map<String, dynamic> map): 
		coverUrl = map["coverUrl"],
		songs = List<Songs>.from(map["songs"].map((it) => Songs.fromJsonMap(it))),
		name = map["name"],
		position = map["position"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['coverUrl'] = coverUrl;
		data['songs'] = songs != null ? 
			this.songs.map((v) => v.toJson()).toList()
			: null;
		data['name'] = name;
		data['position'] = position;
		return data;
	}
}

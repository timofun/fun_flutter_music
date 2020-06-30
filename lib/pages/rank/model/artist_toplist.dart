import 'package:fun_flutter_music/pages/rank/model/artists.dart';

class ArtistToplist {

  String coverUrl;
  List<Artists> artists;
  String name;
  String upateFrequency;
  int position;
  String updateFrequency;

	ArtistToplist.fromJsonMap(Map<String, dynamic> map): 
		coverUrl = map["coverUrl"],
		artists = List<Artists>.from(map["artists"].map((it) => Artists.fromJsonMap(it))),
		name = map["name"],
		upateFrequency = map["upateFrequency"],
		position = map["position"],
		updateFrequency = map["updateFrequency"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['coverUrl'] = coverUrl;
		data['artists'] = artists != null ? 
			this.artists.map((v) => v.toJson()).toList()
			: null;
		data['name'] = name;
		data['upateFrequency'] = upateFrequency;
		data['position'] = position;
		data['updateFrequency'] = updateFrequency;
		return data;
	}
}

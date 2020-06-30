
class Tracks {

  String first;
  String second;

	Tracks.fromJsonMap(Map<String, dynamic> map): 
		first = map["first"],
		second = map["second"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['first'] = first;
		data['second'] = second;
		return data;
	}
}

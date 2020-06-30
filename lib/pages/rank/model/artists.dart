
class Artists {

  String first;
  String second;
  int third;

	Artists.fromJsonMap(Map<String, dynamic> map): 
		first = map["first"],
		second = map["second"],
		third = map["third"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['first'] = first;
		data['second'] = second;
		data['third'] = third;
		return data;
	}
}

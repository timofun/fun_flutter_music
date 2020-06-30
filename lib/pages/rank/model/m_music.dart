
class MMusic {

  Object name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  int volumeDelta;

	MMusic.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		id = map["id"],
		size = map["size"],
		extension = map["extension"],
		sr = map["sr"],
		dfsId = map["dfsId"],
		bitrate = map["bitrate"],
		playTime = map["playTime"],
		volumeDelta = map["volumeDelta"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['id'] = id;
		data['size'] = size;
		data['extension'] = extension;
		data['sr'] = sr;
		data['dfsId'] = dfsId;
		data['bitrate'] = bitrate;
		data['playTime'] = playTime;
		data['volumeDelta'] = volumeDelta;
		return data;
	}
}

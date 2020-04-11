import 'play_list_item_model.dart';

class PlayListModel {

  bool hasTaste;
  int code;
  int category;
  List<PlayListItemModel> result;

	PlayListModel.fromJsonMap(Map<String, dynamic> map):
		hasTaste = map["hasTaste"],
		code = map["code"],
		category = map["category"],
		result = List<PlayListItemModel>.from(map["result"].map((it) => PlayListItemModel.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['hasTaste'] = hasTaste;
		data['code'] = code;
		data['category'] = category;
		data['result'] = result != null ? 
			this.result.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}

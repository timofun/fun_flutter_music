import 'package:fun_flutter_music/pages/discover/model/banners.dart';

class BannerModel {

  List<Banners> banners;
  int code;

	BannerModel.fromJsonMap(Map<String, dynamic> map):
		banners = List<Banners>.from(map["banners"].map((it) => Banners.fromJsonMap(it))),
		code = map["code"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['banners'] = banners != null ? 
			this.banners.map((v) => v.toJson()).toList()
			: null;
		data['code'] = code;
		return data;
	}
}

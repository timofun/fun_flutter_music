import 'package:fun_flutter_music/pages/rank/model/tracks.dart';

class DataList {

  List<Object> subscribers;
  Object subscribed;
  Object creator;
  Object artists;
  List<Tracks> tracks;
  String updateFrequency;
  int backgroundCoverId;
  Object backgroundCoverUrl;
  int titleImage;
  Object titleImageUrl;
  Object englishTitle;
  bool opRecommend;
  Object recommendInfo;
  int adType;
  int trackNumberUpdateTime;
  int createTime;
  bool highQuality;
  int userId;
  int updateTime;
  int coverImgId;
  bool newImported;
  bool anonimous;
  String coverImgUrl;
  int totalDuration;
  int specialType;
  int trackCount;
  String commentThreadId;
  int privacy;
  int trackUpdateTime;
  int playCount;
  int subscribedCount;
  int cloudTrackCount;
  List<Object> tags;
  bool ordered;
  String description;
  int status;
  String name;
  int id;
  String coverImgId_str;
  String ToplistType;


	@override
  String toString() {
    return 'DataList{subscribers: $subscribers, subscribed: $subscribed, creator: $creator, artists: $artists, tracks: $tracks, updateFrequency: $updateFrequency, backgroundCoverId: $backgroundCoverId, backgroundCoverUrl: $backgroundCoverUrl, titleImage: $titleImage, titleImageUrl: $titleImageUrl, englishTitle: $englishTitle, opRecommend: $opRecommend, recommendInfo: $recommendInfo, adType: $adType, trackNumberUpdateTime: $trackNumberUpdateTime, createTime: $createTime, highQuality: $highQuality, userId: $userId, updateTime: $updateTime, coverImgId: $coverImgId, newImported: $newImported, anonimous: $anonimous, coverImgUrl: $coverImgUrl, totalDuration: $totalDuration, specialType: $specialType, trackCount: $trackCount, commentThreadId: $commentThreadId, privacy: $privacy, trackUpdateTime: $trackUpdateTime, playCount: $playCount, subscribedCount: $subscribedCount, cloudTrackCount: $cloudTrackCount, tags: $tags, ordered: $ordered, description: $description, status: $status, name: $name, id: $id, coverImgId_str: $coverImgId_str, ToplistType: $ToplistType}';
  }

  DataList.fromJsonMap(Map<String, dynamic> map):
		subscribers = map["subscribers"],
		subscribed = map["subscribed"],
		creator = map["creator"],
		artists = map["artists"],
		tracks = List<Tracks>.from(map["tracks"].map((it) => Tracks.fromJsonMap(it))),
		updateFrequency = map["updateFrequency"],
		backgroundCoverId = map["backgroundCoverId"],
		backgroundCoverUrl = map["backgroundCoverUrl"],
		titleImage = map["titleImage"],
		titleImageUrl = map["titleImageUrl"],
		englishTitle = map["englishTitle"],
		opRecommend = map["opRecommend"],
		recommendInfo = map["recommendInfo"],
		adType = map["adType"],
		trackNumberUpdateTime = map["trackNumberUpdateTime"],
		createTime = map["createTime"],
		highQuality = map["highQuality"],
		userId = map["userId"],
		updateTime = map["updateTime"],
		coverImgId = map["coverImgId"],
		newImported = map["newImported"],
		anonimous = map["anonimous"],
		coverImgUrl = map["coverImgUrl"],
		totalDuration = map["totalDuration"],
		specialType = map["specialType"],
		trackCount = map["trackCount"],
		commentThreadId = map["commentThreadId"],
		privacy = map["privacy"],
		trackUpdateTime = map["trackUpdateTime"],
		playCount = map["playCount"],
		subscribedCount = map["subscribedCount"],
		cloudTrackCount = map["cloudTrackCount"],
		tags = map["tags"],
		ordered = map["ordered"],
		description = map["description"],
		status = map["status"],
		name = map["name"],
		id = map["id"],
		coverImgId_str = map["coverImgId_str"],
		ToplistType = map["ToplistType"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['subscribers'] = subscribers;
		data['subscribed'] = subscribed;
		data['creator'] = creator;
		data['artists'] = artists;
		data['tracks'] = tracks != null ? 
			this.tracks.map((v) => v.toJson()).toList()
			: null;
		data['updateFrequency'] = updateFrequency;
		data['backgroundCoverId'] = backgroundCoverId;
		data['backgroundCoverUrl'] = backgroundCoverUrl;
		data['titleImage'] = titleImage;
		data['titleImageUrl'] = titleImageUrl;
		data['englishTitle'] = englishTitle;
		data['opRecommend'] = opRecommend;
		data['recommendInfo'] = recommendInfo;
		data['adType'] = adType;
		data['trackNumberUpdateTime'] = trackNumberUpdateTime;
		data['createTime'] = createTime;
		data['highQuality'] = highQuality;
		data['userId'] = userId;
		data['updateTime'] = updateTime;
		data['coverImgId'] = coverImgId;
		data['newImported'] = newImported;
		data['anonimous'] = anonimous;
		data['coverImgUrl'] = coverImgUrl;
		data['totalDuration'] = totalDuration;
		data['specialType'] = specialType;
		data['trackCount'] = trackCount;
		data['commentThreadId'] = commentThreadId;
		data['privacy'] = privacy;
		data['trackUpdateTime'] = trackUpdateTime;
		data['playCount'] = playCount;
		data['subscribedCount'] = subscribedCount;
		data['cloudTrackCount'] = cloudTrackCount;
		data['tags'] = tags;
		data['ordered'] = ordered;
		data['description'] = description;
		data['status'] = status;
		data['name'] = name;
		data['id'] = id;
		data['coverImgId_str'] = coverImgId_str;
		data['ToplistType'] = ToplistType;
		return data;
	}
}

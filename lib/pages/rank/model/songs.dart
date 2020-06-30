import 'package:fun_flutter_music/pages/rank/model/artists.dart';
import 'package:fun_flutter_music/pages/rank/model/album.dart';
import 'package:fun_flutter_music/pages/rank/model/b_music.dart';
import 'package:fun_flutter_music/pages/rank/model/h_music.dart';
import 'package:fun_flutter_music/pages/rank/model/m_music.dart';
import 'package:fun_flutter_music/pages/rank/model/l_music.dart';

class Songs {

  String name;
  int id;
  int position;
  List<Object> alias;
  int status;
  int fee;
  int copyrightId;
  String disc;
  int no;
  List<Artists> artists;
  Album album;
  bool starred;
  int popularity;
  int score;
  int starredNum;
  int duration;
  int playedNum;
  int dayPlays;
  int hearTime;
  Object ringtone;
  Object crbt;
  Object audition;
  String copyFrom;
  String commentThreadId;
  Object rtUrl;
  int ftype;
  List<Object> rtUrls;
  int copyright;
  Object transName;
  Object sign;
  int mark;
  Object noCopyrightRcmd;
  int rtype;
  Object rurl;
  int mvid;
  BMusic bMusic;
  Object mp3Url;
  HMusic hMusic;
  MMusic mMusic;
  LMusic lMusic;

	Songs.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		id = map["id"],
		position = map["position"],
		alias = map["alias"],
		status = map["status"],
		fee = map["fee"],
		copyrightId = map["copyrightId"],
		disc = map["disc"],
		no = map["no"],
		artists = List<Artists>.from(map["artists"].map((it) => Artists.fromJsonMap(it))),
		album = Album.fromJsonMap(map["album"]),
		starred = map["starred"],
		popularity = map["popularity"],
		score = map["score"],
		starredNum = map["starredNum"],
		duration = map["duration"],
		playedNum = map["playedNum"],
		dayPlays = map["dayPlays"],
		hearTime = map["hearTime"],
		ringtone = map["ringtone"],
		crbt = map["crbt"],
		audition = map["audition"],
		copyFrom = map["copyFrom"],
		commentThreadId = map["commentThreadId"],
		rtUrl = map["rtUrl"],
		ftype = map["ftype"],
		rtUrls = map["rtUrls"],
		copyright = map["copyright"],
		transName = map["transName"],
		sign = map["sign"],
		mark = map["mark"],
		noCopyrightRcmd = map["noCopyrightRcmd"],
		rtype = map["rtype"],
		rurl = map["rurl"],
		mvid = map["mvid"],
		bMusic = BMusic.fromJsonMap(map["bMusic"]),
		mp3Url = map["mp3Url"],
		hMusic = HMusic.fromJsonMap(map["hMusic"]),
		mMusic = MMusic.fromJsonMap(map["mMusic"]),
		lMusic = LMusic.fromJsonMap(map["lMusic"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['id'] = id;
		data['position'] = position;
		data['alias'] = alias;
		data['status'] = status;
		data['fee'] = fee;
		data['copyrightId'] = copyrightId;
		data['disc'] = disc;
		data['no'] = no;
		data['artists'] = artists != null ? 
			this.artists.map((v) => v.toJson()).toList()
			: null;
		data['album'] = album == null ? null : album.toJson();
		data['starred'] = starred;
		data['popularity'] = popularity;
		data['score'] = score;
		data['starredNum'] = starredNum;
		data['duration'] = duration;
		data['playedNum'] = playedNum;
		data['dayPlays'] = dayPlays;
		data['hearTime'] = hearTime;
		data['ringtone'] = ringtone;
		data['crbt'] = crbt;
		data['audition'] = audition;
		data['copyFrom'] = copyFrom;
		data['commentThreadId'] = commentThreadId;
		data['rtUrl'] = rtUrl;
		data['ftype'] = ftype;
		data['rtUrls'] = rtUrls;
		data['copyright'] = copyright;
		data['transName'] = transName;
		data['sign'] = sign;
		data['mark'] = mark;
		data['noCopyrightRcmd'] = noCopyrightRcmd;
		data['rtype'] = rtype;
		data['rurl'] = rurl;
		data['mvid'] = mvid;
		data['bMusic'] = bMusic == null ? null : bMusic.toJson();
		data['mp3Url'] = mp3Url;
		data['hMusic'] = hMusic == null ? null : hMusic.toJson();
		data['mMusic'] = mMusic == null ? null : mMusic.toJson();
		data['lMusic'] = lMusic == null ? null : lMusic.toJson();
		return data;
	}
}

import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fun_flutter_music/model/search_result.dart' as songs;
import 'package:fun_flutter_music/model/song.dart';
import 'package:fun_flutter_music/network/api_request_url.dart';
import 'package:fun_flutter_music/network/request_manager.dart';
import 'package:fun_flutter_music/network/result_data.dart';
import 'package:fun_flutter_music/utils/application.dart';
import 'package:fun_flutter_music/utils/fluro_convert_utils.dart';

class PlaySongsModel extends ChangeNotifier {
  AudioPlayer _audioPlayer = AudioPlayer();
  StreamController<String> _curPositionController =
      StreamController<String>.broadcast();

  List<Song> _songs = [];
  int curIndex = 0;
  Duration curSongDuration;
  AudioPlayerState _curState;
  Song curPlaySong = Song(0, name: '', picUrl: '', artists: '');

  List<Song> get allSongs => _songs;

  Song get curSong => _songs[curIndex];

  Stream<String> get curPositionStream => _curPositionController.stream;

  AudioPlayerState get curState => _curState;

  Future<Song> getPlaySong() async {
    ResultData r = await RequestManager.getInstance()
        .get(SONG_DETAIL, params: {"ids": _songs[curIndex].id});
    songs.Songs resSongs = songs.Songs.fromJson(r.data['songs'][0]);
    curPlaySong = Song(
      resSongs.id,
      name: resSongs.name,
      picUrl: resSongs.al.picUrl,
      artists: '${resSongs.ar.map((a) => a.name).toList().join('/')}',
    );
    notifyListeners();
  }

  void init() {
    _audioPlayer.setReleaseMode(ReleaseMode.STOP);
    // 播放状态监听
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _curState = state;

      /// 先做顺序播放
      if (state == AudioPlayerState.COMPLETED) {
        nextPlay();
      }
      // 其实也只有在播放状态更新时才需要通知。
      notifyListeners();
    });
    _audioPlayer.onDurationChanged.listen((d) {
      curSongDuration = d;
    });
    // 当前播放进度监听
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      sinkProgress(p.inMilliseconds > curSongDuration.inMilliseconds
          ? curSongDuration.inMilliseconds
          : p.inMilliseconds);
    });
  }

  // 歌曲进度
  void sinkProgress(int m) {
    _curPositionController.sink.add('$m-${curSongDuration.inMilliseconds}');
  }

  // 播放一首歌
  void playSong(Song song) {
    _songs.insert(curIndex, song);
    play();
  }

  // 播放很多歌
  void playSongs(List<Song> songs, {int index}) {
    this._songs = songs;
    if (index != null) curIndex = index;
    play();
  }

  // 添加歌曲
  void addSongs(List<Song> songs) {
    this._songs.addAll(songs);
  }

  /// 播放
  void play() {
    _audioPlayer.play(
        "https://music.163.com/song/media/outer/url?id=${this._songs[curIndex].id}.mp3");
    saveCurSong();
  }

  /// 暂停、恢复
  void togglePlay() {
    if (_audioPlayer.state == AudioPlayerState.PAUSED) {
      resumePlay();
    } else {
      pausePlay();
    }
  }

  // 暂停
  void pausePlay() {
    _audioPlayer.pause();
  }

  /// 跳转到固定时间
  void seekPlay(int milliseconds) {
    _audioPlayer.seek(Duration(milliseconds: milliseconds));
    resumePlay();
  }

  /// 恢复播放
  void resumePlay() {
    _audioPlayer.resume();
  }

  /// 下一首
  void nextPlay() {
    if (curIndex >= _songs.length) {
      curIndex = 0;
    } else {
      curIndex++;
    }
    play();
  }

  void prePlay() {
    if (curIndex <= 0) {
      curIndex = _songs.length - 1;
    } else {
      curIndex--;
    }
    play();
  }

  // 保存当前歌曲到本地
  void saveCurSong() {
    Application.sp.remove('playing_songs');
    Application.sp.setStringList('playing_songs',
        _songs.map((s) => FluroConvertUtils.object2string(s)).toList());
    Application.sp.setInt('playing_index', curIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _curPositionController.close();
    _audioPlayer.dispose();
  }
}

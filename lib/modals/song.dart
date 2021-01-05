import 'dart:io';

import 'package:get/get_state_manager/src/simple/get_state.dart';

class Song {
  String songTitle;
  String artistName;
  DateTime dateAdded;
  String songPath;
  String songArt;
  String album;
  String path;
  String genre;
  String year;

  Song(
      {this.artistName,
      this.album,
      this.year,
      this.dateAdded,
      this.songArt,
      this.songPath,
      this.genre,
      this.songTitle,
      this.path});

  Song.fromMap(Map<dynamic, dynamic> info, {String filePath}) {
    var date;
    try {
      // if coming from db filepath will be null
      date = File(filePath ?? info['path']).lastAccessedSync();
    } catch (err) {
      date = DateTime(2000);
      print(err);
    }
    // if coming from db filepath will be null
    this.path = filePath ?? info['path'];
    this.songTitle =
        info != null && info['title'] != null && info['title'] != ''
            ? info['title']
            : filePath.split('/').last.split('.mp3').first;
    this.artistName =
        info != null && info['artist'] != null && info['artist'] != ''
            ? info['artist']
            : 'Unknown artist';
    this.genre = info != null && info['genre'] != null ? info['genre'] : '';
    this.album = info != null && info['album'] != null ? info['album'] : '';
    this.year = info != null && info['year'] != null ? info['year'] : '';
    this.dateAdded = date;
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'path': this.path,
      'title': this.songTitle,
      'artist': this.artistName,
      'genre': this.genre,
      'album': this.album,
      'year': this.year,
    };
  }
}

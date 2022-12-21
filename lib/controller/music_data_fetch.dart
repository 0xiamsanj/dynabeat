import 'dart:convert';

import 'package:dynabeat/model/music_data_model.dart';
import 'package:dynabeat/model/result_data_model.dart';
import 'package:dynabeat/services/song_fetch_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SongFetcher extends GetxController {
  var musicList = <MusicData>[].obs;
  var albumList = <ResultData>[].obs;
  var index = 0.obs;
  late TextEditingController songNameSearch;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    songNameSearch = TextEditingController();
    fetchSong("thee");
  }

  void fetchSong(String? songName) async {
    try {
      isLoading(true);
      var song = await SongFetch.fetchSong(songName!);
      var album = await SongFetch.fetchAlbum(songName);
      print(json.encode(song));
      if (song != "") {
        musicList.value = song;
        albumList.value = album;
        print(albumList.value.length);
        isLoading.value = false;
      }
    } finally {
      isLoading(false);
    }
  }
}

import 'dart:convert';

import 'package:dynabeat/model/music_data_model.dart';
import 'package:dynabeat/model/result_data_model.dart';
import 'package:dynabeat/services/song_fetch_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SongFetchController extends GetxController {
  var musicList = <MusicData>[].obs;
  var albumList = <ResultData>[].obs;
  var index = 0.obs;
  late TextEditingController songNameSearch;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    songNameSearch = TextEditingController();
    fetchSong("thunivu");
  }

  void fetchSong(String? songName) async {
    try {
      isLoading(true);
      var song = await SongFetch.fetchSong(songName!);
      print(json.encode(song));
      if (song != "") {
        musicList.value = song;
        print(albumList.value.length);
        isLoading.value = false;
      }
    } finally {
      print("no result");
      isLoading(false);
    }
  }
}

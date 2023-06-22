import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../model/music_data_model.dart';

class AudioPlayerServices extends GetxController {
  late AudioPlayer _player;
  late MusicData music;
  late AudioCache cache;
  var pos = 0.0.obs;

  @override
  void onInit() {
    _player = AudioPlayer();
    pos.value = 0.0;
    super.onInit();
  }

  void playMusic() async {
    await _player.setSourceUrl("${music.mediaUrl}");
  }
}

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../model/music_data_model.dart';

class AudioPlayerServices extends GetxController {
  late AudioPlayer _player;
  late MusicData music;

  var pos = 0.0.obs;

  @override
  void onInit() {
    _player = AudioPlayer();
    super.onInit();
  }

  void playMusic() async {
    await _player.setUrl("${music.mediaUrl}");
  }
}

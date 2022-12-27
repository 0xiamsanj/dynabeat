import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioPlayerController extends GetxController {
  final AudioPlayer _player = AudioPlayer();
  final PlayerState state = PlayerState.stopped;

  Future<void> playMusic(url) async {
    if (state == PlayerState.paused) {
      await _player.resume();
    } else {
      _player.setSourceUrl(url);
      _player.play(url);
    }
  }

  Future<void> pauseMusic() async {
    await _player.pause();
  }
}

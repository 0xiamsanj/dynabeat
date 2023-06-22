import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioPlayerController extends GetxController {
  final AudioPlayer _player = AudioPlayer();
  late PlayerState audioState;
  var isPlaying = true.obs;

  @override
  void onInit() {
    super.onInit();
    isPlaying.value = false;
    audioState = PlayerState.stopped;
  }

  Future<void> PlayPauseService(url) async {
    if (audioState == PlayerState.stopped || audioState == PlayerState.paused) {
      _player.setSourceUrl(url);
      if (audioState == PlayerState.stopped) {
        audioState = PlayerState.playing;
        _player.play(UrlSource(url));
        isPlaying.value = true;
      } else if (audioState == PlayerState.playing) {
        await _player.stop();
        _player.play(UrlSource(url));
        audioState = PlayerState.playing;
        isPlaying.value = true;
      } else if (audioState == PlayerState.paused) {
        _player.resume();
        audioState = PlayerState.playing;
        isPlaying.value = true;
      }
    } else if (audioState == PlayerState.playing) {
      await _player.pause();
      audioState = PlayerState.paused;
      isPlaying.value = false;
    }
  }

  Future<void> seekMusic(double newPos) async {
    _player.seek(Duration(seconds: newPos.toInt()));
  }
}

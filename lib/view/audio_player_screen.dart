import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynabeat/controller/audio_player.dart';
import 'package:dynabeat/controller/audio_player_controller.dart';
import 'package:dynabeat/model/music_data_model.dart';
import 'package:dynabeat/utils/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/audio_player_manager.dart';

final _player = Get.put(AudioPlayerServices());
final _audioPlayer = Get.put(AudioPlayerController());
final AudioPlayerManager _audioPlayerManager = AudioPlayerManager();

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({Key? key, required this.music}) : super(key: key);
  final MusicData music;

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  void initState() {
    _audioPlayer.PlayPauseService(widget.music.mediaUrl!);

    _player.pos.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161A1A),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            _albumArt(),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                    widget.music.song!, 25, FontWeight.w600, Colors.white),
                const SizedBox(
                  height: 10,
                ),
                textWidget(
                    widget.music.singers!, 17, FontWeight.w400, Colors.white),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _customSlider(),
            // _progressBar(),
            SizedBox(
              width: 320,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget("0:00", 10, FontWeight.w700, Colors.white),
                  textWidget("${int.parse(widget.music.duration!) % 60}", 10,
                      FontWeight.w700, Colors.white),
                ],
              ),
            ),
            SizedBox(
              width: 320,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {},
                    child: const Icon(
                      Icons.skip_previous_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Obx(() {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () async {
                        await _audioPlayer.PlayPauseService(
                            widget.music.mediaUrl!);
                      },
                      child: _audioPlayer.isPlaying.value
                          ? const Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 50,
                            )
                          : const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 50,
                            ),
                    );
                  }),
                  InkWell(
                    onTap: () async {},
                    child: const Icon(
                      Icons.skip_next_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  //Slider change function
  void sliderChange(double newPos) {
    _player.pos.value = newPos;
    _audioPlayer.seekMusic(newPos);
    _player.update();
  }

  Widget _progressBar() {
    return StatefulBuilder(builder: (context, setState) {
      return StreamBuilder<DurationState>(
        stream: _audioPlayerManager.durationState,
        builder: (context, snapshot) {
          final durationState = snapshot.data;
          final progress = durationState?.progress ?? Duration.zero;
          final buffered = durationState?.buffered ?? Duration.zero;
          final total = durationState?.total ?? Duration.zero;
          return ProgressBar(
            progress: progress,
            buffered: buffered,
            total: total,
            onSeek: _audioPlayerManager.player.seek,
            onDragUpdate: (details) {
              debugPrint('${details.timeStamp}, ${details.localPosition}');
            },
            barHeight: 20,
            baseBarColor: Colors.grey,
            progressBarColor: Colors.purple,
            bufferedBarColor: Colors.white,
            thumbColor: Colors.red,
            thumbGlowColor: Colors.red.shade100,
            barCapShape: BarCapShape.round,
            thumbRadius: 20,
            thumbCanPaintOutsideBar: true,
            timeLabelLocation: TimeLabelLocation.below,
            timeLabelType: TimeLabelType.remainingTime,
            timeLabelTextStyle: TextStyle(color: Colors.white),
            timeLabelPadding: 10,
          );
        },
      );
    });
  }

  Widget _albumArt() {
    return Hero(
      tag: widget.music.song!,
      child: Container(
        height: 350,
        width: 350,
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onHorizontalDragDown: (s) {
              Get.back(closeOverlays: true);
            },
            child: CachedNetworkImage(
              imageUrl: widget.music.image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  //Slider Widget with duration
  Widget _customSlider() {
    return SizedBox(
      width: 450,
      height: 50,
      child: Column(
        children: [
          Obx(() {
            return Expanded(
              child: SliderTheme(
                data: SliderTheme.of(Get.context!).copyWith(
                  trackHeight: 3.5,
                  trackShape: const RoundedRectSliderTrackShape(),
                  activeTrackColor: Colors.purple.shade800,
                  inactiveTrackColor: Colors.purple.shade100,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 8.0,
                    pressedElevation: 8.0,
                  ),
                  thumbColor: Colors.pinkAccent,
                  overlayColor: Colors.pink.withOpacity(0.2),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 32.0),
                  tickMarkShape: const RoundSliderTickMarkShape(),
                  activeTickMarkColor: Colors.pinkAccent,
                  inactiveTickMarkColor: Colors.white,
                  valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Colors.black,
                  valueIndicatorTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                child: Slider(
                    value: _player.pos.value,
                    min: 0.0,
                    max: double.parse(widget.music.duration!),
                    activeColor: const Color(0xffe6c8ff),
                    inactiveColor: const Color(0xff625d6f),
                    onChanged: (newPos) {
                      sliderChange(newPos);
                    }),
              ),
            );
          }),
        ],
      ),
    );
  }
}

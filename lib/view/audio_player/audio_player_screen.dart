import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynabeat/controller/audio_player.dart';
import 'package:dynabeat/model/music_data_model.dart';
import 'package:dynabeat/utils/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/music_data_fetch.dart';

final _song = Get.put(SongFetcher());
final _player = Get.put(AudioPlayerServices());

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({Key? key, required this.music}) : super(key: key);
  final MusicData music;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Hero(
                tag: music.song!,
                child: SizedBox(
                  height: 350,
                  width: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onHorizontalDragDown: (s) {
                        Get.back(closeOverlays: true);
                      },
                      child: CachedNetworkImage(
                        imageUrl: music.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              textWidget(music.song!, 20, FontWeight.w700, Colors.white),
              const SizedBox(
                height: 10,
              ),
              textWidget(music.singers!, 17, FontWeight.w400, Colors.white),
              customSlider()
            ],
          ),
        ),
      ),
    );
  }

  //Slider change function
  void sliderChange(newPos) {
    _player.pos.value = newPos;
    _player.update();
  }

  //Slider Widget with duration
  Widget customSlider() {
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
                    activeColor: const Color(0xffe6c8ff),
                    inactiveColor: const Color(0xff625d6f),
                    label: "Hello",
                    onChanged: (newPos) {
                      sliderChange(newPos);
                    }),
              ),
            );
          }),
          SizedBox(
            width: 320,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget("0:00", 10, FontWeight.w700, Colors.white),
                textWidget("4:32", 10, FontWeight.w700, Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

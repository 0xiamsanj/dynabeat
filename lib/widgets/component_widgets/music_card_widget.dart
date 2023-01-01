import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynabeat/model/music_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/music_data_fetch.dart';
import '../../view/audio_player_screen.dart';

final _songDetails = Get.put(SongFetchController());

class MusicCard extends StatelessWidget {
  final MusicData music;
  final int index;
  final double? height;
  final int? cardCount;
  final String? label;

  final String? cardImage;

  const MusicCard({
    Key? key,
    this.height,
    this.cardCount,
    this.label,
    this.cardImage,
    required this.music,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _songDetails.index.value = index;
        Get.to(() => AudioPlayerScreen(music: _songDetails.musicList[index]),
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 500));
      },
      onDoubleTap: () async {},
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        height: 270,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Hero(
                      tag: music.song!,
                      child: CachedNetworkImage(imageUrl: music.image!))),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              music.song!,
              style: const TextStyle(
                  fontFamily: 'Gotham',
                  fontSize: 13.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              music.music!,
              style: const TextStyle(
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.5,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

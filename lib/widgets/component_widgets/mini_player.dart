import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynabeat/model/music_data_model.dart';
import 'package:dynabeat/utils/export.dart';
import 'package:dynabeat/view/audio_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({Key? key, required this.music}) : super(key: key);
  final MusicData music;

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (s) {
        Get.to(() => AudioPlayerScreen(music: widget.music),
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 0));
      },
      child: Container(
        width: double.infinity,
        height: 70,
        color: Colors.grey.shade800,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Hero(
                  tag: "s",
                  child: CachedNetworkImage(
                    imageUrl: widget.music.image!,
                  ),
                ),
              ),
            ),
            Container(
                width: 200,
                child: textWidget(
                    widget.music.song!, 14, FontWeight.w700, Colors.white)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow_rounded,
                  size: 30,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_next,
                  size: 30,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}

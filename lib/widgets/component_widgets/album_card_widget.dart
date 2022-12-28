import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynabeat/model/result_data_model.dart';
import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final ResultData result;

  final double? height;
  final int? cardCount;
  final String? label;
  String? cardImage;

  AlbumCard({
    Key? key,
    this.height,
    this.cardCount,
    this.label,
    this.cardImage,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // await player.setUrl(result.mediaUrl!);
        // await player.play();
      },
      onDoubleTap: () async {
        // await player.pause();
      },
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
                  child: CachedNetworkImage(imageUrl: result.image!)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              result.album!,
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
              result.music!,
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

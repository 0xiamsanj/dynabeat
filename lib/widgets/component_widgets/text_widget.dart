import 'package:flutter/material.dart';

Widget textWidget(String text, double? fsize, fweight, color) {
  return Text(
    text,
    style: TextStyle(
      overflow: TextOverflow.ellipsis,
      fontFamily: "Gotham",
      fontWeight: fweight,
      color: color,
      fontSize: fsize,
    ),
  );
}

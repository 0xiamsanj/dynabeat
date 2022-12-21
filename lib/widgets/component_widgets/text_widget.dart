import 'package:flutter/material.dart';

Widget textWidget(String text, double? fsize, fweight, color) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Gotham",
      fontWeight: fweight,
      color: color,
      fontSize: fsize,
    ),
  );
}

import 'package:dynabeat/widgets/component_widgets/text_widget.dart';
import 'package:flutter/material.dart';

Widget logo() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const ImageIcon(
        AssetImage("assets/logo/dyna logo.png"),
        size: 50,
        color: Colors.white,
      ),
      textWidget("Dynabeat", 25, FontWeight.w700, Colors.white),
    ],
  );
}

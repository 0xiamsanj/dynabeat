import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalSize {
  GlobalSize._();
  static double cardSize = 50.0;
  static var height = MediaQuery.of(Get.context!).size.width * 1;
  static var width = MediaQuery.of(Get.context!).size.height * 1;
}

class GlobalColors {
  GlobalColors._();
  static var primaryBackground = Color(0xff161A1A);
  static var accent = Color(0xffba78e8);
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalSize {
  GlobalSize._();
  static double cardSize = 50.0;
  static var height = MediaQuery.of(Get.context!).size.width * 1;
  static var width = MediaQuery.of(Get.context!).size.height * 1;
}

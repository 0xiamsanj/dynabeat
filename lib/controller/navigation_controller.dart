import 'package:get/get.dart';

class NavigationController extends GetxController {
  var tabIndex = 0.obs;

  void tabIndexChange(index) {
    tabIndex.value = index;
  }
}

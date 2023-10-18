import 'package:get/get.dart';

class tilecolorxController extends GetxController {
  RxInt selectedindex = 0.obs;

  void toggle(int index) => selectedindex.value = index;
}

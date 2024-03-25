import 'package:get/get.dart';

class TabIndexController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  set setTabIndex(int index) {
    _selectedIndex.value = index;
  }
}

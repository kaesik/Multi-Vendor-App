import 'package:get/get.dart';

class CategoryController extends GetxController {
  final RxString _category = ''.obs;

  String get categoryValue => _category.value;

  set setCategory(String category) {
    _category.value = category;
  }

  final RxString _title = ''.obs;

  String get titleValue => _title.value;

  set setTitle(String title) {
    _title.value = title;
  }
}

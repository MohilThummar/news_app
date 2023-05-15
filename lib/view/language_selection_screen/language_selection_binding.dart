import 'package:get/get.dart';

import 'language_selection_controller.dart';

class LanguageSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LanguageSelectionController>(LanguageSelectionController());
  }
}

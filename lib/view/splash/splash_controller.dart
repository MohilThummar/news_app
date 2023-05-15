import 'package:get/get.dart';

import '../../utils/routes/routes_name.dart';

//import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Get.offAllNamed(RoutesName.languageScreen);
      },
    );
    super.onInit();
  }
}

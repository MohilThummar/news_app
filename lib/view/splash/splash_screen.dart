import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (GetxController controller) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}

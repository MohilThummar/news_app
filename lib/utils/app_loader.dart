
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.5),
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width > 550 ? 32 : 26,
                  height: Get.width > 550 ? 32 : 26,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    strokeWidth: 3,
                  ),
                ),
                const SizedBox(width: 15.0),
                Text(
                  "Loading...",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Get.width > 550 ? 20 : 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularLoader extends StatelessWidget {
  final Color? color;
  final double? loaderSize;
  final double? height;

  const CircularLoader({super.key, this.height, this.color, this.loaderSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Scaffold(
        // backgroundColor: Colors.grey.withOpacity(0.6),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width * (loaderSize ?? 0.05),
                height: Get.width * (loaderSize ?? 0.05),
                child: getLoader(color, context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getLoader(Color? color, BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoActivityIndicator();
    } else {
      return CircularProgressIndicator(color: color ?? Theme.of(context).primaryColor, strokeWidth: 3);
    }
  }
}

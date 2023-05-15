import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  /// <<< To create dark status bar --------- >>>
  static void darkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.grey.shade100,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  /// <<< To create light status bar --------- >>>
  static void lightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  /// <<< To choose screens portrait --------- >>>
  static void screenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// <<< To get device type --------- >>>
  String getDeviceType() {
    if (Platform.isAndroid) {
      return 'Android';
    } else {
      return 'iOS';
    }
  }

  /// <<< To show toast massage  --------- >>>
  static void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.white,
      backgroundColor: Colors.black26,
    );
  }

  /// <<< To show toast massage  --------- >>>
  static void showSnackBar({
    String title = "",
    bool success = true,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      borderRadius: 10,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: success ? Theme.of(Get.context!).primaryColor : Colors.redAccent,
      titleText: title.isEmpty ? const SizedBox() : null,
      // icon: Image.asset(
      //   success ? "assets/images/success_toast.png" : "assets/images/failure_toast.png",
      //   height: 25,
      //   width: 25,
      //   color: Colors.white,
      // ),
    );
  }

  /// <<< To check email valid or not --------- >>>
  bool emailValidator(String email) {
    RegExp regExp = RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regExp.hasMatch(email);
  }

  /// <<< To check phone valid or not --------- >>>
  bool phoneValidator(String contact) {
    RegExp regExp = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]*$');
    return regExp.hasMatch(contact);
  }

  /// <<< To check password valid or not --------- >>>
  bool passwordValidator(String contact) {
    RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$0&*~]).{8,}$');
    return regExp.hasMatch(contact);
  }

  /// <<< To check data, string, list, object are empty or not --------- >>>
  bool isValidationEmpty(String? val) {
    return (val == null || val.isEmpty || val == "null" || val == "" || val == "NULL");
  }

  /// <<< To transfer string to Md5 --------- >>>
  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  /// <<< hide keyboard --------- >>>
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  /// <<< To change date formant --------- >>>
  String changeDateFormat({DateTime? date, String? outputFormat}) {
    if (date != null) {
      DateFormat formatter = DateFormat(outputFormat);
      String formatted = formatter.format(date);
      return formatted;
    }
    return '';
  }

  String utcToLocal(String date, {bool? isChat}) {
    if (date.isNotEmpty) {
      var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date.toString(), true);
      DateTime dateLocal = dateTime.toLocal();
      return dateLocal.toString();
    }
    return '';
  }

  /// Time Ago Since Date --------- >>>
  String timeAgoSinceDate(String dateString, {bool numericDates = true}) {
    DateTime dateUtc = DateTime.parse(dateString);
    var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateUtc.toString(), true);
    DateTime date = dateTime.toLocal();
    final date2 = DateTime.now();
    final difference = date2.difference(date);

    if ((difference.inDays / 365).floor() >= 2) {
      return (numericDates) ? '${(difference.inDays / 365).floor()} Y' : '${(difference.inDays / 365).floor()} Years ago';
    } else if ((difference.inDays / 365).floor() >= 1) {
      return (numericDates) ? '1 Y' : 'Last year';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} M';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return (numericDates) ? '1 M' : 'Last Month';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return (numericDates) ? '${(difference.inDays / 7).floor()} w' : '${(difference.inDays / 7).floor()} Weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 w' : 'Last week';
    } else if (difference.inDays >= 2) {
      return (numericDates) ? '${difference.inDays} d' : '${difference.inDays} Days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 d' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} h';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 h' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} min';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 min' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} sec';
    } else {
      return 'now';
    }
  }
}

// import 'package:flutter/material.dart';
//
// class Loading {
//   Loading() {
//     EasyLoading.instance
//       ..displayDuration = const Duration(milliseconds: 2000)
//       ..indicatorType = EasyLoadingIndicatorType.circle
//       ..contentPadding = const EdgeInsets.all(18)
//       ..loadingStyle = EasyLoadingStyle.custom
//       ..indicatorSize = 40.0
//       ..lineWidth = 2
//       ..radius = 15
//       ..progressColor = AppColors.whiteColor
//       ..backgroundColor = AppColors.appColor
//       ..indicatorColor = AppColors.whiteColor
//       ..textColor = AppColors.whiteColor
//       ..maskColor = AppColors.blackColor.withOpacity(0.4)
//       ..maskType = EasyLoadingMaskType.custom
//       ..userInteractions = true
//       ..dismissOnTap = false;
//   }
//
//   static void show([String? text]) {
//     EasyLoading.instance.userInteractions = false;
//     EasyLoading.show();
//   }
//
//   static void toast(String text) {
//     EasyLoading.showToast(text);
//   }
//
//   static void dismiss() {
//     EasyLoading.instance.userInteractions = true;
//     EasyLoading.dismiss();
//   }
// }

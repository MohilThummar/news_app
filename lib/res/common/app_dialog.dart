import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

Future<void> commonDialog({
  required String title,
  required Widget description,
  required BuildContext context,
  Color? titleColor,
  Color? btnColor,
  VoidCallback? onTap,
  bool? onlyMessDialog = false,
  String? okButtonText,
}) {
  return showDialog(
    barrierColor: const Color(0xCC000000),
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0 / 2, horizontal: 15.0),
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  color: titleColor ?? Colors.white,
                ),
              ),
            ),
            description,
            Divider(height: 0, color: Theme.of(context).primaryColor.withOpacity(0.7)),
            Padding(
              padding: const EdgeInsets.all(15.0 / 1.3),
              child: !onlyMessDialog!
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: Get.width * 0.25,
                          child: InkWell(
                            onTap: () => Get.back(),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10.0 / 2),
                                border: Border.all(color: Theme.of(context).primaryColor, width: 0.7),
                              ),
                              child: Center(
                                child: Text(
                                  'રદ કરો',
                                  style: TextStyle(color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15.0 / 1.3),
                        SizedBox(
                          width: Get.width * 0.25,
                          child: InkWell(
                            onTap: onTap,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0 / 2),
                                border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
                              ),
                              child: const Center(
                                child: Text(
                                  'બદલો',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: SizedBox(
                        width: Get.width * 0.25,
                        child: InkWell(
                          onTap: onTap ?? () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10.0 / 2),
                              border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
                            ),
                            child: Center(
                              child: Text(
                                okButtonText ?? 'બદલો',
                                style: const TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      );
    },
  );
}

Future<void> confirmationDialog({
  required String? title,
  required String? description,
  required Color? color,
  required BuildContext context,
  VoidCallback? onTap,
}) {
  return showDialog(
    barrierColor: const Color(0xCC000000),
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              msgArea(title, description, context),
              footer(context, color, onTap),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> logoutDialog({
  required String? title,
  required String? description,
  required Color? color,
  required BuildContext context,
  VoidCallback? onTap,
}) {
  return showDialog(
    barrierColor: const Color(0xCC000000),
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: SizedBox(
          height: 130,
          child: Column(
            children: [msgArea(title, description, context), footer(context, color, onTap)],
          ),
        ),
      );
    },
  );
}

backOperation(BuildContext context) {
  return showDialog(
    barrierColor: const Color(0xCC000000),
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: SizedBox(
          height: Get.width * 0.50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0 / 2),
                    child: Text(
                      'એપ્લિકેશનમાંથી બહાર નીકળો',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'શું તમે ખરેખર એપ્લિકેશનમાંથી બહાર નીકળવા માંગો છો?',
                      style: TextStyle(fontSize: 16, color: Theme.of(context).iconTheme.color!.withOpacity(0.8)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Theme.of(context).primaryColor)),
                          height: 40,
                          width: Get.height * 0.13,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text(
                                'ના',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Theme.of(context).primaryColor),
                          height: 40,
                          width: Get.height * 0.13,
                          child: InkWell(
                            onTap: () async {
                              final cacheDir = await getTemporaryDirectory();
                              if (cacheDir.existsSync()) {
                                cacheDir.deleteSync(recursive: true);
                              }
                              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                            },
                            child: const Center(
                              child: Text(
                                'હા',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget msgArea(title, description, context) => Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset(
          //   AppAssets.appLogo,
          //   width: Get.width / 4.2,
          //   fit: BoxFit.contain,
          // ),
          const SizedBox(width: 15.0 / 2.5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 15.0),
                Text(
                  title,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 15.0 / 2),
                Text(
                  description,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(width: 15.0),
              ],
            ),
          ),
        ],
      ),
    );

Widget footer(context, color, onTap) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        color: Colors.grey[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0 / 2),
                border: Border.all(color: color),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: const Text(
                'ના',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 15.0 / 2.5),
          InkWell(
            onTap: () => onTap(),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: color),
                borderRadius: BorderRadius.circular(10.0 / 2),
                color: color,
              ),
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: const Text(
                'હા',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 15.0 / 3),
        ],
      ),
    );

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'res/constant/app_strings.dart';
import 'res/constant/app_theme.dart';
import 'res/controller/base_controller.dart';
import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';
import 'utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Utils.darkStatusBar();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          initialBinding: BaseBinding(),
          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          getPages: pages,
          initialRoute: RoutesName.splashScreen,
        );
      },
    );
  }
}

/// ----- How to use Responsive in app ----------------- >>>
/*
    50.w  //Adapted to screen width
    100.h //Adapted to screen height
    20.r  //Adapt according to the smaller of width or height
    16.sp //Adapter font
    12.sm //return min(12,12.sp)

    ScreenUtil().pixelRatio       //Device pixel density
    ScreenUtil().screenWidth      //Device width
    ScreenUtil().screenHeight     //Device height
    ScreenUtil().bottomBarHeight  //Bottom safe zone distance, suitable for buttons with full screen
    ScreenUtil().statusBarHeight  //Status bar height , Notch will be higher
    ScreenUtil().textScaleFactor  //System font scaling factor

    ScreenUtil().scaleWidth   //The ratio of actual width to UI design
    ScreenUtil().scaleHeight  //The ratio of actual height to UI design

    ScreenUtil().orientation  //Screen orientation

    0.02.sw  //2% of screen width
    0.5.sh  //50% of screen height

    20.setVerticalSpacing  // SizedBox(height: 20 * scaleHeight)
    20.horizontalSpace  // SizedBox(height: 20 * scaleWidth)

    const RPadding.all(8)               // Padding.all(8.r) - take advantage of const key word
    EdgeInsets.all(10).w                //EdgeInsets.all(10.w)
    EdgeInsets.only(left:8,right:8).r   // EdgeInsets.only(left:8.r,right:8.r).

    BoxConstraints(maxWidth: 100, minHeight: 100).w     //BoxConstraints(maxWidth: 100.w, minHeight: 100.w)

    Radius.circular(16).w     //Radius.circular(16.w)

    BorderRadius.all(Radius.circular(16)).w     //BorderRadius.all(Radius.circular(16.w))
*/

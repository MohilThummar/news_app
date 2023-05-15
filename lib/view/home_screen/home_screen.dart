import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/res/common/app_button.dart';
import 'package:news_app/res/constant/app_assets.dart';
import 'package:news_app/res/constant/app_colors.dart';

import '../../res/common/app_header.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return Scaffold(
          body: SafeArea(
            top: false,
            child: controller.selectedTab.value == 0
                ? home()
                : controller.selectedTab.value == 2
                    ? gallery()
                    : controller.selectedTab.value == 3
                        ? setting()
                        : notification(),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 6.0, //extend the shadow
                  offset: const Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(
                left: 6.w,
                right: 6.w,
                bottom: MediaQuery.of(context).padding.bottom + 6.w,
                top: 6.w,
              ),
              child: GNav(
                gap: 8,
                padding: EdgeInsets.all(15.h),
                tabBackgroundGradient: const LinearGradient(
                  colors: [
                    AppColors.appRedColor,
                    AppColors.appRedColor,
                  ],
                ),
                // color: Colors.black,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.black,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: "Home",
                    onPressed: () {
                      controller.selectedTab.value = 0;
                      controller.update();
                    },
                  ),
                  GButton(
                    icon: Icons.notifications,
                    text: "Notification",
                    onPressed: () {
                      controller.selectedTab.value = 1;
                      controller.update();
                    },
                  ),
                  GButton(
                    icon: Icons.bookmark_border,
                    text: "Bookmark",
                    onPressed: () {
                      controller.selectedTab.value = 2;
                      controller.update();
                    },
                  ),
                  GButton(
                    icon: Icons.man,
                    text: "Profile",
                    onPressed: () {
                      controller.selectedTab.value = 3;
                      controller.update();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget home() {
    return Column(
      children: [
        AppHeader(
          backTitle: "News",
          isShowContainer: true,
          containerTitle: "Bookmarks",
        ),
      ],
    );
  }

  Widget notification() {
    return Column(
      children: [
        AppHeader(
          backTitle: "Notification",
          isShowContainer: false,
        ),
      ],
    );
  }

  Widget gallery() {
    return Column(
      children: [
        AppHeader(
          backTitle: "Gallery",
          isShowContainer: false,
        ),
      ],
    );
  }

  Widget setting() {
    return Column(
      children: [
        AppHeader(
          backTitle: "Setting",
          isShowContainer: false,
        ),
      ],
    );
  }
}

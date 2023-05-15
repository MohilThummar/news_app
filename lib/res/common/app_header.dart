import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_assets.dart';
import '../constant/app_colors.dart';
import 'app_button.dart';

/// <<< Common App button --------- >>>

class AppHeader extends StatelessWidget {
  final String? title;
  final String? backTitle;
  final bool? isBackTitle;
  final bool? isShareBookmark;
  final bool? isShowContainer;
  final VoidCallback? onBack;
  final VoidCallback? onContainerBookmark;
  final String? containerTitle;
  final VoidCallback? onBookmark;
  final VoidCallback? onShare;

  const AppHeader({super.key, this.title = "", this.backTitle, this.isBackTitle = true, this.onBack, this.onContainerBookmark, this.containerTitle, this.onBookmark, this.onShare, this.isShareBookmark = false, this.isShowContainer = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).padding.top + 55.h,
      decoration: const BoxDecoration(
        color: AppColors.appRedColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          bottom: 14.h,
          right: 16.w,
        ),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.end,
          alignment: Alignment.bottomCenter,
          children: [
            Visibility(
              visible: isBackTitle == false,
              child: GestureDetector(
                onTap: onBack,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    AppAssets.back,
                    height: 24.h,
                    width: 24.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isBackTitle == true,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: MyTextView(
                  backTitle ?? "",
                  textStyleNew: MyTextStyle(
                    textColor: Colors.white,
                    textWeight: FontWeight.w700,
                    textSize: 18.sp,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: title != "",
              child: MyTextView(
                title ?? "",
                textStyleNew: MyTextStyle(
                  textColor: Colors.white,
                  textWeight: FontWeight.w700,
                  textSize: 18.sp,
                ),
              ),
            ),
            Visibility(
              visible: isShowContainer ?? false,
              child: GestureDetector(
                onTap: onContainerBookmark,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.h),
                    ),
                    child: MyTextView(
                      containerTitle ?? "",
                      textStyleNew: MyTextStyle(
                        textColor: Colors.white,
                        textWeight: FontWeight.w400,
                        textSize: 10.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isShareBookmark ?? false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: onBookmark,
                    child: Image.asset(
                      AppAssets.bookmark,
                      height: 20.h,
                      width: 20.h,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 14.w),
                  GestureDetector(
                    onTap: onShare,
                    child: Image.asset(
                      AppAssets.share,
                      height: 20.h,
                      width: 20.h,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

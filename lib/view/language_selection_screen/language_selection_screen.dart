import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/res/common/app_button.dart';
import 'package:news_app/res/constant/app_assets.dart';
import 'package:news_app/res/constant/app_colors.dart';
import 'package:news_app/res/constant/app_strings.dart';
import 'package:news_app/view/language_selection_screen/language_selection_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../res/common/common_rx_model.dart';
import '../../utils/routes/routes_name.dart';

class LanguageSelectionScreen extends GetView<LanguageSelectionController> {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LanguageSelectionController(),
      builder: (LanguageSelectionController controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                controller.selectedIndex.value != 0
                    ? GestureDetector(
                        onTap: () {
                          if (controller.selectedIndex.value != 0) {
                            controller.selectedIndex.value -= 1;
                            controller.pageController.animateToPage(
                              controller.selectedIndex.value,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          child: Image.asset(
                            AppAssets.back,
                            height: 24.h,
                            width: 24.h,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 24.h,
                        width: 24.h,
                      ),
                Expanded(
                  child: PageView(
                    onPageChanged: (page) {
                      controller.selectedIndex.value = page;
                      controller.update();
                    },
                    controller: controller.pageController,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 46.h),
                            MyTextView(
                              AppStrings.yourLanguage,
                              textStyleNew: MyTextStyle(
                                textColor: AppColors.appRedColor,
                                textSize: 18.sp,
                                textWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            MyTextView(
                              AppStrings.yourLanguageDic,
                              textStyleNew: MyTextStyle(
                                textColor: AppColors.appBlackColor,
                                textSize: 12.sp,
                                textWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 18.h),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: controller.languageArr.length,
                              itemBuilder: (context, index) {
                                CommonRxModel data = controller.languageArr[index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      for (int i = 0; i < controller.languageArr.length; i++) {
                                        if (index == i) {
                                          controller.languageArr[i].isSelect.value = true;
                                        } else {
                                          controller.languageArr[i].isSelect.value = false;
                                        }
                                      }
                                      controller.update();
                                    },
                                    child: Container(
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        color: data.isSelect.value ? AppColors.applightRedColor : AppColors.applightGrayColor,
                                        borderRadius: BorderRadius.circular(6.h),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 20.w),
                                          Expanded(
                                            child: MyTextView(
                                              data.title,
                                              textStyleNew: MyTextStyle(
                                                textColor: data.isSelect.value ? AppColors.appRedColor : AppColors.appBlackColor.withOpacity(0.6),
                                                textSize: 13.sp,
                                                textWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: data.isSelect.value,
                                            child: Image.asset(
                                              AppAssets.tick,
                                              height: 14.h,
                                              width: 14.h,
                                              color: AppColors.appRedColor,
                                            ),
                                          ),
                                          SizedBox(width: 20.w),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 46.h),
                            MyTextView(
                              AppStrings.letsPersonalise,
                              textStyleNew: MyTextStyle(
                                textColor: AppColors.appRedColor,
                                textSize: 18.sp,
                                textWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            MyTextView(
                              AppStrings.letsPersonaliseDic,
                              textStyleNew: MyTextStyle(
                                textColor: AppColors.appBlackColor,
                                textSize: 12.sp,
                                textWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 18.h),
                            MultiSelectContainer(
                              itemsPadding: EdgeInsets.all(12.h),
                              itemsDecoration: MultiSelectDecorations(
                                decoration: BoxDecoration(
                                  color: AppColors.applightGrayColor,
                                  borderRadius: BorderRadius.circular(5.h),
                                ),
                                selectedDecoration: BoxDecoration(
                                  color: AppColors.appRedColor,
                                  borderRadius: BorderRadius.circular(5.h),
                                ),
                              ),
                              textStyles: MultiSelectTextStyles(
                                textStyle: MyTextStyle(
                                  textColor: AppColors.appBlackColor.withOpacity(0.6),
                                  textSize: 13.sp,
                                ),
                                selectedTextStyle: MyTextStyle(
                                  textColor: Colors.white,
                                  textSize: 13.sp,
                                ),
                              ),
                              items: [
                                MultiSelectCard(value: AppStrings.travel, label: AppStrings.travel),
                                MultiSelectCard(value: AppStrings.sports, label: AppStrings.sports),
                                MultiSelectCard(value: AppStrings.editorial, label: AppStrings.editorial),
                                MultiSelectCard(value: AppStrings.lifestyle, label: AppStrings.lifestyle),
                                MultiSelectCard(value: AppStrings.fitness, label: AppStrings.fitness),
                                MultiSelectCard(value: AppStrings.technology, label: AppStrings.technology),
                                MultiSelectCard(value: AppStrings.politics, label: AppStrings.politics),
                                MultiSelectCard(value: AppStrings.world, label: AppStrings.world),
                                MultiSelectCard(value: AppStrings.blog, label: AppStrings.blog),
                                MultiSelectCard(value: AppStrings.economics, label: AppStrings.economics),
                                MultiSelectCard(value: AppStrings.entertainment, label: AppStrings.entertainment),
                                MultiSelectCard(value: AppStrings.cityNews, label: AppStrings.cityNews)
                              ],
                              onChange: (allSelectedItems, selectedItem) {},
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 46.h),
                            MyTextView(
                              AppStrings.yourCity,
                              textStyleNew: MyTextStyle(
                                textColor: AppColors.appRedColor,
                                textSize: 18.sp,
                                textWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            MyTextView(
                              AppStrings.yourCityDic,
                              textStyleNew: MyTextStyle(
                                textColor: AppColors.appBlackColor,
                                textSize: 12.sp,
                                textWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 18.h),
                            MultiSelectContainer(
                              itemsPadding: EdgeInsets.all(12.h),
                              itemsDecoration: MultiSelectDecorations(
                                decoration: BoxDecoration(
                                  color: AppColors.applightGrayColor,
                                  borderRadius: BorderRadius.circular(5.h),
                                ),
                                selectedDecoration: BoxDecoration(
                                  color: AppColors.appRedColor,
                                  borderRadius: BorderRadius.circular(5.h),
                                ),
                              ),
                              textStyles: MultiSelectTextStyles(
                                textStyle: MyTextStyle(
                                  textColor: AppColors.appBlackColor.withOpacity(0.6),
                                  textSize: 13.sp,
                                ),
                                selectedTextStyle: MyTextStyle(
                                  textColor: Colors.white,
                                  textSize: 13.sp,
                                ),
                              ),
                              items: [
                                MultiSelectCard(value: AppStrings.mumbai, label: AppStrings.mumbai),
                                MultiSelectCard(value: AppStrings.pune, label: AppStrings.pune),
                                MultiSelectCard(value: AppStrings.nagpur, label: AppStrings.nagpur),
                              ],
                              onChange: (allSelectedItems, selectedItem) {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Spacer(),
                SizedBox(height: 7.h),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 3,
                    textDirection: TextDirection.ltr,
                    effect: CustomizableEffect(
                      dotDecoration: DotDecoration(
                        color: AppColors.applightRedColor,
                        borderRadius: BorderRadius.circular(5.h),
                        height: 10.h,
                        width: 10.h,
                      ),
                      activeDotDecoration: DotDecoration(
                        color: AppColors.appRedColor,
                        height: 20.h,
                        borderRadius: BorderRadius.circular(5.h),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: AppButton(
                    title: controller.selectedIndex.value == 2 ? AppStrings.letsStart : AppStrings.next,
                    onPressed: () {
                      if (controller.selectedIndex.value != 2) {
                        controller.selectedIndex.value += 1;
                        controller.pageController.animateToPage(
                          controller.selectedIndex.value,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Get.offAllNamed(RoutesName.homeScreen);
                      }
                    },
                  ),
                ),
                SizedBox(height: 7.h),
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(RoutesName.homeScreen);
                  },
                  child: Center(
                    child: MyTextView(
                      AppStrings.skipForNow,
                      textStyleNew: MyTextStyle(
                        textColor: AppColors.appRedColor,
                        textSize: 16.sp,
                        textWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

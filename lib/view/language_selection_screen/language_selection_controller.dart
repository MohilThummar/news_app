import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/res/constant/app_strings.dart';

import '../../res/common/common_rx_model.dart';

class LanguageSelectionController extends GetxController {
  PageController pageController = PageController();
  RxInt selectedIndex = 1.obs;
  RxList<CommonRxModel> languageArr = <CommonRxModel>[].obs;
  RxList<CommonRxModel> cityArr = <CommonRxModel>[].obs;

  @override
  void onInit() {
    //Language
    languageArr.add(CommonRxModel(AppStrings.english, "", true.obs));
    languageArr.add(CommonRxModel(AppStrings.hindi, "", false.obs));
    languageArr.add(CommonRxModel(AppStrings.spain, "", false.obs));
    languageArr.add(CommonRxModel(AppStrings.french, "", false.obs));

    //City
    cityArr.add(CommonRxModel(AppStrings.mumbai, "", false.obs));
    cityArr.add(CommonRxModel(AppStrings.pune, "", false.obs));

    super.onInit();
  }
}

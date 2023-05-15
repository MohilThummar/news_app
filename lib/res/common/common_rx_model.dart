import 'package:get/get.dart';

class CommonRxModel {
  String title = "";
  String value = "";
  RxBool isSelect = false.obs;
  CommonRxModel(this.title, this.value, this.isSelect);
}

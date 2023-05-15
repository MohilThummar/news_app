import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

import '../../res/constant/app_strings.dart';
import '../../utils/color_print.dart';
import '../../utils/utils.dart';
import 'api_class.dart';

class APIFunction {
  /// <<< To Check Internet Availability ------------------- >>>
  ConnectivityResult? connectivityResult;
  final Connectivity connectivity = Connectivity();

  Future<bool> getConnectivityResult() async {
    try {
      connectivityResult = await connectivity.checkConnectivity();
      printOkStatus(connectivityResult.toString());
      if (connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
        return true;
      } else {
        Utils.showSnackBar(message: AppStrings.noInternetAvailable);
        return false;
      }
    } on PlatformException catch (e) {
      printError(e.toString());
      Utils.showSnackBar(message: AppStrings.noInternetAvailable);
      return false;
    }
  }

  /// <<< To Call Post Api ------------------- >>>
  Future<dynamic> postApiCall({
    required String apiName,
    dynamic params,
    bool isFormData = false,
  }) async {
    if (await getConnectivityResult()) {
      printAction("params -------->>> ${isFormData ? params!.fields : params}");
      var response = await HttpUtil().post(
        apiName,
        data: params,
        isFromData: isFormData,
      );
      return response;
    }
  }

  /// <<< To Call Get Api ------------------- >>>
  Future<dynamic> getApiCall({
    required String apiName,
    dynamic queryParameters,
  }) async {
    if (await getConnectivityResult()) {
      printAction("params -------->>> $queryParameters");
      var response = await HttpUtil().get(
        apiName,
        queryParameters: queryParameters,
      );
      return response;
    }
  }
}

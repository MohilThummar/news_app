import 'dart:convert';

import 'package:get_storage/get_storage.dart';

/// <<< To store data in phone storage --------- >>>
class GetStorageData {
  String loginData = "LoginData";
  String deviceId = "deviceId";

  /// <<< To save object data --------- >>>
  saveObject(String key, value) {
    final GetStorage storage = GetStorage();
    String allData = jsonEncode(value);
    storage.write(key, allData);
  }

  /// <<< To read object data --------- >>>
  readObject(String key) {
    final storage = GetStorage();
    var result = storage.read(key);
    return jsonDecode(result);
  }

  /// <<< To save string data --------- >>>
  saveString(String key, value) async {
    final storage = GetStorage();
    return storage.write(key, value);
  }

  /// <<< To read string data --------- >>>
  readString(String key) {
    final storage = GetStorage();
    if (storage.hasData(key)) {
      return storage.read(key);
    } else {
      return null;
    }
  }

  /// <<< To remove data --------- >>>
  removeData(String key) async {
    final storage = GetStorage();
    return storage.remove(key);
  }

  /// <<< To Store Key data --------- >>>
  bool containKey(String key) {
    final storage = GetStorage();
    return storage.hasData(key);
  }
}

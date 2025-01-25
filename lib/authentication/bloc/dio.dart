import 'package:dio/dio.dart';
import 'package:ferpo/core/constants/app_strings.dart';

class MyDio {
  Dio init() {
    //print(GetStorage().hasData(KeysStorage.token));
    return Dio(
      BaseOptions(
        baseUrl: AppStrings.baseUrl,
        headers: {
          // "Authorization":
          //     "Bearer ${StorageApp.box.read(KeysStorage.token)}",
          "Accept": "application/json",
        },
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 25),
      ),
    );
  }
}

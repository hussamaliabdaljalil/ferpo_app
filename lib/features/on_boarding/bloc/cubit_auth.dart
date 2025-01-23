
import 'package:dio/dio.dart';
import 'package:ferpo/features/on_boarding/bloc/super_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';

import '../../keys_storage.dart';
import 'cubit_abstract.dart';


class CubitAuth extends CubitAbstract {

  Future<void> login(String userName, String password) async {
    await requestMain(
        // isGoToLogin: false,
        request: () async {
          String? fcm=await FirebaseMessaging.instance.getToken();

          Response response = await dio
              .post('login', data: {'email': userName, 'password': password,'fcmToken':fcm});
          ////print(response.data);
          // User user = User.fromJson(response.data['user']);
          // await GetStorage().write(KeysStorage.user,);
          // await GetStorage().write(KeysStorage.token, response.data['token']);
          emit(LoginSuccessState());
        },
        error: LoginErrorState(),
        load: LoginLoadingState());
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String token,
  }) async {
    await requestMain(
        isGoToLogin: false,
        request: () async {
          String? fcm=await FirebaseMessaging.instance.getToken();

          Response response = await dio.post('Registery', data: {
            'email': email,
            'name': name,
            'phone': phone,
            'fcmToken':fcm,
          });

          // User user = User.fromJson(response.data['user']);
          // await StorageApp.box.write(KeysStorage.user, user);
          // await StorageApp.box.write(KeysStorage.token, response.data['token']);

          emit(SignUpSuccessState());
        },
        error: SignUpErrorState(),
        load:state
    );
  }



  bool isShow = false;


  bool isConfirmShow = false;

}

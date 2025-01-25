import 'package:dio/dio.dart';
import 'package:ferpo/authentication/bloc/super_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'cubit_abstract.dart';

class CubitAuth extends CubitAbstract {
  Future<void> login(
    String phone,
  ) async {
    await requestMain(
        request: () async {
          String? fcm = await FirebaseMessaging.instance.getToken();
          Response response =
              await dio.post('login', data: {'phone': phone, 'fcmToken': fcm});
          print(
              '******************************************************************************$fcm');
          emit(LoginSuccessState());
        },
        error: LoginErrorState(),
        load: LoginLoadingState());
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String gender,
    required String token,
  }) async {
    await requestMain(
        isGoToLogin: false,
        request: () async {
          String? fcm = await FirebaseMessaging.instance.getToken();

          Response response = await dio.post('signUp', data: {
            'email': email,
            'name': name,
            'gender': gender,
            'fcmToken': fcm,
          });
          emit(SignUpSuccessState());
        },
        error: SignUpErrorState(),
        load: state);
  }

  Future<void> checkCode(
    String phone,
    String otp,
  ) async {
    await requestMain(
        request: () async {
          //  String? fcm = await FirebaseMessaging.instance.getToken();
          Response response =
              await dio.post('checkCode', data: {'phone': phone, 'otp': otp});
          emit(OtpSuccessState());
        },
        error: OtpErrorState(),
        load: OtpLoadingState());
  }
}

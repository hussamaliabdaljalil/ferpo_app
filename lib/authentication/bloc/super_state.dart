abstract class SuperState {}

class InitialState extends SuperState {}

class DioErrorState extends SuperState {
  String errorMsg = '';
}

class SignUpLoadingState extends SuperState {}

class SignUpSuccessState extends SuperState {}

class SignUpErrorState extends DioErrorState {}

class LoginLoadingState extends SuperState {}

class LoginSuccessState extends SuperState {}

class LoginErrorState extends DioErrorState {}

class OtpLoadingState extends SuperState {}

class OtpSuccessState extends SuperState {}

class OtpErrorState extends DioErrorState {}

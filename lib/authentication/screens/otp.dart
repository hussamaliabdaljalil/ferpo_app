import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/home/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/main_button.dart';
import '../../core/theme/app_text_style.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});
  String? phone;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpFieldController otpController = OtpFieldController();
  int? otpCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 24.0, left: 24, right: 24, top: 123),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.signIn.tr(),
              style: AppTextStyle.f32W700Black,
            ),
            SizedBox(
              height: 32,
            ),
            OTPTextField(
              controller: otpController,
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              style: TextStyle(fontSize: 20),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (String verificationCode) {
                if (otpCode != null &&
                    int.tryParse(verificationCode) == otpCode) {
                  // إذا كان الرمز صحيحاً، انتقل لصفحة النجاح
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                } else {
                  // إذا كان الرمز غير صحيح
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid OTP code')),
                  );
                }
              },
            ),
            SizedBox(
              height: 16,
            ),
            MainButton(
              text: AppStrings.signIn.tr(),
              onPressed: () async {
                Response res = await Dio().post('login',
                    data: {'otp': otpController, 'phone': widget.phone});
                if (res.statusCode == 200) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                } else {
                  print(res.data);
                }
              },
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

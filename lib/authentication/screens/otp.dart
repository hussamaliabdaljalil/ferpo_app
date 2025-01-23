import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/authentication/screens/sign_up_screen.dart';

import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../core/generic_widgets/main_button.dart';
import '../../core/theme/app_text_style.dart';
import '../../home/pages/main_screen.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key,required this.phone});
  String phone;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

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
            CustomTextFormField(
              hintText: AppStrings.emailAddress.tr(),
              controller: otpController,
            ),
            SizedBox(
              height: 16,
            ),

                MainButton(
                    text: AppStrings.signIn.tr(),
                    onPressed: () async{
                    Response res=  await Dio().post('login', data: {
                        'otp': otpController.text,
                        'phone': widget.phone
                      });
                      if(res.statusCode==200) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                }
                      else
                        {
                          print(res.data);
                        }
              },
                  ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  AppStrings.dontYouHaveAnAccount.tr(),
                  style: AppTextStyle.f12W500Black,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    AppStrings.createOne.tr(),
                    style: AppTextStyle.f12W700Black,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

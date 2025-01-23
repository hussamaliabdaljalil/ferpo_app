import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/authentication/screens/otp.dart';
import 'package:ferpo/authentication/screens/sign_up_screen.dart';
import 'package:ferpo/features/on_boarding/bloc/cubit_auth.dart';
import 'package:ferpo/features/on_boarding/bloc/super_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../core/generic_widgets/main_button.dart';
import '../../core/theme/app_text_style.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailAddressController = TextEditingController();

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
              controller: emailAddressController,
            ),
            SizedBox(
              height: 16,
            ),
            BlocConsumer<CubitAuth,SuperState>(
              builder: (context, state) {
                return MainButton(
                  text: AppStrings.signIn.tr(),
                  onPressed: () async {
                    context.read<CubitAuth>().loginNumber('', );

                  },
                );
              }, listener: (BuildContext context, SuperState state) {
                if(state is LoginSuccessState)
                  {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => OtpScreen(phone:  emailAddressController.text??''),
                      ),
                          (Route<dynamic> route) => false,
                    );
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

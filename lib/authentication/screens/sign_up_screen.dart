import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/arrow_back_widget.dart';
import '../../core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../core/generic_widgets/main_button.dart';
import '../../core/theme/app_text_style.dart';
import 'forget_password_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 24.0, left: 24, right: 24, top: 64),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowBackWidget(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Create Account' /*AppStrings.createAccount.tr()*/,
                style: AppTextStyle.f32W700Black,
              ),
              SizedBox(
                height: 32,
              ),
              CustomTextFormField(
                hintText: 'Firstname' /*AppStrings.firstName.tr()*/,
                controller: firstNameController,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'Lastname' /*AppStrings.lastName.tr()*/,
                controller: lastNameController,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: AppStrings.emailAddress.tr(),
                controller: emailAddressController,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: AppStrings.password.tr(),
                isPassword: true,
                controller: passwordController,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: "Confirm Password" /*AppStrings.password.tr()*/,
                isConfirmPassword: true,
                controller: confirmPasswordController,
              ),
              SizedBox(
                height: 16,
              ),
              MainButton(
                  text: "Sign Up" /*AppStrings.signIn.tr()*/,
                  onPressed: () {
                    print('Sign Up pressed');
                  }),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    'Forgot Password ? ' /*AppStrings.forgotPassword.tr()*/,
                    style: AppTextStyle.f12W500Black,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Reset" /*AppStrings.createOne.tr()*/,
                      style: AppTextStyle.f12W700Black,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/authentication/bloc/cubit_auth.dart';
import 'package:ferpo/authentication/bloc/super_state.dart';
import 'package:ferpo/authentication/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/main_button.dart';
import '../../core/theme/app_text_style.dart';
import '../bloc/cubit_abstract.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneController = TextEditingController();
  CubitAbstract cubitAbstract = CubitAbstract();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 123),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.signIn.tr(),
              style: AppTextStyle.f32W700Black,
            ),
            SizedBox(height: 32),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CountryPickerUtils.getDefaultFlagImage(Country(
                        isoCode: AppStrings.sy,
                        phoneCode: AppStrings.s963,
                        iso3Code: '',
                        name: '',
                      )),
                      const SizedBox(width: 8),
                      Text(
                        AppStrings.s963,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
                hintText: AppStrings.enterPhoneNumber,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.pleaseEnterPhoneNumber;
                }
                return null;
              },
            ),
            SizedBox(height: 40),
            BlocConsumer<CubitAuth, SuperState>(
              builder: (context, state) {
                return MainButton(
                  text: AppStrings.signIn.tr(),
                  onPressed: () async {
                    String phone = phoneController.text.trim();
                    if (phone.isEmpty || phone.length < 10) {
                      cubitAbstract.showToast(AppStrings.invalidPhone);
                      return;
                    }
                    context.read<CubitAuth>().login(phone);
                  },
                );
              },
              listener: (BuildContext context, SuperState state) {
                if (state is LoginSuccessState) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                } else if (state is LoginErrorState) {
                  cubitAbstract.showToast(state.errorMsg, color: Colors.red);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

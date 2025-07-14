import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:seller_app/config/app_color/app_color.dart';
import 'package:seller_app/screens/auth/login/login_screen_cnt.dart';
import 'package:seller_app/shared/utils/app_padding.dart';
import 'package:seller_app/shared/utils/app_spacing.dart';
import 'package:seller_app/shared/widgets/app_button.dart';
import 'package:seller_app/shared/widgets/app_loading.dart';
import 'package:seller_app/shared/widgets/unfocus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cnt = Get.put(LoginScreenCnt());
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: unFocus,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: AppPadding.authPadding,
              child: Obx(
                () => Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      AppSpacing.h14,
                      // Phone number only
                      IntlPhoneField(
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: theme.hintColor),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),

                            borderSide: BorderSide(color: AppColors.grey1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.grey2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.grey1),
                          ),
                          
                        ),
                        cursorColor: AppColors.black,
                        textInputAction: TextInputAction.done,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: '+${cnt.countryDialCode.value}',
                        controller: cnt.phoneNumberController,
                        onCountryChanged: (value) {
                          cnt.countryDialCode.value = value.dialCode;
                        },
                        invalidNumberMessage: 'Invalid phone number',
                        validator: (value) {
                          if (value == null || value.number.isEmpty) {
                            return 'Please enter a phone number...';
                          }
                          return null;
                        },
                      ),
                      AppSpacing.h24,

                      // Login Button
                      // Obx(
                      //   () => ElevatedButton(
                      //     style: theme.elevatedButtonTheme.style?.copyWith(),
                      // onPressed: () {
                      //   if (cnt.isLoading.value) {
                      //     null;
                      //   } else {
                      //     if (formKey.currentState!.validate()) {
                      //       cnt.getOTP();
                      //     }
                      //   }
                      // },
                      //     child:
                      //         cnt.isLoading.value
                      //             ? appLoading()
                      //             : Text('Get Otp'),
                      //   ),
                      // ),
                      Obx(
                        () => AppButton(
                          text: 'Get Otp',
                          isLoading: cnt.isLoading.value,

                          onPressed: () {
                            if (cnt.isLoading.value) {
                              null;
                            } else {
                              if (formKey.currentState!.validate()) {
                                cnt.getOTP();
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // InputDecoration inputDecoration({
  //   required String hint,
  //   required IconData icon,

  //   Widget? suffixIcon,
  // }) => InputDecoration(
  //   hintText: hint,
  //   hintStyle: TextStyle(color: appGreyColor),
  //   filled: true,
  //   fillColor: appGrey900ShadeColor,
  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(12),
  //     borderSide: BorderSide.none,
  //   ),
  //   suffixIcon: suffixIcon,
  //   errorMaxLines: 2,
  //   prefixIcon: Icon(icon, color: appGreyColor),
  // );
}

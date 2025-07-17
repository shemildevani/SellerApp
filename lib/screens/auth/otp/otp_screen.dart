import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:seller_app/config/app_color/app_color.dart';
import 'package:seller_app/screens/data_collection/seller_owner_data/seller_owner.dart';
import 'package:seller_app/shared/utils/app_padding.dart';
import 'package:seller_app/shared/utils/app_spacing.dart';
import 'package:seller_app/shared/widgets/app_button.dart';
import 'package:seller_app/shared/widgets/app_text.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // NewPasswordScreenCnt cnt = Get.put(NewPasswordScreenCnt());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: AppPadding.authPadding,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  AppSpacing.h34,
                  AppText(
                    text: 'Verify Code',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  AppSpacing.h8,
                  AppText(
                    text:
                        'One Time Password (OTP) has been sent via WhatsApp to',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                  AppSpacing.h24,
                  Align(
                    alignment: Alignment.center,
                    child: OtpTextField(
                      cursorColor: AppColors.green,
                      keyboardType: TextInputType.number,
                      focusedBorderColor: AppColors.green,
                      numberOfFields: 6,
                      onSubmit: (value) {
                        // cnt.otp.value = value;
                      },
                      autoFocus: true,
                    ),
                  ),
                  AppSpacing.h16,
                  TextButton(
                    onPressed: () {},
                    // cnt.isLoading.value
                    //     ? null
                    //     : () async {
                    //       cnt.reSendOtp(email);
                    //     },
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        color: AppColors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  AppSpacing.h24,

                  // Obx(() =>
                  AppButton(
                    text: 'Verify',
                    onPressed: () {
                      Get.to(SellerOwner());
                    },
                  ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

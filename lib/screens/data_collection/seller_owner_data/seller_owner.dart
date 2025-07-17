import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:seller_app/config/app_color/app_color.dart';
import 'package:seller_app/config/app_constant/app_string.dart';
import 'package:seller_app/screens/data_collection/seller_owner_data/seller_owner_cnt.dart';
import 'package:seller_app/shared/utils/app_padding.dart';
import 'package:seller_app/shared/utils/app_spacing.dart';
import 'package:seller_app/shared/widgets/app_button.dart';
import 'package:seller_app/shared/widgets/app_textbox.dart' show AppTextField1;
import 'package:seller_app/shared/widgets/appbar.dart';
import 'package:seller_app/shared/widgets/getback.dart';

class SellerOwner extends StatelessWidget {
  const SellerOwner({super.key});

  @override
  Widget build(BuildContext context) {
    final cnt = Get.put(SellerOwnerCnt());
    return GestureDetector(
      onTap: unFocus,
      child: Scaffold(
        appBar: buildAppBar(title: 'Seller Owner Information'),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppPadding.appPadding,
      
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Form(
                key: cnt.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField1(
                      controller: cnt.firstNameController,
                      titleText: AppStringConst.firstName,
                      hintText: AppStringConst.firstName,
                    ),
              
                    AppSpacing.h10,
                    AppTextField1(
                      controller: cnt.lastNameController,
                      titleText: AppStringConst.lastName,
                      hintText: AppStringConst.lastName,
                    ),
                    AppSpacing.h10,
                    AppTextField1(
                      controller: cnt.emailController,
                      titleText: AppStringConst.email,
                      hintText: AppStringConst.email,
                      isRequired: false,
                    ),
              
                    AppSpacing.h10,
                    AppTextField1(
                      controller: cnt.cityController,
                      titleText: AppStringConst.city,
                      hintText: AppStringConst.city,
                      isRequired: true,
                    ),
              
                    AppSpacing.h10,
                    AppTextField1(
                      controller: cnt.stateController,
                      titleText: AppStringConst.state,
                      hintText: AppStringConst.state,
                      isRequired: true,
                    ),
                    AppSpacing.h24,
              
                    Obx(
                      () => AppButton(
                        text: 'Submit',
                        isLoading: cnt.isLoading.value,
              
                        onPressed: () {
                          if (cnt.isLoading.value) {
                            null;
                          } else {
                            // if (formKey.currentState!.validate()) {
                            cnt.submitData();
                            // }
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
    );
  }
}

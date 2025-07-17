import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerOwnerCnt extends GetxController {
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  void submitData() async {
    try {
      isLoading(true);

      await Future.delayed(
        Duration(seconds: 5)
        // () => Get.to(OtpScreen()),
      ); // Simulate network call
    } catch (e) {
      //
    } finally {
      isLoading(false);
    }
  }
}

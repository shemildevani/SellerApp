import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/shared/utils/app_padding.dart';
import 'package:seller_app/widgets/unfocus.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SignInCnt cnt = Get.put(SignInCnt());
    final formKey = GlobalKey<FormState>();

    final theme = Theme.of(context);
    return GestureDetector(
      onTap: unFocus,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: AppPadding.appPadding,
              child: Obx(
                () => Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: 'Astradigit',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: appBoldFont,
                        ),
                      ),
                      AppWidget.hightBox(height: 24),
                      Text(
                        'Create an Account',
                        style: theme.textTheme.headlineSmall?.copyWith(),
                        textAlign: TextAlign.center,
                      ),
                      AppWidget.hightBox(height: 8),
                      Text(
                        'Sign up to get started',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: appGreyColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      AppWidget.hightBox(height: 32),

                      // First Name.
                      TextFormField(
                        readOnly: cnt.registering.value,
                        textInputAction: TextInputAction.next,
                        controller: cnt.firstNameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter first name...';
                          }
                          return null;
                        },
                        decoration: inputDecoration(
                          hint: 'First Name',
                          icon: Icons.person_outline,
                        ),
                        style: TextStyle(color: appWhiteColor),
                      ),
                      AppWidget.hightBox(height: 16),

                      // Last Name.
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        readOnly: cnt.registering.value,
                        controller: cnt.lastNameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        decoration: inputDecoration(
                          hint: 'Last Name',
                          icon: Icons.person_outline,
                        ),
                        style: TextStyle(color: appWhiteColor),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter last name...';
                          }
                          return null;
                        },
                      ),

                      AppWidget.hightBox(height: 16),

                      // Gmail.
                      TextFormField(
                        readOnly: cnt.registering.value,
                        textInputAction: TextInputAction.next,
                        controller: cnt.emailController,
                        decoration: inputDecoration(
                          hint: 'Email',
                          icon: Icons.email_outlined,
                        ),
                        style: TextStyle(color: appWhiteColor),
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required...';
                          }

                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );

                          if (!emailRegex.hasMatch(value)) {
                            return 'Enter a valid email address...';
                          }

                          return null; // Valid email
                        },
                      ),
                      AppWidget.hightBox(height: 16),

                      // Organization Name.
                      TextFormField(
                        readOnly: cnt.registering.value,
                        textInputAction: TextInputAction.next,
                        controller: cnt.organizationNameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: inputDecoration(
                          hint: 'Organization Name',
                          icon: Icons.business,
                        ),
                        style: TextStyle(color: appWhiteColor),
                      ),
                      AppWidget.hightBox(height: 16),

                      // Password.
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        readOnly: cnt.registering.value,
                        controller: cnt.passwordController,
                        obscureText: cnt.showPassword.value ? false : true,

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: inputDecoration(
                          hint: 'Password',
                          icon: Icons.lock_outline,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cnt.showPassword.value = !cnt.showPassword.value;
                            },

                            icon: Icon(
                              cnt.showPassword.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: appGreyColor,
                            ),
                          ),
                        ),
                        style: TextStyle(color: appWhiteColor),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password...';
                          }

                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }

                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Password must contain at least one uppercase letter';
                          }

                          if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return 'Password must contain at least one lowercase letter';
                          }

                          if (!RegExp(r'\d').hasMatch(value)) {
                            return 'Password must contain at least one digit';
                          }

                          if (!RegExp(
                            r'[!@#\$&*~%^()_+=|<>?{}[\]-]',
                          ).hasMatch(value)) {
                            return 'Password must contain at least one special character';
                          }

                          return null;
                        },
                      ),

                      AppWidget.hightBox(height: 16),

                      // confirm Password.
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        readOnly: cnt.registering.value,
                        controller: cnt.confirmPasswordController,
                        obscureText:
                            cnt.showConfirmPassword.value ? false : true,

                        decoration: inputDecoration(
                          hint: 'Confirm Password',
                          icon: Icons.lock_outline,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cnt.showConfirmPassword.value =
                                  !cnt.showConfirmPassword.value;
                            },
                            icon: Icon(
                              cnt.showConfirmPassword.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: appGreyColor,
                            ),
                          ),
                        ),
                        style: TextStyle(color: appWhiteColor),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter confirm Password';
                          }
                          if (value != cnt.passwordController.text.trim()) {
                            return 'Password does not match!';
                          }
                          return null;
                        },
                      ),

                      AppWidget.hightBox(height: 16),

                      // phone number.
                      IntlPhoneField(
                        decoration: inputDecoration(
                          hint: 'Phone Number',
                          icon: Icons.phone_outlined,
                        ),
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

                      AppWidget.hightBox(height: 24),

                      // Sign Up Button.
                      ElevatedButton(
                        style: theme.elevatedButtonTheme.style?.copyWith(
                          backgroundColor: WidgetStateProperty.all(
                            cnt.registering.value
                                ? appGreyColor
                                : appWhiteColor,
                          ),
                        ),
                        onPressed: () {
                          if (cnt.registering.value) {
                            null;
                          } else {
                            if (formKey.currentState!.validate()) {
                              cnt.register();
                            }
                          }
                        },
                        child: Text('Sign Up'),
                      ),

                      SizedBox(height: 16),
                      // Sign In Option.
                      TextButton(
                        onPressed: () {
                          Get.to(() => LoginPage());
                        },
                        child: Text('Already have an account? Log in'),
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

  InputDecoration inputDecoration({
    required String hint,
    required IconData icon,

    Widget? suffixIcon,
  }) => InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: appGreyColor),
    filled: true,
    fillColor: appGrey900ShadeColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    suffixIcon: suffixIcon,
    errorMaxLines: 2,
    prefixIcon: Icon(icon, color: appGreyColor),
  );
}

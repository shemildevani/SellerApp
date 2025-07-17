import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:seller_app/config/theme/theme.dart';
import 'package:seller_app/screens/auth/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      home: LoginScreen(),
    );
  }
}

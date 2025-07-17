import 'package:flutter/material.dart';
import 'package:seller_app/config/app_color/app_color.dart';

AppBar buildAppBar({
  required String title,
  bool centerTitle = false,
  List<Widget>? action,
  TextStyle? textStyle,
  IconThemeData? actionsIconTheme,
  Color? backgroundColor,
}) {
  return AppBar(
    iconTheme: IconThemeData(color: AppColors.secondary),
    title: Text(
      title,
      style: textStyle ?? TextStyle(color: AppColors.secondary, fontSize: 18),
    ),
    backgroundColor: backgroundColor ?? AppColors.primary,
    centerTitle: centerTitle,
    actions: action,
    actionsIconTheme:
        actionsIconTheme ?? const IconThemeData(color: AppColors.secondary),
  );
}

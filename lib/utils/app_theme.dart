import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.white,
    indicatorColor: AppColor.black,
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white,
      centerTitle: true,
      titleTextStyle: AppStyle.medium20black,
      foregroundColor: AppColor.black,
    ),
    textTheme: TextTheme(
        labelLarge: AppStyle.bold16black,
        labelMedium: AppStyle.medium14black,
        bodyLarge: AppStyle.bold16black,
        titleMedium: AppStyle.medium24black,
        titleLarge: AppStyle.medium12gray),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.black,
    indicatorColor: AppColor.white,
    scaffoldBackgroundColor: AppColor.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.black,
      centerTitle: true,
      titleTextStyle: AppStyle.medium20white,
      foregroundColor: AppColor.white,
    ),
    textTheme: TextTheme(
        labelLarge: AppStyle.bold16white,
        bodyLarge: AppStyle.bold16black,
        labelMedium: AppStyle.medium14white,
        titleMedium: AppStyle.medium24white,
        titleLarge: AppStyle.medium12gray),
  );
}

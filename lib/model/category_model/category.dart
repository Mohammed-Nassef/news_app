import 'package:flutter/material.dart';
import 'package:news_app/provider/theme/app_theme_provider.dart';
import 'package:news_app/utils/asset_manegar.dart';
import 'package:provider/provider.dart';

class Category {
  String imagePath;
  String id;
  String title;
  Category({required this.imagePath, required this.id, required this.title});

  static List<Category> getcategoryList(BuildContext context) {
    AppThemeProvider themeProvider = Provider.of<AppThemeProvider>(context);
    return [
      Category(
          imagePath: themeProvider.theme == ThemeMode.dark
              ? AssetManegar.generalDark
              : AssetManegar.generalLight,
          id: 'general',
          title: 'General'),
      Category(
          imagePath: themeProvider.theme == ThemeMode.dark
              ? AssetManegar.businessDark
              : AssetManegar.businessLight,
          id: 'business',
          title: 'Business'),
      Category(
          imagePath: themeProvider.theme == ThemeMode.dark
              ? AssetManegar.sportDark
              : AssetManegar.sportLight,
          id: 'sports',
          title: 'Sports'),
      Category(
          imagePath: themeProvider.theme == ThemeMode.dark
              ? AssetManegar.technologyDark
              : AssetManegar.technologyLight,
          id: 'technology',
          title: 'Technology'),
      Category(
          imagePath: themeProvider.theme == ThemeMode.dark
              ? AssetManegar.entertainmentDark
              : AssetManegar.entertainmentLight,
          id: 'entertainment',
          title: 'Entertainment'),
      Category(
          imagePath: themeProvider.theme == ThemeMode.dark
              ? AssetManegar.healthDark
              : AssetManegar.healthLight,
          id: 'health',
          title: 'Health'),
      Category(
          imagePath: themeProvider.theme == ThemeMode.dark
              ? AssetManegar.scienceDark
              : AssetManegar.scienceLight,
          id: 'science',
          title: 'Science'),
    ];
  }
}

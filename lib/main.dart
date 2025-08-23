import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/localization/app_localization_provider.dart';
import 'package:news_app/provider/page_provider.dart';
import 'package:news_app/provider/theme/app_theme_provider.dart';
import 'package:news_app/search/search_screen.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppLocalizationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        )
      ],
      child:const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizationProvider languageProvider =
        Provider.of<AppLocalizationProvider>(context);
    AppThemeProvider themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) =>const HomeScreen(),
        SearchScreen.routeName: (context) =>const SearchScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.theme,
      locale: Locale(languageProvider.language),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeAnimationCurve: Curves.easeIn,
      themeAnimationDuration: const Duration(milliseconds: 150),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/provider/localization/app_localization_provider.dart';
import 'package:news_app/provider/theme/app_theme_provider.dart';
import 'package:news_app/ui/drawer/drawer_iteme.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:news_app/utils/asset_manegar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key, required this.goToHome});
  final Function goToHome;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    AppLocalizationProvider languageProvider =
        Provider.of<AppLocalizationProvider>(context);
    AppThemeProvider themeProvider = Provider.of<AppThemeProvider>(context);
    return Drawer(
      backgroundColor: AppColor.black,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: screenWidth,
            height: screenheight * 0.22,
            color: AppColor.white,
            child: Text(
              AppLocalizations.of(context)!.news_App,
              style: AppStyle.bold24black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    goToHome();
                  },
                  child: DrawerIteme(
                    text: AppLocalizations.of(context)!.go_To_Home,
                    iconsName: AssetManegar.home,
                  ),
                ),
             const   Padding(
                  padding:  EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    thickness: 1,
                    color: AppColor.white,
                  ),
                ),
                DrawerIteme(
                  text: AppLocalizations.of(context)!.theme,
                  iconsName: AssetManegar.theme,
                ),
                Container(
                  padding:const EdgeInsets.all(16),
                  margin:const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1, color: AppColor.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        themeProvider.theme == ThemeMode.dark
                            ? AppLocalizations.of(context)!.dark
                            : AppLocalizations.of(context)!.light,
                        style: AppStyle.medium20white,
                      ),
                      PopupMenuButton(
                          child: SvgPicture.asset(
                            AssetManegar.downArrow,
                            height: 16,
                            width: 16,
                            fit: BoxFit.scaleDown,
                          ),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                onTap: () {
                                  themeProvider.chengeTheme(ThemeMode.dark);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.dark,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () {
                                  themeProvider.chengeTheme(ThemeMode.light);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.light,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ];
                          })
                    ],
                  ),
                ),
              const  Padding(
                  padding:  EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    thickness: 1,
                    color: AppColor.white,
                  ),
                ),
                DrawerIteme(
                  text: AppLocalizations.of(context)!.language,
                  iconsName: AssetManegar.language,
                ),
                Container(
                  padding:const EdgeInsets.all(16),
                  margin:const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1, color: AppColor.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        languageProvider.language == 'en'
                            ? AppLocalizations.of(context)!.english
                            : AppLocalizations.of(context)!.arabic,
                        style: AppStyle.medium20white,
                      ),
                      PopupMenuButton(
                          child: SvgPicture.asset(
                            AssetManegar.downArrow,
                            height: 16,
                            width: 16,
                            fit: BoxFit.scaleDown,
                          ),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                onTap: () {
                                  languageProvider.changeLanguage('en');
                           
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.english,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () {
                                  languageProvider.changeLanguage('ar');
                             
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.arabic,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ];
                          })
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

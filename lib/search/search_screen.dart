import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response/news_response.dart';
import 'package:news_app/provider/theme/app_theme_provider.dart';
import 'package:news_app/ui/news/news_list.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:news_app/utils/asset_manegar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static String routeName = 'routeName';
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? query;

  @override
  Widget build(BuildContext context) {
    AppThemeProvider themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (value) {
                  query = value;
                  setState(() {});
                },
                style: themeProvider.theme == ThemeMode.dark
                    ? AppStyle.medium20white
                    : AppStyle.medium20black,
                cursorColor: AppColor.white,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.search,
                  hintStyle: themeProvider.theme == ThemeMode.dark
                      ? AppStyle.medium20white
                      : AppStyle.medium20black,
                  prefixIcon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.clear_rounded,
                      size: 30,
                      color: themeProvider.theme == ThemeMode.dark
                          ? AppColor.white
                          : AppColor.black,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      ApiManager.search(query!);
                      setState(() {});
                    },
                    icon: SvgPicture.asset(
                      AssetManegar.search,
                      height: 24,
                      width: 24,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                          themeProvider.theme == ThemeMode.dark
                              ? AppColor.white
                              : AppColor.black,
                          BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: query == null || query!.isEmpty
                  ? Text(
                      AppLocalizations.of(context)!.no_iteme_found,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  : FutureBuilder(
                      future: ApiManager.search(query!),
                      builder: (context, snapShot) {
                        if (snapShot.connectionState ==
                            ConnectionState.waiting) {
                          const Center(
                            child: CircularProgressIndicator(
                              color: AppColor.gray,
                            ),
                          );
                        } else if (snapShot.hasError) {
                          return Center(
                            child: Text(
                              'Client Erroe',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          );
                        } else if (snapShot.data!.status != 'ok') {
                          return Center(
                            child: Text(
                              snapShot.data!.message!,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          );
                        }
                        List<Article> newslist = snapShot.data?.articles ?? [];

                        return NewsList(
                          newslist: newslist,
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}

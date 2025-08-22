import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/model/category_model/category.dart';
import 'package:news_app/provider/theme/app_theme_provider.dart';
import 'package:news_app/search/search_screen.dart';
import 'package:news_app/ui/categoryDetails/category_details.dart';
import 'package:news_app/ui/categoryfragment/category_fragment.dart';
import 'package:news_app/ui/drawer/drawer_home.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/asset_manegar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppThemeProvider themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      drawer: DrawerHome(
        goToHome: backToCategoryFragment,
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SearchScreen.routeName);
              // showSearch(
              //   context: context,
              //   delegate: Search(),
              // );
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
                (BlendMode.srcIn),
              ),
            ),
          ),
        ],
        scrolledUnderElevation: 0,
        title: Text(selectCategory == null
            ? AppLocalizations.of(context)!.home
            : selectCategory!.title),
      ),
      body: selectCategory == null
          ? CategoryFragment(
              getCategoryByIndex: getCategory,
            )
          : CategoryDetails(
              category: selectCategory!,
            ),
    );
  }

  Category? selectCategory;
  void getCategory(newSelectCategory) {
    selectCategory = newSelectCategory;
    setState(() {});
  }

  void backToCategoryFragment() {
    selectCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}

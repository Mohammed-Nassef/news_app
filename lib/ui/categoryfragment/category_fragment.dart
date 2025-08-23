import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/model/category_model/category.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/asset_manegar.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

 
// ignore: must_be_immutable
class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key, required this.getCategoryByIndex});
  static String routeName = 'CategoryFragment';
  final Function getCategoryByIndex;
   List<Category> categoryList = [];
  @override
  Widget build(BuildContext context) {
    if (categoryList.isEmpty) {
      categoryList = Category.getcategoryList(context);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!
                .good_Morning_Here_is_Some_News_For_You,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              separatorBuilder: (context, __) => const SizedBox(
                height: 16,
              ),
              itemBuilder: (context, index) => Stack(
                alignment: index % 2 == 0
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(categoryList[index].imagePath),
                  ),
                  Container(
                    margin:const EdgeInsets.all(25),
                    child: ToggleSwitch(
                      minHeight: 58,
                      customWidths:const [
                        60,
                        85,
                      ],
                      inactiveBgColor: AppColor.gray,
                      cornerRadius: 84,
                      activeBgColors: [
                        [Theme.of(context).primaryColor],
                        [Theme.of(context).primaryColor]
                      ],
                      initialLabelIndex: 0,
                      totalSwitches: 2,
                      customWidgets: [
                        SvgPicture.asset(
                          AssetManegar.rightArrow,
                          height: 24,
                          width: 24,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).indicatorColor,
                              BlendMode.srcIn),
                        ),
                        Text(
                          AppLocalizations.of(context)!.view_All,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  color: Theme.of(context).indicatorColor),
                        ),
                      ],
                      radiusStyle: true,
                      onToggle: (index1) {
                        if (index1 == 1) {
                          getCategoryByIndex(
                            categoryList[index],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}

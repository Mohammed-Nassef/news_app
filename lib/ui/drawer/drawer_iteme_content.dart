import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:news_app/utils/asset_manegar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerItemeContent extends StatelessWidget {
  const DrawerItemeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            AppLocalizations.of(context)!.dark,
            style: AppStyle.medium20white,
          ),
          SvgPicture.asset(
            AssetManegar.downArrow,
            height: 16,
            width: 16,
            fit: BoxFit.scaleDown,
          )
        ],
      ),
    );
  }
}
